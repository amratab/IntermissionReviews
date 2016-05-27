//
//  WebViewController.swift
//  IntermissionReviews
//
//  Created by Sahil Dhankhar on 25/05/16.
//  Copyright © 2016 Dhankhars. All rights reserved.
//

import Foundation
import UIKit
import OAuthSwift

class WebViewController: UIViewController {
    var targetURL : NSURL?
    @IBOutlet var webView: UIWebView!

    
    override func viewDidLoad() {
        print("view did load!!")
        super.viewDidLoad()
        let req = NSURLRequest(URL: targetURL!)
        self.webView.loadRequest(req)
    }
}
