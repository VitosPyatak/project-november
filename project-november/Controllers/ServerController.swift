import Foundation
import SwiftUI
import Alamofire

struct AppApiController {
    private static let baseUrl = "ngrok"

    static func upload(_ imageData: Data, for userId: UUID, completion complete: @escaping (_ file: FileUploadEntity) -> Void) {
        AF.upload(
            multipartFormData: { data in modifyMultipartFormData(data, with: imageData, and: userId) },
            to: getImageUploadRequestUrl(from: userId)
        ).responseDecodable(of: FileUploadEntity.self) { response in
            complete(response.value!)
        }
    }

    private static func modifyMultipartFormData(_ data: MultipartFormData, with imageData: Data, and userId: UUID) {
        data.append(imageData, withName: userId.uuidString, fileName: generateFileName(from: userId), mimeType: MimeTypes.imageJpeg)
    }

    private static func generateWithName(from userId: UUID) -> String {
        userId.uuidString
    }

    private static func generateFileName(from userId: UUID) -> String {
        "\(userId.uuidString).jpeg"
    }

    private static func getImageUploadRequestUrl(from userId: UUID) -> String {
        "\(baseUrl)/users/\(userId)/image"
    }
}
