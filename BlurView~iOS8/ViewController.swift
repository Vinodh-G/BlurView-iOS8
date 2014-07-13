//
//  ViewController.swift
//  BlurView~iOS8
//
//  Created by Vinodh  on 06/07/14.
//  Copyright (c) 2014 Daston. All rights reserved.
//

import UIKit


class ViewController: UITableViewController
{
    var blurEffects : Any[] = [UIBlurEffectStyle.Dark, UIBlurEffectStyle.Light, UIBlurEffectStyle.ExtraLight]
    
    // View life cycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    //UITableView delegate
    override func tableView(tableView: UITableView!, willDisplayCell cell: UITableViewCell!, forRowAtIndexPath indexPath: NSIndexPath!)
    {
        let blurEffect = self.blurEffects[indexPath.row] as UIBlurEffectStyle
        
        switch indexPath.row
        {
            case 0 :
                (cell as BlurBackgroundCell).setUpCellWithVibrancy(blurStyle: blurEffect, blurTypeText: "Dark Blur", color: UIColor(white: 0.64, alpha: 1))
            case 1 :
                (cell as BlurBackgroundCell).setUpCellWithVibrancy(blurStyle: blurEffect, blurTypeText: "Light Blur", color: UIColor(white: 0.6, alpha: 1))
            case 2 :
                (cell as BlurBackgroundCell).setUpCellWithVibrancy(blurStyle: blurEffect, blurTypeText: "Extra Light Blur", color: UIColor(white: 0.25, alpha: 1))

            default :
                break;
        }
    }
}

