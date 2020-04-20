//
//  DetailHeaderCell.swift
//  Test
//
//  Created by abdul on 17/04/20.
//  Copyright © 2020 abdul. All rights reserved.
//

import UIKit

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
        detailImageView.loadImageAsync(with: src.imageUrl, placeholder: UIImage(named: "ic_placeholder"))
        dateAndAuthorName.text = "\(src.pubDate.getDateFormateby("MMM d")) . \(src.author)"
        detailImageView.clipsToBounds = true
        detailImageView.layer.cornerRadius = UIConstant.radius*2
    }
}

extension DetailHeaderCell : CellIdentifiable {}
