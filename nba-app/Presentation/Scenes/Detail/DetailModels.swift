import Foundation

enum DetailModels {
    
    enum ShowDetail {
        struct Request {}
        
        struct Response {
            let teamDetail: TeamDetail
        }
        
        struct ViewModel {
            let teamDetail: TeamDetail
        }
    }
}
