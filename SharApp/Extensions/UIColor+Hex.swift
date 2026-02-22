import UIKit

extension UIColor {
    /// Initializes a UIColor from a hex string.
    /// Supports formats: "#RGB", "#RGBA", "#RRGGBB", "#RRGGBBAA" (with or without '#')
    convenience init(hex: String) {
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        if hexString.hasPrefix("#") {
            hexString = String(hexString.dropFirst())
        }

        var rgb: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&rgb)

        let r, g, b, a: CGFloat
        switch hexString.count {
        case 6:
            r = CGFloat((rgb >> 16) & 0xFF) / 255
            g = CGFloat((rgb >> 8) & 0xFF) / 255
            b = CGFloat(rgb & 0xFF) / 255
            a = 1.0
        case 8:
            r = CGFloat((rgb >> 24) & 0xFF) / 255
            g = CGFloat((rgb >> 16) & 0xFF) / 255
            b = CGFloat((rgb >> 8) & 0xFF) / 255
            a = CGFloat(rgb & 0xFF) / 255
        default:
            r = 0; g = 0; b = 0; a = 1
        }
        self.init(red: r, green: g, blue: b, alpha: a)
    }
}
