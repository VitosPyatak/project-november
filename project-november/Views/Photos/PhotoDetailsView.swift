import SwiftUI

struct PhotoDetailsView: View {
    private var photo: PhotoEntity
    @ObservedObject private var albumDetails = AlbumDetailsViewModel()
    
    private let imageSide: CGFloat = 150
    private let imageCornerRadius: CGFloat = 50
    
    init(_ photo: PhotoEntity) {
        self.photo = photo
    }
    
    var body: some View {
        VStack {
            if let details = albumDetails.details {
                RemoteImageView(photo.url, imageSide: imageSide)
                    .cornerRadius(imageCornerRadius)
                
                Text(details.title).bold().font(.title)
                
                Text(photo.title)                
            } else {
                AnimationLoader(loaderStyle: .large)
            }
        }
        .padding()
        .navigationBarTitle(NavigationTitles.details, displayMode: .automatic)
        .onAppear(perform: loadDetails)
    }
    
    private func loadDetails() {
        albumDetails.loadDetails(for: photo.albumId)
    }
}
