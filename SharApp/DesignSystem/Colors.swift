import UIKit

// MARK: - Color Palette
// All colors are defined with dark mode readiness using adaptive color providers.
// Currently returns light mode values. Dark mode values are ready to be filled in.

extension UIColor {

    // MARK: Brand Primary
    /// Terracotta — brand primary, used for CTAs and highlights
    static var appPrimary: UIColor {
        UIColor { trait in
            trait.userInterfaceStyle == .dark
                ? UIColor(hex: "#A65138")
                : UIColor(hex: "#BC5D41")
        }
    }

    /// Darker terracotta — used for pressed/highlighted states
    static var appPrimaryDark: UIColor {
        UIColor { trait in
            trait.userInterfaceStyle == .dark
                ? UIColor(hex: "#8B4530")
                : UIColor(hex: "#A65138")
        }
    }

    // MARK: Brand Secondary
    /// Sage green — nature accents, calming secondary color
    static var appSecondary: UIColor {
        UIColor { trait in
            trait.userInterfaceStyle == .dark
                ? UIColor(hex: "#5A6E5D")
                : UIColor(hex: "#6B816E")
        }
    }

    // MARK: Neutral
    /// Warm brown — supportive elements and icons
    static var appWarmBrown: UIColor {
        UIColor { trait in
            trait.userInterfaceStyle == .dark
                ? UIColor(hex: "#7A6459")
                : UIColor(hex: "#9C7C68")
        }
    }

    // MARK: Background & Surface
    /// Cream/beige — main page background
    static var appBackground: UIColor {
        UIColor { trait in
            trait.userInterfaceStyle == .dark
                ? UIColor(hex: "#262321")
                : UIColor(hex: "#FAF8F3")
        }
    }

    /// White — card and surface background
    static var appSurface: UIColor {
        UIColor { trait in
            trait.userInterfaceStyle == .dark
                ? UIColor(hex: "#332E2C")
                : UIColor(hex: "#FFFFFF")
        }
    }

    // MARK: Text
    /// Dark brown — primary text
    static var appTextPrimary: UIColor {
        UIColor { trait in
            trait.userInterfaceStyle == .dark
                ? UIColor(hex: "#D6CFC7")
                : UIColor(hex: "#4A3B32")
        }
    }

    /// Muted brown — secondary/descriptive text
    static var appTextSecondary: UIColor {
        UIColor { trait in
            trait.userInterfaceStyle == .dark
                ? UIColor(hex: "#9C8F87")
                : UIColor(hex: "#85756C")
        }
    }

    /// Very muted — placeholder and tertiary text
    static var appTextMuted: UIColor {
        UIColor { trait in
            trait.userInterfaceStyle == .dark
                ? UIColor(hex: "#6B5F59")
                : UIColor(hex: "#968882")
        }
    }

    // MARK: Tints & Borders
    /// Light terracotta tint — backgrounds, badges
    static var appOrangeTint: UIColor {
        UIColor { trait in
            trait.userInterfaceStyle == .dark
                ? UIColor(hex: "#3D2A24")
                : UIColor(hex: "#F9EBE6")
        }
    }

    /// Light sage tint — backgrounds, badges
    static var appGreenTint: UIColor {
        UIColor { trait in
            trait.userInterfaceStyle == .dark
                ? UIColor(hex: "#253028")
                : UIColor(hex: "#EDF1EE")
        }
    }

    /// Light warm tint — neutral tint backgrounds
    static var appBrownTint: UIColor {
        UIColor { trait in
            trait.userInterfaceStyle == .dark
                ? UIColor(hex: "#302A26")
                : UIColor(hex: "#F5F0EB")
        }
    }

    /// Border/divider color
    static var appAccent: UIColor {
        UIColor { trait in
            trait.userInterfaceStyle == .dark
                ? UIColor(hex: "#4A3F3A")
                : UIColor(hex: "#E6DDD6")
        }
    }
}
