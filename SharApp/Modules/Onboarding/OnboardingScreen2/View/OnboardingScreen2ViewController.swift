import UIKit

/// Onboarding Screen 2: "Connect over Food Memories"
/// Stitch Design ID: 664f8ecf39874f8dada381c9fcda099b
final class OnboardingScreen2ViewController: UIViewController {

    // MARK: VIPER
    var presenter: OnboardingScreen2PresenterInputProtocol?

    // MARK: Subviews
    private let navPreviewView = UIView()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let getStartedButton = PrimaryButton(title: "Get Started")
    private let skipButton = SecondaryButton(title: "Skip onboarding")
    private let scrollView = UIScrollView()
    private let contentView = UIView()

    // MARK: Nav preview icons (simulates app tab bar as a feature preview)
    private let navIcons: [(icon: String, label: String, color: UIColor, bg: UIColor)] = [
        ("heart.fill", "Favorites", .appPrimary, .appOrangeTint),
        ("person.2.fill", "YOU & US", .appSecondary, .appGreenTint),
        ("fork.knife.circle.fill", "MK", .appWarmBrown, .appBrownTint),
        ("person.3.fill", "Groups", .appSecondary, .appGreenTint),
        ("bookmark.fill", "Saved", .appPrimary, .appOrangeTint)
    ]

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

        // Nav preview container
        navPreviewView.translatesAutoresizingMaskIntoConstraints = false
        navPreviewView.backgroundColor = Theme.Colors.surface
        navPreviewView.layer.cornerRadius = CornerRadius.xxl
        navPreviewView.layer.masksToBounds = false
        navPreviewView.applyShadow(.card)
        contentView.addSubview(navPreviewView)

        // Nav icon stack
        let navStack = UIStackView()
        navStack.translatesAutoresizingMaskIntoConstraints = false
        navStack.axis = .horizontal
        navStack.distribution = .fillEqually
        navStack.alignment = .top
        navStack.spacing = Spacing.xs
        navPreviewView.addSubview(navStack)

        for item in navIcons {
            let itemStack = UIStackView()
            itemStack.axis = .vertical
            itemStack.alignment = .center
            itemStack.spacing = Spacing.xxs

            let badge = IconBadgeView(
                systemIconName: item.icon,
                iconColor: item.color,
                backgroundColor: item.bg,
                size: 44
            )

            let label = UILabel()
            label.text = item.label
            label.font = Theme.Typography.caption
            label.textColor = Theme.Colors.textSecondary
            label.textAlignment = .center
            label.numberOfLines = 1
            label.adjustsFontSizeToFitWidth = true
            label.minimumScaleFactor = 0.7

            itemStack.addArrangedSubview(badge)
            itemStack.addArrangedSubview(label)
            navStack.addArrangedSubview(itemStack)
        }

        NSLayoutConstraint.activate([
            navStack.topAnchor.constraint(equalTo: navPreviewView.topAnchor, constant: Spacing.lg),
            navStack.leadingAnchor.constraint(equalTo: navPreviewView.leadingAnchor, constant: Spacing.md),
            navStack.trailingAnchor.constraint(equalTo: navPreviewView.trailingAnchor, constant: -Spacing.md),
            navStack.bottomAnchor.constraint(equalTo: navPreviewView.bottomAnchor, constant: -Spacing.lg)
        ])

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
        getStartedButton.translatesAutoresizingMaskIntoConstraints = false
        getStartedButton.addTarget(self, action: #selector(getStartedTapped), for: .touchUpInside)
        contentView.addSubview(getStartedButton)

        skipButton.translatesAutoresizingMaskIntoConstraints = false
        skipButton.addTarget(self, action: #selector(skipTapped), for: .touchUpInside)
        contentView.addSubview(skipButton)
    }

    private func setupConstraints() {
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

            navPreviewView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Spacing.xxxl * 2.5),
            navPreviewView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Spacing.xl),
            navPreviewView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Spacing.xl),

            titleLabel.topAnchor.constraint(equalTo: navPreviewView.bottomAnchor, constant: Spacing.xxxl),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Spacing.xl),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Spacing.xl),

            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Spacing.md),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Spacing.xl),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Spacing.xl),

            getStartedButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: Spacing.xxxl),
            getStartedButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Spacing.xl),
            getStartedButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Spacing.xl),

            skipButton.topAnchor.constraint(equalTo: getStartedButton.bottomAnchor, constant: Spacing.md),
            skipButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            skipButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Spacing.xxxl)
        ])
    }

    // MARK: Animation
    private func startFloatingAnimation() {
        UIView.animate(
            withDuration: 2.5,
            delay: 0,
            options: [.autoreverse, .repeat, .curveEaseInOut],
            animations: { self.navPreviewView.transform = CGAffineTransform(translationX: 0, y: -8) }
        )
    }

    // MARK: Actions
    @objc private func getStartedTapped() { presenter?.didTapGetStarted() }
    @objc private func skipTapped() { presenter?.didTapSkip() }
}

// MARK: - Presenter Output
extension OnboardingScreen2ViewController: OnboardingScreen2PresenterOutputProtocol {
    func displayContent(_ entity: OnboardingScreen2Entity) {
        titleLabel.text = entity.title
        descriptionLabel.text = entity.description
        getStartedButton.configure(title: entity.getStartedButtonTitle)
        skipButton.setTitle(entity.skipButtonTitle, for: .normal)
    }
}
