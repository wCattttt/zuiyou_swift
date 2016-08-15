//
//  NewViewController.swift
//  zuiyou_swift
//
//  Created by 魏唯隆 on 16/8/11.
//  Copyright © 2016年 魏唯隆. All rights reserved.
//

import UIKit

class NewViewController: BaseViewController , UITableViewDataSource, UITableViewDelegate{

    var newData = NSMutableArray()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reloadDataSource()

        self.view.backgroundColor = UIColor.red()
        
        let tableView = UITableView.init(frame: self.view.frame, style: UITableViewStyle.plain)
        tableView.delegate = self
        tableView.dataSource = self
        
        self.view.addSubview(tableView)
        
    }
    
    func reloadDataSource() {
        // http://tbapi.ixiaochuan.cn/index/recommend?sign=23ff067443feeca74d5fc7e259ab8697
        let postUrl = KDomain + "index/recommend?sign=23ff067443feeca74d5fc7e259ab8697"
        
        let parameter = ["h_did": "598ff586c219a681793fb965c4775fa05eaedea2", "token": "57ad4b49277f28160b6cabfa"]
        RequestData.POST(url: postUrl, parameter: parameter, succeed: { (task: URLSessionDataTask?, responseObject: AnyObject?) in
            print("成功")
        }) { (task: URLSessionDataTask?, data: Data?) in
            print("失败")
            let text: String = String(data: data!, encoding: String.Encoding.utf8)!
            let dic = RequestData.convertStringToDictionary(text: text)
            print(dic)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "test")
        cell.textLabel?.text = "ffffff"
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
