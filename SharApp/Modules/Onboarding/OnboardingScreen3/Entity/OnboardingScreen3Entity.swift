import Foundation

struct OnboardingScreen3Entity {
    let title: String
    let description: String
    let continueButtonTitle: String
    let skipButtonTitle: String
    let alreadyHaveAccountTitle: String

    static let `default` = OnboardingScreen3Entity(
        title: "Build Shared Lists",
        description: "Create collections of your favorite spots and invite your partner to collaborate. Plan your next date night together.",
        continueButtonTitle: "Continue",
        skipButtonTitle: "Skip",
        alreadyHaveAccountTitle: "I already have an account"
    )
}
