import Foundation

class CarWheel {}
class CarEngine {}
class CarGearbox {}
class CarSeat {}
class CarDoor {}

class Car {
    
    var wheels = [CarWheel]()
    var engine: CarEngine?
    var gearbox: CarGearbox?
    var seats = [CarSeat]()
    var doors = [CarDoor]()
    
    static func createCar(builder: CarBuilder) -> Car? {
        builder.startBuildingANewCar()
        builder.buildWheels()
        builder.buildEngine()
        builder.buildGearbox()
        builder.buildSeats()
        builder.buildDoors()
        return builder.getCar()
    }
}
