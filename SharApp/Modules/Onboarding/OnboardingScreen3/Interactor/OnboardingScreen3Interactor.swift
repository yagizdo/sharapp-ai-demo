import Foundation

protocol OnboardingScreen3InteractorInputProtocol: AnyObject {
    func fetchContent()
}

protocol OnboardingScreen3InteractorOutputProtocol: AnyObject {
    func didFetchContent(_ entity: OnboardingScreen3Entity)
}

final class OnboardingScreen3Interactor: OnboardingScreen3InteractorInputProtocol {

    weak var presenter: OnboardingScreen3InteractorOutputProtocol?

    func fetchContent() {
        presenter?.didFetchContent(.default)
    }
}
