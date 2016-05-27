//
//  MovieDetailViewController.swift
//  IntermissionReviews
//
//  Created by Sahil Dhankhar on 24/05/16.
//  Copyright © 2016 Dhankhars. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import AlamofireImage
import FBSDKShareKit
import AVFoundation

class MovieDetailViewController: UIViewController {
    var movie: Movie!
    var player: AVQueuePlayer!
    
    @IBOutlet weak var songLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var posterView: UIImageView!
    override func viewDidLoad() {
        let posterImageUrl = MovieApiContants.Constants.ImageBaseURL + MovieApiContants.ImageSizeKeys.Poster + movie.posterPath!
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Action, target: self, action: #selector(addTapped))
        Alamofire.request(.GET, posterImageUrl)
            .responseImage { response in
                if let image = response.result.value {
                    self.performUIUpdatesOnMain() {
                        self.movie.posterImage = image
                        self.posterView.image = image
                    }
                }
        }
        self.titleLabel.text = movie.title
        var error: NSError?
        var success = AVAudioSession.sharedInstance().setCategory(
            AVAudioSessionCategoryPlayAndRecord,
            withOptions: .DefaultToSpeaker, error: error)
        if !success {
            NSLog("Failed to set audio session category.  Error: \(error)")
        }
        let songNames = ["http://incompetech.com/music/royalty-free/mp3-royaltyfree/Motherlode.mp3", "http://incompetech.com/music/royalty-free/mp3-royaltyfree/RetroFuture%20Clean.mp3"]
        let songs = songNames.map {
            AVPlayerItem(URL: NSURL($0))
        }
        
        player = AVQueuePlayer(items: songs)
        player.actionAtItemEnd = .Advance
        player.addObserver(self, forKeyPath: "currentItem", options: .New ?  .New : .Initial , context: nil)
        player.addPeriodicTimeObserverForInterval(CMTimeMake(1, 100), queue: dispatch_get_main_queue()) {
            [unowned self] time in
            let timeString = String(format: "%02.2f", CMTimeGetSeconds(time))
            if UIApplication.sharedApplication().applicationState == .Active {
                self.titleLabel.text =  timeString
            } else {
                println("Background: \(timeString)")
            }
        }

    }
    
    @IBAction func playPauseAction(sender: UIButton) {
        sender.selected = !sender.selected
        if sender.selected {
            player.play()
        } else {
            player.pause()
        }
    }
    
    func observeValueForKeyPath(keyPath: String, ofObject object: AnyObject, change: [NSObject : AnyObject], context: UnsafeMutablePointer<Void>) {
        if keyPath == "currentItem", let player = object as? AVPlayer,
            currentItem = player.currentItem?.asset as? AVURLAsset {
            songLabel.text = currentItem.URL?.lastPathComponent ?? "Unknown"
        }
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
    
    func addTapped() {
        /**
        // for standard dialog which does not take text

        let content: FBSDKShareLinkContent = FBSDKShareLinkContent()
        content.quote = self.movie.overview
        content.contentURL = NSURL(string: "https://www.themoviedb.org/movie/271110-captain-america-civil-war?language=en")
        FBSDKShareDialog.showFromViewController(self, withContent: content, delegate: nil)
        
         // for dialog to open inside app..can include text and image
        let content: FBSDKShareLinkContent = FBSDKShareLinkContent()
        content.contentTitle = self.movie.title
        content.contentDescription = self.movie.overview
        
        content.imageURL = NSURL(string: MovieApiContants.Constants.ImageBaseURL + MovieApiContants.ImageSizeKeys.Poster + movie.posterPath!)
        let dialog : FBSDKShareDialog = FBSDKShareDialog()
        dialog.mode = FBSDKShareDialogMode.Native
        dialog.shareContent = content
        dialog.fromViewController = self
        dialog.delegate = nil
        dialog.show()
         */
        

        let activityController = UIActivityViewController(activityItems: [movie.overview, movie.posterImage, movie.title], applicationActivities: nil)
        self.presentViewController(activityController, animated: true, completion: nil)
    }
    
    func performUIUpdatesOnMain(updates: () -> Void) {
        dispatch_async(dispatch_get_main_queue()) {
            updates()
        }
    }


}
