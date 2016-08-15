//
//  NavTitleView.swift
//  zuiyou_swift
//
//  Created by 魏唯隆 on 16/8/11.
//  Copyright © 2016年 魏唯隆. All rights reserved.
//

import UIKit

class NavTitleView: UIView {
    private let newBt = UIButton(type: UIButtonType.custom)
    private let attBt = UIButton(type: UIButtonType.custom)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white()
//        self.isUserInteractionEnabled = true

        createSubView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createSubView() {
        newBt.setTitle("推荐", for: UIControlState.normal)
        newBt.frame = CGRect(x: 20, y: 0, width: KScreenWidth/2 - 20, height: 44)
        newBt.setTitleColor(UIColor.black(), for: UIControlState.normal)
        newBt.setTitleColor(UIColor.init(colorLiteralRed: 40.00/255, green:180.00/255, blue:247.00/255, alpha:1), for: UIControlState.selected)
        newBt.isSelected = true
        newBt.addTarget(self, action: #selector(newAction), for: UIControlEvents.touchUpInside)
        self.addSubview(newBt)
        
        attBt.setTitle("关注", for: UIControlState.normal)
        attBt.frame = CGRect(x: KScreenWidth/2, y: 0, width: KScreenWidth/2 - 40, height: 44)
        attBt.setTitleColor(UIColor.black(), for: UIControlState.normal)
        attBt.setTitleColor(UIColor.init(colorLiteralRed: 40.00/255, green:180.00/255, blue:247.00/255, alpha:1), for: UIControlState.selected)
        attBt.addTarget(self, action: #selector(attentionAction), for: UIControlEvents.touchUpInside)
        self.addSubview(attBt)
    }
    
    func newAction() {
        newBt.isSelected = true
        if(attBt.isSelected){
           attBt.isSelected = false
        }
        NotificationCenter.default.post(name: "NewAction" as NSNotification.Name, object: nil)
    }
    
    func attentionAction() {
        attBt.isSelected = true
        if(newBt.isSelected){
            newBt.isSelected = false
        }
        NotificationCenter.default.post(name: "AttentionAction" as NSNotification.Name, object: nil)
    }
    
    override func draw(_ rect: CGRect) {
    
        
    }
    

}
