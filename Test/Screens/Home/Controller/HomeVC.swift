//
//  HomeVC.swift
//  Test
//
//  Created by abdul on 17/04/20.
//  Copyright © 2020 abdul. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var navigationView: NavigationView!
    @IBOutlet weak var homeCollectionView: UICollectionView!
    
    let viewModel = HomeVM()
    var isLoading:Bool = false
    
    // testing animation on click
    var tmpData:HomeModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
        setupDataSourceAndDeleagtes()
        
       
    }
    
    private func setupUI(){
        navigationView.leftBtn.isHidden = true
    }
    
    private func setupDataSourceAndDeleagtes() {
        viewModel.apiDelegates = self
        viewModel.getFeeds()
        
        navigationView.navigationViewDelegate = self
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
        
        homeCollectionView.register(HomeItemCell.nib, forCellWithReuseIdentifier: HomeItemCell.identifier)
        homeCollectionView.register(HomeHeaderViewCell.nib, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier:HomeHeaderViewCell.identifier)
        
        if let flowLayout = homeCollectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
           flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
    }

}



extension HomeVC : NavigationViewDelegates {
    func leftButtonClicked() {

    }
    
    func rightButtonClicked() {
        viewModel.getFeeds()
    }
}

extension HomeVC : APIDelegates {
    func parsingError() {
        print("Parsing error")
    }
    
    func didStartAPICall() {
        isLoading = true
        homeCollectionView.isUserInteractionEnabled = false
        print("API Call Start")
        self.homeCollectionView.reloadData()
    }
    
    func didFinishAPICallWithSuccess() {
        isLoading = false
        homeCollectionView.isUserInteractionEnabled = true
        print("API Call End With Sucess")
        self.homeCollectionView.reloadData()
    }
    
    func didFinishAPICallWithError() {
       print("API Call End With Error")
    }
    
}
