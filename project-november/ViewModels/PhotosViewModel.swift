import Foundation
import SwiftUI

final class PhotosViewModel: ObservableObject {
    @Published var photos = [PhotoEntity]()

    func loadPhotos() {
        PhotosController.get { fetchedPhotos in
            if let photos = fetchedPhotos {
                self.photos = photos
            } else {
                self.photos = []
            }
        }
    }
}
