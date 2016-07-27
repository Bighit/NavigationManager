//
//  NavigationManager.swift
//  NavManager
//
//  Created by hty on 16/7/28.
//  Copyright © 2016年 hantianyu. All rights reserved.
//

import Foundation
import UIKit
class  NavigationNode {
    var nextNode:String?
    let previousNode:NavigationNode?
    //
    let viewController:UINavigationController?
    
    var context = [:]
    
    init(previousNode:NavigationNode ,viewController:UINavigationController) {
        self.previousNode=previousNode
        self.viewController=viewController
    }
}
