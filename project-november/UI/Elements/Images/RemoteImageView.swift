import Foundation
import SwiftUI
import Combine

struct RemoteImageView: View {
    @ObservedObject var remoteImageUrl: ImageLoader
    
    var imageSide: CGFloat?
    
    init(_ imageUrl: String) {
        self.remoteImageUrl = ImageLoader(imageUrl)
    }
    
    init(_ imageUrl: String, imageSide: CGFloat) {
        self.remoteImageUrl = ImageLoader(imageUrl)
        self.imageSide = imageSide
    }
    
    var body: some View {
        let viewBody = getBody()
        
        guard imageSide != nil else {
            return AnyView(viewBody)
        }
        
        return AnyView(viewBody.frame(width: imageSide, height: imageSide))
    }
    
    private func getBody() -> some View {
        HStack {
            if remoteImageUrl.imageData.isEmpty {
                AnimationLoader(loaderStyle: .medium)
            } else {
                Image(uiImage: UIImage(data: remoteImageUrl.imageData)!)
                    .resizable()
            }
        }
    }
}
