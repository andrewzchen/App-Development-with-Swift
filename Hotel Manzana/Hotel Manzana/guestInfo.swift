//
//  guestInfo.swift
//  Hotel Manzana
//
//  Created by Andrew Chen on 7/19/19.
//  Copyright © 2019 Andrew Chen. All rights reserved.
//

import Foundation

struct Registration {
    var firstName: String
    var lastName: String
    var email: String
    var checkIn: Date
    var checkOut: Date
    var numAdults: Int
    var numChildren: Int
    var roomChoice: Room
    var wifiAccess: Bool
}

struct Room: Equatable {
    var id: Int
    var name: String
    var shortName: String
    var price: Int
    static var all: [Room] {
        return [Room(id: 0, name: "Two Queens", shortName: "2Q", price: 179), Room(id: 1, name: "One King", shortName: "1K", price: 209), Room(id: 2, name: "Penthouse Suite", shortName: "PHS", price: 309)]
    }
}
    // Equatable Protocol for Room
func ==(lhs: Room, rhs: Room) -> Bool {
        return lhs.id == rhs.id
    }

