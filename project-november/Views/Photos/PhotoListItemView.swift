import SwiftUI

struct PhotoListItemView: View {
    private var photo: PhotoEntity
    
    init(_ photo: PhotoEntity) {
        self.photo = photo
    }
    
    var body: some View {
        NavigationLink(destination: PhotoDetailsView(photo)) {
            RemoteImageView(photo.url)
            Text(photo.title)
        }
    }
}
