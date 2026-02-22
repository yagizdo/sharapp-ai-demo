import UIKit

/// Text-only / link-style secondary button.
final class SecondaryButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    convenience init(title: String) {
        self.init(frame: .zero)
        setTitle(title, for: .normal)
    }

    private func setup() {
        backgroundColor = .clear
        titleLabel?.font = Theme.Typography.callout
        setTitleColor(Theme.Colors.textSecondary, for: .normal)
        setTitleColor(Theme.Colors.textMuted, for: .highlighted)
        contentEdgeInsets = UIEdgeInsets(top: Spacing.sm, left: Spacing.md, bottom: Spacing.sm, right: Spacing.md)
    }
}
