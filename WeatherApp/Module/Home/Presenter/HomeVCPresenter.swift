//
//  HomePresenter.swift
//  weatherAppMVP
//
//  Created by MacOS on 08/10/2022.
//

import Foundation

protocol HomeView : AnyObject{
    var presenter : HomeVCPresenter? { get set }
    func showFail()
}

class HomeVCPresenter{
    private weak var view : HomeView?
    private var router : HomeVCRouter
    
    init(view : HomeView? ,router : HomeVCRouter) {
        self.view = view
        self.router = router
    }
    
    func getCoutriesWeather(_ text : String?){
        if text == nil {
            self.view?.showFail()
        }
       let countries = text!.removeWhitespace().separateIntoParats(separator: ",")
        router.presentWeatherViewController(from: view, countries: countries)
    }
    
   
    
}
