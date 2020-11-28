import Foundation
import SwiftUI

struct PhotosView: View {
    @ObservedObject private var viewModel = PhotosViewModel()
    
    var body: some View {
        VStack {
            if viewModel.photos.isEmpty {
                Text(ErrorMessages.noPhotos)
            } else {
                List(viewModel.photos) { photo in
                    PhotoListItemView(getFinalPhotoEntry(from: photo))
                }
            }
        }
        .onAppear(perform: processPhotosLoading)
        .navigationBarTitle(NavigationTitles.photosList)
        .navigationBarItems(trailing: getNavigationBarRefreshButton())
    }
    
    private func getNavigationBarRefreshButton() -> Button<Image> {
        Button(action: viewModel.loadPhotos) {
            Image(systemName: SystemIcons.get(.refresh))
        }
    }
    
    private func processPhotosLoading() {
        viewModel.loadStarredPhotos()
        if NavigationService.doNeedToRefresh() {
            viewModel.loadPhotos()
        }
    }
    
    private func getFinalPhotoEntry(from photo: PhotoEntity) -> PhotoEntity {
        viewModel.starredPhotosMapping[photo.id] ?? photo
    }
}
