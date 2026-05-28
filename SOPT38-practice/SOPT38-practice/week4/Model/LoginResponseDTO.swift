//
//  LoginResponseDTO.swift
//  SOPT38-practice
//
//  Created by Seoyoung Lee on 5/8/26.
//

import Foundation

struct LoginResponseDTO: Decodable {
    let success: Bool
    let status: Int
    let message: String
    let code: String
    let data: UserDataDTO?
    let meta: ErrorResponseDTO?
}

struct UserDataDTO: Decodable {
    let userId: Int
}
