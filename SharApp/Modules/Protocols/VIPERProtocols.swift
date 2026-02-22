import UIKit

// MARK: - VIPER Base Protocols
// All module-specific protocols should refine these base types.

/// Represents the View layer. Holds a reference to the presenter.
protocol ViewProtocol: AnyObject {}

/// Represents the Presenter layer. Connects View, Interactor, and Router.
protocol PresenterProtocol: AnyObject {
    associatedtype View: ViewProtocol
    associatedtype Interactor: InteractorProtocol
    associatedtype Router: RouterProtocol

    var view: View? { get set }
    var interactor: Interactor? { get set }
    var router: Router? { get set }
}

/// Represents the Interactor layer. Contains business logic.
protocol InteractorProtocol: AnyObject {
    associatedtype PresenterOutput: PresenterOutputProtocol
    var presenter: PresenterOutput? { get set }
}

/// Callback protocol from Interactor back to Presenter.
protocol PresenterOutputProtocol: AnyObject {}

/// Represents the Router layer. Handles navigation and module creation.
protocol RouterProtocol: AnyObject {
    static func createModule() -> UIViewController
}
