import Fluent

struct MigrateTags: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema(Tag.schema)
            .id()
            .field("title", .string, .required)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema(Tag.schema).delete()
    }
}
