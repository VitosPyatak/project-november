import Foundation

struct NavigationService {
    private static let dataService = UserDefaultsService()
    
    private static let refreshKey = "#resfresh"
    
    static func setRefresh(to value: Bool) {
        dataService.set(value, for: refreshKey)
    }
    
    static func doNeedToRefresh() -> Bool {
        dataService.getBool(for: refreshKey) ?? true
    }
}
