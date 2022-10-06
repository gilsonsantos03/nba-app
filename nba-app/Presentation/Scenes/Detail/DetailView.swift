import Cartography
import UIKit

protocol DetailViewProtocol: UIView {
    func configure(viewModel: ViewModel)
}

struct ViewModel {
    let abbreviation: String
    let city: String
    let name: String
}

final class DetailView: UIView {

    // MARK: - Properties
    
    private let abbreviationLabel: UILabel = {
        let label = UILabel()
        label.text = "1212122"
        return label
    }()
    
    private let cityLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    private let detailStackView: UIStackView = {
        let stack = UIStackView()
        stack.distribution = .fillProportionally
        stack.alignment = .center
        stack.axis = .vertical
        return stack
    }()
    

    // MARK: - Lifecycle

    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        setup()
    }

    required init?(coder: NSCoder) {
        nil
    }

    // MARK: - Constrains

    private func setup() {
        addSubview(detailStackView)
        addSubview(abbreviationLabel)
        addSubview(cityLabel)
        addSubview(nameLabel)
        setupConstrains()
    }
    
    private func setupConstrains() {
        constrainStackView()
    }
    
    private func constrainStackView() {
        detailStackView.addArrangedSubview(abbreviationLabel)
        detailStackView.addArrangedSubview(cityLabel)
        detailStackView.addArrangedSubview(nameLabel)
        
        constrain(detailStackView, self) { stack, superview in
            stack.centerX == superview.centerX
            stack.centerY == superview.centerY
        }
    }
}

extension DetailView: DetailViewProtocol {
    func configure(viewModel: ViewModel) {
        nameLabel.text = viewModel.name
        cityLabel.text = viewModel.city
        abbreviationLabel.text = viewModel.abbreviation
    }
}

