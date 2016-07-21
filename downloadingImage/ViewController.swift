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
                
                // SAVING and image
                // this will store the location of the documents folder to save the image
                var documentsDirectory:String?
                
                // created an array of paths to the directory, the last boolean is refering to the ~
                var paths:[AnyObject] = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)
                
                if paths.count > 0 {
                    
                    // THIS WORKFLOW saves the image to the phone and shows it from the phone
                
                    // location of where the image will be saved
                    documentsDirectory = paths[0] as? String
                    
                    // exactly where the image will be saved
                    let savePath = documentsDirectory! + "/jupiter.jpg"
                    
                    // saved the image to the file system within the phone
                    NSFileManager.defaultManager().createFileAtPath(savePath, contents: data, attributes: nil)
                    
                    // removes error from running in background
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        
                        self.image.image = UIImage(named: savePath)
                        
//                        // create image from data that has been returned
//                        if let jupiter = UIImage(data: data!) {
//                            
//                            // update imageView with the image itself
//                            self.image.image = jupiter
//                        }
                        
                    })
                
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

