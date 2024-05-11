//
//  ContentView.swift
//  SwiftUIMarathon05
//
//  Created by Mike Rudoy on 11/05/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var position = CGPoint(x: 100, y: 300)
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Color.white
                Color.pink
                Color.yellow
                Color.black
            }
            .zIndex(0)
            .ignoresSafeArea()
            movingSquare
        }
    }
        
    var movingSquare: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(.black)
            .blendMode(.hue)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .fill(.white)
                    .blendMode(.exclusion)
                    .overlay (
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.white)
                            .blendMode(.overlay)
                            .overlay (
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(.black)
                                    .blendMode(.overlay)
                            )
                    )
            )
        .frame(width: 100, height: 100)
        .position(position)
        .gesture(DragGesture()
         .onChanged({ value in
             position = value.location
         }))
    }
}


#Preview {
    ContentView()
}


//RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
//    .fill(Color.black)
//    .frame(width: 100, height: 100)
//    .blendMode(.hue)
//    .position(position)
//    .gesture(
//        DragGesture()
//            .onChanged({ value in
//                position = value.location
//            })
//    ).overlay(
//        RoundedRectangle(cornerRadius: 10)
//                                .foregroundStyle(.white)
//                                .blendMode(.exclusion)
//
//    )
//    
//}
