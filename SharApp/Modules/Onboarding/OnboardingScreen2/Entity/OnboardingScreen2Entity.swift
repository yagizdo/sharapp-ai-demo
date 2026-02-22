import Foundation

struct OnboardingScreen2Entity {
    let title: String
    let description: String
    let getStartedButtonTitle: String
    let skipButtonTitle: String

    static let `default` = OnboardingScreen2Entity(
        title: "Connect over Food Memories",
        description: "Save the places that matter, share discoveries with your partner, and build a culinary story that's uniquely yours.",
        getStartedButtonTitle: "Get Started",
        skipButtonTitle: "Skip onboarding"
    )
}
