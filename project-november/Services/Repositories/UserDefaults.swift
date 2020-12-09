import Foundation

struct UserDefaultsService {
    private let userDefaults: UserDefaults = .standard
    
    func set(_ value: Any, for key: String) {
        userDefaults.set(value, forKey: key)
    }
        
    func setArray(_ dataArray: [Data], for key: String) {
        userDefaults.set(dataArray, forKey: key)
    }
    
    func getData(for key: String) -> Data? {
        userDefaults.data(forKey: key)
    }
    
    func getArray(for key: String) -> [Data]? {
        userDefaults.array(forKey: key) as? [Data]
    }
    
    func getBool(for key: String) -> Bool? {
        userDefaults.bool(forKey: key)
    }
    
    func getIntArray(for key: String) -> [Int]? {
        userDefaults.array(forKey: key) as? [Int]
    }
    
    func getDictionary(for key: String) -> Any? {
        userDefaults.object(forKey: key)
    }
    
    func getString(for key: String) -> String? {
            userDefaults.string(forKey: key)
        }
}
