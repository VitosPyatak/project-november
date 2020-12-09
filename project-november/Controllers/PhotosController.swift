import Foundation
import Alamofire

struct PhotosController {
    private static let baseUrl = "https://jsonplaceholder.typicode.com"

    private static var fetchLimit = 15

    static func get(completion complete: @escaping ([PhotoEntity]?) -> Void) {
        let requestUrl = "\(baseUrl)/photos"
        let parameters = ["_limit": fetchLimit]
        AF.request(requestUrl, method: .get, parameters: parameters).responseDecodable(of: [PhotoEntity].self) { response in
            complete(response.value)
        }
    }
}
