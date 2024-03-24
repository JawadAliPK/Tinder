//
//  CardService.swift
//  Tinder
//
//  Created by jawad ali on 24/03/2024.
//

import Foundation

struct CardService {
    func fetchCardModels() async throws -> [CardModel] {
        let users = MockData.users
        return users.map ({ CardModel(user: $0)})
    }
}
