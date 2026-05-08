//
//  PatchUserDataRequestDTO.swift
//  SOPT38-practice
//
//  Created by Seoyoung Lee on 5/8/26.
//

import Foundation

struct PatchUserDataRequestDTO: Encodable {
    let name: String
    let email: String
    let age: Int
}
