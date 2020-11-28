import SwiftUI

struct PhotoListItemView: View {
    private var photo: PhotoEntity
    
    private let imageSide: CGFloat = 50
    
    init(_ photo: PhotoEntity) {
        self.photo = photo
    }
    
    var body: some View {
        NavigationLink(destination: PhotoDetailsView(photo)) {
            RemoteImageView(photo.url, imageSide: imageSide)
            Text(photo.title)
        }
    }
}
