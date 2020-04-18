//
//  ViewController.swift
//  Test
//
//  Created by abdul on 17/04/20.
//  Copyright © 2020 abdul. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        funcNavigateToHome()
    }
    
    private func funcNavigateToHome() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let homeVc = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "Home") as! HomeVC
            homeVc.modalTransitionStyle = .crossDissolve
            homeVc.modalPresentationStyle = .fullScreen
            self.present(homeVc, animated: true, completion: nil)
        }
    }


}

