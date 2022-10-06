import UIKit

protocol HomeDisplayLogic: AnyObject {
    func displayTeams(viewModel: HomeModels.FetchTeams.ViewModel)
    func displayTeam(viewModel: HomeModels.DidSelectTeam.ViewModel)
}

final class HomeViewController: UIViewController {

    private let customView: HomeViewProtocol
    private let router: HomeRoutingLogic
    private let interactor: HomeInteractor

    private var teams: [TeamCell.ViewModel] = []

    init(view: HomeViewProtocol = HomeView(), router: HomeRoutingLogic, interactor: HomeInteractor) {
        self.customView = view
        self.router = router
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
        customView.setTableViewDelegate(self)
        customView.setTableViewDataSource(self)
    }

    required init?(coder: NSCoder) {
        nil
    }

    override func loadView() {
        view = customView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        interactor.fetchTeams(request: .init())
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigationBar()
    }

    private func setupNavigationBar() {
        view.backgroundColor = UIColor.white
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.tintColor = .white
        navigationItem.title = "Teams"
    }
}

extension HomeViewController: HomeDisplayLogic {
    func displayTeams(viewModel: HomeModels.FetchTeams.ViewModel) {
        teams = viewModel.teams
        customView.reload()
    }

    func displayTeam(viewModel: HomeModels.DidSelectTeam.ViewModel) {
        router.showDetail(teamDetail: viewModel.teamDetail)
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        teams.count
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)

        if let cell = cell as? TeamCell {
            tableView.deselectRow(at: indexPath, animated: true)
            interactor.didSelectTeam(request: .init(id: indexPath.count, abbreviation: cell.teamAbbreviation , city: cell.teamCity, name: cell.teamName))
        }
    }
}

extension HomeViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TeamCell.identifier, for: indexPath) as? TeamCell else {
            return UITableViewCell()
        }

        let team = teams[indexPath.row]
        cell.configure(with: team)

        return cell
    }
}
