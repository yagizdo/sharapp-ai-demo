import UIKit

protocol OnboardingScreen3RouterProtocol: AnyObject {
    func completeOnboarding()
    func navigateToLogin()
}

final class OnboardingScreen3Router: OnboardingScreen3RouterProtocol {

    weak var viewController: UIViewController?

    static func createModule() -> UIViewController {
        let view = OnboardingScreen3ViewController()
        let presenter = OnboardingScreen3Presenter()
        let interactor = OnboardingScreen3Interactor()
        let router = OnboardingScreen3Router()

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.viewController = view

        return view
    }

    func completeOnboarding() {
        // Future: navigate to main app / home screen
    }

    func navigateToLogin() {
        // Future: navigate to login screen
    }
}
