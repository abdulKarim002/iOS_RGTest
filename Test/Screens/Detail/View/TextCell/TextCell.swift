//
//  TextCell.swift
//  Test
//
//  Created by abdul on 17/04/20.
//  Copyright © 2020 abdul. All rights reserved.
//

import UIKit

class TextCell: UITableViewCell {

    @IBOutlet weak var textlable: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func populateHTMLData(with src:HomeModel){
        textlable.attributedText = src.htmlData.htmlToAttributedString
        if #available(iOS 13.0, *) {
            textlable.textColor = UIColor.label
        } else {
            // Fallback on earlier versions
        }
    }
    
    func populateTitleData(with src:HomeModel) {
        textlable.text = src.title
        textlable.font = UIFont(name: "Roboto Medium", size: 20)
    }
    
}

extension TextCell: CellIdentifiable {}
