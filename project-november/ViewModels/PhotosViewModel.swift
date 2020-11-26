import Foundation
import Combine
import SwiftUI

final class PhotosViewModel: ObservableObject {
    @Published var photos = [PhotoEntity]()
    
    private var loadedItems = 0
    private let loadingStep = 15
    
    func loadPhotos() {
        PhotosController.get(skip: loadedItems) { fetchedPhotos in
            if let photos = fetchedPhotos {
                self.photos = photos
            } else {
                self.photos = []
            }
            self.increaseLoadedAmount()
        }
    }
    
    private func increaseLoadedAmount() {
        loadedItems += loadingStep
    }
}
