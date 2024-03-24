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
    
    @State private var mockImages = [
        "Vin_Diesel_1",
        "Vin_Diesel_2"
    ]
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ZStack(alignment: .top) {
                Image(mockImages[currentImageIndex])
                    .resizable()
                .scaledToFill()
                .overlay {
                    ImageScrollingOverlay(currentImageIndex: $currentImageIndex, imageCount: mockImages.count)
                }
                
                SwipeActionIndicatorView(xOffSet: $xOffSet)
            }
                
            
            UserInfoView()
                .padding(.horizontal)
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
    func onDragChanged(_ value: _ChangedGesture<DragGesture>.Value) {
        xOffSet = value.translation.width
        degrees = Double(value.translation.width / 25)
    }
    func onDragEnded(_ value: _ChangedGesture<DragGesture>.Value) {
        let width = value.translation.width
        
        if abs(width) <= abs(SizeConstants.screenCutoff) {
            xOffSet = 0
            degrees = 0
        }
    }
}



#Preview {
    CardView()
}
