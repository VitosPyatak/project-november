import Foundation

class UserEntity: Codable, Identifiable {
    var firstName: String?
    var lastName: String?
    var phoneNumber: String?
    var email: String?
    var password: String?
}
