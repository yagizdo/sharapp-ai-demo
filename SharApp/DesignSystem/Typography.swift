import UIKit

// MARK: - Typography System
// Uses Plus Jakarta Sans font family with system font fallback.

enum AppFont {
    // MARK: Font Name Constants
    static let regularName = "PlusJakartaSans-Regular"
    static let mediumName = "PlusJakartaSans-Medium"
    static let semiBoldName = "PlusJakartaSans-SemiBold"
    static let boldName = "PlusJakartaSans-Bold"

    // MARK: Font Factory
    static func regular(size: CGFloat) -> UIFont {
        UIFont(name: regularName, size: size) ?? .systemFont(ofSize: size, weight: .regular)
    }

    static func medium(size: CGFloat) -> UIFont {
        UIFont(name: mediumName, size: size) ?? .systemFont(ofSize: size, weight: .medium)
    }

    static func semiBold(size: CGFloat) -> UIFont {
        UIFont(name: semiBoldName, size: size) ?? .systemFont(ofSize: size, weight: .semibold)
    }

    static func bold(size: CGFloat) -> UIFont {
        UIFont(name: boldName, size: size) ?? .systemFont(ofSize: size, weight: .bold)
    }
}

// MARK: - Text Style Definitions
extension UIFont {
    /// 28pt Bold — main screen headings
    static var appLargeTitle: UIFont { AppFont.bold(size: 28) }

    /// 24pt SemiBold — section titles
    static var appTitle1: UIFont { AppFont.semiBold(size: 24) }

    /// 20pt SemiBold — secondary titles
    static var appTitle2: UIFont { AppFont.semiBold(size: 20) }

    /// 17pt SemiBold — headlines, button labels
    static var appHeadline: UIFont { AppFont.semiBold(size: 17) }

    /// 16pt Regular — body text
    static var appBody: UIFont { AppFont.regular(size: 16) }

    /// 15pt Medium — callout text
    static var appCallout: UIFont { AppFont.medium(size: 15) }

    /// 14pt Regular — subheadlines, secondary info
    static var appSubheadline: UIFont { AppFont.regular(size: 14) }

    /// 12pt Regular — captions, labels, badges
    static var appCaption: UIFont { AppFont.regular(size: 12) }
}
