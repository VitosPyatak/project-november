import Foundation

struct JsonCoder {
    private static var encoder = JSONEncoder()
    private static var decoder = JSONDecoder()
    
    static func encode<GenericEntity>(_ entity: GenericEntity) -> Data where GenericEntity: Codable {
        try! encoder.encode(entity)
    }
    
    static func decode<GenericEntity>(_ data: Data, of type: GenericEntity.Type) -> GenericEntity where GenericEntity: Codable {
        try! decoder.decode(type, from: data)
    }
    
    static func decodeArray<GenericEntity>(_ data: Data, of type: [GenericEntity].Type) -> [GenericEntity] where GenericEntity: Codable {
        try! decoder.decode(type, from: data)
    }
}
