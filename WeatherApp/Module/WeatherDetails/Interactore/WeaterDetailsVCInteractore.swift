//
//  WeaterDetailsVCInteractore.swift
//  weatherAppMVP
//
//  Created by MacOS on 12/10/2022.
//

import Foundation

class WeatherDetailsVCInteractore{
    
    let networkManager = NetworkManager()
    
    func getData(from name : String , completion : @escaping(Result<[WeatherCity],Error>)->Void){
        Task{
            do{
                async let task1 : ForecacastCity = try networkManager.reqestObject(from: .forecast, method: .get, parameter: ["q":name , "appid" : "b7f1d80b093cadc7f43148b44aeb0060"])
                let finalResult = try await task1.list
                completion(.success(finalResult))
            }catch{
                completion(.failure(error))
            }
            
        }
    }    
    
}
