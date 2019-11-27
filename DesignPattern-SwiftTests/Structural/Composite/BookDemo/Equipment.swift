import Foundation

protocol Equipment: class {
    typealias Watt = Double
    typealias Currency = Double
    
    var power: Watt { get }
    var netPrice: Currency { get }
    
    func addEquipment(_ equipment: Equipment)
    func removeEquipment(_ equipment: Equipment)
}

extension Equipment {
    func addEquipment(_ equipment: Equipment) {}
    func removeEquipment(_ equipment: Equipment) {}
}
