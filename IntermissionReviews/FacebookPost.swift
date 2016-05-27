//
//  FacebookPost.swift
//  IntermissionReviews
//
//  Created by Sahil Dhankhar on 26/05/16.
//  Copyright © 2016 Dhankhars. All rights reserved.
//

import Foundation
import UIKit

class FacebookPost  {
    

    func activityViewControllerPlaceholderItem(activityViewController: UIActivityViewController) -> AnyObject {
       return [UIActivityTypePrint, UIActivityTypeAirDrop]
    }
    
    func activityViewController(activityViewController: UIActivityViewController, itemForActivityType activityType: String) -> AnyObject? {
        if activityType == UIActivityTypePostToFacebook {
            return NSLocalizedString("Like this!", comment: "comment")
        } else if activityType == UIActivityTypePostToTwitter {
            return NSLocalizedString("Retweet this!", comment: "comment")
        } else {
            return nil
        }
    }
}

