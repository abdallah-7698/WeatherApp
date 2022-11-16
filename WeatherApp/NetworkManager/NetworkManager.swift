//
//  NetworkManager.swift
//  weatherAppMVP
//
//  Created by Abdallah on 14/11/2022.
//

import Foundation

class NetworkManager{
    
    fileprivate func createRequest(route : Route , method : Method, parameter : [String : Any]? = nil)->URLRequest?{
        let urlString = Route.baseURL + route.description
        guard let url =  URL(string: urlString) else{return nil}
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = method.rawValue
        if let parameter = parameter {
            switch method {
            case .get:
                var urlComponent = URLComponents(string: urlString)
                urlComponent?.queryItems = parameter.map{URLQueryItem(name: $0, value: "\($1)")}
                urlRequest.url = urlComponent?.url
            case .post , .delete , .patch:
                let bodyData = try? JSONSerialization.data(withJSONObject: parameter, options: .fragmentsAllowed)
                urlRequest.httpBody = bodyData
            }
        }
        return urlRequest
    }
    
    fileprivate func prepareObject<T:Codable>(data : Data , completion : @escaping (Result<T,APIError>)->Void){
        do{
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            completion(.success(decodedData))
        }catch{
            print(error.localizedDescription)
            completion(.failure(.invalidResponse))
        }
    }
    
    
    func reqestObject<T : Codable>(from route:Route , method : Method , parameter : [String : Any]? = nil) async throws -> T{
        return try await withCheckedThrowingContinuation{ continuation in
            guard let url = createRequest(route: route, method: method, parameter: parameter) else{
                continuation.resume(throwing: APIError.unvalidURL)
                return
            }
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let data = data , let response = response as? HTTPURLResponse,response.statusCode == 200 else{
                    continuation.resume(throwing: APIError.invalidData)
                    return
                }
                self.prepareObject(data: data) { continuation.resume(with: $0)}
                return
            }.resume()
        }
    }
    
    
}
