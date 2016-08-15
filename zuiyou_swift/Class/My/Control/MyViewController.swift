//
//  MyViewController.swift
//  zuiyou_swift
//
//  Created by 魏唯隆 on 16/8/10.
//  Copyright © 2016年 魏唯隆. All rights reserved.
//

import UIKit

//#define KScreenWidth UIScreen.main().bounds.size.width

// 头视图的背景和毛玻璃视图

var bgImgView: UIImageView = UIImageView.init(frame: CGRect(x: 0, y: 0, width: KScreenWidth, height: 264))
var effectview = UIVisualEffectView()



func createImageWithColor(color: UIColor) -> UIImage {
    let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
    UIGraphicsBeginImageContext(rect.size)
    let context = UIGraphicsGetCurrentContext()
    
    context!.setFillColor(color.cgColor)
    context!.fill(rect)
    let theImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext();
    
    return theImage!
}


class MyViewController: UITableViewController {
    @IBOutlet weak var bgView: UIView!

    @IBOutlet weak var headerImgView: UIImageView!
    @IBOutlet weak var sexImgView: UIImageView!
    @IBOutlet weak var signLabel: UILabel!
    @IBOutlet weak var praiseLabel: UILabel!
    @IBOutlet weak var attentionLabel: UILabel!
    @IBOutlet weak var fansLabel: UILabel!
    
    
    @IBOutlet weak var listLabel: UILabel!
    @IBOutlet weak var sendLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var collectionLabel: UILabel!
    @IBOutlet weak var zanLabel: UILabel!
    @IBOutlet weak var forbiddenLabel: UILabel!
    
    @IBOutlet weak var nightSwitch: UISwitch!
    
    
    func initView()  {
        self.tableView.contentInset = UIEdgeInsetsMake(-64, 0, 0, 0)
        bgView.insertSubview(bgImgView, at: 0)
        
        headerImgView.layer.masksToBounds = true
        headerImgView.layer.cornerRadius = 30
        
        bgImgView.image = headerImgView.image
        
        let blur = UIBlurEffect.init(style: UIBlurEffectStyle.light)
        effectview = UIVisualEffectView.init(effect: blur)
        effectview.frame = CGRect(x: 0, y: 0, width: KScreenWidth, height: 264)
        
        bgView.insertSubview(effectview, at: 1)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // 初始化添加的视图
        initView()
        // 初始化导航栏
        navInit()
        
        
    }
    
    func navInit() {
        self.title = "未登录"
        // 设置导航栏背景
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white()]
        //修改导航栏按钮颜色
        self.navigationController?.navigationBar.tintColor = UIColor.white()
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage.init(named: "Setting_20x20_@3x"), style: UIBarButtonItemStyle.done, target: self, action: #selector(rightAction))
        
    }
    
    func rightAction() {
        
    }

    func reloadDataSource() {
        
    }
    
    // UITableView协议
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        print(scrollView.contentOffset)
        
        effectview.frame = CGRect(x: 0, y: scrollView.contentOffset.y, width: KScreenWidth, height: 264 - scrollView.contentOffset.y)
        
        bgImgView.frame = CGRect(x: 0, y: scrollView.contentOffset.y, width: KScreenWidth, height: 264 - scrollView.contentOffset.y)
        
        if(scrollView.contentOffset.y >= 150){
            self.navigationController?.navigationBar.setBackgroundImage(createImageWithColor(color: UIColor.white()), for: UIBarMetrics.default)
            self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.black()]
            self.navigationController?.navigationBar.tintColor = UIColor.black()
        }else{
            self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
            self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white()]
            self.navigationController?.navigationBar.tintColor = UIColor.white()
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
