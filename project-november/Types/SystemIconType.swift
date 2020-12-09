import Foundation

enum SystemIconType {
    case message
    case pencil
    case confirmation
    case reject
    
    func name() -> String {
        switch self {
        case .message:
            return SystemIcons.message
        case .pencil:
            return SystemIcons.pencil
        case .confirmation:
            return SystemIcons.checkmark
        case .reject:
            return SystemIcons.exclamationMark
        }
    }
}
