//
//  ViewController.swift
//  PlainLoaderDemo
//
//  Created by Saravanan on 29/09/16.
//  Copyright © 2016 Saravanan. All rights reserved.
//

import UIKit

extension UIColor {
    class func FontliRedColor () -> UIColor {
        return UIColor.init(red: 228 / 255.0, green: 53 / 255.0, blue: 69 / 255.0, alpha: 1.0)
    }
}

class ViewController: UIViewController {
    var loader: PlainLoaderView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initializeLoaderView()
    }

    func initializeLoaderView() {
        loader = PlainLoaderView(frame: self.view.frame)
        loader.animationDuration = 10.0 // Defaults to 4.0
        /*
         // ** To apply Auto Layout programatically on the PlainLoaderView **
        self.view.addConstraint(NSLayoutConstraint(item: loader, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.left, multiplier: 1.0, constant: 1.0))
        self.view.addConstraint(NSLayoutConstraint(item: loader, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.top, multiplier: 1.0, constant: 1.0))
        self.view.addConstraint(NSLayoutConstraint(item: loader, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.bottom, multiplier: 1.0, constant: 1.0))
        self.view.addConstraint(NSLayoutConstraint(item: loader, attribute: NSLayoutAttribute.trailing, relatedBy: NSLayoutRelation.equal, toItem: self.view, attribute: NSLayoutAttribute.trailing, multiplier: 1.0, constant: 1.0))
*/
        self.view.addSubview(loader)
        loader.backgroundColor = UIColor.gray // Defaults to clear/no-color
        loader.loaderStrokeColor = UIColor.FontliRedColor() // Defaults to clear/no-color

        Timer.scheduledTimer(timeInterval: 2.0, target: loader, selector: #selector(loader.startAnimation), userInfo: nil, repeats: false)

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

