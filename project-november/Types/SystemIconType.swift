import Foundation

enum SystemIconType {
    case message
    case pencil
    case confirmation
    case reject
    case refresh
    case star
    case starFill
    case listBullet
    case photoListRecFill
    case personBadgePlus
    case personFill
    
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
        case .refresh:
            return SystemIcons.refreshArrow
        case .star:
            return SystemIcons.star
        case .starFill:
            return SystemIcons.starFill
        case .listBullet:
            return SystemIcons.listBullet
        case .photoListRecFill:
            return SystemIcons.photoListRectangleFill
        case .personBadgePlus:
            return SystemIcons.personBadgePlus
        case .personFill:
            return SystemIcons.personFill
        }
    }
}
