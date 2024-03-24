//
//  CardView.swift
//  Tinder
//
//  Created by jawad ali on 22/03/2024.
//

import SwiftUI

struct CardView: View {
    
    @State private var xOffSet: CGFloat = 0
    @State private var degrees: Double = 0
    
    
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
        .offset(x: xOffSet)
        .rotationEffect(.degrees(degrees))
        .animation(.snappy, value: xOffSet)
        .gesture(
            DragGesture()
                .onChanged(onDragChanged)
                .onEnded(onDragEnded)
        )
    }
}

private extension CardView {
    func onDragChanged(_ value: _ChangedGesture<DragGesture>.Value) {
        xOffSet = value.translation.width
        degrees = Double(value.translation.width / 25)
    }
    func onDragEnded(_ value: _ChangedGesture<DragGesture>.Value) {
        let width = value.translation.width
        
        if abs(width) <= abs(screenCutoff) {
            xOffSet = 0
            degrees = 0
        }
    }
}

private extension CardView {
    private var screenCutoff: CGFloat {
        (UIScreen.main.bounds.width / 2) * 0.8
    }
    private var cardWidth: CGFloat {
        UIScreen.main.bounds.width - 20
    }
    
    private var cardHeight: CGFloat {
        UIScreen.main.bounds.height / 1.45
    }
}

#Preview {
    CardView()
}
