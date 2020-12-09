import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = RegisterFormViewModel()
    
    var body: some View {
        TabView {
            NavigationView {
                RegisterView()
            }
            .tabItem { getViewTabItem(with: SystemIconType.personBadgePlus) }
            
            NavigationView {
                UsersListView()
            }
            .tabItem { getViewTabItem(with: SystemIconType.personFill) }
            
            NavigationView {
                PhotosView()
            }
            .tabItem { getViewTabItem(with: SystemIconType.photoListRecFill) }
            
            NavigationView {
                StarredPhotosView()
            }
            .tabItem { getViewTabItem(with: SystemIconType.starFill) }
        }
    }
    
    private func getViewTabItem(with systemIcon: SystemIconType) -> some View {
        HStack {
            Image(uiImage: UIImage(systemName: systemIcon.name())!)
        }
    }
}
