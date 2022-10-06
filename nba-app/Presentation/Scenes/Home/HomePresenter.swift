import UIKit

protocol HomePresentationLogic: AnyObject {
    func presentTeams(response: HomeModels.FetchTeams.Response)
    func presentTeam(response: HomeModels.DidSelectTeam.Response)
}

final class HomePresenter {
    var view: HomeDisplayLogic?
}

extension HomePresenter: HomePresentationLogic {
    func presentTeams(response: HomeModels.FetchTeams.Response) {
        let teams = response.teams

        let viewModel = teams.map { team in
            TeamCell.ViewModel(abbreviation: team.abbreviation, name: team.name, city: team.city)
        }

        view?.displayTeams(viewModel: .init(teams: viewModel, numberOfTeams: teams.count))
    }

    func presentTeam(response: HomeModels.DidSelectTeam.Response) {
        view?.displayTeam(viewModel: .init(teamDetail: response.teamDetail))
    }
}
