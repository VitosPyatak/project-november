import Foundation

struct SystemIcons {
    enum SysIcon {
        case message
        case pencil
        case confirmation
        case reject
        case refresh
        case star
        case starFill
    }
    
    private static let icons: [SysIcon : String] = [
        .message: "message",
        .pencil: "pencil.tip.crop.circle",
        .confirmation: "checkmark.icloud.fill",
        .reject: "exclamationmark.icloud.fill",
        .refresh: "arrow.clockwise.icloud",
        .star: "star",
        .starFill: "star.fill"
    ]
    
    static func get(_ id: SysIcon) -> String {
        icons[id]!
    }
}
