import Foundation

public enum CustomError: Error {
    case unexpected(message: String?)
}

extension CustomError {
    public var description: String? {
        switch self {
        case .unexpected(let message):
            return message
        }
    }
}
