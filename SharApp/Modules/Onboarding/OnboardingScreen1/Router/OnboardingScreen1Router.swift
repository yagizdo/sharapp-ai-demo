import UIKit

// MARK: - Onboarding Screen 1 Router Protocol
protocol OnboardingScreen1RouterProtocol: AnyObject {
    func navigateToScreen2()
    func skipOnboarding()
}

// MARK: - Router
final class OnboardingScreen1Router: OnboardingScreen1RouterProtocol {

    weak var viewController: UIViewController?

    // MARK: Module Factory
    static func createModule() -> UIViewController {
        let view = OnboardingScreen1ViewController()
        let presenter = OnboardingScreen1Presenter()
        let interactor = OnboardingScreen1Interactor()
        let router = OnboardingScreen1Router()

        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.viewController = view

        return view
    }

    // MARK: Navigation
    func navigateToScreen2() {
        let screen2 = OnboardingScreen2Router.createModule()
        viewController?.navigationController?.pushViewController(screen2, animated: true)
    }

    func skipOnboarding() {
        // Future: navigate to main app screen
    }
}
