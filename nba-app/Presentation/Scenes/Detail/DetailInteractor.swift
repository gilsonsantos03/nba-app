import UIKit

protocol DetailBusinessLogic: AnyObject {
    func showTeamDetail(request: DetailModels.ShowDetail.Request)
}

final class DetailInteractor {
    private let presenter: DetailPresentationLogic
    private let teamDetail: TeamDetail

    init(presenter: DetailPresentationLogic, teamDetail: TeamDetail) {
        self.presenter = presenter
        self.teamDetail = teamDetail
    }
}

extension DetailInteractor: DetailBusinessLogic {
    func showTeamDetail(request: DetailModels.ShowDetail.Request) {
        presenter.presentTeamDetail(response: .init(teamDetail: teamDetail))
    }
}
