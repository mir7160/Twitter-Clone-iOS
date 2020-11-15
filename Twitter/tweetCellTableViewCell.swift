//
//  tweetCellTableViewCell.swift
//  Twitter
//
//  Created by Mir Farid on 11/8/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class tweetCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var tweetContent: UILabel!
    
    
    @IBOutlet weak var favButton: UIButton!
    
    @IBOutlet weak var retweetButton: UIButton!
   
    var favorited:Bool = false
    
    var tweetId: Int = -1
    

    
    
    
    @IBAction func favoriteTweet(_ sender: Any) {
        let toBeFavorited = !favorited
        if(toBeFavorited){
            TwitterAPICaller.client?.favoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(isFavorited: true)
            }, failure: { (error) in
                print("favorite did not succeed \(error)")
            })
        } else{
            TwitterAPICaller.client?.unFavoriteTweet(tweetId: tweetId, success: {
                self.setFavorite(isFavorited: false)
            }, failure: { (error) in
                print("Unfavorite did not succeed \(error)")
            })
        }
    }
    
    @IBAction func retweet(_ sender: Any) {
        TwitterAPICaller.client?.reTweet(tweetId: tweetId, success: {
            self.setReTweeted(isReTweeted: true)
        }, failure: { (error) in
            print("Error in retweeting \(error)")
        })
    }
    
    func setReTweeted( isReTweeted: Bool){
        if (isReTweeted){
            retweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            retweetButton.isEnabled = false
        }else{
            retweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            retweetButton.isEnabled = true
        }
    }
     
    
    func setFavorite( isFavorited:Bool){
        favorited = isFavorited
        if (favorited){
            favButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        } else{
            favButton.setImage(UIImage(named: "favor-icon-1"), for: UIControl.State.normal)
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
