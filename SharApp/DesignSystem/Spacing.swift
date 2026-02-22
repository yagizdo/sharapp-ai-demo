import UIKit

// MARK: - Spacing System
// Centralized spacing constants. Never use raw numbers in layout code.

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

// MARK: - Corner Radius
enum CornerRadius {
    static let small: CGFloat = 4
    static let medium: CGFloat = 8
    static let large: CGFloat = 12
    static let xl: CGFloat = 16
    static let xxl: CGFloat = 20
    static let full: CGFloat = 9999
}

// MARK: - Shadow
struct AppShadow {
    let color: UIColor
    let opacity: Float
    let offset: CGSize
    let radius: CGFloat

    static let soft = AppShadow(
        color: UIColor(hex: "#443630"),
        opacity: 0.08,
        offset: CGSize(width: 0, height: 8),
        radius: 20
    )

    static let card = AppShadow(
        color: UIColor(hex: "#443630"),
        opacity: 0.1,
        offset: CGSize(width: 0, height: 4),
        radius: 10
    )
}

extension UIView {
    func applyShadow(_ shadow: AppShadow) {
        layer.shadowColor = shadow.color.cgColor
        layer.shadowOpacity = shadow.opacity
        layer.shadowOffset = shadow.offset
        layer.shadowRadius = shadow.radius
        layer.masksToBounds = false
    }
}
