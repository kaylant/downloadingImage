//
//  ViewController.swift
//  downloadingImage
//
//  Created by Kaylan Smith on 7/19/16.
//  Copyright © 2016 Kaylan Smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var image: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let url = NSURL(string: "https://upload.wikimedia.org/wikipedia/commons/2/2b/Jupiter_and_its_shrunken_Great_Red_Spot.jpg")
        
        // download contents of url into the session
        let task = NSURLSession.sharedSession().dataTaskWithURL(url!) { (data, response, error) -> Void in
        
            if error != nil {
            
                print(error)
                
            } else {
            
                // create image from data that has been returned
                if let jupiter = UIImage(data: data!) {
                
                    // update imageView with the image itself
                    self.image.image = jupiter
                
                }
                
            }
            
        }
        
        task.resume()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

