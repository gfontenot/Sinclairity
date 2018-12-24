public struct Command<Msg> {}

public extension Command {
    static var none: Command<Msg> {
        return .init()
    }
}
