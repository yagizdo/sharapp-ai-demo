import Foundation

// MARK: - Onboarding Screen 1 Presenter Protocols
protocol OnboardingScreen1PresenterInputProtocol: AnyObject {
    func viewDidLoad()
    func didTapContinue()
    func didTapSkip()
}

protocol OnboardingScreen1PresenterOutputProtocol: AnyObject {
    func displayContent(_ entity: OnboardingScreen1Entity)
}

// MARK: - Presenter
final class OnboardingScreen1Presenter: OnboardingScreen1PresenterInputProtocol {

    weak var view: OnboardingScreen1PresenterOutputProtocol?
    var interactor: OnboardingScreen1InteractorInputProtocol?
    var router: OnboardingScreen1RouterProtocol?

    func viewDidLoad() {
        interactor?.fetchContent()
    }

    func didTapContinue() {
        router?.navigateToScreen2()
    }

    func didTapSkip() {
        router?.skipOnboarding()
    }
}

// MARK: - Interactor Output
extension OnboardingScreen1Presenter: OnboardingScreen1InteractorOutputProtocol {
    func didFetchContent(_ entity: OnboardingScreen1Entity) {
        view?.displayContent(entity)
    }
}
