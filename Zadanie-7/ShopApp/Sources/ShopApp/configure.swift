import NIOSSL
import Fluent
import FluentSQLiteDriver
import Leaf
import Vapor
import Redis

public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    if let redisURL = Environment.get("REDIS_URL") {
        app.redis.configuration = try .init(url: redisURL)
    } else {
        app.redis.configuration = try .init(hostname: "127.0.0.1") 
    }

    app.databases.use(DatabaseConfigurationFactory.sqlite(.file("db.sqlite")), as: .sqlite)

    app.migrations.add(CreateCategory())
    app.migrations.add(CreateProduct())

    app.views.use(.leaf)

    try routes(app)
}
