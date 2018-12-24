public final class Program<T: Component> {
    private let component: T
    private var state: T.Model

    private var references: [AnyObject] = []

    public init(initial state: T.Model, root component: T) {
        self.state = state
        self.component = component
    }

    public func rootViewController() -> UIViewController {
        let view = component.view(state)
        let (rendered, references) = render(view)
        self.references.append(contentsOf: references)
        return ElmViewController(view: rendered)
    }
}

// MARK: - Rendering

private extension Program {
    func render<Message>(_ view: View<Message>) -> (UIView, [AnyObject]) {
        switch view {
        case let ._label(label): return render(label)
        case let ._textField(textField): return render(textField)
        case let ._space(space): return render(space)
        case let ._stack(stack): return render(stack)
        }
    }

    func render(_ label: Label) -> (UIView, [AnyObject]) {
        let result = UILabel()
        result.text = label.text
        result.textAlignment = label.alignment
        result.font = .preferredFont(forTextStyle: label.style)

        return (result, [])
    }

    func render<Message>(_ textField: TextField<Message>) -> (UIView, [AnyObject]) {
        let result = UITextField()
        result.text = textField.value
        result.placeholder = textField.placeholder

        return (result, [])
    }

    func render(_ space: Space) -> (UIView, [AnyObject]) {
        return (SpacerView(width: space.width, height: space.height), [])
    }

    func render<Message>(_ stack: Stack<Message>) -> (UIView, [AnyObject]) {
        let (subviews, references) = unzip(stack.children.map(render))
        let result = UIStackView(arrangedSubviews: subviews)

        result.axis = stack.axis
        result.distribution = stack.distribution

        return (result, references.flatMap { $0 })
    }
}

func first<T, U>(_ tuple: (T, U)) -> T {
    return tuple.0
}

func second<T, U>(_ tuple: (T, U)) -> U {
    return tuple.1
}

func unzip<T, U>(_ xs: [(T, U)]) -> ([T], [U]) {
    return (xs.map(first), xs.map(second))
}
