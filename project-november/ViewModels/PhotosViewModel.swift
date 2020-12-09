import Foundation
import SwiftUI

final class PhotosViewModel: ObservableObject {
    @Published var photos = [PhotoEntity]()
    @Published var starredPhotosMapping = [Int: PhotoEntity]()
    
    var starredImages: [PhotoEntity] {
        get { starredPhotosMapping.enumerated().map { _, entry in entry.value } }
    }
    
    private var loadedItems = 0
    private let loadingStep = 15
    
    func loadPhotos() {
        loadStarredPhotos()
        PhotosController.getMany(skip: loadedItems) { fetchedPhotos in
            if let photos = fetchedPhotos {
                self.photos = photos
                self.increaseLoadedAmount()
            } else {
                self.photos = []
            }
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
