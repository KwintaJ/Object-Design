import Fluent
import Vapor

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

    struct IndexContext: Encodable {
        let title: String
        let products: [Product]
    }

    struct EditContext: Encodable {
        let title: String
        let product: Product
    }

    // GET /products
    func index(req: Request) async throws -> View {
        let products = try await Product.query(on: req.db).all()
        let context = IndexContext(title: ". s t o r e", products: products)
        return try await req.view.render("products/index", context)
    }

    // GET /products/create
    func createView(req: Request) async throws -> View {
        return try await req.view.render("products/create", ["title": "Dodaj nowy produkt"])
    }

    // POST /products
    func create(req: Request) async throws -> Response {
        let product = try req.content.decode(Product.self)
        try await product.save(on: req.db)
        return req.redirect(to: "/products")
    }

    // GET /products/:productID/edit
    func editView(req: Request) async throws -> View {
        guard let product = try await Product.find(req.parameters.get("productID"), on: req.db) else {
            throw Abort(.notFound)
        }
        let context = EditContext(title: "Edycja Produktu", product: product)
        return try await req.view.render("products/edit", context)
    }

    // POST /products/:productID/edit
    func update(req: Request) async throws -> Response {
        let updatedData = try req.content.decode(Product.self)
        guard let product = try await Product.find(req.parameters.get("productID"), on: req.db) else {
            throw Abort(.notFound)
        }
        product.name = updatedData.name
        product.price = updatedData.price
        try await product.save(on: req.db)
        return req.redirect(to: "/products")
    }

    // POST /products/:productID/delete
    func delete(req: Request) async throws -> Response {
        guard let product = try await Product.find(req.parameters.get("productID"), on: req.db) else {
            throw Abort(.notFound)
        }
        try await product.delete(on: req.db)
        return req.redirect(to: "/products")
    }
}