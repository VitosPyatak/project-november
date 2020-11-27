import Foundation
import SwiftUI
import Combine

struct RemoteImageView: View {
    @ObservedObject var remoteImageUrl: ImageLoader
    
    var imageSide: CGFloat
    
    private static let defaultImageSide: CGFloat = 50
    
    init(_ imageUrl: String, imageSide: CGFloat? = defaultImageSide) {
        self.remoteImageUrl = ImageLoader(imageUrl)
        self.imageSide = imageSide!
    }
    
    var body: some View {
        HStack{
            if remoteImageUrl.imageData.isEmpty {
                AnimationLoader(loaderStyle: .medium)
            } else {
                Image(uiImage: UIImage(data: remoteImageUrl.imageData)!)
                    .resizable()
            }
        }
        .aspectRatio(contentMode: .fit)
        .frame(width: imageSide, height: imageSide)
    }
}
