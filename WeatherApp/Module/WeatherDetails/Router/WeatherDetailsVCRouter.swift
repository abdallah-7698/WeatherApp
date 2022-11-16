//
//  WeatherDetailsVCRouter.swift
//  weatherAppMVP
//
//  Created by MacOS on 12/10/2022.
//

import Foundation
import UIKit

class WeatherDetailsVCRouter{
    
    class func createWeatherDetailsVC(countryName : String)->UIViewController{
        let interactore = WeatherDetailsVCInteractore()
        let weatherDetailsVC = WeatherDetailsVC()
        let router = WeatherDetailsVCRouter()
        if let vc = weatherDetailsVC as? WeatherDetailsView{
            let presenter = WeatherDetailsVCPresenter(view: vc, interactore: interactore, countryName: countryName, router: router)
            vc.presenter = presenter
        }
        return weatherDetailsVC
    }
    
    func presentWeatherInfoViewController(from view : WeatherDetailsView? , weatherInfoArray : [WeatherCity]){
        let vc = WeatherInfoRouter.createWeatherInfoVC(weatherInfoArray: weatherInfoArray)
        if let viewController = view as? UIViewController{
            viewController.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
