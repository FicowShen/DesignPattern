import Foundation

class Address {}

class Protection {}

class Memory {
    var address: Address?
    var protection: Protection?
}

class AddressTranslation {}

class TwoLevelPageTable: AddressTranslation {}

class MemoryObject {
    
    let address: Address
    
    init(address: Address) {
        self.address = address
    }
}

class PersistentStore: MemoryObject {}

class FilePersistentStore: PersistentStore {}

class DiskPersistentStore: PersistentStore {}

class MemoryObjectCache {
    var memoryObjects = [MemoryObject]()
}

class PagedMemoryObjectCache: MemoryObjectCache {}

class Domain {
    
    let cache = PagedMemoryObjectCache()
    
    func addMemory(_ memory: Memory, address: Address) {
        cache.memoryObjects.append(MemoryObject(address: address))
        memory.address = address
    }
    
    func removeMemory(_ memory: Memory) {
        guard let address = memory.address else { return }
        cache.memoryObjects.removeAll(where: { $0.address === address })
    }
    
    func protectMemory(_ memory: Memory, protection: Protection) {
        
    }
    
    func repairFault() {
        
    }
}

class Process {
    let domain = Domain()
}

