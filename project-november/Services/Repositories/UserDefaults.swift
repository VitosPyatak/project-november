import Foundation

class UserDefaultsService {
    static let shared = UserDefaultsService()
    
    private let userDefaults: UserDefaults = .standard
    
    func setArray(_ dataArray: [Data], for key: String) {
        userDefaults.set(dataArray, forKey: key)
    }
    
    func getData(for key: String) -> Data? {
        userDefaults.data(forKey: key)
    }
    
    func getArray(for key: String) -> [Data]? {
        userDefaults.array(forKey: key) as? [Data]
    }
}
