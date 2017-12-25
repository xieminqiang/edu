//
//  QGClassRoomDetailsController.swift
//  qiqiaoguoEdu
//
//  Created by xieminqiang on 2017/12/25.
//  Copyright © 2017年 xieminqiang. All rights reserved.
//

import UIKit
import RxSwift
class QGClassRoomDetailsController: QGViewController {
    var coursesId: Int?
    let disposeBag = DisposeBag()
    var detailModel: QGClassRoomDetailModel?
    var headImg = UIImageView()
    var nameLab = UILabel()
    var priceLab = UILabel()
    var tagView = QGBtnTagView()
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.title = "课堂详情"
        
        setupUI()
        gitHubProvider.rx.request(QGNetAPI.loadCourseDetail(coursesId!))
            .mapObject(QGClassRoomModel.self)
            .subscribe { event  in
                switch event {
                case .success(let repos):
                    self.detailModel = repos.itemD
                    // print("sssssss",repos.itemD)
                    
                    self.updata(dataModel: repos.itemD)
                    self.tableView.reloadData()
                    
                case .error(let error):
                    print(error)
                }
                
            }.disposed(by: disposeBag)
        
        
    }
    
    func updata(dataModel:QGClassRoomDetailModel)  {
        for son in tagView.subviews {
            son.removeFromSuperview()
        }
        
        headImg.kf.setImage(with: URL(string:dataModel.cover_path!))
        nameLab.text = dataModel.org_name
        priceLab.text = "¥" +  dataModel.class_price!
        tagView.creatButton(dataArr: dataModel.tagList)
        
        headImg.frame = CGRect.init(x: 0, y: 0, width: Screen_width, height:Screen_width*0.62)
        nameLab.numberOfLines = 2;
        nameLab.width = Screen_width - QGScreenMargin*2
        nameLab.sizeToFit()
        nameLab.x = QGScreenMargin
        nameLab.y = headImg.maxY + fixH(floatHeight:18)
        priceLab.sizeToFit()
        
        priceLab.sizeToFit()
        priceLab.x = QGScreenMargin
        priceLab.y =  nameLab.maxY + fixH(floatHeight:8)
        
        tagView.width = Screen_width - QGScreenMargin*2
        tagView.height = QGBtnTagViewH
        tagView.x = QGScreenMargin
        tagView.y = priceLab.maxY + fixH(floatHeight: 8)
        
        headView.frame = CGRect.init(x: 0, y: 0, width: Screen_width, height: tagView.maxY + fixH(floatHeight: 18))
        
        
    }
    fileprivate func setupUI() {
        view.addSubview(tableView)
        tableView.tableHeaderView = headView
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        }
        
        tableView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalTo(view)
            
        }
        navBar.backgroundColor = UIColor.white
        view.insertSubview(navBar, aboveSubview: tableView)
        
        
    }
    
    fileprivate lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = QGAPPBackgroundColor;
        tableView.contentInset = UIEdgeInsetsMake(CGFloat(kNavBarBottom), 0, 0, 0)
        tableView.register(QGClassRoomDetailsCell.classForCoder() , forCellReuseIdentifier: "QGClassRoomDetailsCell")
   
        return tableView
    }()
    
    fileprivate lazy var headView: UIView = {
        let headView = UIView()
        headView.backgroundColor = UIColor.white
        headImg.contentMode = UIViewContentMode.scaleAspectFill
        headImg.clipsToBounds = true
        nameLab.textColor = QGColor_333333
        nameLab.font = UIFont.systemFont(ofSize: 17)
        priceLab.textColor = QGColor_red
        priceLab.font = UIFont.boldSystemFont(ofSize: 15)
        
        headView.addSubview(headImg)
        headView.addSubview(nameLab)
        headView.addSubview(priceLab)
        headView.addSubview(tagView)
        return headView
    }()
    
    
    
    
}
extension QGClassRoomDetailsController: UITableViewDataSource, UITableViewDelegate {
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        

            if detailModel == nil {
                return 0
            }else {
                return  1

            }

        
        
        
        
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "QGClassRoomDetailsCell") as!  QGClassRoomDetailsCell

            cell.model = self.detailModel
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "QGClassRoomDetailsCell") as!  QGClassRoomDetailsCell
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            cell.backgroundColor = UIColor.black
            return cell
        }
        
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            print("1111111")
        } else {
            
            print("22222222")
        }
    }
}

