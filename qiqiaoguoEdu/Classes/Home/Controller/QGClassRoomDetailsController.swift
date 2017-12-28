//
//  QGClassRoomDetailsController.swift
//  qiqiaoguoEdu
//
//  Created by xieminqiang on 2017/12/25.
//  Copyright © 2017年 xieminqiang. All rights reserved.
//

import UIKit
import RxSwift
import SVProgressHUD
class QGClassRoomDetailsController: QGViewController,UIWebViewDelegate {
    var coursesId: Int?
    let disposeBag = DisposeBag()
    var detailModel: QGClassRoomDetailModel?
    var headImg = UIImageView()
    var nameLab = UILabel()
    var priceLab = UILabel()
    var tagView = QGBtnTagView()
    let offSetMax:CGFloat = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navBar.title = "课堂详情"
        
        setupUI()
        
       loadData()
        
    }
    
    func loadData()  {
        SVProgressHUD.show()
        gitHubProvider.rx.request(QGNetAPI.loadCourseDetail(coursesId!))
            .mapObject(QGClassRoomModel.self)
            .subscribe { event  in
                switch event {
                case .success(let repos):
                    self.detailModel = repos.itemD
                    self.updata(dataModel: repos.itemD)
                    SVProgressHUD.dismiss()
                case .error(let error):
                     SVProgressHUD.dismiss()
                     self.tableView.reloadData()
                    print(error)
                }
                
            }.disposed(by: disposeBag)
        
    }

    func updata(dataModel:QGClassRoomDetailModel)  {
        for son in tagView.subviews {
            son.removeFromSuperview()
        }
        
        headImg.kf.setImage(with: URL(string:dataModel.cover_path!))
        nameLab.text = dataModel.title
        priceLab.text = "¥" +  dataModel.class_price!
        tagView.creatButton(dataArr: dataModel.tagList)
          footerView.nameStr(str: "继续拖动，查看课程详情")
        headImg.frame = CGRect.init(x: 0, y: 0, width: Screen_width, height:Screen_width*0.625)
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
        
        loadWebView.loadHTMLString(dataModel.course_desc!, baseURL: nil)
        
        
        if dataModel.sign_status != 1  {
            signBtn.backgroundColor = QGColor_e1e1e1
            signBtn.setTitleColor(QGlineBackgroundColor, for: UIControlState.normal)
            signBtn.setTitle(dataModel.sign_status_text, for: UIControlState.normal)
            signBtn.isEnabled = false
        } else {
            signBtn.backgroundColor = QGColor_red
            signBtn.setTitleColor(UIColor.white, for: UIControlState.normal)
            signBtn.setTitle("立即报名", for: UIControlState.normal)
            signBtn.isEnabled = true
        }
   
         self.tableView.reloadData()
        
    }
    fileprivate func setupUI() {
        view.addSubview(loadWebView)
        view.addSubview(tableView)
        view.addSubview(toolView)
        view.addSubview(signBtn)
        tableView.tableHeaderView = headView
        tableView.tableFooterView = footerView
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
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
        tableView.frame = CGRect.init(x: 0, y: CGFloat(kNavBarBottom), width: Screen_width, height: Screen_height-CGFloat(kNavBarBottom)-54)
        tableView.register(QGClassRoomDetailsCell.classForCoder() , forCellReuseIdentifier: "QGClassRoomDetailsCell")
   
        return tableView
    }()
    
    fileprivate lazy var headView: UIView = {
        let headView = UIView()
        headView.backgroundColor = UIColor.white
        headImg.contentMode = UIViewContentMode.scaleAspectFill
        headImg.clipsToBounds = true
        nameLab.textColor = QGColor_333333
        nameLab.font = QGFont_PingFangSCLight(float: 17)
        priceLab.textColor = QGColor_red
        priceLab.font = UIFont.boldSystemFont(ofSize: 15)
        headView.addSubview(headImg)
        headView.addSubview(nameLab)
        headView.addSubview(priceLab)
        headView.addSubview(tagView)
        return headView
    }()
    
    
    fileprivate lazy var footerView:QGPullView = {
        let footerView = QGPullView()
        footerView.frame = CGRect.init(x: 0, y: 0, width: Screen_width, height:fixH(floatHeight: 50))
        return footerView
    }()
    
    fileprivate lazy var loadWebView:QGLoadWebView = {
        let loadWebView = QGLoadWebView()
        loadWebView.frame = CGRect.init(x: 0, y: Screen_height + CGFloat(kNavBarBottom) , width: Screen_width, height: Screen_height - CGFloat(kNavBarBottom))
        loadWebView.scrollView.delegate = self
        return loadWebView
    }()
    
    fileprivate lazy var toolView:QGToolButtonView = {
        let toolView = QGToolButtonView.init(frame: CGRect.init(x: 0, y: Screen_height - 54 , width: Screen_width * 2/3, height: 54))
        toolView.backgroundColor = UIColor.white
       
        return toolView
    }()
    fileprivate lazy var signBtn:UIButton = {
        let signBtn = UIButton.init(frame: CGRect.init(x: Screen_width * 2/3, y: Screen_height - 54 , width: Screen_width * 1/3, height: 54))
        signBtn.backgroundColor = QGColor_e1e1e1
       
        return signBtn
    }()
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = tableView.contentOffset.y
        if offsetY < 0 {
            headImg.frame = CGRect.init(x: 0, y: offsetY, width:Screen_width, height: Screen_width * 0.625 - offsetY)
        } else {
            
             headImg.frame = CGRect.init(x: 0, y: 0, width:Screen_width, height: Screen_width * 0.625 )
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offsetY:CGFloat = scrollView.contentOffset.y
        if scrollView is UITableView {
         let valueNum = tableView.contentSize.height - Screen_height
            if (offsetY - valueNum) > offSetMax {
                goToDetailAnimation()//进入图文详情页面
                
            }
            
        } else {
            if (offsetY < 0 && -offsetY > offSetMax ) {
                
                backToFirstPageAnimation()// 返回基本详情界面的动画
            }
            
            
        }
    }
    
    
    func goToDetailAnimation() {
       
        
        UIView.animate(withDuration:0.3, animations: {
            self.navBar.title = "图文详情"
            self.loadWebView.frame  = CGRect.init(x: 0, y: CGFloat(kNavBarBottom), width: Screen_width, height: Screen_height-CGFloat(kNavBarBottom)-54 )
            self.tableView.frame = CGRect.init(x: 0, y: -self.tableView.height, width: Screen_width, height: self.tableView.height)
        })
    }
    func backToFirstPageAnimation (){
        UIView.animate(withDuration:0.3, animations: {
              self.navBar.title = "课程详情"
            self.loadWebView.frame  = CGRect.init(x: 0, y: CGFloat(kNavBarBottom) +  Screen_height, width: Screen_width, height: Screen_height-CGFloat(kNavBarBottom) )
            self.tableView.frame = CGRect.init(x: 0, y: CGFloat(kNavBarBottom), width: Screen_width, height: Screen_height-CGFloat(kNavBarBottom)-54)
        })
       
    }
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
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "QGClassRoomDetailsCell") as!  QGClassRoomDetailsCell
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            cell.model = self.detailModel
            cell.theacherClick.addTarget(self, action:#selector(theatherVC(button:)), for: .touchUpInside)
            cell.orgClick.addTarget(self, action:#selector(orgVC(button:)), for: .touchUpInside)
            return cell
    
    }
    
    @objc func theatherVC(button:UIButton) {
      let theatherVc =  QGTheatherViewController()
        theatherVc.theatherId = self.detailModel?.teacher_id
        self.navigationController?.pushViewController(theatherVc, animated: true)
       
    }
    @objc func orgVC(button:UIButton) {
        let theatherVc =  QGOrgViewController()
        theatherVc.orgId = self.detailModel?.org_id
        self.navigationController?.pushViewController(theatherVc, animated: true)
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            print("1111111")
        } else {
            
            print("22222222")
        }
    }
}

