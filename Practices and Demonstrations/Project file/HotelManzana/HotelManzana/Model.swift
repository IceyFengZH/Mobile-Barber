//
//  Model.swift
//  HotelManzana
//
//  Created by Wayne on 2021/12/7.
//

import Foundation

struct Registeration {
    var firstName: String
    var lastName: String
    var emailAdress: String
    
    var checkInDate: Date
    var checkOutDate: Date
    var numberOfAdults: Int
    var numberOfChildren: Int
    
    var wifi: Bool
    var roomType: RoomType
    
}

struct RoomType: Equatable {
    var id: Int
    var name: String
    var shortName: String
    var price: Int
    
    static func == (lhs: RoomType, rhs: RoomType) -> Bool{
        return lhs.id == rhs.id
    }
    
    
    static var all: [RoomType] {
        return [
            RoomType(id: 0, name: "Two Queens", shortName: "2Q", price: 179),
            RoomType(id: 1, name: "One King", shortName: "K", price: 209),
            RoomType(id: 2, name: "PentHouse Suite", shortName: "PHS", price: 309)
        ]
    }
}
