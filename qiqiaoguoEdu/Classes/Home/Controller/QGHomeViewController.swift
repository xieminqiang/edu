//
//  QGHomeViewController.swift
//  qiqiaoguoEdu
//
//  Created by xieminqiang on 2017/11/21.
//  Copyright © 2017年 xieminqiang. All rights reserved.
//

import UIKit
import RxSwift
import SDCycleScrollView
class QGHomeViewController: QGViewController {
    var dateModel:QGHomeRepositoryModel!
    let disposeBag = DisposeBag()
    var coursesModel = [QGCoursesListModel]()
    var bannerModel = [QGBannerListModel]()
    var cateListModel = [QGCateListModel]()
    

    override func viewDidLoad() {
        super.viewDidLoad()

 
      setupUI()
      downloadRepositories(50)
      
    }
    func downloadRepositories(_ username: Int) {
        gitHubProvider.rx.request(.loadHomeData(username))
        .mapObject(QGHomeRepositoryModel.self)
        .subscribe { event  in
            switch event {
            case .success(let repos):
            self.dateModel =  repos
            self.updata(dataModel: repos)
            print(repos)
            case .error(let error):
                print(error)
            }
            self.tableView.reloadData()
            }.disposed(by: disposeBag)
 
    }
    func updata(dataModel:QGHomeRepositoryModel)  {
        var bannerArr = [String]()
        self.coursesModel = dataModel.CoursesList
        self.cateListModel = dataModel.CateList
        self.bannerModel = dataModel.BannerList
        for kk in  dataModel.BannerList {
            bannerArr.append(kk.cover!)
        }
        self.cycleScrollView.imageURLStringsGroup = bannerArr
    }
    
    
    fileprivate lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = QGAPPBackgroundColor;
        tableView.contentInset = UIEdgeInsetsMake(0, 0, -10, 0)
        tableView.register(QGHomeViewCell.classForCoder() , forCellReuseIdentifier: "cellIdentity")
        return tableView
    }()
    
    fileprivate lazy var cycleScrollView: SDCycleScrollView = {
        
        let cycleScrollView = SDCycleScrollView()
        cycleScrollView.frame = CGRect.init(x: 0, y: 0, width: view.width, height: view.width * 0.628)
        cycleScrollView.autoScrollTimeInterval = 3
        cycleScrollView.pageControlDotSize = CGSize.init(width: 5, height: 5)
        return cycleScrollView
        
        
    }()
    
    

}


extension QGHomeViewController: UITableViewDataSource, UITableViewDelegate {
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return self.coursesModel.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

     let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentity") as!  QGHomeViewCell
        showQGHomeViewCell(indexPath: indexPath, cell: cell)
        return cell
    }
    private func showQGHomeViewCell(indexPath: IndexPath,cell: QGHomeViewCell) {
        let repo = coursesModel[(indexPath as NSIndexPath).row]

       cell.sendModel(model: repo)
    }
 
}

extension  QGHomeViewController {
    
    fileprivate func setupUI() {
     view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalTo(view)
            
        }
        tableView.tableHeaderView = cycleScrollView
   
      
        
        
        
    }
    
}
