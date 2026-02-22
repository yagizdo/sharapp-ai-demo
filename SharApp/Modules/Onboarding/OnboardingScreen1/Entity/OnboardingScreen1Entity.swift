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
        description: "Discover, save, and plan your next dining experiences together. Build your shared food story one meal at a time.",
        continueButtonTitle: "Continue",
        skipButtonTitle: "Skip"
    )
}
