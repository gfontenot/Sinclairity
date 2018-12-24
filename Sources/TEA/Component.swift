public protocol Component {
    associatedtype Model
    associatedtype Message

    func view(_ model: Model) -> View<Message>
    func update(_ message: Message, model: Model) -> (Model, Command<Message>)
}
