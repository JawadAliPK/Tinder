//
//  SwipeActionIndicatorView.swift
//  Tinder
//
//  Created by jawad ali on 24/03/2024.
//

import SwiftUI

struct SwipeActionIndicatorView: View {
    @Binding var xOffSet: CGFloat
    
    var body: some View {
        HStack {
            Text("Like")
                .font(.title.weight(.heavy))
                .foregroundStyle(.green)
                .overlay {
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(.green, lineWidth: 2)
                        .frame(width: 100, height: 48)
                }
                .rotationEffect(.degrees(-45))
                .opacity(Double(xOffSet / SizeConstants.screenCutoff))
            
            Spacer()
            
            Text("Nope")
                .font(.title.weight(.heavy))
                .foregroundStyle(.red)
                .overlay {
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(.red, lineWidth: 2)
                        .frame(width: 100, height: 48)
                }
                .rotationEffect(.degrees(45))
                .opacity(Double(xOffSet / SizeConstants.screenCutoff) * -1)

        }
        .padding(40)
    }
}

#Preview {
    SwipeActionIndicatorView(xOffSet: .constant(20))
}
