import SwiftUI

struct UsersListView: View {
    @State private var users: [User]?
    
    
    
    var body: some View {
        HStack {
            if let allUsers = users {
                List(allUsers) { user in
                    VStack(alignment: .leading) {
                        Text("\(user.firstName!) \(user.lastName!)").fontWeight(.bold)
                        Text(user.phoneNumber!).fontWeight(.regular)
                    }
                }
            } else {
                Text(ErrorMessages.noUsers)
            }
        }
        .onAppear(perform: fetchUsers)
    }
    
    private func fetchUsers() {
        users = UserService.getAll()
    }
}


//struct UserListPreview: PreviewProvider {
//    
//     private var users = [UserEntity]()
//    
//    
//    init() {
//        let user1 = UserEntity()
//        user1.firstName = "test"
//        user1.lastName = "test"
//        user1.phoneNumber = "123123123"
//        
//        let user2 = UserEntity()
//        user2.firstName = "test"
//        user2.lastName = "test"
//        user2.phoneNumber = "123123123"
//        
//        users = [user1, user2]
//    }
//    
//    
//    static var previews: some View {
//        UsersListView()
//    }
//}
