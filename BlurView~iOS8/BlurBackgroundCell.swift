//
//  BlurBackgroundCell.swift
//  BlurView~iOS8
//
//  Created by Vinodh  on 06/07/14.
//  Copyright (c) 2014 Daston. All rights reserved.
//

import UIKit
import QuartzCore

class BlurBackgroundCell : UITableViewCell
{
    @IBOutlet var BlurContentView : UIView
    @IBOutlet var cellTitleLabel: UILabel
    var blurView : UIVisualEffectView!
    var blurStyle : UIBlurEffectStyle!
    
    
    // returns simple Blur cell of specified blur type
    func setUpCell(#blurStyle : UIBlurEffectStyle)
    {
        if (self.blurView == nil)
        {
            var blurView : UIVisualEffectView = blurEffectViewWithBlurSTyle(blurStyle)
            blurView.frame = self.BlurContentView.bounds
            self.BlurContentView.addSubview(blurView);
            self.BlurContentView.clipsToBounds = true;
            self.blurView = blurView;
        }
    }
    

    // returns blur cell of specified blur type with Vibrancyview for displaying label on top of blurView
    func setUpCellWithVibrancy(#blurStyle : UIBlurEffectStyle, #blurTypeText : NSString, #color : UIColor)
    {
        if (self.blurView == nil)
        {
            var blurView : UIVisualEffectView = blurEffectViewWithBlurSTyle(blurStyle)
            blurView.frame = self.BlurContentView.bounds
            self.BlurContentView.addSubview(blurView);
            self.BlurContentView.clipsToBounds = true;
            
            let vibrancy = UIVibrancyEffect(forBlurEffect: blurView.effect as UIBlurEffect)
            let vibrancyView = UIVisualEffectView(effect: vibrancy)
            vibrancyView.frame = blurView.bounds
            vibrancyView.autoresizingMask = .FlexibleWidth | .FlexibleHeight
            blurView.contentView.addSubview(vibrancyView)
            
            
            let label = UILabel(frame:CGRectMake(20, 80, 240, 22))
            label.textAlignment = NSTextAlignment.Right
            label.font = UIFont.systemFontOfSize(18)
            label.text = blurTypeText
            label.textColor = color;
            vibrancyView.addSubview(label)
            self.blurView = blurView;
        }
    }
    
    //Private
    func blurEffectViewWithBlurSTyle(blurStyle: UIBlurEffectStyle) -> UIVisualEffectView!
    {
        let blurEffect = UIBlurEffect(style:blurStyle)
        let blurView : UIVisualEffectView = UIVisualEffectView(effect: blurEffect)
        blurView.autoresizingMask = UIViewAutoresizing.FlexibleHeight | UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleTopMargin | UIViewAutoresizing.FlexibleBottomMargin
        return blurView
    }
    
}

