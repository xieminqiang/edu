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

         self.heardView.cycleScrollView.imageURLStringsGroup = bannerArr
         self.heardView.catlittModel(model: dataModel.CateList)
        if dataModel.CateList.count>4 {
            heardView.frame =  CGRect.init(x: 0, y: 0, width:  view.width, height: Screen_width*0.625 + fixH(floatHeight: 200))
        }
      
        self.tableView.reloadData()
    }
    
    
    fileprivate lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = QGAPPBackgroundColor;
        tableView.contentInset = UIEdgeInsetsMake(0, 0, -10, 0)
        tableView.register(QGNearCourseCell.classForCoder() , forCellReuseIdentifier: "QGNearCourseCell")
        tableView.register(QGCoursesListCell.classForCoder() , forCellReuseIdentifier: "QGCoursesListCell")
        return tableView
    }()
    

    fileprivate lazy var heardView:QGHomeHeardView = {
        let heardView = QGHomeHeardView()
        heardView.frame =  CGRect.init(x: 0, y: 0, width:  view.width, height: Screen_width*0.625 + fixH(floatHeight:110))
        heardView.backgroundColor = UIColor.white
        return heardView
    }()
    
}


extension QGHomeViewController: UITableViewDataSource, UITableViewDelegate {
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 0
        } else {
            return self.coursesModel.count
        }
        
      
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
   
      
        
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "QGNearCourseCell") as!  QGNearCourseCell
            return cell
        } else {
            let ListCell = tableView.dequeueReusableCell(withIdentifier: "QGCoursesListCell") as!  QGCoursesListCell
            showQGCoursesListCell(indexPath: indexPath, cell: ListCell)
            return ListCell
        }
        
       
    }
    private func showQGCoursesListCell(indexPath: IndexPath,cell: QGCoursesListCell) {
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

      tableView.tableHeaderView =  heardView
        


        
    }
    
}
