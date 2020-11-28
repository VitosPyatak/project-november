import Foundation

struct PhotoEntity: Codable, Hashable, Identifiable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
    var isStarred: Bool?
}
