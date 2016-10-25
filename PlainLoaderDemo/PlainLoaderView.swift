//
//  PlainLoaderView.swift
//  Fontli
//
//  Created by Saravanan on 21/07/16.
//  Copyright © 2016 Pramati. All rights reserved.
//

import UIKit

class PlainLoaderView: UIView {
    
    var _animationDuration: TimeInterval = 4.0
    var _loaderStrokeColor: UIColor? {
        didSet {
            if let newColor = self.loaderStrokeColor {
                strokeLayerView.backgroundColor = newColor
            }
        }
    }
    
    var _progress: CGFloat = 0.0
    internal var oldWidth: CGFloat = 0
    var strokeLayerViewTrailingConstraint: NSLayoutConstraint!
    var configured: Bool = false
    var strokeLayerView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        setup()
    }
    
    override func didMoveToSuperview() {
    }
    
    override func layoutSubviews() {
        if !configured {
            configure()
            configured = true
//          Moving the strokeLayerView to its start position
            strokeLayerViewTrailingConstraint.constant = -self.frame.size.width
            self.setNeedsUpdateConstraints()
            self.layoutIfNeeded()
        }
    }
    
    func setup() {
        strokeLayerView = UIView(frame: CGRect.zero)
        strokeLayerView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(strokeLayerView)
        self.backgroundColor = UIColor.clear
        self.loaderStrokeColor = UIColor.clear
   
    }
    
    func configure() {
        let leftConstraint = NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: strokeLayerView, attribute: .leading, multiplier: 1.0, constant: 0.0)
        let rightConstraint = NSLayoutConstraint(item: strokeLayerView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: 0.0)
        let topConstraint = NSLayoutConstraint(item: strokeLayerView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0.0)
        let bottomConstraint = NSLayoutConstraint(item: strokeLayerView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        
        strokeLayerViewTrailingConstraint = rightConstraint
        self.addConstraints([leftConstraint, rightConstraint, topConstraint, bottomConstraint])
        
        strokeLayerView.backgroundColor = self.loaderStrokeColor
    }
    
//  Loader view background color (Default: White)
    var animationDuration: TimeInterval {
        get { return _animationDuration }
        set {
            _animationDuration = newValue
        }
    }
    
//  Loader view background color (Default: White)
    var loaderStrokeColor: UIColor? {
        get { return _loaderStrokeColor }
        set {
            _loaderStrokeColor = newValue
        }
    }

//    Update the progress by giving value b/w 0 & 1
    var progress: CGFloat {
        get { return _progress }
        set {
            if (newValue > 1.0 || newValue < 0.0) { return }
            _progress = newValue
            applyProgress()
        }
    }

//    Animates the strokeLayerView with the given progress value
    internal func applyProgress() {
        let actualWidth = self.frame.size.width*(1-progress)
        UIView.animate(withDuration: 0.2, animations: {
            self.strokeLayerViewTrailingConstraint.constant = -actualWidth
            self.layoutIfNeeded()
        }, completion: { finished in
        })
        
        oldWidth = actualWidth
    }
    
//    Animates from 0 to 1 for the given duration
    func startAnimation () {
        self.updateConstraintsIfNeeded()
        UIView.animate(withDuration: self.animationDuration, animations: {
            self.strokeLayerViewTrailingConstraint.constant = 0
            self.layoutIfNeeded()
            }, completion: { finished in
        })
    }
    
    
}

