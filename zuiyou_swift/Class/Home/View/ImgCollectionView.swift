//
//  ImgCollectionView.swift
//  zuiyou_swift
//
//  Created by 魏唯隆 on 16/8/16.
//  Copyright © 2016年 魏唯隆. All rights reserved.
//

import UIKit
import SDWebImage

class ImgCollectionView: UICollectionView , UICollectionViewDelegate , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    var imgData = NSArray()
    var identifier: NSString?
    
    let itemWidth = (KScreenWidth - 110)/3
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        
        super.init(frame: frame, collectionViewLayout: flowLayout)
        
        self.delegate = self
        self.dataSource = self
        
        self.backgroundColor = UIColor.orange()
        
        identifier = "ImgCollectionViewCell"
        self.register(ImgCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: identifier! as String)
        self.register(UIView.classForCoder(), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "HeaderView")
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setImgModel(imgs: NSArray) {
        
        for imgModel in imgs {
            if imgModel.isKind(of: NSDictionary.classForCoder()){
                let imgM = ImgModel(dataDic: imgModel as! NSDictionary as [NSObject : AnyObject]!)
                imgData = imgData.adding(imgM!)
                print(imgM?.imgid)
            }else if imgModel.isKind(of: ImgModel.classForCoder()){
                imgData = imgData.adding(imgModel as! ImgModel)
            }
        }
        self.reloadData()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier! as String, for: indexPath) as! ImgCollectionViewCell
        let imgModel: ImgModel = imgData[indexPath.row] as! ImgModel
        let urlStr = KImgHttp + String(format: "%@", imgModel.imgid)
        cell.imageView?.sd_setImage(with: URL(string: urlStr))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(8, 8, 8, 8)
    }

}
