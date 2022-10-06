import UIKit

public struct HomeConfigurator {

    public func resolve() -> UIViewController {
        let router = HomeRouter()
        let presenter = HomePresenter()
        let teamsRepository = TeamsRepository()
        let getTeamsUseCase = GetTeams(repository: teamsRepository)
        let interactor = HomeInteractor(presenter: presenter, getTeams: getTeamsUseCase)
        let viewController = HomeViewController(router: router, interactor: interactor)

        router.viewController = viewController
        presenter.view = viewController

        return viewController
    }
}
