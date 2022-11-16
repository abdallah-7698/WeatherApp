//
//  WeatherDetailsVCPresenter.swift
//  weatherAppMVP
//
//  Created by MacOS on 12/10/2022.
//

import Foundation

protocol WeatherDetailsView : AnyObject{
    var presenter : WeatherDetailsVCPresenter? {set get}
    func showError(error : String)
}

protocol WeatherDetailsCellView{
    func showIndecator()
    func hideIndecator()
    func displayCellData(data : WeatherCity)
    func displayCountryName(_ text: String)
}

class WeatherDetailsVCPresenter{
    
    private let interactore : WeatherDetailsVCInteractore
    private weak var view : WeatherDetailsView?
    private let countryName : String
    private let router : WeatherDetailsVCRouter
    var finalData : [WeatherCity] = []
    
    init(view : WeatherDetailsView , interactore : WeatherDetailsVCInteractore , countryName : String , router : WeatherDetailsVCRouter ) {
        self.view = view
        self.interactore = interactore
        self.countryName = countryName
        self.router = router
    }
    
    func setData(for cell : WeatherDetailsCellView ,at index : Int){
        cell.showIndecator()
        interactore.getData(from: countryName) { [weak self] result in
            guard let self = self else {return}
            cell.hideIndecator()
            switch result{
            case .success(let weatherDetailsData):
                let result = self.separateDays(in: weatherDetailsData, index: index)
                self.finalData = weatherDetailsData
                DispatchQueue.main.async {
                    self.configure(cell, with: result[0])
                }
            case .failure(let error):
                print(error.localizedDescription)
                self.view?.showError(error: error.localizedDescription)
            }
        }
    }
    
    func separateDays(in array : [WeatherCity],index : Int )->[WeatherCity]{
        var firstArray : [WeatherCity] = []
        let day = array[0].dt_txt!.getDay()
        for value in array[0...7] where value.dt_txt!.getDay() == day {
            firstArray.append(value)
        }
        switch index{
        case 0:
            return firstArray
        case 1...4:
          let firstIndex = firstArray.count + (index-1) * 8
            return Array(array[firstIndex ... firstIndex + 7])
        case 5:
            print(firstArray.count*index + 32)
            return Array(array[(32+firstArray.count)...])
        default:
            return []
        }
    }

    func getNumberOfRows()->Int{
        let myDate = Calendar.current.component(.hour, from: Date())
        return myDate < 3 ? 5 : 6
    }

    private func configure(_ cell : WeatherDetailsCellView ,with data : WeatherCity){
        cell.displayCellData(data: data)
        cell.displayCountryName(self.countryName)
    }
    
    func didSelectRow(at index : Int){
        router.presentWeatherInfoViewController(from: view, weatherInfoArray: separateDays(in: finalData  , index: index))
    }
    
}
