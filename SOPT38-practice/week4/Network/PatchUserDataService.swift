//
//  PatchUserDataService.swift
//  SOPT38-practice
//
//  Created by Seoyoung Lee on 5/8/26.
//

import Foundation

final class PatchUserDataService {
    static var shared = PatchUserDataService()
    private init() {}
    
    private func makeRequestBody(name: String,
                                 email: String,
                                 age: Int) -> Data? {
        do {
            let data = PatchUserDataRequestDTO(
                name: name,
                email: email,
                age: age
            )
            let jsonEncoder = JSONEncoder()
            let requestBody = try jsonEncoder.encode(data)
            return requestBody
        } catch {
            print(error)
            return nil
        }
    }
    
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
        
        request.httpMethod = "PATCH"
        
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
    
    func patchUserData(userId: Int,
                       name: String,
                       email: String,
                       age: Int) async throws -> PatchUserDataResponseDTO {
        
        guard let body = makeRequestBody(name: name, email: email, age: age)
        else { throw NetworkError.requestEncodingError }
        
        let request = try makeRequest(userId: userId, body: body)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        dump("Request \(request)")
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.responseError
        }
        
        dump("Response \(response)")
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw configureHTTPError(errorCode: httpResponse.statusCode)
        }
        
        do {
            let decoded = try JSONDecoder().decode(PatchUserDataResponseDTO.self, from: data)
            return decoded
        } catch {
            throw error
        }
    }
    
    private func configureHTTPError(errorCode: Int) -> Error{
        return NetworkError(rawValue: errorCode) ?? NetworkError.unknownError
    }
}
