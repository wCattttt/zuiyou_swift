//
//  ImgCollectionViewCell.swift
//  zuiyou_swift
//
//  Created by 魏唯隆 on 16/8/17.
//  Copyright © 2016年 魏唯隆. All rights reserved.
//

import UIKit

class ImgCollectionViewCell: UICollectionViewCell {
    var imageView: UIImageView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        imageView = UIImageView(frame: self.frame)
        self.addSubview(imageView!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
