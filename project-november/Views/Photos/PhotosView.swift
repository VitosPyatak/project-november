import Foundation
import SwiftUI

struct PhotosView: View {
    @ObservedObject private var viewModel = PhotosViewModel()
    @State private var starredPhotos = [PhotoEntity]()
    @State private var starredPhotosMapping = [Int: PhotoEntity]()
    
    var body: some View {
        VStack {
            if viewModel.photos.isEmpty {
                Text(ErrorMessages.noPhotos)
            } else {
                List(viewModel.photos) { photo in
                    NavigationLink(destination: PhotoDetailsView(getFinalPhotoEntry(from: photo))) {
                        RemoteImageView(photo.url)
                        Text(photo.title)
                    }
                }
            }
        }
        .onAppear(perform: processPhotosLoading)
        .navigationBarTitle(NavigationTitles.photosList, displayMode: .inline)
        .navigationBarItems(trailing: getNavigationBarRefreshButton())
    }
    
    private func getNavigationBarRefreshButton() -> Button<Image> {
        Button(action: viewModel.loadPhotos) {
            Image(systemName: SystemIcons.get(.refresh))
        }
    }
    
    private func processPhotosLoading() {
        processStarredPhotos()
        if NavigationService.doNeedToRefresh() {
            viewModel.loadPhotos()
        }
    }
    
    private func getFinalPhotoEntry(from photo: PhotoEntity) -> PhotoEntity {
        starredPhotosMapping[photo.id] ?? photo
    }
    
    private func processStarredPhotos() {
        starredPhotos = StarredService.getStarred()
        starredPhotosMapping = starredPhotos.reduce(into: [Int : PhotoEntity]()) { dictionary, photo in
            dictionary[photo.id] = photo
        }
    }
}
