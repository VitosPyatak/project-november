import Foundation
import SwiftUI

struct PhotosView: View {
    @ObservedObject private var viewModel = PhotosViewModel()
    
    var body: some View {        
        NavigationView {
            HStack {
                if viewModel.photos.isEmpty {
                    Text(ErrorMessages.noPhotos)
                } else {
                    List(viewModel.photos) { photo in
                        RemoteImageView(photo.url)
                        Text(photo.title)
                    }
                }
            }
        }
        .onAppear(perform: fetchPhotos)
        .navigationBarTitle(NavigationTitles.photosList)
        .navigationBarItems(trailing: getNavigationBarRefreshButton())
    }
    
    private func getNavigationBarRefreshButton() -> Button<Image> {
        Button(action: viewModel.loadPhotos) {
            Image(systemName: SystemIcons.get(.refresh))
        }
    }
    
    private func fetchPhotos() {
        viewModel.loadPhotos()
    }
}
