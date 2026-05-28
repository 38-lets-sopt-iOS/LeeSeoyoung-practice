//
//  ChatListView.swift
//  SOPT-38-SwiftUI
//
//  Created by Seoyoung Lee on 5/28/26.
//

import SwiftUI

struct ChatListView: View {

    let chatUsers: [ChatUser]
    @Binding var activeStates: [Bool]
    
    var body: some View {
        ForEach(chatUsers.indices, id: \.self) { index in
            ChatRowView(chatUser: chatUsers[index], isActive: activeStates[index])
            Divider()
        }
        .listStyle(.plain)
    }
}
