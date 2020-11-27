import Foundation


struct StarredService {
    private static let dataService = UserDefaultsService()
    
    private static let starredKey = "#starredPhoto"
    
    static func getStarred() -> [PhotoEntity] {
        if let staredPhotoData = getStarredPhotosData() {
            return getDecodedPhotos(from: staredPhotoData)
            
        }
        return [PhotoEntity]()
    }
    
    static func updateStarred(with newPhoto: PhotoEntity, as isStarred: Bool) {
        let newPhotoCopy = getNewPhotoCopy(from: newPhoto, and: isStarred)
        let allStarredPhotos = getAllStarredPhotos(with: newPhoto, as: isStarred)
        let filteredStarredPhotos = filterStarredPhotos(from: allStarredPhotos, excludeBy: newPhotoCopy)
        dataService.set(getEndcodedPhotosData(from: filteredStarredPhotos), for: starredKey)
    }
    
    private static func getStarredPhotosData() -> [Data]? {
        dataService.getArray(for: starredKey)
    }
    
    private static func getAllStarredPhotos(with newPhoto: PhotoEntity, as isStarred: Bool) -> [PhotoEntity] {
        let starredPhotosData = getStarredPhotosData() ?? [Data]()
        return getDecodedPhotos(from: starredPhotosData)
    }
    
    private static func filterStarredPhotos(from photos: [PhotoEntity], excludeBy newPhoto: PhotoEntity) -> [PhotoEntity] {
        var filteredPhotos = photos.filter { photo in photo.id != newPhoto.id }
        if newPhoto.isStarred! {
            filteredPhotos.append(newPhoto)
        }
        return filteredPhotos
    }
    
    private static func getEndcodedPhotosData(from photos: [PhotoEntity]) -> [Data] {
        photos.map { photo in JsonCoder.encode(photo) }
    }
    
    private static func getDecodedPhotos(from photosData: [Data]) -> [PhotoEntity] {
        photosData.map { photo in JsonCoder.decode(photo, of: PhotoEntity.self)}
    }
    
    private static func getNewPhotoCopy(from newPhoto: PhotoEntity, and isStarred: Bool) -> PhotoEntity {
        var newPhotoCopy = newPhoto
        newPhotoCopy.isStarred = isStarred
        return newPhotoCopy
    }
}
