//
//  WeatherVCInteractore.swift
//  weatherAppMVP
//
//  Created by Abdallah on 14/11/2022.
//

import Foundation
import ProgressHUD

class WeatherVCInteractore{
    
    let natworkManager = NetworkManager()
    
    func getData(from name : String , completion : @escaping (Result< WeatherCity ,Error> )->Void){
        Task{
            do{
                async let task1 : WeatherCity = try natworkManager.reqestObject(from: .weather, method: .get, parameter: ["q" : name , "appid" : "b7f1d80b093cadc7f43148b44aeb0060"])
                let result = try await task1
                completion(.success(result))
                
            }catch{
                completion(.failure(error))
            }
        }
    }
    
}
