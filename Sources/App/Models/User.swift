import Fluent
import Vapor

/// A single entry of a Todo list.
final class User: Model {
    static let schema = "users"

    /// The unique identifier for this `Todo`.
    @ID(key: .id)
    var id: UUID?

    /// A title describing what this `Todo` entails.
    @Field(key: "name")
    var name: String

    @Children(for: \.$user)
    var todos: [Todo]

    init() { }

    /// Creates a new `Todo`.
    init(id: UUID? = nil, name: String) {
        self.id = id
        self.name = name
    }
}
