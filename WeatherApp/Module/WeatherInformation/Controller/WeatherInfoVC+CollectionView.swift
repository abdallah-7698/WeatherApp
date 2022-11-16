//
//  WeatherInfoVC+CollectionView.swift
//  weatherAppMVP
//
//  Created by MacOS on 16/10/2022.
//

import Foundation
import UIKit

extension WeatherInfoVC : UICollectionViewDataSource , UICollectionViewDelegate{
    
    func prepareCollectionView(){
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: .createLayout())
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(UINib(nibName: WeatherInfoCell.reuseID, bundle: nil), forCellWithReuseIdentifier: WeatherInfoCell.reuseID)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.isScrollEnabled = false
        collectionView.backgroundColor = .clear
        view.addSubview(collectionView)
        collectionView.layoutSubviews()
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: titleFirContainerView.bottomAnchor ,constant: 10),
            collectionView.widthAnchor.constraint(equalTo: containerView.widthAnchor),
            collectionView.heightAnchor.constraint(equalTo: containerView.heightAnchor, multiplier: 0.6)
        ])
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (presenter?.getNumberOfRows())!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherInfoCell.reuseID, for: indexPath) as? WeatherInfoCell else {return UICollectionViewCell()}
        presenter?.setData(cell, at: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.didSelectRow(at: indexPath.row)
    }
    
    
}


