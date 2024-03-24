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
    @State private var currentImageIndex = 0
    
    let model: CardModel
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .top) {
                Image(user.profileImageURLs[currentImageIndex])
                    .resizable()
                    .scaledToFill()
                    .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)

                    .overlay {
                        ImageScrollingOverlay(currentImageIndex:
                                                $currentImageIndex,
                                              imageCount: imageCount)
                    }
                
                CardImageIndicatorView(currentImageIndex: currentImageIndex,
                                       imageCount: imageCount)
                
                SwipeActionIndicatorView(xOffSet: $xOffSet)
            }
            
            
            UserInfoView(user: user)
        }
        .frame(width: SizeConstants.cardWidth, height: SizeConstants.cardHeight)
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
    var user: User {
        return model.user
    }
    
    var imageCount: Int {
        return user.profileImageURLs.count
    }
}

private extension CardView {
    func onDragChanged(_ value: _ChangedGesture<DragGesture>.Value) {
        xOffSet = value.translation.width
        degrees = Double(value.translation.width / 25)
    }
    
    func onDragEnded(_ value: _ChangedGesture<DragGesture>.Value) {
        let width = value.translation.width
        
        if abs(width) <= abs(SizeConstants.screenCutoff) {
            returnToCenter()
            return
        }
        
        if width >= SizeConstants.screenCutoff {
            swiftRight()
        } else {
            swiftLeft()
        }
    }
}

private extension CardView {
    func returnToCenter() {
        xOffSet = 0
        degrees = 0
    }
    
    func swiftRight() {
        xOffSet = 500
        degrees = 12
    }
    
    func swiftLeft() {
        xOffSet = -500
        degrees = -12
    }
}

#Preview {
    CardView(model: CardModel(user: MockData.users[1]))
}
