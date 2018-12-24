public enum View<Message> {
    case _label(Label)
    case _textField(TextField<Message>)
    case _space(Space)
    case _stack(Stack<Message>)
}

// MARK: - Label

public struct Label {
    let text: String
    let alignment: NSTextAlignment
    let style: UIFontTextStyle
}

public extension View {
    static func label(_ text: String, alignment: NSTextAlignment = .left, style: UIFontTextStyle = .body) -> View {
        return ._label(Label(text: text, alignment: alignment, style: style))
    }
}

// MARK: - TextField

public struct TextField<Message> {
    let value: String
    let placeholder: String
    let onChange: ((String) -> Message)?
}

public extension View {
    static func textField(value: String, placeholder: String, onChange: ((String) -> Message)? = nil) -> View {
        return ._textField(TextField(value: value, placeholder: placeholder, onChange: onChange))
    }
}

// MARK: - Space

public struct Space {
    let width: CGFloat?
    let height: CGFloat?
}

public extension View {
    static func space(width: CGFloat? = nil, height: CGFloat? = nil) -> View {
        return ._space(Space(width: width, height: height))
    }
}

// MARK: - Stack

public struct Stack<Message> {
    let children: [View<Message>]

    let alignment: UIStackViewAlignment
    let axis: UILayoutConstraintAxis
    let isBaselineRelativeArrangement: Bool
    let distribution: UIStackViewDistribution
    let isLayoutMarginsRelativeArrangement: Bool
    let spacing: CGFloat
}

public extension View {
    static func stack(
        _ children: [View],
        alignment: UIStackViewAlignment = .fill,
        axis: UILayoutConstraintAxis = .horizontal,
        isBaselineRelativeArrangement: Bool = false,
        distribution: UIStackViewDistribution = .fill,
        isLayoutMarginsRelativeArrangement: Bool = false,
        spacing: CGFloat = 0.0
        ) -> View {
        return ._stack(Stack(
            children: children,
            alignment: alignment,
            axis: axis,
            isBaselineRelativeArrangement: isBaselineRelativeArrangement,
            distribution: distribution,
            isLayoutMarginsRelativeArrangement: isLayoutMarginsRelativeArrangement,
            spacing: spacing
        ))
    }
}
