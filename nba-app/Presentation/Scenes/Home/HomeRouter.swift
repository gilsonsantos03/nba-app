import UIKit

protocol HomeRoutingLogic: AnyObject {
    func showDetail(teamDetail: TeamDetail)
}

final class HomeRouter {
    weak var viewController: (UIViewController & HomeDisplayLogic)?
}

extension HomeRouter: HomeRoutingLogic {
    func showDetail(teamDetail: TeamDetail) {
        let detailViewController = DetailConfigurator(teamDetail: teamDetail).resolve()
        viewController?.navigationController?.pushViewController(detailViewController, animated: true)
    }
}

