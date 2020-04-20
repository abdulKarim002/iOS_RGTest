//
//  HomeItemCell.swift
//  Test
//
//  Created by abdul on 17/04/20.
//  Copyright © 2020 abdul. All rights reserved.
//

import UIKit

protocol AnimationEndNowNavigate:class {
    func nagigate()
}

class HomeItemCell: UICollectionViewCell {
    @IBOutlet weak var itemImage: ShimmerImageView!
    @IBOutlet weak var itemTitle: ShimmerLabelView!
    @IBOutlet weak var widthOfCell: NSLayoutConstraint!
    
    weak var cellTouchDelegate:AnimationEndNowNavigate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        widthOfCell.constant = contentView.getCellWidth()
    }
    
    func populateData(with source:HomeModel, isLoading:Bool) {
        if isLoading == true {
           startLoading()
         }else if isLoading == false {
            stopLoading()
         }
        
        itemTitle.text = source.title
        itemImage.loadImageAsync(with: source.imageUrl, placeholder: UIImage(named: "ic_placeholder"))

    }
    
    private func stopLoading() {
        itemImage.stopShimmering()
        itemTitle.stopShimmering()
    }
    
    private func startLoading() {
        itemImage.startShimmering()
        itemTitle.startShimmering()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        animate(isHighlighted: true)
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        animate(isHighlighted: false) { (sts) in
            self.cellTouchDelegate?.nagigate()
        }
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        animate(isHighlighted: false)
    }

    //MARK:- Private functions
    private func animate(isHighlighted: Bool, completion: ((Bool) -> Void)?=nil) {
        
        let animationOptions: UIView.AnimationOptions = [.allowUserInteraction]
        if isHighlighted {
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 1,
                           initialSpringVelocity: 0,
                           options: animationOptions, animations: {
                            self.transform = .init(scaleX: 0.96, y: 0.96)
            }, completion: completion)
        } else {
            UIView.animate(withDuration: 0.5,
                           delay: 0,
                           usingSpringWithDamping: 1,
                           initialSpringVelocity: 0,
                           options: animationOptions, animations: {
                            self.transform = .identity
            }, completion: completion)
        }
    }

}

extension HomeItemCell : CellIdentifiable {}
