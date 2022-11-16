//
//  HomeViewController.swift
//  weatherAppMVP
//
//  Created by MacOS on 09/10/2022.
//

import UIKit
import ProgressHUD

class HomeViewController: UIViewController {

    @IBOutlet weak var coutriesTF: UITextField!{
        didSet{
            coutriesTF.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: coutriesTF.frame.height))
            coutriesTF.leftViewMode = .always
            coutriesTF.clearButtonMode = .whileEditing
        }
    }
    
    var presenter: HomeVCPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
        
    }
    
    @IBAction func getData(_ sender: UIButton) {
        presenter?.getCoutriesWeather(coutriesTF.text)
    }
    
}

extension HomeViewController : HomeView{
    
    func showFail() {
        ProgressHUD.showFailed()
    }
    
}
