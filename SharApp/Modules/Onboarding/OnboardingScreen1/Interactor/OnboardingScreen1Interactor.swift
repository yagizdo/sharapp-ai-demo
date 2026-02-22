import Foundation

// MARK: - Onboarding Screen 1 Interactor Protocols
protocol OnboardingScreen1InteractorInputProtocol: AnyObject {
    func fetchContent()
}

protocol OnboardingScreen1InteractorOutputProtocol: AnyObject {
    func didFetchContent(_ entity: OnboardingScreen1Entity)
}

// MARK: - Interactor
final class OnboardingScreen1Interactor: OnboardingScreen1InteractorInputProtocol {

    weak var presenter: OnboardingScreen1InteractorOutputProtocol?

    func fetchContent() {
        // No API yet — return static entity
        presenter?.didFetchContent(.default)
    }
}
