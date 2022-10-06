import Foundation

public final class TeamsRepository: TeamsRepositoryInterface {
    private let network: NetworkServiceInterface

    init(network: NetworkServiceInterface = NetworkService()) {
        self.network = network
    }
    
    public func getTeams(completion: @escaping (Result<Team, CustomError>) -> Void) {
        let request = GetTeamsRequest()

        network.request(request: request) { (result: Result<Team, CustomError>) in
            switch result {
            case .success(let teams):
                completion(.success(teams))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
