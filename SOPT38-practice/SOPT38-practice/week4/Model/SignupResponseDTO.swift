//
//  SignupResponseDTO.swift
//  SOPT38-practice
//
//  Created by Seoyoung Lee on 5/2/26.
//

import Foundation

struct SignupResponseDTO: Decodable {
    let success: Bool
    let status: Int
    let message: String
    let code: String
    let meta: ErrorResponseDTO?
}
