//
//  CardModel.swift
//  Tinder
//
//  Created by jawad ali on 24/03/2024.
//

import Foundation

struct CardModel {
    let user: User
}

extension CardModel: Identifiable, Hashable {
    var id: String { return user.id }
}
