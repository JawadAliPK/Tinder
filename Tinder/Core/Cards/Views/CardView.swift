//
//  CardView.swift
//  Tinder
//
//  Created by jawad ali on 22/03/2024.
//

import SwiftUI

struct CardView: View {
    
    
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(.meganFox1)
                .resizable()
                .scaledToFill()
                
            
            UserInfoView()
                .padding(.horizontal)
        }
        .frame(width: cardWidth, height: cardHeight)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    CardView()
}

private extension CardView {
    private var cardWidth: CGFloat {
        UIScreen.main.bounds.width - 20
    }
    
    private var cardHeight: CGFloat {
        UIScreen.main.bounds.height / 1.45
    }
}
