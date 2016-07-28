//
//  NavigationManager.swift
//  NavManager
//
//  Created by hty on 16/7/28.
//  Copyright © 2016年 hantianyu. All rights reserved.
//

import Foundation
import UIKit
public class  NavigationNode {
    var nextNodePath:String?
    var previousNode:NavigationNode?
    //
    let viewController:UIViewController?
    
    var identifier = ""
    var context = [:]
    
    init(viewController : UIViewController!) {
        self.viewController=viewController
    }
    
    func getNextNode()->NavigationNode?{
        if let classNamePath = nextNodePath {
            var classArray  = classNamePath.componentsSeparatedByString("=>")
            if classArray.count > 1 {
                if let viewController = self.viewControllerFromString(classArray[1]) {
                    let node = NavigationNode(viewController: viewController)
                    viewController.node = node
                    node.previousNode = self
                    node.identifier = self.identifier
                    classArray.removeAtIndex(1)
                    node.nextNodePath = classArray.joinWithSeparator("=>")
                    return node
                }
 
            }

        }
        return nil
    }
    
    func description()->String{
        return "identifier:"+self.identifier+"currentVC:"+NSStringFromClass((self.viewController?.classForCoder)!)+"\n"+"nextPath:"+self.nextNodePath!
    }
    private func viewControllerFromString(childControllerName : String) ->UIViewController? {
        
        
        if let clsName = NSBundle.mainBundle().infoDictionary!["CFBundleExecutable"] {
            let cls : AnyClass? = NSClassFromString((clsName as! String) + "." + childControllerName)
            
            if let clsType = cls as? UIViewController.Type  {
                let childController = clsType.init()
                return childController
            }
        }
        
        return nil
    }
    
}

private let managerInstance = NavigationManager()
public class NavigationManager {
   
    
    class var manager :NavigationManager{
        return managerInstance
    }
    
    public let navigationMapping : NSMutableArray = {
        let dictionary  = NSMutableArray(contentsOfFile : navigationConfigFileName)
        if let temp = dictionary {
            return temp
        }
        return NSMutableArray()
    } ()
    public var nodeDictionary = [String:NavigationNode]()
    
    public func configWith(tabBarController : UITabBarController) {
        if let temp = tabBarController.viewControllers as? [UINavigationController] {
            for (index, value) in temp.enumerate() {
                if let vc = value.topViewController{
                    let navNode=NavigationNode( viewController: vc)
                    navNode.identifier=tabChildViewControllerIdentifier+String(index)
                    vc.node=navNode
                    self.nodeDictionary.updateValue(navNode, forKey: navNode.identifier)
                }
                
            }
        }
    }
    init(){}
    public func addNavigationNode(node : NavigationNode){
        nodeDictionary.updateValue(node, forKey: node.identifier)
    }
    public func configNavigationPathWithString(path:String,_ identifier:String){
        if let node = nodeDictionary[identifier]{
            node.nextNodePath=path
        }
    }
    public func pushWithUIViewController(viewController : UIViewController, animated:Bool){
        
        if let nextNode = viewController.node?.getNextNode(){
            nodeDictionary[nextNode.identifier]=nextNode
            print(nextNode.description())
            viewController.navigationController!.pushViewController(nextNode.viewController!, animated:animated)
        }else
        {
            
        }
        
    }
    public func popViewControllerWithUIViewController(viewController:UIViewController, to:String="",animated:Bool){
        if let previousNode=viewController.node?.previousNode {
            if to.isEmpty{
                nodeDictionary[previousNode.identifier]=previousNode
                print(previousNode.description())
                viewController.navigationController!.popViewControllerAnimated(animated)
            }else
            {
                var node=previousNode
                while  NSStringFromClass((node.viewController?.classForCoder)!) != to   {
                   node=node.previousNode!
                }
                nodeDictionary[node.identifier]=node
                print(node.description())
                viewController.navigationController!.popToViewController(node.viewController!, animated: animated)
            }
        }
    }
}
extension UIViewController{
    private struct navNodekey {
        static var  node:NavigationNode?
    }
    //
    var node:NavigationNode? {
        get {
            return objc_getAssociatedObject(self,&navNodekey.node) as? NavigationNode
        }
        set {
            if let newValue = newValue {
                objc_setAssociatedObject(self,&navNodekey.node, newValue as NavigationNode?, objc_AssociationPolicy.OBJC_ASSOCIATION_ASSIGN)
            }
        }
    }
    
}