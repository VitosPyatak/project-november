import Foundation

struct AlbumEntity: Codable, Hashable, Identifiable {
    let id: Int
    let userId: Int
    let title: String
}
