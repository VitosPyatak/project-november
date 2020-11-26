import Foundation
import Alamofire

struct PhotosController {
    private static let requestUrl = "\(JPApiConfig.BASE_URL)/photos"
    
    private static var fetchLimit = 15
    
    static func get(skip: Int = 0, completion complete: @escaping ([PhotoEntity]?) -> Void) {
        let parameters = ["_limit": fetchLimit, "_start": skip]
        AF.request(requestUrl, method: .get, parameters: parameters).responseDecodable(of: [PhotoEntity].self) { response in
            complete(response.value)
        }
    }
}
