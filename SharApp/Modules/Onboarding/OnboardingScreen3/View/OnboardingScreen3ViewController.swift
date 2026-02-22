import UIKit

/// Onboarding Screen 3: "Build Shared Lists"
/// Stitch Design ID: d60a9b424d1d41ca9fd344a0c4ec6ebd
final class OnboardingScreen3ViewController: UIViewController {

    // MARK: VIPER
    var presenter: OnboardingScreen3PresenterInputProtocol?

    // MARK: Subviews
    private let skipButton = SecondaryButton(title: "Skip")
    private let avatarRowView = UIView()
    private let featureCardView = UIView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let continueButton = PrimaryButton(title: "Continue", trailingIcon: "arrow.right")
    private let accountButton = SecondaryButton(title: "I already have an account")
    private let scrollView = UIScrollView()
    private let contentView = UIView()

    // Avatar views
    private let youAvatar = AvatarView(initials: "You", name: "You", backgroundColor: .appOrangeTint)
    private let partnerAvatar = AvatarView(initials: "MK", name: "Partner", backgroundColor: .appGreenTint)

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraints()
        startFloatingAnimation()
        presenter?.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    // MARK: UI Setup
    private func setupUI() {
        view.backgroundColor = Theme.Colors.background

        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        // Skip
        skipButton.translatesAutoresizingMaskIntoConstraints = false
        skipButton.addTarget(self, action: #selector(skipTapped), for: .touchUpInside)
        view.addSubview(skipButton)

        // Avatar row
        avatarRowView.translatesAutoresizingMaskIntoConstraints = false
        youAvatar.translatesAutoresizingMaskIntoConstraints = false
        partnerAvatar.translatesAutoresizingMaskIntoConstraints = false

        // Connection line between avatars
        let connectionLine = UIView()
        connectionLine.translatesAutoresizingMaskIntoConstraints = false
        connectionLine.backgroundColor = Theme.Colors.accent
        connectionLine.layer.cornerRadius = 2

        avatarRowView.addSubview(youAvatar)
        avatarRowView.addSubview(connectionLine)
        avatarRowView.addSubview(partnerAvatar)

        NSLayoutConstraint.activate([
            youAvatar.leadingAnchor.constraint(equalTo: avatarRowView.leadingAnchor),
            youAvatar.centerYAnchor.constraint(equalTo: avatarRowView.centerYAnchor),
            youAvatar.topAnchor.constraint(equalTo: avatarRowView.topAnchor),
            youAvatar.bottomAnchor.constraint(equalTo: avatarRowView.bottomAnchor),

            partnerAvatar.trailingAnchor.constraint(equalTo: avatarRowView.trailingAnchor),
            partnerAvatar.centerYAnchor.constraint(equalTo: avatarRowView.centerYAnchor),

            connectionLine.leadingAnchor.constraint(equalTo: youAvatar.trailingAnchor, constant: Spacing.sm),
            connectionLine.trailingAnchor.constraint(equalTo: partnerAvatar.leadingAnchor, constant: -Spacing.sm),
            connectionLine.heightAnchor.constraint(equalToConstant: 3),
            connectionLine.centerYAnchor.constraint(equalTo: avatarRowView.centerYAnchor, constant: -14)
        ])
        contentView.addSubview(avatarRowView)

        // Feature card
        featureCardView.translatesAutoresizingMaskIntoConstraints = false
        featureCardView.backgroundColor = Theme.Colors.surface
        featureCardView.layer.cornerRadius = CornerRadius.xl
        featureCardView.layer.borderWidth = 1
        featureCardView.layer.borderColor = Theme.Colors.accent.cgColor
        featureCardView.applyShadow(.card)

        let cardStack = UIStackView()
        cardStack.translatesAutoresizingMaskIntoConstraints = false
        cardStack.axis = .horizontal
        cardStack.alignment = .center
        cardStack.spacing = Spacing.md

        let starIcon = UIImageView(image: UIImage(systemName: "star.fill"))
        starIcon.tintColor = Theme.Colors.primary
        starIcon.translatesAutoresizingMaskIntoConstraints = false
        starIcon.setSize(width: 28, height: 28)

        let cardTextStack = UIStackView()
        cardTextStack.axis = .vertical
        cardTextStack.spacing = Spacing.xxs

        let cardTitle = UILabel()
        cardTitle.text = "Shared List"
        cardTitle.font = Theme.Typography.headline
        cardTitle.textColor = Theme.Colors.textPrimary

        let cardSubtitle = UILabel()
        cardSubtitle.text = "Date Night Spots"
        cardSubtitle.font = Theme.Typography.subheadline
        cardSubtitle.textColor = Theme.Colors.textSecondary

        cardTextStack.addArrangedSubview(cardTitle)
        cardTextStack.addArrangedSubview(cardSubtitle)

        let newBadge = UILabel()
        newBadge.text = "New"
        newBadge.font = Theme.Typography.caption
        newBadge.textColor = .white
        newBadge.backgroundColor = Theme.Colors.secondary
        newBadge.layer.cornerRadius = CornerRadius.small
        newBadge.layer.masksToBounds = true
        newBadge.textAlignment = .center
        newBadge.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            newBadge.widthAnchor.constraint(equalToConstant: 36),
            newBadge.heightAnchor.constraint(equalToConstant: 20)
        ])

