import Foundation

class HPS {
    func process(x0: Double, y0: Double, x1: Double, y1: Double) {}
}

class PMWindowImp: WindowImp {
    
    let hps: HPS
    
    init(hps: HPS) {
        self.hps = hps
    }
    
    func impTop() {}
    
    func impBottom() {}
    
    func deviceRect(x0: Double, y0: Double, x1: Double, y1: Double) {
        hps.process(x0: x0, y0: y0, x1: x1, y1: y1)
        GpiStrokePath(hps: hps)
    }
    
    func deviceBitmap(_ name: String, x: Double, y: Double) {}
}

func GpiStrokePath(hps: HPS) {
    
}
