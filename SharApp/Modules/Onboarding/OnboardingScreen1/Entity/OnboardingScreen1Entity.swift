import Foundation

// MARK: - Onboarding Screen 1 Entity
struct OnboardingScreen1Entity {
    let subtitle: String
    let title: String
    let description: String
    let continueButtonTitle: String
    let skipButtonTitle: String

    static let `default` = OnboardingScreen1Entity(
        subtitle: "Shared with Alex",
        title: "Your Shared Culinary Journey",
        description: "Link lists with your partner or friends. Rate places together and build a collaborative history of your dining adventures.",
        continueButtonTitle: "Continue",
        skipButtonTitle: "Skip"
    )
}