        cardStack.addArrangedSubview(starIcon)
        cardStack.addArrangedSubview(cardTextStack)
        cardStack.addArrangedSubview(UIView()) // spacer
        cardStack.addArrangedSubview(newBadge)

        featureCardView.addSubview(cardStack)
        NSLayoutConstraint.activate([
            cardStack.topAnchor.constraint(equalTo: featureCardView.topAnchor, constant: Spacing.md),
            cardStack.leadingAnchor.constraint(equalTo: featureCardView.leadingAnchor, constant: Spacing.md),
            cardStack.trailingAnchor.constraint(equalTo: featureCardView.trailingAnchor, constant: -Spacing.md),
            cardStack.bottomAnchor.constraint(equalTo: featureCardView.bottomAnchor, constant: -Spacing.md)
        ])
        contentView.addSubview(featureCardView)

        // Title
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = Theme.Typography.largeTitle
        titleLabel.textColor = Theme.Colors.textPrimary
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        contentView.addSubview(titleLabel)

        // Description
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.font = Theme.Typography.body
        descriptionLabel.textColor = Theme.Colors.textSecondary
        descriptionLabel.textAlignment = .center
        descriptionLabel.numberOfLines = 0
        contentView.addSubview(descriptionLabel)

        // Buttons
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        continueButton.addTarget(self, action: #selector(continueTapped), for: .touchUpInside)
        contentView.addSubview(continueButton)

        accountButton.translatesAutoresizingMaskIntoConstraints = false
        accountButton.addTarget(self, action: #selector(accountTapped), for: .touchUpInside)
        contentView.addSubview(accountButton)
    }

    private func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor),
            contentView.heightAnchor.constraint(greaterThanOrEqualTo: scrollView.frameLayoutGuide.heightAnchor),

            skipButton.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: Spacing.xs),
            skipButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Spacing.md),

            avatarRowView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Spacing.xxxl * 2),
            avatarRowView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            avatarRowView.widthAnchor.constraint(equalToConstant: 180),

            featureCardView.topAnchor.constraint(equalTo: avatarRowView.bottomAnchor, constant: Spacing.xl),
            featureCardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Spacing.xl),
            featureCardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Spacing.xl),

            titleLabel.topAnchor.constraint(equalTo: featureCardView.bottomAnchor, constant: Spacing.xxxl),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Spacing.xl),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Spacing.xl),

            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Spacing.md),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Spacing.xl),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Spacing.xl),

            continueButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: Spacing.xxxl),
            continueButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Spacing.xl),
            continueButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Spacing.xl),

            accountButton.topAnchor.constraint(equalTo: continueButton.bottomAnchor, constant: Spacing.md),
            accountButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            accountButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Spacing.xxxl)
        ])
    }

    // MARK: Animation
    private func startFloatingAnimation() {
        let group = UIView()
        UIView.animate(
            withDuration: 2.8,
            delay: 0.2,
            options: [.autoreverse, .repeat, .curveEaseInOut],
            animations: {
                self.avatarRowView.transform = CGAffineTransform(translationX: 0, y: -8)
                self.featureCardView.transform = CGAffineTransform(translationX: 0, y: -6)
            }
        )
        _ = group
    }

    // MARK: Actions
    @objc private func continueTapped() { presenter?.didTapContinue() }
    @objc private func skipTapped() { presenter?.didTapSkip() }
    @objc private func accountTapped() { presenter?.didTapAlreadyHaveAccount() }
}

// MARK: - Presenter Output
extension OnboardingScreen3ViewController: OnboardingScreen3PresenterOutputProtocol {
    func displayContent(_ entity: OnboardingScreen3Entity) {
        titleLabel.text = entity.title
        descriptionLabel.text = entity.description
        continueButton.configure(title: entity.continueButtonTitle, trailingIcon: "arrow.right")
        skipButton.setTitle(entity.skipButtonTitle, for: .normal)
        accountButton.setTitle(entity.alreadyHaveAccountTitle, for: .normal)
    }
}
