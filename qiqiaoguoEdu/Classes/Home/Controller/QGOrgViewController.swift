//
//  QGOrgViewController.swift
//  qiqiaoguoEdu
//
//  Created by xieminqiang on 2017/12/28.
//  Copyright © 2017年 xieminqiang. All rights reserved.
//

import UIKit
import SVProgressHUD
import RxSwift
class QGOrgViewController: QGViewController {
      var orgId: Int?
      let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadOrgData()
    }
    
    
    func setupUI() {
        
    }
    func loadOrgData() {
        SVProgressHUD.show()
        gitHubProvider.rx.request(QGNetAPI.loadOrgDetail(orgId!))
            .mapObject(QGOrgModel.self)
            .subscribe { event  in
                switch event {
                case .success(let repos):
//                    self.detailModel = repos.itemD
//                    self.updata(dataModel: repos.itemD)
                    SVProgressHUD.dismiss()
                case .error(let error):
                    SVProgressHUD.dismiss()
                    self.tableView.reloadData()
                    print(error)
                }
                
            }.disposed(by: disposeBag)
        
    }
    fileprivate lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = QGAPPBackgroundColor;
        tableView.frame = CGRect.init(x: 0, y: 0, width: Screen_width, height: Screen_height)
        tableView.register(QGOrgTableCell.classForCoder() , forCellReuseIdentifier: "QGOrgTableCell")
        
        return tableView
    }()
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
extension QGOrgViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "QGOrgTableCell") as!  QGOrgTableCell

        return cell
        
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            print("1111111")
        } else {
            
            print("22222222")
        }
    }
}
