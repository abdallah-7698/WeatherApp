//
//  WeatherInfoCell.swift
//  weatherAppMVP
//
//  Created by MacOS on 16/10/2022.
//

import UIKit



class WeatherInfoCell: UICollectionViewCell {

    //MARK: - Outlet
    
    @IBOutlet weak var backView: UIView!{
        didSet{
            backView.layer.cornerRadius = backView.frame.height / 4
            backView.layer.borderWidth = 2
            backView.layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
        }
    }
    @IBOutlet weak var timeLable: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tempLable: UILabel!
    
    //MARK: - Variables
    static let reuseID = "WeatherInfoCell"

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override var isSelected: Bool {
        didSet {
            if isSelected {
                backView.backgroundColor = UIColor(named: "SelectedCollectionViewCell")!
                backView.layer.borderColor = UIColor.black.withAlphaComponent(0.2).cgColor
            }else{
                backView.backgroundColor = UIColor(named: "CollectionViewCellColor")!
                backView.layer.borderColor = UIColor.white.withAlphaComponent(0.2).cgColor
            }
        }
    }

}

extension WeatherInfoCell : WeatherInfoCellView{
    func displayCellData(data: WeatherCity) {
        timeLable.text = data.dt_txt!.hoursFromDate()
        imageView.image = getImageFrom(name: data.weather.first?.main ?? "No data")
        tempLable.text = "\(data.main.temp.toCelsius())°"
    }
    
    func setVisableViewCell(_ isVisable: Bool) {
        print("isVisable \(isVisable)")
        timeLable.isHidden = isVisable
        tempLable.isHidden = isVisable
    }
   
}
