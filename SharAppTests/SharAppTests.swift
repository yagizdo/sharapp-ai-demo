import XCTest
@testable import SharApp

final class SharAppTests: XCTestCase {
    func testOnboarding1EntityDefaults() {
        let entity = OnboardingScreen1Entity.default
        XCTAssertFalse(entity.title.isEmpty)
        XCTAssertFalse(entity.description.isEmpty)
    }

    func testOnboarding2EntityDefaults() {
        let entity = OnboardingScreen2Entity.default
        XCTAssertFalse(entity.title.isEmpty)
    }

    func testOnboarding3EntityDefaults() {
        let entity = OnboardingScreen3Entity.default
        XCTAssertFalse(entity.title.isEmpty)
    }
}
