import Foundation
import SwiftUI

struct PersistentImageService {
    private static let dataService = UserDefaultsService()

    private static let imageFilePrefix = "#image"

    private static let compressQuality: CGFloat = 0.1

    static func save(_ image: UIImage, for userId: UUID) {
        let dataKey = generateImageKeyName(from: userId)
        let imageData = image.jpegData(compressionQuality: compressQuality) ?? Data()
        dataService.set(imageData, for: dataKey)
    }

    static func get(for userId: UUID) -> UIImage {
        let dataKey = generateImageKeyName(from: userId)
        if let imageData = dataService.getData(for: dataKey) {
            return UIImage(data: imageData)!
        }
        return UIImage(systemName: SystemIconType.personFill.name())!
    }

    private static func generateImageKeyName(from userId: UUID) -> String {
        "\(imageFilePrefix)-\(userId.uuidString)"
    }
}
