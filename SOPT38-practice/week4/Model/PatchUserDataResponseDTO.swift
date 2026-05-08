//
//  PatchUserDataResp.swift
//  SOPT38-practice
//
//  Created by Seoyoung Lee on 5/8/26.
//

import Foundation

struct PatchUserDataResponseDTO: Decodable {
    let success: Bool
    let status: Int
    let message: String
    let code: String
    let data: UserInfoData?
    let meta: ErrorResponseDTO?
}
