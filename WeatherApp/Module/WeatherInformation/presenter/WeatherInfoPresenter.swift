//
//  WeatherInfoPresenter.swift
//  weatherAppMVP
//
//  Created by MacOS on 15/10/2022.
//

import UIKit

protocol WeatherInfoView{
    var presenter : WeatherInfoPresenter? {set get}
    func displayTempLable(_ text: String)
    func displayHLTemp(_ text: String)
    func displayDate(_ text: String)
    func displayWeatherDescriptionLable(_ text : String)
}

protocol WeatherInfoCellView{
    func displayCellData(data : WeatherCity)
    func setVisableViewCell(_ isVisable: Bool)
}


class WeatherInfoPresenter{
    
    private var view : WeatherInfoView?
    private var weatherInfoArray : [WeatherCity] = []
    private var currnentHeight: CGFloat = 300.0
    
    init(view : WeatherInfoView? , weatherInfoArray : [WeatherCity] ){
        self.view = view
        self.weatherInfoArray = weatherInfoArray
    }
    
    func didSelectRow(at index : Int){
        let data = weatherInfoArray[index]
        view?.displayDate(data.dt_txt?.separateIntoParats(separator: " ").first ?? "no data")
        view?.displayHLTemp("H:\(data.main.temp_max)°  L:\(data.main.temp_min.toCelsius())°")
        view?.displayTempLable("\(data.main.temp.toCelsius())°")
        view?.displayWeatherDescriptionLable(data.weather.first?.description ?? "No data")
    }
    
    func getNumberOfRows()->Int{
        return weatherInfoArray.count
    }
    
    // MARK:  Cell Part
    
    func setCurrnectHeighet(_ height: CGFloat){
        self.currnentHeight = height
    }
    
    
    func setData(_ cell : WeatherInfoCellView ,at index : Int){
        let data = weatherInfoArray[index]
        cell.displayCellData(data: data)
        var isVisable: Bool = (currnentHeight < 300.0)
        print("currnentHeight" ,currnentHeight)
        cell.setVisableViewCell(isVisable)
    }
    
    
}
