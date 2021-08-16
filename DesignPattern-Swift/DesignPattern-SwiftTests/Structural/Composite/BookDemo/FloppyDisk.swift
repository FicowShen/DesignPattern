import Foundation

class FloppyDisk: Equipment {
    var power: Watt
    var netPrice: Currency
    
    init(power: Watt, netPrice: Currency) {
        self.power = power
        self.netPrice = netPrice
    }
}
