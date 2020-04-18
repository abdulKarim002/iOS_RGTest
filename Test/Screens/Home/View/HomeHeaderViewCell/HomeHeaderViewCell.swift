//
//  HomeHeaderViewCell.swift
//  Test
//
//  Created by abdul on 17/04/20.
//  Copyright © 2020 abdul. All rights reserved.
//

import UIKit
import Kingfisher

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
        
        let url = URL(string: src.imageUrl)
        let processor = RoundCornerImageProcessor(cornerRadius: UIConstant.radius * 5)
        headerImage.kf.indicatorType = .activity
        headerImage.kf.setImage(
            with: url,
            placeholder: UIImage(named: "ic_placeholder"),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        
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
