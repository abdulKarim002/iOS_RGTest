//
//  HomeHeaderViewCell.swift
//  Test
//
//  Created by abdul on 17/04/20.
//  Copyright © 2020 abdul. All rights reserved.
//

import UIKit

class HomeHeaderViewCell: UICollectionViewCell {

    @IBOutlet weak var headerImage: ShimmerImageView!
    @IBOutlet weak var headerTitle: ShimmerLabelView!
    @IBOutlet weak var headerSubtitle: ShimmerLabelView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func populateData(with src:HomeModel, isLoading:Bool) {
        if isLoading == true {
          startLoading()
        }else if isLoading == false {
           stopLoading()
        }
        
        headerTitle.text = src.title
        headerSubtitle.text = src.subtitle
        
        headerImage.loadImageAsync(with: src.imageUrl)
    }
    
    private func stopLoading() {
        headerImage.stopShimmering()
        headerTitle.stopShimmering()
        headerSubtitle.stopShimmering()
    }
    
    private func startLoading() {
        headerImage.startShimmering()
        headerTitle.startShimmering()
        headerSubtitle.startShimmering()
    }

}

extension HomeHeaderViewCell : CellIdentifiable {}
