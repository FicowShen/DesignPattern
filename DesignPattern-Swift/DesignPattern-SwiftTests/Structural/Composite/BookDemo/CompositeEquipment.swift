import Foundation

class CompositeEquipment: Equipment {
    var power: Watt = 0
    
    var netPrice: Currency {
        equipments.reduce(0) { $0 + $1.netPrice }
    }
    
    private lazy var equipments = [Equipment]()
    
    func addEquipment(_ equipment: Equipment) {
        equipments.append(equipment)
    }
    func removeEquipment(_ equipment: Equipment) {
        equipments.removeAll(where: { $0 === equipment })
    }
}
