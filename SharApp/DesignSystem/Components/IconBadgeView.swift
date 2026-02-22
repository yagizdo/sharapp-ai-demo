import UIKit

/// Circular icon container with optional badge label.
final class IconBadgeView: UIView {

    // MARK: Subviews
    private let containerView = UIView()
    private let iconImageView = UIImageView()
    private let badgeView = UIView()
    private let badgeLabel = UILabel()

    // MARK: Properties
    var iconColor: UIColor = .appPrimary {
        didSet { iconImageView.tintColor = iconColor }
    }

    var containerColor: UIColor = .appOrangeTint {
        didSet { containerView.backgroundColor = containerColor }
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

    convenience init(
        systemIconName: String,
        iconColor: UIColor = .appPrimary,
        backgroundColor: UIColor = .appOrangeTint,
        size: CGFloat = 52,
        badge: String? = nil
    ) {
        self.init(frame: .zero)
        iconImageView.image = UIImage(systemName: systemIconName)?
            .withConfiguration(UIImage.SymbolConfiguration(pointSize: size * 0.38, weight: .medium))
        self.iconColor = iconColor
        iconImageView.tintColor = iconColor
        containerView.backgroundColor = backgroundColor
        containerView.layer.cornerRadius = size / 2
        setSize(width: size, height: size)

        if let badge {
            badgeLabel.text = badge
            badgeView.isHidden = false
        }
    }

    // MARK: Setup
    private func setup() {
        let size: CGFloat = 52

        // Container
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = .appOrangeTint
        containerView.layer.cornerRadius = size / 2
        containerView.layer.masksToBounds = true
        containerView.applyShadow(.soft)

        // Icon
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.tintColor = .appPrimary

        // Badge
        badgeView.translatesAutoresizingMaskIntoConstraints = false
        badgeView.backgroundColor = .appSecondary
        badgeView.layer.cornerRadius = 8
        badgeView.isHidden = true

        badgeLabel.translatesAutoresizingMaskIntoConstraints = false
        badgeLabel.font = Theme.Typography.caption
        badgeLabel.textColor = .white
        badgeLabel.textAlignment = .center

        addSubviewWithAutoLayout(containerView)
        containerView.addSubviewWithAutoLayout(iconImageView)
        addSubviewWithAutoLayout(badgeView)
        badgeView.addSubviewWithAutoLayout(badgeLabel)

        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),

            iconImageView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            iconImageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),

            badgeView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: -4),
            badgeView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 4),

            badgeLabel.topAnchor.constraint(equalTo: badgeView.topAnchor, constant: 2),
            badgeLabel.leadingAnchor.constraint(equalTo: badgeView.leadingAnchor, constant: 4),
            badgeLabel.trailingAnchor.constraint(equalTo: badgeView.trailingAnchor, constant: -4),
            badgeLabel.bottomAnchor.constraint(equalTo: badgeView.bottomAnchor, constant: -2)
        ])
    }
}
