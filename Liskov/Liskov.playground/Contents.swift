// Liskov substitution principle

// Description: Objects should be replaceable with their subtypes without affecting the correctness of the program

// First example: In this class, there is a Car class and a RacingCar class. Besides, RacingCar  inherit from Car.
class Car {
    private var cabinWidth: Double = 0
    
    func getCabinWidth() -> Double {
        return cabinWidth
    }
}

enum ErrorResponding: Double {
    case error = 0
}

class RacingCar: Car {
    private var cockpitWidth: Double = 0
    
    // Here we have a problem because our RacingCar has not a cabin like the rest of the cars. However RacingCar has a Cockpit
    override func getCabinWidth() -> Double {
        //UNIMPLEMENTED
        return ErrorResponding.error.rawValue
    }
    
    public func getCockpitWidth() -> Double {
        return cockpitWidth
    }
}

// Solution1: Break the hierarchy if it fails the substitution
class Vehicle {
    private var interiorWidth: Double = 0
    
    func getInteriorWidth() -> Double {
        return interiorWidth
    }
}

class Carr: Vehicle {
    private var cabinWidth: Double = 0
    
    override func getInteriorWidth() -> Double {
        return getCabinWidth()
    }
    
    func getCabinWidth() -> Double {
        return cabinWidth
    }
}

class RacingCarr: Vehicle {
    private var cockpitWidth: Double = 0
    
    override func getInteriorWidth() -> Double {
        return getCockpitWidth()
    }
    
    public func getCockpitWidth() -> Double {
        return cockpitWidth
    }
}

// Second example: We hace a product which has a 20% of discount. Also if the product is in-house, the discount is increased by 1.5
class Product {
    var discount: Double = 20
    
    func getDiscount() -> Double {
        return discount
    }
}

class InHouseProduct: Product {
    func applyExtraDiscount() {
        discount = discount * 1.5
    }
}

class main {
    var productsArray: [Product] = [Product(),Product(),InHouseProduct()]
    
    func getDiscount(){
        for product in productsArray {
            // InHouseProduct is inheriting the getDiscount method, but in that case the way in which the discount is obtained result as a smell code.
            if product is InHouseProduct {
                (product as! InHouseProduct).applyExtraDiscount()
            }
            print("Discount: \(product.getDiscount())")
        }
    }
}

// Solution: Object can be substitudes by their subtypes
class Productt {
    var discount: Double = 20
    
    func getDiscount() -> Double {
        return discount
    }
}

class InHouseProductt: Productt {
    
    override func getDiscount() -> Double {
        applyExtraDiscount()
        return discount
    }
    
    func applyExtraDiscount() {
        discount = discount * 1.5
    }
}

class mainn {
    var productsArray: [Productt] = [Productt(),Productt(),InHouseProductt()]
    
    func getDiscount(){
        for product in productsArray {
            print("Discount: \(product.getDiscount())") // Now Products and InHouseProducts are working as the same object, only theyselves know how work their implementations
        }
    }
}
