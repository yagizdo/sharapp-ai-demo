import Foundation

struct OnboardingScreen3Entity {
    let title: String
    let description: String
    let continueButtonTitle: String
    let skipButtonTitle: String
    let alreadyHaveAccountTitle: String

    static let `default` = OnboardingScreen3Entity(
        title: "Build Shared Lists",
        description: "Create collections of your favourite spots, invite your partner, and plan every experience together.",
        continueButtonTitle: "Continue",
        skipButtonTitle: "Skip",
        alreadyHaveAccountTitle: "I already have an account"
    )
}
