//
//  NewViewController.swift
//  zuiyou_swift
//
//  Created by 魏唯隆 on 16/8/11.
//  Copyright © 2016年 魏唯隆. All rights reserved.
//

import UIKit
import MBProgressHUD

class NewViewController: BaseViewController , UITableViewDataSource, UITableViewDelegate{

    var newData = NSMutableArray()
    let identifier = "NewTableViewCell"
    var tableView = UITableView(frame: CGRect.zero, style: UITableViewStyle.plain)
    let refreshControl =  UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let frame = CGRect(x: 0, y: 0, width: KScreenWidth, height: KScreenHeight - 64 - 49)
        tableView.frame = frame
        self.view.backgroundColor = UIColor.red()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NewTableViewCell.classForCoder(), forCellReuseIdentifier: identifier)
        self.view.addSubview(tableView)
        
        reloadDataSource()
        
        refreshControl.tintColor = blueColor
        refreshControl.attributedTitle = AttributedString(string: "→_→。。")
        refreshControl.addTarget(self, action: #selector(refreshAction), for: UIControlEvents.valueChanged)
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            // Fallback on earlier versions
        }
        
    }
    
    func refreshAction() {
        refreshControl.beginRefreshing()
        reloadDataSource()
    }
    
    func reloadDataSource() {
        // http://tbapi.ixiaochuan.cn/index/recommend?sign=23ff067443feeca74d5fc7e259ab8697
        let postUrl = KDomain + "index/recommend?sign=23ff067443feeca74d5fc7e259ab8697"
        
        let parameter = ["h_did": "598ff586c219a681793fb965c4775fa05eaedea2", "token": "57ad4b49277f28160b6cabfa"]
        
        let hudView = MBProgressHUD.showAdded(to: self.view, animated: true)
        hudView.label.text = "加载中..."
        RequestData.postBody(urlString: postUrl, parameter: parameter, succeed: { (dataTask, data) in
            hudView.removeFromSuperview()
            self.refreshControl.endRefreshing()
            let dataStr = NSString(data: data as! Data, encoding: String.Encoding.utf8.rawValue)
            if dataStr != nil {
                let dataDic = RequestData.convertStringToDictionary(text: dataStr as? String)
                let newModel = NewModel(dataDic: dataDic)
                
                self.newData = newModel?.data["list"] as! NSMutableArray
                self.tableView.reloadData()
            }
            
        }) { (dataTask, error) in
           print(error)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newData.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier) as! NewTableViewCell
        
        let listModel: ListModel = newData[indexPath.row] as! ListModel
        cell.setListModel(listModel: listModel)
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
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
