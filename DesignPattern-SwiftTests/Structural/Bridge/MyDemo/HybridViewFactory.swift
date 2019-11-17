import Foundation

protocol HybridViewImpFactory {
    func makeHybridViewImp() -> HybridViewImp
}

class HybridViewFactory {
    func makeHybridViewImp() -> HybridViewImp {
        #if os(macOS) || os(iOS)
            return createHybridViewImp(MacHybridViewImpFactory())
        #elseif os(Linux)
            return createHybridViewImp(LinuxHybridViewImpFactory())
        #else
            fatalError("Incompatible os!")
        #endif
    }
    
    private func createHybridViewImp(_ factory: HybridViewImpFactory) -> HybridViewImp {
        return factory.makeHybridViewImp()
    }
}

class MacHybridViewImpFactory: HybridViewImpFactory {
    func makeHybridViewImp() -> HybridViewImp {
        return MacViewImp()
    }
}

class LinuxHybridViewImpFactory: HybridViewImpFactory {
    func makeHybridViewImp() -> HybridViewImp {
        return LinuxViewImp()
    }
}

