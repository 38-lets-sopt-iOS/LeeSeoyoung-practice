//
//  LoginRequestDTO.swift
//  SOPT38-practice
//
//  Created by Seoyoung Lee on 5/8/26.
//

import Foundation

struct LoginRequestDTO: Encodable {
    let loginId: String
    let password: String
}
