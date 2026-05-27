import Fluent
import Vapor

struct CreateProduct: AsyncMigration {
    func prepare(on database: any Database) async throws {
        try await database.schema("products")
            .id()
            .field("name", .string, .required)
            .field("price", .double, .required)
            .field("category_id", .uuid, .required, .references("categories", "id", onDelete: .cascade))
            .create()
        
        let gitary = try await Category.query(on: database).filter(\.$name == "Gitary").first()
        let basy = try await Category.query(on: database).filter(\.$name == "Basy").first()
        let naglosnienie = try await Category.query(on: database).filter(\.$name == "Nagłośnienie").first()
        
        if let guitId = gitary?.id, let bassId = basy?.id, let ampId = naglosnienie?.id {
            let rockProducts = [
                Product(name: "Gitara Fender Stratocaster (Black)", price: 8499.99, categoryID: guitId),
                Product(name: "Bas Joe Dart Bass (Orange)", price: 12669.99, categoryID: bassId),
                Product(name: "Wzmacniacz Marshall JCM800", price: 6149.49, categoryID: ampId),
            ]
            for product in rockProducts {
                try await product.create(on: database)
            }
        }
    }

    func revert(on database: any Database) async throws {
        try await database.schema("products").delete()
    }
}