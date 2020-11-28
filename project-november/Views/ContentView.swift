import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = RegisterFormViewModel()
    
    var body: some View {
        TabView {
            NavigationView {
                RegisterView()
            }
            .tabItem { getViewTabItem(with: .personBadgePlus) }
            
            NavigationView {
                UsersListView()
            }
            .tabItem { getViewTabItem(with: .personFill) }
            
            NavigationView {
                PhotosView()
            }
            .tabItem { getViewTabItem(with: .photoListRecFill) }
            
            NavigationView {
                StarredPhotosView()
            }
            .tabItem { getViewTabItem(with: .starFill) }
        }
    }
    
    private func getViewTabItem(with systemIconName: SysIcon) -> some View {
        HStack {
            Image(uiImage: UIImage(systemName: SystemIcons.get(systemIconName))!)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
