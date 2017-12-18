//
//  QGHomeViewController.swift
//  qiqiaoguoEdu
//
//  Created by xieminqiang on 2017/11/21.
//  Copyright © 2017年 xieminqiang. All rights reserved.
//

import UIKit


class QGHomeViewController: QGViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()

        
        setupUI()
  
    }
    fileprivate lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = QGAPPBackgroundColor;
        tableView.register(QGHomeViewCell.classForCoder() , forCellReuseIdentifier: "cellIdentity")
        return tableView
    }()

}

extension QGHomeViewController: UITableViewDataSource, UITableViewDelegate {
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

     let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentity") as!  QGHomeViewCell
        showQGHomeViewCell(indexPath: indexPath, cell: cell)
       // let cell = Bundle.main.loadNibNamed(String(describing: QGHomeViewCell.self), owner: nil, options: nil)?.last as! QGHomeViewCell
        return cell
    }
    
    
    
    private func showQGHomeViewCell(indexPath: IndexPath,cell: QGHomeViewCell) {
         //  cell.fd_enforceFrameLayout = false
           let dateArray = QGCoursesListModel.init()
           cell.sendModel(model: dateArray)
    }
 
}

extension  QGHomeViewController {
    
    fileprivate func setupUI() {
        
     view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalTo(view)
        }
        
    }
    
}
