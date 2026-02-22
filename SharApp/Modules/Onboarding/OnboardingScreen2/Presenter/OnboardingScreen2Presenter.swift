import Foundation

protocol OnboardingScreen2PresenterInputProtocol: AnyObject {
    func viewDidLoad()
    func didTapGetStarted()
    func didTapSkip()
}

protocol OnboardingScreen2PresenterOutputProtocol: AnyObject {
    func displayContent(_ entity: OnboardingScreen2Entity)
}

final class OnboardingScreen2Presenter: OnboardingScreen2PresenterInputProtocol {

    weak var view: OnboardingScreen2PresenterOutputProtocol?
    var interactor: OnboardingScreen2InteractorInputProtocol?
    var router: OnboardingScreen2RouterProtocol?

    func viewDidLoad() {
        interactor?.fetchContent()
    }

    func didTapGetStarted() {
        router?.navigateToScreen3()
    }

    func didTapSkip() {
        router?.skipOnboarding()
    }
}

extension OnboardingScreen2Presenter: OnboardingScreen2InteractorOutputProtocol {
    func didFetchContent(_ entity: OnboardingScreen2Entity) {
        view?.displayContent(entity)
    }
}
