import UIKit

/// Circular avatar view with optional label below.
final class AvatarView: UIView {

    // MARK: Subviews
    private let circleView = UIView()
    private let initialsLabel = UILabel()
    private let nameLabel = UILabel()
    private let stackView = UIStackView()

    // MARK: Properties
    var initials: String = "" {
        didSet { initialsLabel.text = initials }
    }

    var name: String = "" {
        didSet { nameLabel.text = name }
    }

    var avatarBackgroundColor: UIColor = .appOrangeTint {
        didSet { circleView.backgroundColor = avatarBackgroundColor }
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

    convenience init(initials: String, name: String, backgroundColor: UIColor = .appOrangeTint) {
        self.init(frame: .zero)
        self.initials = initials
        self.name = name
        self.avatarBackgroundColor = backgroundColor
        initialsLabel.text = initials
        nameLabel.text = name
        circleView.backgroundColor = backgroundColor
    }

    // MARK: Setup
    private func setup() {
        let avatarSize: CGFloat = 60

        // Circle
        circleView.translatesAutoresizingMaskIntoConstraints = false
        circleView.backgroundColor = .appOrangeTint
        circleView.layer.cornerRadius = avatarSize / 2
        circleView.layer.masksToBounds = true
        circleView.applyShadow(.soft)

        // Initials
        initialsLabel.translatesAutoresizingMaskIntoConstraints = false
        initialsLabel.font = Theme.Typography.headline
        initialsLabel.textColor = Theme.Colors.textPrimary
        initialsLabel.textAlignment = .center

        // Name label
        nameLabel.font = Theme.Typography.caption
        nameLabel.textColor = Theme.Colors.textSecondary
        nameLabel.textAlignment = .center

        // Container stack
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = Spacing.xs

        circleView.addSubviewWithAutoLayout(initialsLabel)
        stackView.addArrangedSubview(circleView)
        stackView.addArrangedSubview(nameLabel)
        addSubviewWithAutoLayout(stackView)

        NSLayoutConstraint.activate([
            circleView.widthAnchor.constraint(equalToConstant: avatarSize),
            circleView.heightAnchor.constraint(equalToConstant: avatarSize),
            initialsLabel.centerXAnchor.constraint(equalTo: circleView.centerXAnchor),
            initialsLabel.centerYAnchor.constraint(equalTo: circleView.centerYAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
