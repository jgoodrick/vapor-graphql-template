import Fluent

struct MigrateTodosTags: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema(TodoTag.schema)
            .id()
            .field("todo_id", .uuid, .required)
            .field("tag_id", .uuid, .required)
            .unique(on: "todo_id", "tag_id")
            .create()
    }
    
    func revert(on database: Database) async throws {
        try await database.schema(TodoTag.schema).delete()
    }
}
