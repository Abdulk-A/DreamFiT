//
//  APIService.swift
//  petForMe
//
//  Created by Abdullah Abdulkareem on 1/23/24.
//

import Foundation


class APIService {
    
    enum APIError: Error {
        case invalidURL
        case unableToFetch
        case unableToDecode
        
        case testingError
    }
    
    func fetch(for mus: String, andFor diff: String) async throws -> [Exercise] {
        // /ZcT/c3EVP+UET3O7G9S6g==MA12LG6NnqCg7w6k

        let exercises: [Exercise]
        
        let urlString = "https://api.api-ninjas.com/v1/exercises?muscle=\(mus)&difficulty=\(diff)"
        
        guard let url = URL(string: urlString) else {
            throw APIError.invalidURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        //key no longer exists :)
        //updata your key here
        let myAPIKEY: String = "/ZcT/c3EVP+UET3O7G9S6g==MA12LG6NnqCg7w6k"
        
        request.setValue(myAPIKEY, forHTTPHeaderField: "X-Api-Key")
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            
//            // Print raw data for debugging
//            print("Raw Data: \(String(data: data, encoding: .utf8) ?? "Unable to convert data to string")")
//            
//            if let httpResponse = response as? HTTPURLResponse {
//                print("Response Status Code: \(httpResponse.statusCode)")
//            }
            
            guard let decodedData = try? JSONDecoder().decode([Exercise].self, from: data) else {
//                print("Unable to decode data")
                throw APIError.unableToDecode
            }
            
            exercises = decodedData
            
        } catch {
            //breaks here
            throw APIError.unableToFetch
        }
        
        return exercises
    }

}

