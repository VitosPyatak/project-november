import Foundation

struct SystemIcons {
    enum SysIcon {
        case message
        case pencil
        case confirmation
        case reject
    }
    
    private static let icons: [SysIcon : String] = [
        .message: "message",
        .pencil: "pencil.tip.crop.circle",
        .confirmation: "checkmark.icloud.fill",
        .reject: "exclamationmark.icloud.fill"
    ]
    
    static func get(_ id: SysIcon) -> String {
        icons[id]!
    }
}
