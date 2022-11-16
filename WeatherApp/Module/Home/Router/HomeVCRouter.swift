//
//  HomeVCRouter.swift
//  weatherAppMVP
//
//  Created by MacOS on 09/10/2022.
//

import UIKit
import ProgressHUD

class HomeVCRouter{

    class func createHomeVC()->UIViewController{
        let vc = HomeViewController()
        let homeView = vc as? HomeView
        let router = HomeVCRouter()
        let presenter = HomeVCPresenter(view: homeView, router: router)
        homeView?.presenter = presenter
        return vc
    }
    
    func presentWeatherViewController(from view : HomeView? , countries : [String]){
        let vc = WeaterVCRouter.createWeatherVC(countries)
        if let viewController = view as? UIViewController{
            vc.modalPresentationStyle = .fullScreen
            if Reachability.isConnectedToNetwork(){
                viewController.navigationController?.pushViewController(vc, animated: true)
            }else{
                ProgressHUD.showError("No Internet , Pleas Connect to Internet")
            }
        }
    }
    
}
