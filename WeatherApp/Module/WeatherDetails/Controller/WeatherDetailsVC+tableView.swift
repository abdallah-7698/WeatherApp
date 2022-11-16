//
//  WeatherDetailsVC+tableView.swift
//  weatherAppMVP
//
//  Created by MacOS on 13/10/2022.
//

import Foundation
import UIKit

extension WeatherDetailsVC : UITableViewDelegate , UITableViewDataSource{
    func setupTableView(){
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: WeatherDetailsCell.reuseID, bundle: nil), forCellReuseIdentifier: WeatherDetailsCell.reuseID)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (presenter?.getNumberOfRows())!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WeatherDetailsCell.reuseID, for: indexPath) as! WeatherDetailsCell
        presenter?.setData(for: cell, at: indexPath.row)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectRow(at: indexPath.row)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
}
