import Foundation
import Combine
import SwiftUI

final class PhotosViewModel: ObservableObject {
    @Published var photos = [PhotoEntity]()
    @Published var starredPhotosMapping = [Int: PhotoEntity]()
    
    private var loadedItems = 0
    private let loadingStep = 15
    
    func loadPhotos() {
        loadStarredPhotos()
        PhotosController.get(skip: loadedItems) { fetchedPhotos in
            if let photos = fetchedPhotos {
                self.photos = photos
            } else {
                self.photos = []
            }
            self.increaseLoadedAmount()
        }
    }
    
    func loadStarredPhotos() {
        let starredPhotos = StarredService.getStarred()
        starredPhotosMapping = starredPhotos.reduce(into: [Int : PhotoEntity]()) { dictionary, photo in
            dictionary[photo.id] = photo
        }
    }
    
    private func increaseLoadedAmount() {
        loadedItems += loadingStep
    }
}
