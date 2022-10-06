import UIKit

protocol DetailDisplayLogic: AnyObject {
    func displayTeamDetail(viewModel: DetailModels.ShowDetail.ViewModel)
}

final class DetailViewController: UIViewController {

    private let customView: DetailViewProtocol
    private let router: DetailRoutingLogic
    private let interactor: DetailInteractor


    init(view: DetailViewProtocol = DetailView(), router: DetailRoutingLogic, interactor: DetailInteractor) {
        self.customView = view
        self.router = router
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        configureNavigationBar()
    }

    override func loadView() {
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.showTeamDetail(request: .init())
    }
}

extension DetailViewController: DetailDisplayLogic {
    func displayTeamDetail(viewModel: DetailModels.ShowDetail.ViewModel) {
        let teamDetail = viewModel.teamDetail
        customView.configure(viewModel: .init(abbreviation: teamDetail.abbreviation, city: teamDetail.city, name: teamDetail.name))
    }
}

// MARK: - Private Methods
extension DetailViewController {
    private func configureNavigationBar() {
        navigationController?.navigationBar.tintColor = .black
    }
}
