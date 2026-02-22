import Foundation

protocol OnboardingScreen2InteractorInputProtocol: AnyObject {
    func fetchContent()
}

protocol OnboardingScreen2InteractorOutputProtocol: AnyObject {
    func didFetchContent(_ entity: OnboardingScreen2Entity)
}

final class OnboardingScreen2Interactor: OnboardingScreen2InteractorInputProtocol {

    weak var presenter: OnboardingScreen2InteractorOutputProtocol?

    func fetchContent() {
        presenter?.didFetchContent(.default)
    }
}
