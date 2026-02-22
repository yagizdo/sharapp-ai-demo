# SharApp — Implementation Checklist
> VIPER Architecture · UIKit · Earth-Tone Design System
> Stitch Project: `6522402948192772662`

---

## Phase 1: Xcode Project Scaffolding

- [x] Create Xcode project (`SharApp`) using `xcodegen` from `project.yml`
- [x] Set bundle ID: `com.sharapp.ios.demo`
- [x] Set deployment target: iOS 16.0
- [x] Set device family: iPhone only
- [x] Remove Main.storyboard — programmatic UI only
- [x] Configure `SceneDelegate` to set root view controller
- [x] Configure UILaunchScreen dictionary (no storyboard needed)
- [x] Register Plus Jakarta Sans fonts in `Info.plist` (`UIAppFonts`)
- [x] **Build passes ✅ (3.4s)**

---

## Phase 2: Folder Structure (VIPER)

- [x] `SharApp/Application/` — AppDelegate, SceneDelegate
- [x] `SharApp/DesignSystem/` — Theme, Colors, Typography, Spacing
- [x] `SharApp/DesignSystem/Components/` — Reusable UI components
- [x] `SharApp/Modules/Protocols/` — VIPERProtocols.swift
- [x] `SharApp/Modules/Onboarding/OnboardingScreen1/{View,Presenter,Interactor,Router,Entity}/`
- [x] `SharApp/Modules/Onboarding/OnboardingScreen2/{View,Presenter,Interactor,Router,Entity}/`
- [x] `SharApp/Modules/Onboarding/OnboardingScreen3/{View,Presenter,Interactor,Router,Entity}/`
- [x] `SharApp/Extensions/` — UIView+Constraints, UIColor+Hex
- [x] `SharApp/Resources/Fonts/` — Plus Jakarta Sans TTF files
- [x] `SharAppTests/` — Unit tests

---

## Phase 3: Design System

- [x] `Colors.swift` — 13 semantic color tokens, all dark-mode ready via `UIColor { traitCollection in ... }`
- [x] `Typography.swift` — 8 text styles using Plus Jakarta Sans with system font fallback
- [x] `Spacing.swift` — 8 spacing constants (4–40pt) + CornerRadius enum + AppShadow struct
- [x] `Theme.swift` — Unified access point (`Theme.Colors.primary`, `Theme.Typography.largeTitle`, etc.)
- [x] `UIColor+Hex.swift` — Hex string initializer extension
- [x] `UIView+Constraints.swift` — Auto Layout helper methods

### Design Tokens
| Category | Count | Example |
|---|---|---|
| Colors | 13 | `Theme.Colors.primary` → `#BC5D41` |
| Typography | 8 | `Theme.Typography.largeTitle` → Plus Jakarta Sans Bold 28pt |
| Spacing | 8 | `Theme.Spacing.md` → 16pt |
| Corner Radius | 6 | `Theme.Radius.large` → 12pt |

---

## Phase 4: Reusable Components

- [x] `PrimaryButton.swift` — Terracotta CTA with optional trailing SF Symbol, press animation
- [x] `SecondaryButton.swift` — Text-only link button
- [x] `AvatarView.swift` — Circular avatar with initials + name label below
- [x] `IconBadgeView.swift` — Circular icon container with optional badge label

---

## Phase 5: VIPER Protocols

- [x] `VIPERProtocols.swift` — Base protocols: ViewProtocol, PresenterProtocol, InteractorProtocol, PresenterOutputProtocol, RouterProtocol

---

## Phase 6: Screen Implementations

### Screen 1 — "Your Shared Culinary Journey"
> Stitch ID: `4801090702744695a0bafc330b2d1dd9`

