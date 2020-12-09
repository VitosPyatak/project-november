import Foundation

class AlbumDetailsViewModel: ObservableObject {
    @Published var details: AlbumEntity?

    func loadDetails(for albumId: Int) {
        AlbumController.get(by: albumId) { details in
            self.details = details
        }
    }
}
