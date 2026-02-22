import UIKit

protocol OnboardingScreen2RouterProtocol: AnyObject {
    func navigateToScreen3()
    func skipOnboarding()
}

final class OnboardingScreen2Router: OnboardingScreen2RouterProtocol {

    weak var viewController: UIViewController?

    static func createModule() -> UIViewController {
        let view = OnboardingScreen2ViewController()
        let presenter = OnboardingScreen2Presenter()
        let interactor = OnboardingScreen2Interactor()
        let router = OnboardingScreen2Router()

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.viewController = view

        return view
    }

    func navigateToScreen3() {
        let screen3 = OnboardingScreen3Router.createModule()
        viewController?.navigationController?.pushViewController(screen3, animated: true)
    }

    func skipOnboarding() {
        // Future: navigate to main app
    }
}
