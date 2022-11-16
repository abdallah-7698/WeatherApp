//
//  WeatherVCRouter.swift
//  weatherAppMVP
//
//  Created by MacOS on 09/10/2022.
//

import Foundation
import UIKit

class WeaterVCRouter{
    class func createWeatherVC(_ coutries : [String])->UIViewController{
        let weathVC = WeatherViewController()
        let interactor = WeatherVCInteractore()
        let router = WeaterVCRouter()
        if let vc = weathVC as? WeatherView{
            let presenter = WeatherVCPresenter(view : vc , countries: coutries, interactor: interactor,router : router)
            vc.presenter = presenter
        }
        return weathVC
    }
    
    func presentWeatherDetailsViewController(from view : WeatherView? , CountryName : String){
        let vc = WeatherDetailsVCRouter.createWeatherDetailsVC(countryName: CountryName)
        if let viewController = view as? UIViewController{
            viewController.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
