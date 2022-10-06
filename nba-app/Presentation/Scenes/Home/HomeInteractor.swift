import UIKit

protocol HomeBusinessLogic: AnyObject {
    func fetchTeams(request: HomeModels.FetchTeams.Request)
    func didSelectTeam(request: HomeModels.DidSelectTeam.Request)
}

final class HomeInteractor {
    private let presenter: HomePresentationLogic
    private let getTeams: GetTeamsUseCase

    init(presenter: HomePresentationLogic, getTeams: GetTeamsUseCase) {
        self.presenter = presenter
        self.getTeams = getTeams
    }
}

extension HomeInteractor: HomeBusinessLogic {
    func fetchTeams(request: HomeModels.FetchTeams.Request) {
        getTeams.execute(completion: { response in
            switch response {
            case .success(let teams):
                self.presenter.presentTeams(response: .init(teams: teams.data))
            case .failure(let error):
                print("[ERROR] \(error)")
            }
        })
    }

    func didSelectTeam(request: HomeModels.DidSelectTeam.Request) {
        let team = TeamDetail(id: request.id, abbreviation: request.abbreviation ?? "", city: request.city ?? "", name: request.name ?? "")
        presenter.presentTeam(response: .init(teamDetail: team))
    }
}
