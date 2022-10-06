import Foundation

public protocol TeamsRepositoryInterface: AnyObject {
    func getTeams(completion: @escaping (Result<Team, CustomError>) -> Void)
}
