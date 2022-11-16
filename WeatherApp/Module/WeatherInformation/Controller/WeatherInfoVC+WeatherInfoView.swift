//
//  WeatherInfoVC+WeatherInfoView.swift
//  weatherAppMVP
//
//  Created by MacOS on 16/10/2022.
//

import Foundation

extension WeatherInfoVC : WeatherInfoView{    
    
    func displayTempLable(_ text: String) {
        tempLable.text = text
    }
    
    func displayHLTemp(_ text: String) {
        hlTemp.text = text
    }
    
    func displayDate(_ text: String) {
        DateLable.text = text
    }
    
    func displayWeatherDescriptionLable(_ text: String) {
        weatherDescriptionLable.text = text
    }
    
  
    
    
}
