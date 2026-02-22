import Foundation

protocol OnboardingScreen3PresenterInputProtocol: AnyObject {
    func viewDidLoad()
    func didTapContinue()
    func didTapSkip()
    func didTapAlreadyHaveAccount()
}

protocol OnboardingScreen3PresenterOutputProtocol: AnyObject {
    func displayContent(_ entity: OnboardingScreen3Entity)
}

final class OnboardingScreen3Presenter: OnboardingScreen3PresenterInputProtocol {

    weak var view: OnboardingScreen3PresenterOutputProtocol?
    var interactor: OnboardingScreen3InteractorInputProtocol?
    var router: OnboardingScreen3RouterProtocol?

    func viewDidLoad() {
        interactor?.fetchContent()
    }

    func didTapContinue() {
        router?.completeOnboarding()
    }

    func didTapSkip() {
        router?.completeOnboarding()
    }

    func didTapAlreadyHaveAccount() {
        router?.navigateToLogin()
    }
}

extension OnboardingScreen3Presenter: OnboardingScreen3InteractorOutputProtocol {
    func didFetchContent(_ entity: OnboardingScreen3Entity) {
        view?.displayContent(entity)
    }
}
