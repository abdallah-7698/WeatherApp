//
//  WeatherDetailsVC+WeatherDetailsView.swift
//  weatherAppMVP
//
//  Created by MacOS on 12/10/2022.
//

import Foundation
import ProgressHUD

extension WeatherDetailsVC : WeatherDetailsView{
    
    func showError(error: String) {
        ProgressHUD.showError(error)
    }
    
}
