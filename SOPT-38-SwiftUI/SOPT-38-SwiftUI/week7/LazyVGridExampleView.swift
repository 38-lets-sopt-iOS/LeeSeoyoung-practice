//
//  LazyVGridExampleView.swift
//  SOPT-38-SwiftUI
//
//  Created by Seoyoung Lee on 5/23/26.
//

import SwiftUI

struct LazyVGridExampleView: View {
    
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(0..<20) { value in
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.teal)
                        VStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.gray)
                                .padding([.horizontal, .top], 15)
                            Text("아이템 \(value+1)")
                                .padding(.bottom, 10)
                        }
                    }.frame(height: 150).padding(5)
                }
            }
        }.padding()
    }
}

#Preview {
    LazyVGridExampleView()
}
