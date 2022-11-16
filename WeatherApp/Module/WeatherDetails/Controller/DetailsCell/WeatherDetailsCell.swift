//
//  WeatherDetailsCell.swift
//  weatherAppMVP
//
//  Created by MacOS on 13/10/2022.
//

import UIKit

class WeatherDetailsCell: UITableViewCell {


    @IBOutlet weak var backView: UIView!{
        didSet{
            backView.layer.cornerRadius = 25
        }
    }
    @IBOutlet weak var tempLable: UILabel!
    @IBOutlet weak var hlTemp: UILabel!
    @IBOutlet weak var countryNameLable: UILabel!
    @IBOutlet weak var dateLable: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var weatherDescriptionLable: UILabel!
    
    let activityIndicatorView = UIActivityIndicatorView(style: .large)
    
    static let reuseID = "WeatherDetailsCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureActivityIndecator()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    //MARK: - Helper Function
    private func configureActivityIndecator(){
        contentView.addSubview(activityIndicatorView)
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicatorView.centerXAnchor.constraint(equalTo: backView.centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: backView.centerYAnchor)
        ])
    }
    
}

extension WeatherDetailsCell : WeatherDetailsCellView{
   
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
        tempLable.text = "\(data.main.temp.toCelsius())°"
        hlTemp.text = "H:\(data.main.temp_max)°  L:\(data.main.temp_min.toCelsius())°"
        dateLable.text = data.dt_txt?.separateIntoParats(separator: " ").first ?? "no data"
        weatherImage.image = getImageFrom(name: data.weather.first?.main ?? "No data" )
        weatherDescriptionLable.text = data.weather.first?.description ?? "No data"
    }

    /// you can't find country name in the API
    func displayCountryName(_ text: String){
        countryNameLable.text = text
    }

}
