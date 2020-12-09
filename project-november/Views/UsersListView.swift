import SwiftUI

struct UsersListView: View {
    @State private var users: [UserEntity]?
    
    var body: some View {
        HStack {
            if let allUsers = users {
                List(allUsers) { user in
                    NavigationLink(destination: UserAccountView(user)) {
                        VStack {
                            Text(getHeaderText(from: user)).fontWeight(.bold)
                            Text(getSubheaderText(from: user)).fontWeight(.regular)
                        }
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
    
    private func getHeaderText(from user: UserEntity) -> String {
        "\(user.firstName!) \(user.lastName!)"
    }

    private func getSubheaderText(from user: UserEntity) -> String {
        user.phoneNumber!
    }
}
