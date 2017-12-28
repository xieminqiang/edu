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
let kNavBarBottom = WRNavigationBar.navBarBottom()

private let IMAGE_HEIGHT:CGFloat = Screen_width*0.625
private let NAVBAR_COLORCHANGE_POINT:CGFloat = IMAGE_HEIGHT - CGFloat(kNavBarBottom * 2)

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
        gitHubProvider.rx.request(QGNetAPI.loadHomeData(username))
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
        } else {
            
            heardView.frame =  CGRect.init(x: 0, y: 0, width:  view.width, height: Screen_width*0.625 + fixH(floatHeight:110))
        }
      
        self.tableView.reloadData()
    }
    
    
    fileprivate lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = QGAPPBackgroundColor;
        tableView.contentInset = UIEdgeInsetsMake(0, 0, -fixH(floatHeight: 10) + CGFloat(kNavBarBottom), 0)
        tableView.register(QGNearCourseCell.classForCoder() , forCellReuseIdentifier: "QGNearCourseCell")
        tableView.register(QGCoursesListCell.classForCoder() , forCellReuseIdentifier: "QGCoursesListCell")
        return tableView
    }()

    fileprivate lazy var heardView:QGHomeHeardView = {
        let heardView = QGHomeHeardView()
        heardView.backgroundColor = UIColor.white
        return heardView
    }()
    
    fileprivate lazy var navView:QGNavView = {
        let navView = QGNavView()
        navView.backgroundColor = UIColor.clear
        return navView
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
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            return cell
        } else {
            let ListCell = tableView.dequeueReusableCell(withIdentifier: "QGCoursesListCell") as!  QGCoursesListCell
             ListCell.selectionStyle = UITableViewCellSelectionStyle.none
            let repo = coursesModel[(indexPath as NSIndexPath).row]
             ListCell.sendModel(model: repo)
            return ListCell
        }
        
       
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
              print("1111111")
        } else {
               let repo = coursesModel[(indexPath as NSIndexPath).row]
            let courseVC = QGClassRoomDetailsController()
            courseVC.coursesId = repo.coursesId
            self.navigationController?.pushViewController(courseVC, animated: true)
             //
            print("22222222")
        }
    }
}
// MARK: - 滑动改变导航栏透明度、标题颜色、左右按钮颜色、状态栏颜色
extension QGHomeViewController
{
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        let offsetY = scrollView.contentOffset.y
        if (offsetY > NAVBAR_COLORCHANGE_POINT)
        {
            let alpha = (offsetY - NAVBAR_COLORCHANGE_POINT) / CGFloat(kNavBarBottom)
            navView.searchImg.image = UIImage.init(named: "icon_classification_search")
            navView.searchStr.textColor = QGColor_333333
            navView.leftBtn.setTitleColor(QGColor_333333, for: UIControlState.normal)
            navView.leftBtn.setImage(UIImage.init(named: "search-drop-down-icon"), for: UIControlState.normal)
            navView.searchBg.backgroundColor = QGAPPBackgroundColor
            navBar.wr_setBackgroundAlpha(alpha: alpha)
            

        }
        else if (offsetY < 0.0) {
            navBar.wr_setBackgroundAlpha(alpha: 0)
            navView.searchImg.image = UIImage.init(named: "")
            navView.searchStr.textColor = UIColor.clear
            navView.leftBtn.setTitleColor(UIColor.clear, for: UIControlState.normal)
            navView.searchBg.backgroundColor = UIColor.clear
            navView.leftBtn.setImage(UIImage.init(named: ""), for: UIControlState.normal)
            
        } else {
            navBar.wr_setBackgroundAlpha(alpha: 0)
            navView.searchImg.image = UIImage.init(named: "icon_search_home")
            navView.searchStr.textColor = UIColor.white
            navView.leftBtn.setTitleColor(UIColor.white, for: UIControlState.normal)
            navView.searchBg.backgroundColor = UIColor.init(white: 1, alpha: 0.5)
            navView.leftBtn.setImage(UIImage.init(named: "icon_city_home"), for: UIControlState.normal)
        }
    }
}
extension  QGHomeViewController {
    
    fileprivate func setupUI() {
        view.addSubview(tableView)
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        }
        
       tableView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalTo(view)
            
       }

         tableView.tableHeaderView =  heardView
        
        view.insertSubview(navBar, aboveSubview: tableView)
        // 设置初始导航栏透明度
        navBar.wr_setBackgroundAlpha(alpha: 0)
      
        navView.frame = navBar.frame
        navBar.addSubview(navView)
        navView.adressName(nameStr: "深圳")
        

        
    }
    
}
