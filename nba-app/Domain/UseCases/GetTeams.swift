import Foundation

public protocol GetTeamsUseCase {
    func execute(completion: @escaping ((Result<Team, CustomError>) -> Void))
}

public final class GetTeams: GetTeamsUseCase {
    private let repository: TeamsRepositoryInterface

    public init(repository: TeamsRepositoryInterface) {
        self.repository = repository
    }

    public func execute(completion: @escaping ((Result<Team, CustomError>) -> Void)) {
        repository.getTeams { result in
            switch result {
            case .success(let teams):
                completion(.success(teams))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
