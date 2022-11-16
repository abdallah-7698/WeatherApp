//
//  WeatherCell.swift
//  weatherAppMVP
//
//  Created by MacOS on 09/10/2022.
//

import UIKit

class WeatherCell: UITableViewCell {
   
    //MARK: - Outlet
    @IBOutlet weak var backView: UIView!{
        didSet{ backView.layer.cornerRadius = 25 }
    }
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var minTemp: UILabel!
    @IBOutlet weak var maxTemp: UILabel!
    @IBOutlet weak var weatherDescription: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var averageTemp: UILabel!
   
    let activityIndicatorView = UIActivityIndicatorView(style: .large)
    
    //MARK: - Variables
    
    static let reuseID = "WeatherCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureActivityIndecator()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
    //MARK: - HelperFunctions
    private func configureActivityIndecator(){
        contentView.addSubview(activityIndicatorView)
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicatorView.centerXAnchor.constraint(equalTo: backView.centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: backView.centerYAnchor)
        ])
    }
    
}


extension WeatherCell : WeatherCellView{

    func showIndecator() {
        isUserInteractionEnabled = false
        activityIndicatorView.startAnimating()
    }
    
    func hideIndecator() {
        DispatchQueue.main.async {
            self.isUserInteractionEnabled = true
            self.activityIndicatorView.stopAnimating()
        }
    }
    
    func displayCellData(data: WeatherCity) {
        countryName.text = data.name ?? "No name"
        minTemp.text = "min \(data.main.temp_min.toCelsius())°C"
        maxTemp.text = "max \(data.main.temp_max.toCelsius())°C"
        weatherDescription.text = data.weather.first?.description ?? "no Data"
        weatherImage.image = getImageFrom(name:data.weather.first?.main ?? "no Data" )
        averageTemp.text = "\(data.main.temp.toCelsius())°C"
    }
    
}
