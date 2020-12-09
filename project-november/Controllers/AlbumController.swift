import Foundation
import Alamofire

struct AlbumController {
    private static var apiController = ApiController<AlbumEntity>("https://jsonplaceholder.typicode.com/albums")
    private static let fetchLimit = 15
    private static let defaultSkip = 0
    
    static func getMany(skip: Int = defaultSkip, completion: @escaping ([AlbumEntity]?) -> Void) {
        apiController.parameters = getParameters(skip: skip)
        apiController.getMany(completion: completion)
    }
    
    static func get(by id: Int, completion: @escaping (AlbumEntity?) -> Void) {
        apiController.getOne(by: id, completion: completion)
    }
    
    private static func getParameters(skip: Int) -> Parameters {
        [
            "_limit": fetchLimit,
            "_start": skip
        ]
    }
}
