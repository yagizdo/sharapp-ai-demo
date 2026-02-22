import UIKit

/// Full-width primary CTA button with terracotta background.
/// Supports optional trailing SF Symbol icon and a custom background color.
final class PrimaryButton: UIButton {

    // MARK: Stored background — allows callers to override the default terracotta
    var normalBackgroundColor: UIColor = Theme.Colors.primary {
        didSet { backgroundColor = normalBackgroundColor }
    }

    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    convenience init(title: String, trailingIcon: String? = nil) {
        self.init(frame: .zero)
        configure(title: title, trailingIcon: trailingIcon)
    }

    // MARK: Setup
    private func setup() {
        backgroundColor = normalBackgroundColor
        layer.cornerRadius = Theme.Radius.large
        layer.masksToBounds = true

        titleLabel?.font = Theme.Typography.headline
        setTitleColor(.white, for: .normal)
        setTitleColor(UIColor.white.withAlphaComponent(0.7), for: .highlighted)

        contentEdgeInsets = UIEdgeInsets(
            top: Theme.Spacing.md,
            left: Theme.Spacing.xl,
            bottom: Theme.Spacing.md,
            right: Theme.Spacing.xl
        )
        heightAnchor.constraint(equalToConstant: 54).isActive = true
    }

    func configure(title: String, trailingIcon: String? = nil) {
        if let iconName = trailingIcon,
           let icon = UIImage(systemName: iconName)?
            .withTintColor(.white, renderingMode: .alwaysOriginal)
            .withConfiguration(UIImage.SymbolConfiguration(pointSize: 14, weight: .semibold)) {
            setTitle(title + "  ", for: .normal)
            setImage(icon, for: .normal)
            semanticContentAttribute = .forceRightToLeft
            imageEdgeInsets = UIEdgeInsets(top: 0, left: Spacing.xs, bottom: 0, right: 0)
        } else {
            setTitle(title, for: .normal)
            setImage(nil, for: .normal)
        }
    }

    // MARK: Interaction
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        UIView.animate(withDuration: 0.12) {
            self.backgroundColor = self.normalBackgroundColor.withAlphaComponent(0.8)
            self.transform = CGAffineTransform(scaleX: 0.97, y: 0.97)
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        UIView.animate(withDuration: 0.12) {
            self.backgroundColor = self.normalBackgroundColor
            self.transform = .identity
        }
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        UIView.animate(withDuration: 0.12) {
            self.backgroundColor = self.normalBackgroundColor
            self.transform = .identity
        }
    }
}
