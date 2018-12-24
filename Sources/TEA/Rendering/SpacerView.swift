import UIKit

final class SpacerView: UIView {
    init(width: CGFloat?, height: CGFloat?) {
        super.init(frame: .zero)

        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false

        if let w = width {
            let widthConstraint = widthAnchor.constraint(equalToConstant: w)
            widthConstraint.priority = .defaultHigh
            widthConstraint.isActive = true
        }

        if let h = height {
            let heightConstraint = heightAnchor.constraint(equalToConstant: h)
            heightConstraint.priority = .defaultHigh
            heightConstraint.isActive = true
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override class var layerClass : AnyClass {
        return CATransformLayer.self
    }
}