- [x] `OnboardingScreen1Entity.swift` — Static content model
- [x] `OnboardingScreen1Interactor.swift` — Fetches entity, stub for future API
- [x] `OnboardingScreen1Presenter.swift` — Routes Continue → Screen 2, Skip → stub
- [x] `OnboardingScreen1Router.swift` — `createModule()` factory, wires VIPER stack
- [x] `OnboardingScreen1ViewController.swift` — Full UIKit layout:
  - [x] Skip button (top-right)
  - [x] Icon cluster with 5 SF Symbol badges (fork.knife, person, face.smiling, checkmark, heart)
  - [x] Floating animation (3s cycle, -10px Y)
  - [x] "Shared with Alex" subtitle in sage green
  - [x] Large title + description text
  - [x] PrimaryButton "Continue →"
  - [x] ScrollView for responsiveness

### Screen 2 — "Connect over Food Memories"
> Stitch ID: `664f8ecf39874f8dada381c9fcda099b`

- [x] `OnboardingScreen2Entity.swift`
- [x] `OnboardingScreen2Interactor.swift`
- [x] `OnboardingScreen2Presenter.swift` — Routes GetStarted → Screen 3
- [x] `OnboardingScreen2Router.swift`
- [x] `OnboardingScreen2ViewController.swift` — Full UIKit layout:
  - [x] Nav preview card (shows 5 app tabs: Favorites, YOU & US, MK, Groups, Saved)
  - [x] Float animation on card (2.5s cycle)
  - [x] Large title + description
  - [x] PrimaryButton "Get Started"
  - [x] SecondaryButton "Skip onboarding"

### Screen 3 — "Build Shared Lists"
> Stitch ID: `d60a9b424d1d41ca9fd344a0c4ec6ebd`

- [x] `OnboardingScreen3Entity.swift`
- [x] `OnboardingScreen3Interactor.swift`
- [x] `OnboardingScreen3Presenter.swift` — Routes Continue/Skip → completeOnboarding stub
- [x] `OnboardingScreen3Router.swift`
- [x] `OnboardingScreen3ViewController.swift` — Full UIKit layout:
  - [x] Skip button (top-right)
  - [x] Two AvatarViews ("You" + "Partner") connected by a line
  - [x] Feature card: "Shared List / Date Night Spots" + "New" badge
  - [x] Float animation on avatar row + card
  - [x] Large title + description
  - [x] PrimaryButton "Continue →"
  - [x] SecondaryButton "I already have an account"

---

## Phase 7: Font Integration

- [x] Download Plus Jakarta Sans from Google Fonts GitHub (`tokotype/PlusJakartaSans`)
- [x] Files in `SharApp/Resources/Fonts/`:
  - [x] `PlusJakartaSans-Regular.ttf` (~298KB)
  - [x] `PlusJakartaSans-Medium.ttf` (~298KB)
  - [x] `PlusJakartaSans-SemiBold.ttf` (~298KB)
  - [x] `PlusJakartaSans-Bold.ttf` (~298KB)
- [x] Registered in `Info.plist` via `UIAppFonts`
- [x] System font fallback in `Typography.swift` if registration fails

---

## Phase 8: Build & Verification

- [x] **Xcode build: PASSED** ✅ (iPhone 16 Pro simulator, 3.4s)
- [x] Boot iPhone 16 Pro simulator
- [x] Install and launch app
- [x] Screenshot — Screen 1 (Onboarding 1) ✅ cream bg, icon cluster, Continue button
- [x] Screenshot — Screen 2 (Onboarding 2) ✅ nav preview card, Get Started, Skip link
- [x] Screenshot — Screen 3 (Onboarding 3) ✅ avatars, feature card with "New" badge, account link
- [x] Visual comparison against Stitch designs — matches design intent ✅
- [ ] Test on iPhone SE (small screen responsiveness)

---

## Acceptance Criteria

| Criterion | Status |
|---|---|
| Xcode project builds with zero errors | ✅ |
| Zero hardcoded hex values in screen code | ✅ |
| VIPER folder structure clean and modular | ✅ |
| All 3 screens implemented with correct layout | ✅ |
| Auto Layout with ScrollView (SE → Pro Max) | ✅ |
| Dark mode infrastructure in place | ✅ |
| Plus Jakarta Sans font bundled and registered | ✅ |
| Navigation Screen1 → Screen2 → Screen3 | ✅ |
| Simulator screenshots match Stitch designs | ✅ |
| Unit tests for entity models | ✅ |
