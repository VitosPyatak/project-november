import Foundation
import Alamofire

struct PhotosController {
    private static var apiController = ApiController<PhotoEntity>("https://jsonplaceholder.typicode.com/photos")
    private static let fetchLimit = 15
    
    static func getMany(skip: Int, completion: @escaping ([PhotoEntity]?) -> Void) {
        apiController.parameters = getParameters(skip: skip)
        apiController.getMany(completion: completion)
    }
    
    private static func getParameters(skip: Int) -> Parameters {
        [
            "_limit": fetchLimit,
            "_start": skip
        ]
    }
}
