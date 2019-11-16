import Foundation

class Display {}
protocol Drawable {}
class GC {}

func XDrawRectangle(dpy: Display, winid: Drawable, gc: GC, x: Double, y: Double, width: Double, height: Double) {
    
}

class XWindowImp: WindowImp {
    
    let dpy: Display
    let winid: Drawable
    let gc: GC
    
    init(display: Display,
         winid: Drawable,
         gc: GC) {
        self.dpy = display
        self.winid = winid
        self.gc = gc
    }
    
    func impTop() {
        
    }
    
    func impBottom() {
        
    }
    
    func deviceRect(x0: Double, y0: Double, x1: Double, y1: Double) {
        let x = round(min(x0, x1))
        let y = round(min(y0, y1))
        let w = round(abs(x0 - x1))
        let h = round(abs(y0 - y1))
        XDrawRectangle(dpy: dpy,
                       winid: winid,
                       gc: gc,
                       x: x,
                       y: y,
                       width: w,
                       height: h)
    }
    
    func deviceBitmap(_ name: String, x: Double, y: Double) {
        
    }
}

