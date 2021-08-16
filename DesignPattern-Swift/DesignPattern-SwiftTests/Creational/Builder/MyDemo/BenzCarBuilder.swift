import Foundation

class RaceCarWheel: CarWheel {}
class ElectricCarEngine: CarEngine {}
class AutomaticCarGearbox: CarGearbox {}
class SoftCarSeat: CarSeat {}
class BulletProofCarDoor: CarDoor {}

class BenzCarBuilder: CarBuilder {
    
    private var currentCar: Car!
    
    func startBuildingANewCar() {
        currentCar = Car()
    }
    
    func buildWheels() {
        currentCar.wheels = [CarWheel].init(repeating: RaceCarWheel(), count: 4)
    }
    
    func buildEngine() {
        currentCar.engine = ElectricCarEngine()
    }
    
    func buildGearbox() {
        currentCar.gearbox = AutomaticCarGearbox()
    }
    
    func buildSeats() {
        currentCar.seats = [CarSeat].init(repeating: SoftCarSeat(), count: 4)
    }
    
    func buildDoors() {
        currentCar.doors = [CarDoor].init(repeating: BulletProofCarDoor(), count: 4)
    }
    
    func getCar() -> Car? { return currentCar }
}
