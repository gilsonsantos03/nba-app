import Cartography
import UIKit

final class TeamCell: UITableViewCell {

    static let identifier = "TeamCell"

    struct ViewModel {
        let abbreviation: String
        let name: String
        let city: String
    }

    var teamAbbreviation: String?
    var teamName: String?
    var teamCity: String?

    private let backgroundBox: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 4
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        return view
    }()

    private let icon: UILabel = {
        let label = UILabel()
        label.backgroundColor = .black
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .center
        label.layer.borderWidth = 3
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 6
        return label
    }()

    private let name: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        return label
    }()

    private let city: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        return label
    }()

    private let rightArrow: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.text = ">"
        return label
    }()

    private let stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 6
        return stack
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    required init?(coder: NSCoder) {
        nil
    }

    private func setup() {
        stackLabels()
        setupConstraints()
    }

    private func setupConstraints() {
        constrainBackgroundBox()
        constrainIcon()
        constrainStack()
        constrainRightArrow()
    }

    private func stackLabels() {
        stack.addArrangedSubview(name)
        stack.addArrangedSubview(city)
    }

    private func constrainBackgroundBox() {
        addSubview(backgroundBox)
        constrain(backgroundBox, self) { background, view in
            background.top == view.top
            background.leading == view.leading + 16
            background.trailing == view.trailing - 16
            background.bottom == view.bottom - 6
        }
    }

    private func constrainIcon() {
        addSubview(icon)
        constrain(icon, backgroundBox) { icon, background in
            icon.leading == background.leading + 8
            icon.centerY == background.centerY
            icon.width == 40
            icon.height == 30
        }
    }

    private func constrainStack() {
        addSubview(stack)
        constrain(stack, icon, backgroundBox) { stack, icon, background in
            stack.leading == icon.trailing + 16
            stack.centerY == background.centerY
        }
    }

    private func constrainRightArrow() {
        addSubview(rightArrow)
        constrain(rightArrow, backgroundBox) { arrow, background in
            arrow.trailing == background.trailing - 10
            arrow.centerY == background.centerY
        }
    }
}

extension TeamCell {
    func configure(with display: ViewModel) {
        icon.text = display.abbreviation
        name.text = display.name
        city.text = display.city

        self.teamAbbreviation = display.abbreviation
        self.teamName = display.name
        self.teamCity = display.city
    }
}
