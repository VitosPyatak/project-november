import Foundation
import SwiftUI

struct UserAccountView: View {
    private var user: UserEntity

    @State private var doShowImagePicker = false
    @State private var selectedImage: Image?
    @State private var countdownCompleted = true

    init(_ user: UserEntity) {
        self.user = user
    }

    var body: some View {
        VStack {
            if countdownCompleted {
                Button(action: toggleImagePicker) {
                    Text(ButtonPlacehoder.chooseImage)
                }
            }

            if let image = selectedImage {
                if countdownCompleted {
                    image.resizable().scaledToFit()
                } else {
                    CountdownView(doneLoading: $countdownCompleted)
                }
            }

            if countdownCompleted {
                Button(action: uploadImageToServer) {
                    Text(ButtonPlacehoder.uploadImage)
                }
            }

        }
        .onAppear(perform: loadUserImage)
        .sheet(isPresented: $doShowImagePicker) {
            ImagePicker(image: $selectedImage)
        }
    }

    private func toggleImagePicker() {
        doShowImagePicker.toggle()
    }

    private func uploadImageToServer() {
        setUploadingUi()
        if let image = selectedImage {
            let uiImage = image.asUIImage()
            ImageService.upload(uiImage, for: user, completion: completeImageUploading)
            PersistentImageService.save(uiImage, for: user.id)
        }
    }

    private func completeImageUploading(_ file: FileUploadEntity) {

    }

    private func loadUserImage() {
        let image = PersistentImageService.get(for: user.id)
        selectedImage = Image(uiImage: image)
    }

    private func setUploadingUi() {
        countdownCompleted = false
    }
}
