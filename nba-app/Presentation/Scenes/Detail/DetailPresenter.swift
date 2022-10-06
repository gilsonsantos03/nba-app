import UIKit

protocol DetailPresentationLogic: AnyObject {
    func presentTeamDetail(response: DetailModels.ShowDetail.Response)
}

final class DetailPresenter {
    weak var view: DetailDisplayLogic?
}

extension DetailPresenter: DetailPresentationLogic {
    func presentTeamDetail(response: DetailModels.ShowDetail.Response) {
        let teamDetail = response.teamDetail
        view?.displayTeamDetail(viewModel: .init(teamDetail: teamDetail))
    }
}
