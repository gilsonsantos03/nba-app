import Alamofire
import Foundation

final class GetTeamsRequest: URLRequestBuilder {
    var path: String {
        "api/v1/teams"
    }

    var parameters: Parameters?

    var method: HTTPMethod {
        .get
    }
}
