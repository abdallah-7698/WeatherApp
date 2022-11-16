//
//  WeatherInfoRouter.swift
//  weatherAppMVP
//
//  Created by MacOS on 15/10/2022.
//

import Foundation
import UIKit

class WeatherInfoRouter{
    
    class func createWeatherInfoVC(weatherInfoArray:[WeatherCity])->UIViewController{
        let weatherInfo = WeatherInfoVC()
        if var vc = weatherInfo as? WeatherInfoView{
            let presenter = WeatherInfoPresenter(view: vc, weatherInfoArray: weatherInfoArray)
            vc.presenter = presenter
        }
        return weatherInfo
    }
    
}
