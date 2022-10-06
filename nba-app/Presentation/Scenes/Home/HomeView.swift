import Cartography
import UIKit

protocol HomeViewProtocol: UIView {
    func setTableViewDataSource(_ dataSource: UITableViewDataSource)
    func setTableViewDelegate(_ delegate: UITableViewDelegate)
    func reload()
}

final class HomeView: UIView {

    // MARK: - Properties

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(TeamCell.self, forCellReuseIdentifier: TeamCell.identifier)
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        return tableView
    }()

    // MARK: - Lifecycle

    init() {
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        nil
    }

    // MARK: - Constrains

    private func setup() {
        self.backgroundColor = .white
        addSubview(tableView)
        constrainTableView()
    }

    private func constrainTableView() {
        constrain(tableView, self) { tableView, view in
            tableView.edges == view.edges
        }
    }
}

extension HomeView: HomeViewProtocol {
    func setTableViewDataSource(_ dataSource: UITableViewDataSource) {
        tableView.dataSource = dataSource
    }

    func setTableViewDelegate(_ delegate: UITableViewDelegate) {
        tableView.delegate = delegate
    }

    func reload() {
        tableView.reloadData()
    }
}

