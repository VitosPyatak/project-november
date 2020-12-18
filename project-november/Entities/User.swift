import Foundation

class User: Codable, Identifiable {
    var firstName: String?
    var lastName: String?
    var phoneNumber: String?
    var email: String?
    var password: String?
}
