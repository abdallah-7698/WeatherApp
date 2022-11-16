//
//  WeatherViewController+WeatherView.swift
//  weatherAppMVP
//
//  Created by MacOS on 09/10/2022.
//

import Foundation
import ProgressHUD

extension WeatherViewController : WeatherView{
    
    func RemoveCellFromTableView(at index: Int) {
        let indexPath = IndexPath(item: index, section: 0)
        DispatchQueue.main.async {
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    func showError(error: String) {
        ProgressHUD.showError("error")
    }
    
}
