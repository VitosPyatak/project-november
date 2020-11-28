import Foundation
import Alamofire

struct PhotosController {
    private static let requestUrl = "\(JPApiConfig.baseUrl)/photos"
    
    private static let fetchLimit = 15
    private static let defaultSkip = 0
    
    static func get(skip: Int = defaultSkip, completion complete: @escaping ([PhotoEntity]?) -> Void) {
        let parameters = JPApiParametersBuilder.build(skip: skip, limit: fetchLimit)
        AF.request(requestUrl, method: .get, parameters: parameters).responseDecodable(of: [PhotoEntity].self) { response in
            complete(response.value)
        }
    }
}


struct AlbumController {
    private static let requestUrl = "\(JPApiConfig.baseUrl)/albums"
    
    private static let fetchLimit = 15
    private static let defaultSkip = 0
    
    static func get(skip: Int = defaultSkip, completion complete: @escaping ([AlbumEntity]?) -> Void) {
        let parameters = JPApiParametersBuilder.build(skip: skip, limit: fetchLimit)
        AF.request(requestUrl, method: .get, parameters: parameters).responseDecodable(of: [AlbumEntity].self) { response in
            complete(response.value)
        }
    }
    
    static func get(by id: Int, completion complete: @escaping (AlbumEntity?) -> Void) {
        let albumRequestUrl = "\(requestUrl)/\(id)"
        AF.request(albumRequestUrl, method: .get).responseDecodable(of: AlbumEntity.self) { response in
            complete(response.value)
        }
    }
}
