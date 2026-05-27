import Fluent
import Foundation

struct CreateCategory: AsyncMigration {
    func prepare(on database: any Database) async throws {
        try await database.schema("categories")
            .id()
            .field("name", .string, .required)
            .create()
        
        let categories = [
            Category(id: UUID(), name: "Gitary"),
            Category(id: UUID(), name: "Basy"),
            Category(id: UUID(), name: "Nagłośnienie"),
        ]
        
        for category in categories {
            try await category.create(on: database)
        }
    }

    func revert(on database: any Database) async throws {
        try await database.schema("categories").delete()
    }
}