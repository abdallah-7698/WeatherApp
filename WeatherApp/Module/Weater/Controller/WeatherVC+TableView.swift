//
//  WeatherVC+TableView.swift
//  weatherAppMVP
//
//  Created by MacOS on 09/10/2022.
//

import Foundation
import UIKit

extension WeatherViewController : UITableViewDelegate , UITableViewDataSource {
    
    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorColor = .clear
        tableView.register(UINib(nibName: WeatherCell.reuseID, bundle: nil), forCellReuseIdentifier: WeatherCell.reuseID)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (presenter?.getNumberOfCells())!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell = tableView.dequeueReusableCell(withIdentifier: WeatherCell.reuseID, for: indexPath) as! WeatherCell
        presenter?.setData(for: cell, at: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectRow(at: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 144
    }
      
}
