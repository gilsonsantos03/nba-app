import Foundation

enum HomeModels {

    enum FetchTeams {
        struct Request {}

        struct Response {
            let teams: [Datum]
        }

        struct ViewModel {
            let teams: [TeamCell.ViewModel]
            let numberOfTeams: Int
        }
    }

    enum DidSelectTeam {
        struct Request {
            let id: Int
            let abbreviation: String?
            let city: String?
            let name: String?
        }

        struct Response {
            let teamDetail: TeamDetail
        }

        struct ViewModel {
            let teamDetail: TeamDetail
        }
    }
}
