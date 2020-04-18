//
//  DetailVC.swift
//  Test
//
//  Created by abdul on 17/04/20.
//  Copyright © 2020 abdul. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var navigationView: NavigationView!
    @IBOutlet weak var detailtableView: UITableView!
    
    var viewModel = DetailVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
        setupDataSourceAndDeleagtes()

    }
    
    private func setupUI(){
        navigationView.titleTxt.text = viewModel.getTitleText()
        navigationView.rightBtn.isHidden = true
    }
    
    private func setupDataSourceAndDeleagtes() {

        navigationView.navigationViewDelegate = self
        detailtableView.dataSource = self
        detailtableView.delegate = self
        
        detailtableView.register(TextCell.nib, forCellReuseIdentifier: TextCell.identifier)
        detailtableView.register(DetailHeaderCell.nib, forCellReuseIdentifier: DetailHeaderCell.identifier)
    }

}


extension DetailVC : NavigationViewDelegates {
    func leftButtonClicked() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func rightButtonClicked() {

    }
    
    
}
