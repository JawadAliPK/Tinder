//
//  SizeConstants.swift
//  Tinder
//
//  Created by jawad ali on 24/03/2024.
//

import Foundation
import SwiftUI

struct SizeConstants {
    static var screenCutoff: CGFloat {
        (UIScreen.main.bounds.width / 2) * 0.8
    }
    static var cardWidth: CGFloat {
        UIScreen.main.bounds.width - 20
    }
    static var cardHeight: CGFloat {
        UIScreen.main.bounds.height / 1.45
    }
}

