import UIKit

public struct DetailConfigurator {

    private let teamDetail: TeamDetail

    init(teamDetail: TeamDetail) {
        self.teamDetail = teamDetail
    }

    public func resolve() -> UIViewController {
        let router = DetailRouter()
        let presenter = DetailPresenter()
        let interactor = DetailInteractor(presenter: presenter, teamDetail: teamDetail)
        let viewController = DetailViewController(router: router, interactor: interactor)

        presenter.view = viewController

        return viewController
    }
}

