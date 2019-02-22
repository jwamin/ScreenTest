//
//  ScreenTest.swift
//  ScreenTest
//
//  Created by Joss Manger on 2/18/19.
//  Copyright © 2019 Joss Manger. All rights reserved.
//

import ScreenSaver
import os.log

final class ScreenTest : ScreenSaverView {

    private let grey = NSColor.ezColor(r: 244, g: 244, b: 244);
    
    private let colors = [
        grey,
        NSColor.yellow,
        NSColor.cyan,
        NSColor.green,
        NSColor.magenta,
        NSColor.red,
        NSColor.blue
    ]
    
    private let secondRowColors = [
        NSColor.ezColor(r: 4, g: 31, b: 224),
        NSColor.ezColor(r: 8, g: 8, b: 8),
        NSColor.ezColor(r: 250, g: 41, b: 250),
        NSColor.ezColor(r: 11, g: 12, b: 20),
        NSColor.ezColor(r: 40, g: 231, b: 230),
        NSColor.ezColor(r: 12, g: 12, b: 12),
        grey
    ]
    
    private let thirdRowColors = [
        NSColor.ezColor(r: 0, g: 27, b: 65),
        NSColor.white,
        NSColor.ezColor(r: 43, g: 2, b: 87),
        NSColor.black
    ]
    
    override init?(frame: NSRect, isPreview: Bool) {
        super.init(frame: frame, isPreview: isPreview)
        self.animationTimeInterval = 1/30
    }
    
    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: NSRect) {
        super.draw(rect)
        
        //Top Color Blocks
        
        //top line color block dimensions, screenwidth divided by number of colors
        let interval = rect.width / CGFloat(colors.count)
        let size = CGSize(width: interval, height: rect.height)
        
        //space from bottom of screen ( 1/4 )
        let yGap = rect.height / CGFloat(4)
        
        //Thin Color Blocks
        
        // further divide the quarter height by 4 ( 1 / 16 )
        let gapHeight = yGap / 4
        // subtract this height from the original 1/4 height origin
        let secondY = yGap - gapHeight
        
        // create 1/16th size with these dimensions
        let secondSize = CGSize(width: interval, height: gapHeight)
        
        //Bottom Color Blocks
        
        // 1/6 width of screen
        let bottomWidth = rect.width / 6
        
        //size that is remaining size of screen
        let finalSize = CGSize(width: bottomWidth, height: secondY)
        
        
        for (index,color) in colors.enumerated(){
            
            //x coordinate origin, in each case the y coordinate is the same and is calculated before the loop begins
            let intervalMultiple = interval * CGFloat(index)
            let point = NSPoint(x: intervalMultiple, y: yGap)
            let rect = NSRect(origin: point, size: size)
            
            //draw tall block
            
            color.setFill()
            rect.fill()
            
            //calculate origin and draw thin blocks in the same loop since interval is the same
            let secondPoint = NSPoint(x: intervalMultiple, y: secondY)
            let seconRect = NSRect(origin: secondPoint, size: secondSize)
            
            //draw thin block
            secondRowColors[index].setFill()
            seconRect.fill()
            
        }
    
        
        for (index,color) in thirdRowColors.enumerated(){
            
            if(index == thirdRowColors.count){
                //skip drawing since it's black for the rest of the screen
                return
            }
            
            //draw 1/6 blocks along the bottom (y=0)
            let finalStart = CGFloat(index) * bottomWidth
            let finalPoint = NSPoint(x: finalStart, y: 0)
            let finalRect = NSRect(origin: finalPoint, size: finalSize)
            
            //commit draw of 1/6 block
            color.setFill()
            finalRect.fill()
            
        }
        
        
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


extension NSColor{
    
    static func ezColor(r:Int,g:Int,b:Int,a:Int = 255)->NSColor{
        
        func fixColorInt(int:Int)->CGFloat{
            let floatValue = CGFloat(int)
            return CGFloat(floatValue/255.0)
        }
        
        return NSColor(srgbRed: fixColorInt(int: r), green: fixColorInt(int: g), blue: fixColorInt(int: b), alpha: fixColorInt(int: a))
        
    }
    
}
