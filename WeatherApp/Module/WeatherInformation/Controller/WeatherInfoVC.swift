//
//  WeatherInfoVCViewController.swift
//  weatherAppMVP
//
//  Created by MacOS on 15/10/2022.
//

import UIKit

class WeatherInfoVC: UIViewController {
    
    //MARK: - IBOutlet
    
    private var imageView : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "HouseImage")
        image.contentMode = .scaleAspectFit
        return image
    }()
    @IBOutlet weak var DateLable: UILabel!
    @IBOutlet weak var tempLable: UILabel!
    @IBOutlet weak var weatherDescriptionLable: UILabel!
    @IBOutlet weak var hlTemp: UILabel!
    
    var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "SliderViewColor")!
        view.layer.cornerRadius = 40
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor(named: "BorderColor")!.cgColor
        view.clipsToBounds = true
        return view
    }()
    var titleFirContainerView:UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "Weather"
        lable.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        lable.textColor = .systemBackground
        return lable
    }()

    var collectionView : UICollectionView!
    
    //MARK: - Constant
        
    var presenter: WeatherInfoPresenter?
    
    var containerViewHeightConstraint: NSLayoutConstraint?{
        didSet{
            self.presenter?.setCurrnectHeighet(containerViewHeightConstraint!.constant)
        }
    }
    var containerViewBottomConstraint: NSLayoutConstraint?
    let defaultHeight: CGFloat = 150
    var maximumContainerHeight: CGFloat = 300
    var currentContainerHeight: CGFloat = 150{
        didSet{
            self.collectionView.reloadData()
        }
    }
    //MARK: - View Life Sycle
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let indexPath = IndexPath(row: 0, section: 0)
        collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .left)
        
        animatePresentContainer()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createGradientView()
        congiureUI()
        setupConstraints()
        prepareCollectionView()
        presenter?.didSelectRow(at: 0)
        setupPanGesture()
    }
    
    //MARK: - HelperFunctions
    
    func createGradientView(){
        let gradientView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height+100))
        let gradientLayer:CAGradientLayer = CAGradientLayer()
        gradientLayer.frame.size = gradientView.frame.size
        gradientLayer.colors =
        [UIColor(named: "GradientColor")!.withAlphaComponent(0.1).cgColor,UIColor(named: "GradientColor")!.cgColor]
        gradientLayer.shouldRasterize = true
        gradientView.layer.addSublayer(gradientLayer)
        view.addSubview(gradientView)
    }
    
    private func congiureUI(){
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5),
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 100)
        ])
    }
    
    //MARK: - Custome Slider View Funcs
    
    func setupConstraints() {
        view.addSubview(containerView)
        containerView.addSubview(titleFirContainerView)
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            titleFirContainerView.topAnchor.constraint(equalTo: containerView.topAnchor , constant: 12),
            titleFirContainerView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor)
        ])
        containerViewHeightConstraint = containerView.heightAnchor.constraint(equalToConstant: defaultHeight)
        containerViewBottomConstraint = containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: defaultHeight)
        containerViewHeightConstraint?.isActive = true
        containerViewBottomConstraint?.isActive = true
    }
    
    
    func setupPanGesture() {
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.handlePanGesture(gesture:)))
        panGesture.delaysTouchesBegan = false
        panGesture.delaysTouchesEnded = false
        view.addGestureRecognizer(panGesture)
    }
    
    // MARK: Pan gesture handler
    @objc func handlePanGesture(gesture: UIPanGestureRecognizer) {
         view.handleGestureWithAnimation(gesture
                                        , defaultHeight: defaultHeight
                                        , containerViewHeightConstraint: &containerViewHeightConstraint
                                        , currentContainerHeight: &currentContainerHeight
                                         ,maximumContainerHeight: &maximumContainerHeight)
    }
        
    // MARK: Present and dismiss animation
    func animatePresentContainer() {
        UIView.animate(withDuration: 0.3) {
            self.containerViewBottomConstraint?.constant = 0
            self.view.layoutIfNeeded()
        }
    }


}
