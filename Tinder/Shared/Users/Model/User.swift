//
//  User.swift
//  Tinder
//
//  Created by jawad ali on 24/03/2024.
//

import Foundation

struct User: Identifiable, Hashable {
    let id: String
    let fullName: String
    let age: Int
    var profileImageURLs: [String]
}
