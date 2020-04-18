//
//  HomeVm.swift
//  Test
//
//  Created by abdul on 17/04/20.
//  Copyright © 2020 abdul. All rights reserved.
//

import Foundation
import UIKit

class HomeVM {

    weak var apiDelegates: APIDelegates?
    
    var headerModel = [HomeModel]()
    var itemModel = [HomeModel]()
    
    init() {
        
    }
    
    func getFeeds() {
        
        apiDelegates?.didStartAPICall()
        let feedURL = URL(string: Urls.getData.feeds)!
        let parser = FeedParser(URL: feedURL)
        
        // Parse asynchronously, not to block the UI.
        parser.parseAsync { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let feed):
                // Grab the parsed feed directly as an optional rss, atom or json feed object
                //self.rssFeed =
                self.crunchData(rssFeed: feed.rssFeed)
                
            case .failure(let error):
                print(error)
                self.apiDelegates?.didFinishAPICallWithError()
            }
        }
    }
    
    func crunchData(rssFeed: RSSFeed?) {
        var ctr = 0
        if rssFeed == nil {
            self.apiDelegates?.parsingError()
            return
        }
        for item in rssFeed!.items! {
            let title = item.title!
            let subtitle = item.description!
            let imageUrl = item.enclosure!.attributes!.url!
            let htmlData = item.content!.contentEncoded!
            let pubDate = item.pubDate!
            let author = item.author ?? "-"
            
            let modelObj = HomeModel(title: title, subtitle: subtitle, imageUrl: imageUrl, htmlData: htmlData, pubDate: pubDate, author : author)
            if ctr == 0 {
                headerModel.append(modelObj)
            }else {
                itemModel.append(modelObj)
            }
            
            ctr += 1
        }
        
        DispatchQueue.main.async {
        self.apiDelegates?.didFinishAPICallWithSuccess()
        }
    }
    
    func getNoOfCell() -> Int {
        return itemModel.count
    }
}

extension HomeVC:  UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 414, height: 416)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind:
        String, at indexPath: IndexPath) -> UICollectionReusableView {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier:
                HomeHeaderViewCell.identifier, for: indexPath) as! HomeHeaderViewCell
             if viewModel.headerModel.isEmpty  {
                return header
             }
             let data = viewModel.headerModel[indexPath.row]
             header.populateData(with: data, isLoading: isLoading)
             //header.headerImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.tap(_:))))
        
            let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tap(_:)))
            tapRecognizer.numberOfTapsRequired = 1
            header.addGestureRecognizer(tapRecognizer)
            return header
    }
    
    @objc func tap(_ gestureRecognizer: UITapGestureRecognizer) {
        presentDetailView(item: viewModel.headerModel.first!)
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isLoading {
            return 5
        }else {
            return viewModel.itemModel.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let courseCell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeItemCell.identifier, for: indexPath) as! HomeItemCell
        courseCell.cellTouchDelegate = self
        if viewModel.itemModel.isEmpty {
            return courseCell
        }
        let data = viewModel.itemModel[indexPath.row]
        courseCell.populateData(with: data, isLoading: isLoading)
        return courseCell
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
       return UIEdgeInsets(top: CGFloat(0), left: CGFloat(16), bottom: CGFloat(0), right: CGFloat(16))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        return CGSize(width: view.getCellWidth() , height: 300)
    }
    


}

extension HomeVC : UICollectionViewDelegate, AnimationEndNowNavigate {
    func nagigate() {
        presentDetailView(item: tmpData!)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = viewModel.itemModel[indexPath.row]
        tmpData = item
        //presentDetailView(item: item)
    }
    
    func presentDetailView(item:HomeModel){
        let detailVC = UIStoryboard(name: "Detail", bundle: nil).instantiateViewController(withIdentifier: "Detail") as! DetailVC
        
        detailVC.modalTransitionStyle = .coverVertical
        detailVC.modalPresentationStyle = .fullScreen
        detailVC.viewModel.shareData(src: item)
        self.present(detailVC, animated: true, completion: nil)
    }
}

