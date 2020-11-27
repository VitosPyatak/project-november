import Foundation
import SwiftUI

struct StarredPhotosView: View {
    @ObservedObject private var photosViewModel = PhotosViewModel()
    
    var body: some View {
        VStack {
            if photosViewModel.starredPhotosMapping.isEmpty {
                Text(ErrorMessages.noStarred)
            } else {
                List(photosViewModel.starredImages) { starredImage in
                    PhotoListItemView(starredImage)
                }
            }
        }
        .navigationBarTitle(NavigationTitles.starredPhotos)
        .onAppear(perform: loadStarredPhotos)
    }
    
    private func loadStarredPhotos() {
        photosViewModel.loadStarredPhotos()
    }
}
