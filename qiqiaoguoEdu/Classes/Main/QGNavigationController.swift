//
//  QGNavigationController.swift
//  qiqiaoguoEdu
//
//  Created by xieminqiang on 2017/11/22.
//  Copyright © 2017年 xieminqiang. All rights reserved.
//

import UIKit

class QGNavigationController: UINavigationController ,UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        let target = self.navigationController?.interactivePopGestureRecognizer?.delegate
        
        let pan = UIPanGestureRecognizer.init(target: target, action: Selector(("handleNavigationTransition:")))
        
        pan.delegate = self
        
        self.view.addGestureRecognizer(pan)
        
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        
 
    
    }
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool    {
        
        if self.childViewControllers.count == 1 {
            return false
        }
        return true
    }
    


}
