//
//  HomeViewController.swift
//  zuiyou_swift
//
//  Created by 魏唯隆 on 16/8/10.
//  Copyright © 2016年 魏唯隆. All rights reserved.
//

import UIKit

let KScreenWidth = UIScreen.main().bounds.size.width
let KScreenHeight = UIScreen.main().bounds.size.height
let KDomain = "http://tbapi.ixiaochuan.cn/"

let KFrameHeight = UIScreen.main().bounds.size.height - 64

class HomeViewController: BaseViewController , UIScrollViewDelegate {
    
    
    let mainSrcllView = UIScrollView()
    let navView = NavTitleView(frame: CGRect(x: 0, y: 0, width: KScreenWidth, height: 43))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(newAction), name: "NewAction" as NSNotification.Name, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(attentionAction), name: "AttentionAction" as NSNotification.Name, object: nil)
        
        createScrollView()
        
        createNav()
        
        addChildVC()
    }
    
    func createNav() {
        self.navigationItem.titleView = navView
    }
    
    func createScrollView() {
        mainSrcllView.frame = CGRect(x: 0, y: 64, width: KScreenWidth, height: KFrameHeight)
        mainSrcllView.contentInset = UIEdgeInsets(top: -64, left: 0, bottom: 0, right: 0)
        mainSrcllView.contentSize = CGSize(width: KScreenWidth * 2, height: 0)
        mainSrcllView.isPagingEnabled = true
        mainSrcllView.showsVerticalScrollIndicator = false
        mainSrcllView.showsHorizontalScrollIndicator = false
        mainSrcllView.delegate = self
        mainSrcllView.backgroundColor = UIColor.white()
        self.view.addSubview(mainSrcllView)
    }
    
    func addChildVC() {
        let newVC = NewViewController()
        let attentionVC = AttentionViewController()
        
        newVC.view.frame = CGRect(x: 0, y: 0, width: KScreenWidth, height: KFrameHeight)
        attentionVC.view.frame = CGRect(x: KScreenWidth, y: 0, width: KScreenWidth, height: KFrameHeight)
        
        self.addChildViewController(newVC)
        self.addChildViewController(attentionVC)
        
        mainSrcllView.addSubview(newVC.view)
        mainSrcllView.addSubview(attentionVC.view)
    }
    
    // 接收点击通知
    func newAction() {
        if(mainSrcllView.contentOffset.x >= 320){
            let transition = CATransition()
            transition.duration = 0.5
            transition.type = "rippleEffect"
            transition.subtype = "fromLeft"
            mainSrcllView.layer.add(transition, forKey: "mainSrcoll")
            self.mainSrcllView.contentOffset.x = 0

        }
    }
    
    func attentionAction() {
        if(mainSrcllView.contentOffset.x <= 0){
            let transition = CATransition()
            transition.duration = 0.5
            transition.type = "rippleEffect"
            transition.subtype = "fromRight"
            mainSrcllView.layer.add(transition, forKey: "mainSrcoll")
            self.mainSrcllView.contentOffset.x = KScreenWidth
        }
    }
    
    // UIScrollView 协议
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.x)
        if(scrollView.contentOffset.x <= 0){
            navView.newAction()
        }else if(scrollView.contentOffset.x >= KScreenWidth){
            navView.attentionAction()
        }
        
    }
    
    func requestTest() {
        //        http://192.168.9.19/eOut/m/pub/listFeedType.action
        
        /*
         let getUrl = "http://cgi.connect.qq.com/qqconnectopen/openapi/policy_conf?format=json&status_version=10&status_machine=iPhone6%2C1&oauth_consumer_key=1103537147&status_os=10.0&sdkv=2.9&client_id=1103537147&sdkp=i"
         
         RequestData.GET(url: getUrl, parameter: nil, succeed: { (task:URLSessionDataTask?,responseObject:AnyObject?) in
         //                print("oh my god  成功了+\(responseObject)")
         }) { (task:URLSessionDataTask?,data:Data?) in
         let text: String = String(data: data!, encoding: String.Encoding.utf8)!
         let dic = self.convertStringToDictionary(text: text)
         print(dic)
         }
         
         let postUrl = "http://tbapi.ixiaochuan.cn/topic/categories?sign=99c219f715191edc03e9c6e7e0730b1e"
         RequestData.POST(url: postUrl, parameter: nil, succeed: { (task: URLSessionDataTask?, responseObject: AnyObject?) in
         print("成功")
         }) { (task: URLSessionDataTask?, data: Data?) in
         print("失败")
         let text: String = String(data: data!, encoding: String.Encoding.utf8)!
         let dic = self.convertStringToDictionary(text: text)
         print(dic)
         }
         */
        
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
