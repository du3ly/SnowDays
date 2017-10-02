//
//  CompassViewController.swift
//  SnowDays
//
//  Created by Duely Yung on 3/2/16.
//  Copyright © 2016 Duely Yung. All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController {
    
    @IBOutlet weak var canvas: CanvasView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: "handleSwipes:")
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: "handleSwipes:")
        
        leftSwipe.direction = .Left
        rightSwipe.direction = .Right
        
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
    }
    
    @IBAction func helpButton(sender: UIButton) {
        let alertController = UIAlertController(title: "Instructions", message: "Single tap -> Start\n Double tap -> Stop", preferredStyle: .Alert)
        let okayAction = UIAlertAction(title: "Okay", style: .Default, handler: nil)
        alertController.addAction(okayAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var timer: NSTimer?
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            if touch.tapCount >= 2 {
                timer?.invalidate()
            }
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            if touch.tapCount == 2 {
                handleDoubleTap()
            } else {
                timer = NSTimer.scheduledTimerWithTimeInterval(0.3,
                    target: self, selector: "handleSingleTap",
                    userInfo: nil, repeats: false)
            }
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {

    }
    
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
    
    }
    
    @IBAction func velocityChange(sender: UISlider) {
        canvas.velocity = CGFloat(sender.value)
    }
    
    func handleSingleTap() {
        canvas.start()
        print("Single tap!")
    }
    
    func handleDoubleTap() {
        canvas.stop()
        print("Double tap!!")
    }
    
    func handleSwipes(sender:UISwipeGestureRecognizer) {
        
        if (sender.direction == .Left) {
            print("Swipe left!")
        }
        
        if (sender.direction == .Right) {
            print("Swipe right!")
        }

    }

    
}
