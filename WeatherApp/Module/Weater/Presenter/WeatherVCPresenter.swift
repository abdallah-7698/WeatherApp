//
//  weatherVCPresenter.swift
//  weatherAppMVP
//
//  Created by MacOS on 09/10/2022.
//

import Foundation

protocol WeatherView : AnyObject{
    var presenter : WeatherVCPresenter? {get set}
    func showError(error:String)
    func RemoveCellFromTableView(at index : Int)
}

protocol WeatherCellView : AnyObject{
    func showIndecator()
    func hideIndecator()
    func displayCellData(data : WeatherCity)
}

class WeatherVCPresenter{
    private weak var view : WeatherView?
    private var countries = [String]()
    private var interactor : WeatherVCInteractore
    private let router : WeaterVCRouter
    
    init(view : WeatherView , countries : [String], interactor : WeatherVCInteractore , router : WeaterVCRouter){
        self.countries = countries
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func setData(for cell : WeatherCellView , at index : Int){
        cell.showIndecator()
        interactor.getData(from: countries[index]) { [weak self] result in
            guard let self = self else {return}
            cell.hideIndecator()
            switch result{
            case .success(let countryWither):
                DispatchQueue.main.async {
                    self.configure(cell: cell,with : countryWither)
                }
            case .failure(let error):
                self.countries.remove(at: index)
                self.view?.RemoveCellFromTableView(at : index)
                cell.hideIndecator()
                self.view?.showError(error: error.localizedDescription)
            }
        }
    }
    
    
    func getNumberOfCells()->Int{
        return countries.count
    }
    
    private func configure(cell : WeatherCellView,with data : WeatherCity ){
        cell.displayCellData(data: data)
    }
    
    func didSelectRow(at index : Int){
        router.presentWeatherDetailsViewController(from: view, CountryName: countries[index])
    }
    
}
