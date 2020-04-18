//
//  NavigationView.swift
//  Test
//
//  Created by abdul on 17/04/20.
//  Copyright © 2020 abdul. All rights reserved.
//

import UIKit

protocol NavigationViewDelegates : class {
    func leftButtonClicked()
    func rightButtonClicked()
}

class NavigationView: UIView {
    
    @IBOutlet var baseView: UIView!
    @IBOutlet weak var titleTxt: UILabel!
    @IBOutlet weak var leftBtn: UIButton!
    @IBOutlet weak var rightBtn: UIButton!
    
    
    weak var navigationViewDelegate:NavigationViewDelegates?
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }
    
    private func setupView() {
        let bundle = Bundle(for: type(of: self))
        UINib(nibName: "NavigationView", bundle: bundle).instantiate(withOwner: self, options: nil)
        
        addSubview(baseView)
        baseView.frame = bounds
        
        baseView.layer.masksToBounds = false
        baseView.layer.shadowRadius = 2
        baseView.layer.shadowOpacity = 1
        baseView.layer.shadowColor = UIColor.black.cgColor
        baseView.layer.shadowOffset = CGSize(width: 0 , height:1)

    }
    

    @IBAction func rightBtnAction(_ sender: Any) {
        navigationViewDelegate?.rightButtonClicked()
    }
    
    @IBAction func leftBtnAction(_ sender: Any) {
        navigationViewDelegate?.leftButtonClicked()
    }
    
}
