import SwiftUI
import Combine

class RemoteImageURL: ObservableObject {
    @Published var imageData: Data = Data()
    
    init(imageURL: String) {
        guard let url = URL(string: imageURL) else {
            return
        }
        
        URLSession.shared.dataTask(with: url, completionHandler: setRemoteImageUrl).resume()
    }
    
    private func setRemoteImageUrl(_ data: Data?, _ response: URLResponse?, _ error: Error?) {
        guard let data = data else { return }
        
        DispatchQueue.main.async {
            self.imageData = data
        }
    }
}
