import Foundation

enum SysIcon {
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
}

struct SystemIcons {
    
    private static let icons: [SysIcon : String] = [
        .message: "message",
        .pencil: "pencil.tip.crop.circle",
        .confirmation: "checkmark.icloud.fill",
        .reject: "exclamationmark.icloud.fill",
        .refresh: "arrow.clockwise.icloud",
        .star: "star",
        .starFill: "star.fill",
        .listBullet: "list.bullet",
        .photoListRecFill: "photo.fill.on.rectangle.fill",
        .personBadgePlus: "person.badge.plus",
        .personFill: "person.fill"
    ]
    
    static func get(_ id: SysIcon) -> String {
        icons[id]!
    }
}
