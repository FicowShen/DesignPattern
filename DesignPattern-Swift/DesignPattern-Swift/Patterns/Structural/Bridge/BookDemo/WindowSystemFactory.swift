import Foundation

protocol WindowImpFactory {
    func makeWindowImp() -> WindowImp
}

final class WindowSystemFactory {
    func makeWindowImp() -> WindowImp {
        return getWindowImpFromFactory(PMWindowImpFactory())
    }
    
    func getWindowImpFromFactory(_ factory: WindowImpFactory) -> WindowImp {
        return factory.makeWindowImp()
    }
}

class PMWindowImpFactory: WindowImpFactory {
    func makeWindowImp() -> WindowImp {
        return PMWindowImp(hps: HPS())
    }
}
