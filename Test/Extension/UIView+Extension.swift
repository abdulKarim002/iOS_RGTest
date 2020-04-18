//
//  UIView+Extension.swift
//  Test
//
//  Created by abdul on 17/04/20.
//  Copyright © 2020 abdul. All rights reserved.
//

import Foundation
import UIKit


extension UIView {
   
   func getCellWidth() -> CGFloat {
       let ViewWidth = UIScreen.main.bounds.width
       let cellWidth = (ViewWidth / 2) - 24
       return cellWidth
   }
   
   func getCellHeight() -> CGFloat {
       let ViewWidth = UIScreen.main.bounds.width
       let cellHeight = ViewWidth - 125
       return cellHeight
   }
    
}
