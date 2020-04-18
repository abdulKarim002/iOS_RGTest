//
//  DetailHeaderCell.swift
//  Test
//
//  Created by abdul on 17/04/20.
//  Copyright © 2020 abdul. All rights reserved.
//

import UIKit
import Kingfisher

class DetailHeaderCell: UITableViewCell {

    
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var dateAndAuthorName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func populateDataWith(src:HomeModel) {
        let url = URL(string: src.imageUrl)
        let processor = RoundCornerImageProcessor(cornerRadius: UIConstant.radius * 5)
        detailImageView.kf.indicatorType = .activity
        detailImageView.kf.setImage(
            with: url,
            placeholder: UIImage(named: "ic_placeholder"),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ])
        
        dateAndAuthorName.text = "\(src.pubDate.getDateFormateby("MMM d")) . \(src.author)"
    }
}

extension DetailHeaderCell : CellIdentifiable {}
