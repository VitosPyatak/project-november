import Foundation
import SwiftUI
import Combine

struct RemoteImageView: View {
    @ObservedObject var remoteImageUrl: ImageLoader
    
    private let imageSide: CGFloat = 50
    
    init(_ imageUrl: String) {
        self.remoteImageUrl = ImageLoader(imageUrl)
    }
    
    var body: some View {
        Image(uiImage: getUiImage())
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: imageSide, height: imageSide)
    }
    
    private func getUiImage() -> UIImage {
        remoteImageUrl.imageData.isEmpty
            ? UIImage(systemName: "heart.fill")!
            : UIImage(data: remoteImageUrl.imageData)!
    }
}
