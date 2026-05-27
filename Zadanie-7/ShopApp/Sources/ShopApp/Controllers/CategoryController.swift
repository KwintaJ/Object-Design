import Fluent
import Vapor

struct CategoryController: RouteCollection {
    func boot(routes: any RoutesBuilder) throws {
        let categories = routes.grouped("categories")
        
        categories.get(use: index)
        categories.get("create", use: createView)
        categories.get(":categoryID", "edit", use: editView)
        
        categories.post(use: create)
        categories.post(":categoryID", "edit", use: update)
        categories.post(":categoryID", "delete", use: delete)
    }

    struct IndexContext: Encodable {
        let title: String
        let categories: [Category]
    }

    struct EditContext: Encodable {
        let title: String
        let category: Category
    }

    // GET /categories
    func index(req: Request) async throws -> View {
        let categories = try await Category.query(on: req.db).all()
        let context = IndexContext(title: "Zarządzanie Kategoriami", categories: categories)
        return try await req.view.render("categories/index", context)
    }

    // GET /categories/create
    func createView(req: Request) async throws -> View {
        return try await req.view.render("categories/create", ["title": "Dodaj Kategorię"])
    }

    // POST /categories
    func create(req: Request) async throws -> Response {
        let category = try req.content.decode(Category.self)
        try await category.save(on: req.db)
        return req.redirect(to: "/categories")
    }

    // GET /categories/:categoryID/edit
    func editView(req: Request) async throws -> View {
        guard let category = try await Category.find(req.parameters.get("categoryID"), on: req.db) else {
            throw Abort(.notFound)
        }
        let context = EditContext(title: "Edytuj Kategorię", category: category)
        return try await req.view.render("categories/edit", context)
    }

    // POST /categories/:categoryID/edit
    func update(req: Request) async throws -> Response {
        let updatedData = try req.content.decode(Category.self)
        guard let category = try await Category.find(req.parameters.get("categoryID"), on: req.db) else {
            throw Abort(.notFound)
        }
        category.name = updatedData.name
        try await category.save(on: req.db)
        return req.redirect(to: "/categories")
    }

    // POST /categories/:categoryID/delete
    func delete(req: Request) async throws -> Response {
        guard let category = try await Category.find(req.parameters.get("categoryID"), on: req.db) else {
            throw Abort(.notFound)
        }
        try await category.delete(on: req.db)
        return req.redirect(to: "/categories")
    }
}