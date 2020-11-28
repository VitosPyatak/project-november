import Foundation

struct JPApiParametersBuilder {
    private static let defaultLimit = 15
    private static let defaultSkip = 0
    
    static func build(skip: Int? = defaultSkip, limit: Int? = defaultLimit ) -> [String : Any] {
        [
            "_start": skip!,
            "_limit": limit!
        ]
    }
}
