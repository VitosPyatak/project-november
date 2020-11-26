import Foundation
import Alamofire

struct PhotosController {
    private static let baseUrl = JPApiConfig.BASE_URL
    
    private static var path = "/photos"
    private static var fetchLimit = 15
    
    static func get(completion complete: @escaping ([PhotoEntity]?) -> Void) {
        let requestUrl = "\(baseUrl)\(path)"
        let parameters = ["_limit": fetchLimit]
        AF.request(requestUrl, method: .get, parameters: parameters).responseDecodable(of: [PhotoEntity].self) { response in
            complete(response.value)
        }
    }
}
