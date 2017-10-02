//
//  CanvasView.swift
//  SnowDays
//
//  Created by Duely Yung on 3/12/16.
//  Copyright © 2016 Duely Yung. All rights reserved.
//

import UIKit

class CanvasView: UIView {
    var x: CGFloat = 0, y: CGFloat = 0, r: CGFloat = 25
    var velocity: CGFloat = 1
    var dx: CGFloat = 1, dy: CGFloat = 1
    var xColor: Int = 0
    
    var timer : NSTimer?
    
    var colorPalette = [UIColor.blueColor(), UIColor.yellowColor(), UIColor.redColor(), UIColor.redColor()]
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        let color = colorPalette[xColor].CGColor
        CGContextSetFillColorWithColor(context, color)
        let rect = CGRect(x: x - r, y: y - r, width: 2 * r, height: 2 * r)
        CGContextFillEllipseInRect(context, rect)
    }
    
    func start() {
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0/60.0,
            target: self, selector: "update:", 
            userInfo: nil,
            repeats: true)
        x = bounds.width / 2
        y = bounds.height / 2
    }
    
    func stop() {
        timer?.invalidate()
    }
    
    func update(timer: NSTimer) {
        //println("x: \(x) y: \(y) w: \(bounds.width) h: \(bounds.height)")
        
        x += dx * velocity
        y += dy * velocity
        if x < r || x > bounds.width - r {
            dx = -dx
        }
        if y < r || y > bounds.height - r {
            dy = -dy
        }
        self.setNeedsDisplay()
    }
    
}
