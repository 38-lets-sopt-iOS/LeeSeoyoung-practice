//
//  SignupRequestDTO.swift
//  SOPT38-practice
//
//  Created by Seoyoung Lee on 5/2/26.
//

import Foundation

struct SignupRequestDTO: Encodable {
    let loginId: String
    let password: String
    let name: String
    let email: String
    let age: Int
    let part: String
}
