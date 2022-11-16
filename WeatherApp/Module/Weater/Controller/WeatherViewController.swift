//
//  WeatherViewController.swift
//  weatherAppMVP
//
//  Created by MacOS on 09/10/2022.
//

import UIKit

class WeatherViewController: UIViewController {
    
    var presenter: WeatherVCPresenter?
    var tableView : UITableView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure(){
        tableView = UITableView()
        tableView.frame = view.frame
        tableView.backgroundColor = .clear
        view.addSubview(tableView)
        setupTableView()
    }

    
}

