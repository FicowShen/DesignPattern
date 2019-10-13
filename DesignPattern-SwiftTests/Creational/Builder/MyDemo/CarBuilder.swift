import Foundation

protocol CarBuilder {
    func startBuildingANewCar()
    func buildWheels()
    func buildEngine()
    func buildGearbox()
    func buildSeats()
    func buildDoors()
    
    func getCar() -> Car?
}

extension CarBuilder {
    func startBuildingANewCar() {}
    func buildWheels() {}
    func buildEngine() {}
    func buildGearbox() {}
    func buildSeats() {}
    func buildDoors() {}
    
    func getCar() -> Car? { return nil }
}
