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
    var teacherList = [QGTeacherListModel]()
    var courseList =  [QGCoursesListModel]()
    var orgItem:QGOrgItemModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadOrgData()
    }
    
    
    func setupUI() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.left.right.top.bottom.equalTo(view)
        }
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        }
        tableView.tableHeaderView = headerView
 
        view.insertSubview(navBar, aboveSubview: tableView)
        // 设置初始导航栏透明度
        navBar.wr_setBackgroundAlpha(alpha: 0)
    }
 

    func loadOrgData() {
        SVProgressHUD.show()
        gitHubProvider.rx.request(QGNetAPI.loadOrgDetail(orgId!))
            .mapObject(QGOrgModel.self)
            .subscribe { event  in
                switch event {
                case .success(let repos):
//                    self.detailModel = repos.itemD
                    self.updata(dataModel: repos)
                    SVProgressHUD.dismiss()
                case .error(let error):
                    SVProgressHUD.dismiss()
                    self.tableView.reloadData()
                    print(error)
                }
                
            }.disposed(by: disposeBag)
        
    }
    func updata(dataModel:QGOrgModel){
        self.orgItem = dataModel.orgItem
         self.courseList = dataModel.courseList
         self.teacherList = dataModel.teacherList
          headerView.orgItemModel = dataModel.orgItem
          headerView.backgroundColor = UIColor.white
          headerView.frame = CGRect.init(x: 0, y: 0, width: Screen_width, height: headerView.tagView.maxY + fixW(floatWidth: 15))
          tableView.reloadData()
        
    }
    
    fileprivate lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = QGAPPBackgroundColor;
     // tableView.frame = CGRect.init(x: 0, y: 0, width: Screen_width, height: Screen_height)
        tableView.register(QGOrgCourseCell.classForCoder() , forCellReuseIdentifier: "QGOrgCourseCell")
        
        return tableView
    }()
    
    fileprivate lazy var headerView: QGOrgHeaderView = {
        let headerView = QGOrgHeaderView()
        return headerView
    }()
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
extension QGOrgViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "QGOrgCourseCell") as!  QGOrgCourseCell
     
        //cell.textLabel?.text = "78787878"
        cell.courseList = self.courseList
        cell.collectionView.reloadData()
        return cell
        
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return fixW(floatWidth: 152)
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
         return 10
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: Screen_width, height: 10))
        headView.backgroundColor = QGAPPBackgroundColor
        return headView
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            print("1111111")
        } else {
            
            print("22222222")
        }
    }
}
