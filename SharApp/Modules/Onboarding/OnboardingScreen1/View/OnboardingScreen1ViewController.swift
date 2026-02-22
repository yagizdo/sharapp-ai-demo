import UIKit

/// Onboarding Screen 1: "Your Shared Culinary Journey"
/// Stitch Design ID: 4801090702744695a0bafc330b2d1dd9
final class OnboardingScreen1ViewController: UIViewController {

    // MARK: VIPER
    var presenter: OnboardingScreen1PresenterInputProtocol?

    // MARK: Subviews
    private let skipButton = SecondaryButton(title: "Skip")
    private let iconClusterView = UIView()
    private let subtitleLabel = UILabel()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let continueButton = PrimaryButton(title: "Continue", trailingIcon: "arrow.right")
    private let pageControl = UIPageControl()
    private let scrollView = UIScrollView()
    private let contentView = UIView()

    // MARK: Icon badges (SF Symbol equivalents of the Stitch design icons)
    private lazy var icon1 = IconBadgeView(
        systemIconName: "fork.knife",
        iconColor: .appPrimary,
        backgroundColor: .appOrangeTint,
        size: 56
    )
    private lazy var icon2 = IconBadgeView(
        systemIconName: "person.fill",
        iconColor: .appWarmBrown,
        backgroundColor: .appBrownTint,
        size: 48
    )
    private lazy var icon3 = IconBadgeView(
        systemIconName: "face.smiling",
        iconColor: .appSecondary,
        backgroundColor: .appGreenTint,
        size: 44
    )
    private lazy var icon4 = IconBadgeView(
        systemIconName: "checkmark.circle.fill",
        iconColor: .appSecondary,
        backgroundColor: .appGreenTint,
        size: 40
    )
    private lazy var icon5 = IconBadgeView(
        systemIconName: "heart.fill",
        iconColor: .appPrimary,
        backgroundColor: .appOrangeTint,
        size: 52
    )

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

        // Scroll view
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.alwaysBounceVertical = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)

        // Skip button
        skipButton.translatesAutoresizingMaskIntoConstraints = false
        skipButton.addTarget(self, action: #selector(skipTapped), for: .touchUpInside)
        view.addSubview(skipButton)

        // Icon cluster
        iconClusterView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(iconClusterView)

        [icon1, icon2, icon3, icon4, icon5].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            iconClusterView.addSubview($0)
        }

        // Subtitle
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.font = Theme.Typography.caption
        subtitleLabel.textColor = Theme.Colors.secondary
        subtitleLabel.textAlignment = .center
        subtitleLabel.text = "Shared with Alex"
        subtitleLabel.layer.cornerRadius = CornerRadius.small
        contentView.addSubview(subtitleLabel)

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
        descriptionLabel.lineBreakMode = .byWordWrapping
        contentView.addSubview(descriptionLabel)

        // Page control
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.numberOfPages = 3
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = Theme.Colors.primary
        pageControl.pageIndicatorTintColor = Theme.Colors.primary.withAlphaComponent(0.25)
        pageControl.isUserInteractionEnabled = false
        contentView.addSubview(pageControl)

        // Continue button
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        continueButton.addTarget(self, action: #selector(continueTapped), for: .touchUpInside)
        contentView.addSubview(continueButton)
    }

    private func setupConstraints() {
        let safeArea = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            // ScrollView
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

            // Skip button
            skipButton.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: Spacing.xs),
            skipButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Spacing.md),

            // Icon cluster (centered, fixed height area)
            iconClusterView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Spacing.xxxl * 2),
            iconClusterView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            iconClusterView.widthAnchor.constraint(equalToConstant: 240),
            iconClusterView.heightAnchor.constraint(equalToConstant: 200),

            // Icons positioned in a scattered cluster layout
            icon1.centerXAnchor.constraint(equalTo: iconClusterView.centerXAnchor),
            icon1.centerYAnchor.constraint(equalTo: iconClusterView.centerYAnchor, constant: -20),

            icon2.trailingAnchor.constraint(equalTo: icon1.leadingAnchor, constant: -Spacing.sm),
            icon2.topAnchor.constraint(equalTo: iconClusterView.topAnchor, constant: Spacing.lg),

            icon3.leadingAnchor.constraint(equalTo: icon1.trailingAnchor, constant: Spacing.sm),
            icon3.topAnchor.constraint(equalTo: iconClusterView.topAnchor, constant: Spacing.md),

            icon4.leadingAnchor.constraint(equalTo: icon1.trailingAnchor, constant: Spacing.xxl),
            icon4.bottomAnchor.constraint(equalTo: iconClusterView.bottomAnchor, constant: -Spacing.lg),

            icon5.trailingAnchor.constraint(equalTo: icon1.leadingAnchor, constant: -Spacing.xxl),
            icon5.bottomAnchor.constraint(equalTo: iconClusterView.bottomAnchor, constant: -Spacing.md),

            // Subtitle
            subtitleLabel.topAnchor.constraint(equalTo: iconClusterView.bottomAnchor, constant: Spacing.xl),
            subtitleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

            // Title
            titleLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: Spacing.sm),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Spacing.xl),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Spacing.xl),

            // Description
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Spacing.md),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Spacing.xl),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Spacing.xl),

            // Page control
            pageControl.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: Spacing.xl),
            pageControl.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

            // Continue button
            continueButton.topAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: Spacing.xl),
            continueButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Spacing.xl),
            continueButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Spacing.xl),
            continueButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Spacing.xxxl)
        ])
    }

    // MARK: Animation
    private func startFloatingAnimation() {
        UIView.animate(
            withDuration: 3.0,
            delay: 0,
            options: [.autoreverse, .repeat, .curveEaseInOut],
            animations: { self.iconClusterView.transform = CGAffineTransform(translationX: 0, y: -10) }
        )
    }

    // MARK: Actions
    @objc private func continueTapped() { presenter?.didTapContinue() }
    @objc private func skipTapped() { presenter?.didTapSkip() }
}

// MARK: - Presenter Output
extension OnboardingScreen1ViewController: OnboardingScreen1PresenterOutputProtocol {
    func displayContent(_ entity: OnboardingScreen1Entity) {
        subtitleLabel.text = entity.subtitle
        titleLabel.text = entity.title
        descriptionLabel.text = entity.description
        skipButton.setTitle(entity.skipButtonTitle, for: .normal)
        continueButton.configure(title: entity.continueButtonTitle, trailingIcon: "arrow.right")
    }
}
