//
//  GetUserDataResponseDTO.swift
//  SOPT38-practice
//
//  Created by Seoyoung Lee on 5/8/26.
//

import Foundation

struct GetUserDataResponseDTO: Decodable {
    let success: Bool
    let status: Int
    let message: String
    let code: String
    let data: UserInfoData
}

struct UserInfoData: Decodable {
    let id: Int
    let loginId: String
    let name: String
    let email: String
    let age: Int
    let part: String
}
