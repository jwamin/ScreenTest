//: A Cocoa based Playground to present user interface

import AppKit
import PlaygroundSupport

let color = NSColor(calibratedRed: 188.0/255, green: 0, blue: 45.0/255, alpha: 1.0)


func degToRad(degrees:Float)->CGFloat{
    return CGFloat(degrees * (.pi / 180))
}

degToRad(degrees: 360)

class DrawView : NSView {
    
    override func awakeFromNib() {
        print("err woke")
    }
    
    override func draw(_ dirtyRect: NSRect) {
        
        let context = NSGraphicsContext.current?.cgContext
        let center = CGPoint(x: dirtyRect.midX / 4 * 3, y: dirtyRect.midY);
        NSColor.white.setFill()
        dirtyRect.fill()
        
        let wedgeDegrees = degToRad(degrees: 15)
        
        let step:CGFloat = -degToRad(degrees: 360) / 24
        let gapstep:CGFloat = step * 2
        var start:CGFloat = -0.0 + gapstep
        var end:CGFloat = step + gapstep
        
        print(start)
        for wedge in 0...12{

            context?.beginPath()
            context?.move(to: center)

            context?.addArc(center: center, radius: 450, startAngle: start, endAngle: end, clockwise: true)

            
            if(wedge == 0){
                context?.setFillColor(NSColor.yellow.cgColor)
            } else {
                context?.setFillColor(color.cgColor)
            }
            context?.fillPath()

            start = start + gapstep
            end = end + gapstep
        }
        
        context?.beginPath()
        context?.setLineWidth(1.0)
        context?.setStrokeColor(NSColor.white.cgColor)
        context?.addArc(center: center, radius: 70, startAngle: 0.0, endAngle: degToRad(degrees: 360), clockwise: true)
        context?.fillPath()
        
        
        
    }
    
    
}


let nibFile = NSNib.Name("MyView")
var topLevelObjects : NSArray?

Bundle.main.loadNibNamed(nibFile, owner:nil, topLevelObjects: &topLevelObjects)
let views = (topLevelObjects as! Array<Any>).filter { $0 is NSView }



let superV = views[0] as! NSView

// Present the view in Playground
PlaygroundPage.current.liveView = superV

let view:DrawView = DrawView()
view.frame = superV.frame
superV.addSubview(view)



