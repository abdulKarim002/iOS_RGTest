//
//  DetailVM.swift
//  Test
//
//  Created by abdul on 18/04/20.
//  Copyright © 2020 abdul. All rights reserved.
//

import Foundation
import UIKit

class DetailVM {
    
    var detailModel:HomeModel?
    
    init() {
        
    }
    
    func shareData(src:HomeModel) {
        detailModel = src
    }
    
    func getTitleText() -> String {
        return detailModel?.title ?? "--"
    }
}

extension DetailVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let textCell = tableView.dequeueReusableCell(withIdentifier: TextCell.identifier) as! TextCell
        
        if indexPath.row == 0 {
            textCell.populateTitleData(with: viewModel.detailModel!)
            return  textCell
        }
        else if indexPath.row == 1 {
            textCell.populateHTMLData(with: viewModel.detailModel!)
            return textCell
        } else {
            return UITableViewCell()
        }
    }
}

extension DetailVC : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 314
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let headerCell = tableView.dequeueReusableCell(withIdentifier: DetailHeaderCell.identifier) as! DetailHeaderCell
        headerCell.populateDataWith(src: viewModel.detailModel!)
        return headerCell
    }
}
