import Foundation

struct UserService {
    private static let dataService = UserDefaultsService()
    
    private static let repositoryKey = "#users"
    
    static func save(from textFields: [TextFieldInput]) {
        let newUser = UserBuilder.build(from: textFields)
        processNewInstanceSaving(newUser)
    }
    
    static func getAll() -> [UserEntity]? {
        guard let allUsers = dataService.getArray(for: repositoryKey) else {
            return nil
        }
        return getDecodedUsers(from: allUsers)
    }
    
    private static func processNewInstanceSaving(_ newUser: UserEntity) {
        let newUserData = JsonCoder.encode(newUser)
        
        guard var usersData = dataService.getArray(for: repositoryKey) else {
            return dataService.setArray([newUserData], for: repositoryKey)
        }
        
        usersData.append(newUserData)
        dataService.setArray(usersData, for: repositoryKey)
    }
    
    private static func getDecodedUsers(from users: [Data]) -> [UserEntity] {
        users.map { user in JsonCoder.decode(user, of: UserEntity.self) }
    }
}
