import SwiftUI

struct UsersListView: View {
    @State private var users: [UserEntity]?
    
    var body: some View {
        HStack {
            if let allUsers = users {
                List(allUsers) { user in
                    VStack {
                        Text("\(user.firstName!) \(user.lastName!)").fontWeight(.bold)
                        Text(user.phoneNumber!).fontWeight(.regular)
                    }
                }
            } else {
                Text(ErrorMessages.noUsers)
            }
        }
        .onAppear(perform: fetchUsers)
        .navigationBarTitle(NavigationTitles.usersList)
    }
    
    private func fetchUsers() {
        users = UserService.getAll()
    }
}
