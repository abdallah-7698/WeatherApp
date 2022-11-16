//
//  WeatherDetailsVC.swift
//  weatherAppMVP
//
//  Created by MacOS on 12/10/2022.
//

import UIKit

class WeatherDetailsVC: UIViewController {

    var presenter: WeatherDetailsVCPresenter?
    var tableView : UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    private func configure(){
        tableView = UITableView()
        tableView.frame = view.frame
        view.addSubview(tableView)
        setupTableView()
    }

}
