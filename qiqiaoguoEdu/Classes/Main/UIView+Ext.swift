//
//  UIView+Ext.swift
//  ProjectSwift
//
//  Created by ZJQ on 2016/12/23.
//  Copyright © 2016年 ZJQ. All rights reserved.
//

import UIKit

extension UIView {

    public var x: CGFloat{
        get{
            return self.frame.origin.x
        }
        set{
            var r = self.frame
            r.origin.x = newValue
            self.frame = r
        }
    }
    
    public var y: CGFloat{
        get{
            return self.frame.origin.y
        }
        set{
            var r = self.frame
            r.origin.y = newValue
            self.frame = r
        }
    }
    
    public var top: CGFloat{
    
        get {
            return self.frame.origin.y
        }
        set{
        
            var r = self.frame
            r.origin.y = newValue
            self.frame = r
        }
    
    }

    public var  maxY: CGFloat{
        
        get {
            return self.frame.origin.y+self.frame.size.height
        }
        set{
            
            var r = self.frame
            r.origin.y = newValue - self.frame.size.height
            self.frame = r
        }
        
    }
    public var maxX: CGFloat{
        
        get {
            return self.frame.origin.x+self.frame.size.width
        }
        set{
            
            var r = self.frame
            r.origin.x = newValue - self.frame.size.width
            self.frame = r
        }
        
    }
    public var width: CGFloat{
        
        get {
            return self.frame.size.width
        }
        set{
            
            var r = self.frame
            r.size.width = newValue
            self.frame = r
        }
        
    }
    
    public var height: CGFloat{
        
        get {
            return self.frame.size.height
        }
        set{
            
            var r = self.frame
            r.size.height = newValue
            self.frame = r
        }
        
    }
    
}
