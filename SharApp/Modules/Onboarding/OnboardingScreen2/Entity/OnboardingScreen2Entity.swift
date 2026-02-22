import Foundation

struct OnboardingScreen2Entity {
    let title: String
    let description: String
    let getStartedButtonTitle: String
    let skipButtonTitle: String

    static let `default` = OnboardingScreen2Entity(
        title: "Connect over Food Memories",
        description: "No more single lists. Link with your partner, invite friends to groups, and discover your next favorite meal together.",
        getStartedButtonTitle: "Get Started",
        skipButtonTitle: "Skip onboarding"
    )
}
