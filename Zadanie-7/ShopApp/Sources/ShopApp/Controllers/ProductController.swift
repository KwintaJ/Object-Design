import Fluent
import Vapor
import Redis

struct ProductController: RouteCollection {
    func boot(routes: any RoutesBuilder) throws {
        let products = routes.grouped("products")
        
        products.get(use: index)
        products.get("create", use: createView)
        products.get(":productID", "edit", use: editView)
        
        products.post(use: create)
        products.post(":productID", "edit", use: update)
        products.post(":productID", "delete", use: delete)
    }

    struct ProductFormInput: Decodable {
        let name: String
        let price: Double
        let category_id: UUID
    }

    struct IndexContext: Encodable {
        let title: String
        let products: [Product]
    }

    struct CreateContext: Encodable {
        let title: String
        let categories: [Category]
    }

    struct EditContext: Encodable {
        let title: String
        let product: Product
        let categories: [Category]
    }

    // GET /products
    func index(req: Request) async throws -> View {
        let key = RedisKey("all_products")
        
        // try redis
        let result = try await req.redis.get(key, as: String?.self).get()
    
        if let maybeCachedString = result, let cachedString = maybeCachedString {
            if let data = cachedString.data(using: .utf8) {
                let cachedProducts = try JSONDecoder().decode([Product].self, from: data)
                return try await req.view.render("products/index", IndexContext(title: ". s t o r e", products: cachedProducts))
            }
        }
        
        // no cache - query db
        let products = try await Product.query(on: req.db).with(\.$category).all()
        
        let data = try JSONEncoder().encode(products)
        if let jsonString = String(data: data, encoding: .utf8) {
            _ = try await req.redis.set(key, to: jsonString).get()
            _ = try await req.redis.expire(key, after: .seconds(30)).get()
        }
        
        return try await req.view.render("products/index", IndexContext(title: ". s t o r e", products: products))
    }

    // GET /products/create
    func createView(req: Request) async throws -> View {
        let categories = try await Category.query(on: req.db).all()
        let context = CreateContext(title: "Dodaj nowy produkt", categories: categories)
        return try await req.view.render("products/create", context)
    }

    // POST /products
    func create(req: Request) async throws -> Response {
        let input = try req.content.decode(ProductFormInput.self)
        let product = Product(name: input.name, price: input.price, categoryID: input.category_id)
        try await product.save(on: req.db)
        _ = try await req.redis.delete(RedisKey("all_products")).get()
        return req.redirect(to: "/products")
    }

    // GET /products/:productID/edit
    func editView(req: Request) async throws -> View {
        guard let product = try await Product.find(req.parameters.get("productID"), on: req.db) else {
            throw Abort(.notFound)
        }
        let categories = try await Category.query(on: req.db).all()
        let context = EditContext(title: "Edycja Produktu", product: product, categories: categories)
        return try await req.view.render("products/edit", context)
    }

    // POST /products/:productID/edit
    func update(req: Request) async throws -> Response {
        let input = try req.content.decode(ProductFormInput.self)
        guard let product = try await Product.find(req.parameters.get("productID"), on: req.db) else {
            throw Abort(.notFound)
        }
        product.name = input.name
        product.price = input.price
        product.$category.id = input.category_id
        try await product.save(on: req.db)
        _ = try await req.redis.delete(RedisKey("all_products")).get()
        return req.redirect(to: "/products")
    }

    // POST /products/:productID/delete
    func delete(req: Request) async throws -> Response {
        guard let product = try await Product.find(req.parameters.get("productID"), on: req.db) else {
            throw Abort(.notFound)
        }
        try await product.delete(on: req.db)
        _ = try await req.redis.delete(RedisKey("all_products")).get()
        return req.redirect(to: "/products")
    }
}