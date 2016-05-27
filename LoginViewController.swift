//
//  LoginViewController.swift
//  IntermissionReviews
//
//  Created by Sahil Dhankhar on 25/05/16.
//  Copyright © 2016 Dhankhars. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import OAuthSwift

class LoginViewController: UIViewController, OAuthSwiftURLHandlerType {
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    func handle(url: NSURL) {
        let webViewController = self.storyboard?.instantiateViewControllerWithIdentifier("WebViewController") as! WebViewController
        webViewController.targetURL = url
        
        presentViewController(webViewController, animated: true, completion: nil)
    }

    
    func doOAuthFacebook(serviceParameters: [String:String]) {
        let oauthswift = OAuth2Swift(
            consumerKey:    serviceParameters["consumerKey"]!,
            consumerSecret: serviceParameters["consumerSecret"]!,
            authorizeUrl:   "https://www.facebook.com/dialog/oauth",
            accessTokenUrl: "https://graph.facebook.com/oauth/access_token",
            responseType:   "code"
        )
        oauthswift.authorize_url_handler = self
        let state: String = generateStateWithLength(20) as String
        oauthswift.authorizeWithCallbackURL( NSURL(string: "https://oauthswift.herokuapp.com/callback/facebook")!, scope: "public_profile", state: state, success: {
            credential, response, parameters in
                print(response)
            print(parameters)
                self.proceedToMainFlow()
            }, failure: { error in
                print(error.localizedDescription, terminator: "")
        })
    }
    
    func proceedToMainFlow() {
        let controller = storyboard!.instantiateViewControllerWithIdentifier("ManagerNavigationController") as! UINavigationController
        presentViewController(controller, animated: true, completion: nil)
    }
    
    @IBAction func startFacebookOauth2Test(sender: AnyObject) {
        var serviceParams = [String:String]()
        serviceParams["consumerKey"] = "741217782580221"
        serviceParams["consumerSecret"] = "38f28136f0afa04a1e638b39f2ebf608"
        serviceParams["name"] = "fb"
        doOAuthFacebook(serviceParams)
    }
}

//let oauthswift = OAuth2Swift(
//    consumerKey:    "741217782580221",
//    consumerSecret: "38f28136f0afa04a1e638b39f2ebf608",
//    authorizeUrl:   "https://www.facebook.com/dialog/oauth",
//    responseType:   "token"
//)
//oauthswift.authorizeWithCallbackURL(
//    NSURL(string: "oauth-swift://oauth-callback/instagram")!,
//    scope: "likes+comments", state:"INSTAGRAM",
//    success: { credential, response, parameters in
//        print(credential.oauth_token)
//    },
//    failure: { error in
//        print(error.localizedDescription)
//    }
//)