//
//  GetUserDataService.swift
//  SOPT38-practice
//
//  Created by Seoyoung Lee on 5/8/26.
//

import Foundation

final class GetUserDataService {
    static var shared = GetUserDataService()
    private init() {}
    
    private func makeRequest(userId: Int, body: Data?) throws -> URLRequest {
        guard let baseURL = Bundle.main.infoDictionary?["BASE_URL"] as? String else {
            throw NetworkError.urlError
        }
        
        let baseUrl = baseURL
        print(baseUrl)
        let path = "/api/v1/users"
        let parameter = userId
        let url = baseUrl + path + "/\(parameter)"
        print(url)
        guard let encodedURL = URL(string: url) else {
            throw NetworkError.urlError
        }
        
        var request = URLRequest(url: encodedURL)
        
        request.httpMethod = "GET"
        
        let header = ["Content-Type": "application/json"]
        header.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        
        if let body = body {
            request.httpBody = body
        }
        
        if let body = request.httpBody, let str = String(data: body, encoding: .utf8) {
            print("Request Body: \(str)")
        }
        
        return request
    }
    
    func getUserData(userId: Int) async throws -> GetUserDataResponseDTO {
        let request = try makeRequest(userId: userId, body: nil)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        dump("Request \(response)")
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.responseError
        }
        
        dump("Response \(response)")
        
        guard(200...299).contains(httpResponse.statusCode) else {
            throw configureHTTPError(errorCode: httpResponse.statusCode)
        }
        
        do {
            let decoded = try JSONDecoder().decode(GetUserDataResponseDTO.self, from: data)
            return decoded
        } catch {
            throw error
        }
    }
    
    private func configureHTTPError(errorCode: Int) -> Error{
        return NetworkError(rawValue: errorCode) ?? NetworkError.unknownError
    }
}
