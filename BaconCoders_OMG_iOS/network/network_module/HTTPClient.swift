//
//  HTTPClient.swift
//  BaconCoders_OMG_iOS
//
//  Created by 박병호 on 6/30/24.
//

import Foundation

class HTTPClient {
    
    static let shared = HTTPClient()
    
    private init() {}
    
    func get(url: URL, completion: @escaping (Result<Data, Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                let statusError = NSError(domain: "HTTPClientError", code: 0, userInfo: [NSLocalizedDescriptionKey : "Invalid response from server"])
                completion(.failure(statusError))
                return
            }
            
            guard let data = data else {
                let dataError = NSError(domain: "HTTPClientError", code: 0, userInfo: [NSLocalizedDescriptionKey : "No data received from server"])
                completion(.failure(dataError))
                return
            }
            
            completion(.success(data))
        }
        
        task.resume()
    }
    
    func post(url: URL, body: [String: Any], completion: @escaping (Result<Data, Error>) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: body, options: [])
        } catch {
            completion(.failure(error))
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                let statusError = NSError(domain: "HTTPClientError", code: 0, userInfo: [NSLocalizedDescriptionKey : "Invalid response from server"])
                completion(.failure(statusError))
                return
            }
            
            guard let data = data else {
                let dataError = NSError(domain: "HTTPClientError", code: 0, userInfo: [NSLocalizedDescriptionKey : "No data received from server"])
                completion(.failure(dataError))
                return
            }
            
            completion(.success(data))
        }
        
        task.resume()
    }
}
