//
//  MockData.swift
//  Tinder
//
//  Created by jawad ali on 24/03/2024.
//

import Foundation

struct MockData {
    static let users: [User] = [
        .init(
            id: NSUUID().uuidString,
            fullName: "Vin Diesel",
            age: 47,
            profileImageURLs: ["Vin_Diesel_1", "Vin_Diesel_2", "Vin_Diesel_3", "Vin_Diesel_4"]
        ), .init(
            id: NSUUID().uuidString,
            fullName: "Jason Statham",
            age: 56,
            profileImageURLs: ["Jason_Statham_1", "Jason_Statham_2", "Jason_Statham_3", "Jason_Statham_4", "Jason_Statham_5"]
        ), .init(
            id: NSUUID().uuidString,
            fullName: "Ludacris",
            age: 46,
            profileImageURLs: ["Ludacris_1", "Ludacris_2", "Ludacris_3"]
        ), .init(
            id: NSUUID().uuidString,
            fullName: "Jason Statham",
            age: 45,
            profileImageURLs: ["Tyrese_Gibson_1", "Tyrese_Gibson_2", "Tyrese_Gibson_3", "Tyrese_Gibson_4", "Tyrese_Gibson_5", "Tyrese_Gibson_6"]
        ), .init(
            id: NSUUID().uuidString,
            fullName: "Paul Walker",
            age: 40,
            profileImageURLs: ["Paul_Walker_1", "Paul_Walker_2"]
        ),
    ]
}
