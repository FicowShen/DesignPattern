import Foundation

enum Visitor {
    class Equipment {
        let name: String
        let tagPrice: Float

        init(name: String, tagPrice: Float) {
            self.name = name
            self.tagPrice = tagPrice
        }

        func accept(visitor: EquipmentVisitor) {
            visitor.visitEquipment(self)
        }
    }

    final class FloppyDisk: Equipment {
        let netPrice: Float

        init(name: String, tagPrice: Float, netPrice: Float) {
            self.netPrice = netPrice
            super.init(name: name, tagPrice: tagPrice)
        }

        override func accept(visitor: EquipmentVisitor) {
            visitor.visitFloppyDisk(self)
        }
    }

    final class Chassis: Equipment {
        let parts: List<Equipment>
        let discountPrice: Float

        init(name: String,
             tagPrice: Float,
             parts: List<Equipment>,
             discountPrice: Float) {
            self.parts = parts
            self.discountPrice = discountPrice
            super.init(name: name, tagPrice: tagPrice)
        }

        override func accept(visitor: EquipmentVisitor) {
            let iterator = ListIterator<Equipment>(list: parts)
            while !iterator.isDone {
                iterator.currentItem.accept(visitor: visitor)
                iterator.next()
            }
            visitor.visitChassis(self)
        }
    }

    class EquipmentVisitor {
        func visitEquipment(_ equipment: Equipment) {}
        func visitFloppyDisk(_ disk: FloppyDisk) {}
        func visitChassis(_ chassis: Chassis) {}
    }

    class PricingVisitor: EquipmentVisitor {
        private(set) var totalPrice: Float = 0

        override func visitEquipment(_ equipment: Visitor.Equipment) {
            totalPrice += equipment.tagPrice
        }
        
        override func visitFloppyDisk(_ disk: FloppyDisk) {
            totalPrice += disk.netPrice
        }

        override func visitChassis(_ chassis: Chassis) {
            totalPrice += chassis.discountPrice
        }
    }
}
