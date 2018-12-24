import UIKit
import TEA

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    let program = Program(
        initial: .init(bodyweight: 105),
        root: SinclairCalculator()
    )

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {

        window = UIWindow(frame: UIScreen.main.bounds)

        window?.rootViewController = program.rootViewController()
        window?.makeKeyAndVisible()
        window?.backgroundColor = .white

        return true
    }
}

struct SinclairCalculator: Component {
    struct Model {
        let bodyweight: Decimal
    }

    enum Message {
        case textChanged(String)
    }

    func view(_ model: SinclairCalculator.Model) -> View<Message> {
        return .stack([
            .space(height: 50),
            .label("Sinclairity", alignment: .center, style: .largeTitle),
            .stack([
                .space(),
                .textField(value: "\(model.bodyweight)", placeholder: "bodyweight", onChange: Message.textChanged),
                .space(),
            ], axis: .vertical, distribution: .equalCentering),
            .space(height: 50),
        ], axis: .vertical)
    }

    func update(_ message: SinclairCalculator.Message, model: SinclairCalculator.Model) -> (SinclairCalculator.Model, Command<SinclairCalculator.Message>) {
        return (model, .none)
    }
}
