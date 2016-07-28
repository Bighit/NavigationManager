//
//  ViewController.swift
//  NavManager
//
//  Created by hty on 16/7/28.
//  Copyright © 2016年 hantianyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.redColor()
        let button = UIButton(frame:CGRectMake(50, 50, 100, 100))
        button.backgroundColor=UIColor.whiteColor()
            button.addTarget(self, action: "buttonClick", forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(button)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func buttonClick() {
    NavigationManager.manager.configNavigationPathWithString("=>ViewController2=>ViewController4","UITabBarViewController0")
        NavigationManager.manager.pushWithUIViewController(self, animated: true)
    }

}

class ViewController1: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor=UIColor.greenColor()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
class ViewController2: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor=UIColor.yellowColor()
        let button = UIButton(frame:CGRectMake(50, 50, 100, 100))
        button.backgroundColor=UIColor.whiteColor()
        button.addTarget(self, action: "buttonClick", forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(button)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    func buttonClick() {
        NavigationManager.manager.pushWithUIViewController(self, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
class ViewController3: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor=UIColor.purpleColor()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
class ViewController4: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor=UIColor.blueColor()
        let button = UIButton(frame:CGRectMake(50, 50, 100, 100))
        button.backgroundColor=UIColor.whiteColor()
        button.addTarget(self, action: "buttonClick", forControlEvents: UIControlEvents.TouchUpInside)
        view.addSubview(button)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    func buttonClick() {
        NavigationManager.manager.popViewControllerWithUIViewController(self,animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}