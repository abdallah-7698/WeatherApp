//
//  RequestHelper.swift
//  learnModernConcurrency
//
//  Created by MacOS on 15/09/2022.
//

import UIKit



//MARK: - Make the route

enum Route{
    
    static let baseURL = "https://api.openweathermap.org/data/2.5"
    
    case weather
    case forecast
    
    var description : String{
        switch self{
        case .weather: return "/weather"
        case .forecast: return "/forecast"
        }
    }
    
}

//MARK: - Method
enum Method : String {
    case get    = "GET"
    case post   = "POST"
    case delete = "DELETE"
    case patch  = "PATCH"
}



//MARK: - Error Handeling

enum APIError : LocalizedError{
    case unableToComplete
    case invalidResponse
    case invalidData
    case unvalidURL
    case unexpectedError(String)
    
    var errorDescription: String?{
        switch self{
        case .unableToComplete:
            return "Unable to complete your request . please check your internet connection"
        case .invalidResponse:
            return "invalid response from the server. please try again."
        case .invalidData:
            return "The data you get from the server was invalid. please try again."
        case .unvalidURL:
            return "The URL you but is not valid."
        case .unexpectedError(let error):
            return error
        }
    }
    
}

