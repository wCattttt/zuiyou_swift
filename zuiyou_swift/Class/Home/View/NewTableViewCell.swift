//
//  NewTableViewCell.swift
//  zuiyou_swift
//
//  Created by 魏唯隆 on 16/8/16.
//  Copyright © 2016年 魏唯隆. All rights reserved.
//

import UIKit

class NewTableViewCell: UITableViewCell {
    
    private let titleLabel = UILabel(frame: CGRect.zero)    // 标题
    private let label = UIButton(type: UIButtonType.custom) // 标签
    private let upBt = UIButton(type: UIButtonType.custom)  // 顶
    private let upLab = UILabel(frame: CGRect.zero) // 点赞数
    private let downBt = UIButton(type: UIButtonType.custom)    // 踩
    private var imgCollectionView = ImgCollectionView() // 图片显示视图
    private let authorBt = UIButton(type: UIButtonType.custom)  // 作者头像和名称
    private let shareBt = UIButton(type: UIButtonType.custom)   // 分享按钮
    private let reviewBt = UIButton(type: UIButtonType.custom)  // 回复按钮
    private let reviewView = ReviewView()   // 回复视图
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        print("++++++++++++++++++++++awak")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setListModel(listModel: ListModel) {
        let width = KScreenWidth - 70
        
        titleLabel.text = listModel.content
        titleLabel.font = UIFont.systemFont(ofSize: 16)
        titleLabel.numberOfLines = 0
        let titleHeight = getLabHeight(labelStr: listModel.content, font: titleLabel.font, width: width)
        titleLabel.frame = CGRect(x: 8, y: 20, width: width, height: titleHeight)
        self.addSubview(titleLabel)
        
        if listModel.topic.isKind(of: NSDictionary.classForCoder()) {
//            let topicModel = TopicModel(dataDic: listModel.topic as! NSDictionary as [NSObject : AnyObject]!)
            label.setTitle("参数错误", for: UIControlState.normal)
        }else if listModel.topic.isKind(of: TopicModel.classForCoder()){
            label.setTitle(listModel.topic.topic, for: UIControlState.normal)
        }
        label.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        label.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
//        label.titleEdgeInsets = UIEdgeInsetsMake(0, 8, 0, 0)
        label.frame = CGRect(x: 8, y: titleLabel.bottom + 8, width: titleLabel.width, height: 20)
        label.setTitleColor(blueColor, for: UIControlState.normal)
        label.addTarget(self, action: #selector(labelAction), for: UIControlEvents.touchUpInside)
        self.addSubview(label)
        
        let frame = CGRect(x: 8, y: label.bottom + 8, width: width, height: CGFloat(listModel.imgs.count) * width/3)
//        imgCollectionView = ImgCollectionView(frame: frame, collectionViewLayout: flowLayout)
        imgCollectionView.frame = frame
        imgCollectionView.setImgModel(imgs: listModel.imgs)
        self.addSubview(imgCollectionView)
        
        upBt.frame = CGRect(x: KScreenWidth - 48, y: 10, width: 40, height: 30)
        upBt.setImage(UIImage(named: "up_white_22x13_@2x"), for: UIControlState.normal)
        upBt.setImage(UIImage(named: "up_white_hl_22x13_@2x"), for: UIControlState.selected)
        upBt.addTarget(self, action: #selector(upAction), for: UIControlEvents.touchUpInside)
        self.addSubview(upBt)
        
        upLab.frame = CGRect(x: KScreenWidth - upBt.width - 8, y: upBt.bottom, width: upBt.width, height: 20)
        upLab.textAlignment = NSTextAlignment.center
        var upText = String(format: "%.0f", listModel.likes.floatValue/1)
        if listModel.likes.floatValue > 1000 && listModel.likes.floatValue < 10000 {
            upText = String(format: "%.1f", listModel.likes.floatValue/1000) + "k"
        }else if listModel.likes.floatValue > 10000{
            upText = String(format: "%.1f", listModel.likes.floatValue/10000) + "w"
        }
        upLab.text = upText
        upLab.textColor = blueColor
        self.addSubview(upLab)
        
        downBt.frame = CGRect(x: KScreenWidth - upBt.width - 8, y: upLab.bottom, width: upBt.width, height: upBt.hight)
        downBt.setImage(UIImage(named: "down_white_22x13_@2x"), for: UIControlState.normal)
        downBt.setImage(UIImage(named: "down_white_hl_22x13_@2x"), for: UIControlState.selected)
        downBt.addTarget(self, action: #selector(downAction), for: UIControlEvents.touchUpInside)
        self.addSubview(downBt)
    }
    
    func labelAction() {
        print("labelAction")
    }
    
    func upAction(upBt: UIButton) {
        upBt.isSelected = true
    }
    
    func downAction(upBt: UIButton) {
        upBt.isSelected = true
    }
    

    //获取高度
    func getLabHeight(labelStr:String,font:UIFont,width:CGFloat) -> CGFloat {
        let statusLabelText: NSString = labelStr
        let size = CGSize(width: width, height: 900)
        let dic = NSDictionary(object: font, forKey: NSFontAttributeName)
        let strSize = statusLabelText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic as? [String : AnyObject], context: nil).size
        return strSize.height
    }

    //获取宽度
    func getLabWidth(labelStr:String,font:UIFont,height:CGFloat) -> CGFloat {
        let statusLabelText: NSString = labelStr
        let size = CGSize(width: 900, height: height)
        let dic = NSDictionary(object: font, forKey: NSFontAttributeName)
        let strSize = statusLabelText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: dic as? [String : AnyObject], context: nil).size
        return strSize.width
    }
    
}
