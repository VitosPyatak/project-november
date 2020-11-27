import SwiftUI

struct PhotoDetailsView: View {
    private var photo: PhotoEntity
    
    @ObservedObject private var albumDetails = AlbumDetailsViewModel()
    @State private var isStarred = false
    
    private let imageSide: CGFloat = 150
    private let imageCornerRadius: CGFloat = 50
    
    init(_ photo: PhotoEntity) {
        self.photo = photo
        NavigationService.setRefresh(to: false)
    }
    
    var body: some View {
        VStack  {
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
        .navigationBarItems(
            trailing: getNavigationTitleStarButton().onTapGesture(perform: toggleIsStarred)
        )
        .onAppear(perform: loadDetails)
    }
    
    private func getNavigationTitleStarButton() -> Image {
        Image(uiImage: UIImage(systemName: SystemIcons.get(isStarred ? .starFill : .star))!)
    }
    
    private func getNavigationBackButton() -> Image {
        Image(uiImage: UIImage(systemName: SystemIcons.get(isStarred ? .starFill : .star))!)
    }
    
    private func toggleIsStarred() {
        isStarred.toggle()
        StarredService.updateStarred(with: photo, as: isStarred)
    }
    
    private func loadDetails() {
        isStarred = isPhotoStarred()
        albumDetails.loadDetails(for: photo.albumId)
    }
    
    private func isPhotoStarred() -> Bool {
        photo.isStarred ?? false
    }
}
