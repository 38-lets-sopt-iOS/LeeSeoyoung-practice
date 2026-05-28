//
//  StoryScrollVIew.swift
//  SOPT-38-SwiftUI
//
//  Created by Seoyoung Lee on 5/28/26.
//

import SwiftUI

struct StoryScrollVIew: View {
    
    let chatUsers: [ChatUser]
    @Binding var activeStates: [Bool]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(chatUsers.indices, id: \.self) { index in
                    ZStack(alignment: .bottomTrailing) {
                        Image(systemName: "person.crop.circle.fill")
                            .font(.system(size: 60))
                            .foregroundStyle(activeStates[index] ? .blue : .gray)
                            .onTapGesture { activeStates[index].toggle() }
                        Circle()
                            .frame(width: 15)
                            .padding(4)
                            .foregroundStyle(activeStates[index] ? .green : .gray)
                    }
                }
                
            }
        }.padding(.horizontal)
    }
}
