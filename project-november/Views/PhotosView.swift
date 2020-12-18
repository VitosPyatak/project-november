import Foundation
import SwiftUI

struct PhotosView: View {
    @ObservedObject private var viewModel = PhotosViewModel()

    var body: some View {
        HStack {
            if viewModel.photos.isEmpty {
                Text(ErrorMessages.noPhotos)
            } else {
                List(viewModel.photos) { photo in
                    RemoteImage(photo.url)
                    Text(photo.title)
                }
            }
        }
        .onAppear(perform: fetchPhotos)
    }

    private func fetchPhotos() {
        viewModel.loadPhotos()
    }
}
