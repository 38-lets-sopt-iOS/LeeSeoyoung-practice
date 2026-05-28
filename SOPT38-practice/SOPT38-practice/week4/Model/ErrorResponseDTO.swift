//
//  ErrorResponseDTO.swift
//  SOPT38-practice
//
//  Created by Seoyoung Lee on 5/8/26.
//

import Foundation

struct ErrorResponseDTO: Decodable {
    let path: String
    let timestamp: String
}
