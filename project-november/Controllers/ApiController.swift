import Foundation
import Alamofire

struct ApiController<GenericResponseEntity> where GenericResponseEntity: Codable {
    private var requestUrl: String
    
    var parameters = Parameters()
    
    init(_ requestUrl: String) {
        self.requestUrl = requestUrl
    }
    
    func getMany(completion complete: @escaping ([GenericResponseEntity]?) -> Void) {
        AF.request(requestUrl, method: .get, parameters: parameters).responseDecodable(of: [GenericResponseEntity].self) { response in
            complete(response.value)
        }
    }
    
    func getOne(by id: Int, completion complete: @escaping (GenericResponseEntity?) -> Void) {
        AF.request(getRequestUrl(id), method: .get).responseDecodable(of: GenericResponseEntity.self) { response in
            complete(response.value)
        }
    }
            
    private func getRequestUrl(_ id: Int) -> String {
        "\(requestUrl)/\(id)"
    }
}
