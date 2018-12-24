import UIKit

final class ElmViewController: UIViewController {
    let _view: UIView

    required init(view: UIView) {
        self._view = view
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = _view
    }
}
