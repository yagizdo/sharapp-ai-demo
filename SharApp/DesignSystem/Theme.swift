import UIKit

// MARK: - Theme
// Central access point for the design system.
// Usage: Theme.Colors.primary, Theme.Typography.largeTitle, Theme.Spacing.md

enum Theme {

    enum Colors {
        static var primary: UIColor { .appPrimary }
        static var primaryDark: UIColor { .appPrimaryDark }
        static var secondary: UIColor { .appSecondary }
        static var warmBrown: UIColor { .appWarmBrown }
        static var background: UIColor { .appBackground }
        static var surface: UIColor { .appSurface }
        static var textPrimary: UIColor { .appTextPrimary }
        static var textSecondary: UIColor { .appTextSecondary }
        static var textMuted: UIColor { .appTextMuted }
        static var accent: UIColor { .appAccent }
        static var orangeTint: UIColor { .appOrangeTint }
        static var greenTint: UIColor { .appGreenTint }
        static var brownTint: UIColor { .appBrownTint }
    }

    enum Typography {
        static var largeTitle: UIFont { .appLargeTitle }
        static var title1: UIFont { .appTitle1 }
        static var title2: UIFont { .appTitle2 }
        static var headline: UIFont { .appHeadline }
        static var body: UIFont { .appBody }
        static var callout: UIFont { .appCallout }
        static var subheadline: UIFont { .appSubheadline }
        static var caption: UIFont { .appCaption }
    }

    enum Spacing {
        static let xxs: CGFloat = 4
        static let xs: CGFloat = 8
        static let sm: CGFloat = 12
        static let md: CGFloat = 16
        static let lg: CGFloat = 20
        static let xl: CGFloat = 24
        static let xxl: CGFloat = 32
        static let xxxl: CGFloat = 40
    }

    enum Radius {
        static let small: CGFloat = 4
        static let medium: CGFloat = 8
        static let large: CGFloat = 12
        static let xl: CGFloat = 16
        static let xxl: CGFloat = 20
        static let full: CGFloat = 9999
    }
}
