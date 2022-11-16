//
//  HelperFunctions.swift
//  weatherAppMVP
//
//  Created by MacOS on 09/10/2022.
//

import Foundation
import UIKit

func getImageFrom(name : String )->UIImage{
    switch name {
    case "Clouds":
        return UIImage(named: "Clouds")!
    case "Clear":
        return UIImage(named : "Clear")!
    case "Rain" :
        return UIImage(named: "Rain")!
    default :
        return UIImage(named: "NoWeather")!
    }
}
