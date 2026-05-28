//
//  ContentView.swift
//  SOPT-38-SwiftUI
//
//  Created by Seoyoung Lee on 5/28/26.
//

import SwiftUI

struct ContentView: View {

    @State private var activeStates: [Bool] = [true, true, true, true, true]

    var body: some View {
        VStack(alignment: .leading) {
            StoryScrollVIew(chatUsers: ChatUser.users, activeStates: $activeStates)
            Spacer().frame(height: 20)
            ChatListView(chatUsers: ChatUser.users, activeStates: $activeStates)
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
