import Foundation
import SwiftUI

struct ImageService {
    private static let compressQuality: CGFloat = 0.1

    static func upload(_ image: UIImage, for user: UserEntity, completion: @escaping (FileUploadEntity) -> Void) {
        let imageData = image.jpegData(compressionQuality: compressQuality) ?? Data()
        AppApiController.upload(imageData, for: user.id, completion: completion)
    }
}
