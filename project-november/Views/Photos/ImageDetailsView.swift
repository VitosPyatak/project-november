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
        VStack {
            if let details = albumDetails.details {
                NavigationLink(destination: RemoteImage(photo.url)) {
                    RemoteImage(photo.url, imageSide: imageSide)
                        .cornerRadius(imageCornerRadius)
                }

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
        let iconType: SystemIconType = isStarred ? .starFill : .star
        return Image(uiImage: UIImage(systemName: iconType.name())!)
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
