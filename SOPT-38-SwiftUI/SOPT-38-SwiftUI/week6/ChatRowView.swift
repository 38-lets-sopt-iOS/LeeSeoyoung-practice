//
//  ChatRowView.swift
//  SOPT-38-SwiftUI
//
//  Created by Seoyoung Lee on 5/28/26.
//

import SwiftUI

struct ChatRowView: View {
    let chatUser: ChatUser
    let isActive: Bool
    
    var body: some View {
        HStack {
            ZStack(alignment: .bottomTrailing) {
                Image(systemName: "person.crop.circle.fill")
                    .font(.system(size: 50))
                    .foregroundStyle(isActive ? .blue : .gray)
                Circle()
                    .frame(width: 12)
                    .padding(4)
                    .foregroundStyle(isActive ? .green : .gray)
            }
            
            VStack(alignment: .leading) {
                Text(chatUser.name)
                    .bold()
                Text(chatUser.message)
                    .foregroundStyle(.gray)
            }
            Spacer()
            Text("오전 09:30")
                .font(.caption)
                .foregroundStyle(.gray)
        }.padding()
    }
}
