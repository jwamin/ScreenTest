//
//  ScreenTest.swift
//  ScreenTest
//
//  Created by Joss Manger on 2/18/19.
//  Copyright © 2019 Joss Manger. All rights reserved.
//

import ScreenSaver

class ScreenTest : ScreenSaverView {

    let color = NSColor(calibratedRed: 188.0/255, green: 0, blue: 45.0/255, alpha: 1.0)
    
    override init?(frame: NSRect, isPreview: Bool) {
        super.init(frame: frame, isPreview: isPreview)
        self.animationTimeInterval = 1/30
    }
    
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: NSRect) {
        super.draw(rect)
        
        NSColor.white.setFill()
        self.bounds.fill()
        
        let circleDimension = self.bounds.height/2;
        
        let centerX = self.bounds.midX - (circleDimension / 2)
        let centerY = self.bounds.midY - (circleDimension / 2)
        
        let point = NSPoint(x: centerX, y: centerY)
        color.setFill()
        let circleRect = NSRect(origin: point, size: CGSize(width: self.bounds.height/2, height: self.bounds.height/2))
        let path = NSBezierPath(ovalIn: circleRect)
    
        path.fill()
        
        
    }
    
//    override func animateOneFrame() {
//        return
//    }
//
//    override var hasConfigureSheet: Bool{
//        return false
//    }
//
//    override var configureSheet: NSWindow?{
//        return nil
//    }
    
}
