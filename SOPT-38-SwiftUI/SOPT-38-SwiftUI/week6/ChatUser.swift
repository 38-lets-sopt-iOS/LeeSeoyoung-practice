//
//  ChatUser.swift
//  SOPT-38-SwiftUI
//
//  Created by Seoyoung Lee on 5/28/26.
//

import Foundation
import SwiftUI

struct ChatUser: Identifiable {
    let id = UUID()
    let name: String
    let message: String
}

extension ChatUser {
    static let users: [ChatUser] = [
        ChatUser(name: "나연", message: "듀듀듀"),
        ChatUser(name: "소은", message: "영화 보러 가자요"),
        ChatUser(name: "승희", message: "버블티머글사람"),
        ChatUser(name: "교은", message: "내일 점심 어때요?"),
        ChatUser(name: "지인", message: "내 말 들리나요")
    ]
}
