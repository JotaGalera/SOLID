// Single Responsability principle

// Every software components should have one and only one responsability,
// with high cohesion and low coupling between them

// Cohesion: is the degree to which the various parts of a software compenent are related

// Class without Single Responsability princiciple

class Square {
    let side = 5
    var hihgResolutionMonitor = true
    
    // High cohesion between calculateArea and calculatePerimeter
    func calculateArea() -> Int {
        return side * side
    }
    
    func calculatePerimeter() -> Int {
        return side * 4
    }
    
    // High cohesion between draw and rotate
    func draw() {
        if hihgResolutionMonitor {
            // Render a high resolution image
        } else {
            // Render a normal image of a square
        }
    }
    
    func rotate(degree: Int) {
        //Rotate the image
    }
    
    // But the cohesion between both blocks is very poor
}

// Splitting the methods and responsabilities to increase the cohesion. In this case, Square has been splitted
// like two different classes related to each other.
class SquareShape {
    let side = 5
        
    func calculateArea() -> Int {
        return side * side
    }
    
    func calculatePerimeter() -> Int {
        return side * 4
    }
    
    
}

class SquareUI {
    var hihgResolutionMonitor = true

    func draw() {
        if hihgResolutionMonitor {
            // Render a high resolution image
        } else {
            // Render a normal image of a square
        }
    }
    
    func rotate(degree: Int) {
        //Rotate the image
    }
}

// Coupling: is defined as the level of inter dependency between various software components
import Foundation

class Student {
    private var id: String = ""
    private var dob: Date = Date()
    private var address: String = ""
    
    // Imagine that you are inserting the data in the core data of the device, but in the future
    // the data need to be inserted in a external stored. Probably a new method should be implemented,
    // for that reason we know that "Student" has a big coupling, in this case, with the Core Data.
    func save() {
        // Serialize object into a string representation
        // and insert into the DB
    }
    
    func getId() -> String {
        return id
    }
    
    func setId(_ id: String){
        self.id = id
    }
}

// Decoupling solution
class Repository {
    func save() {
        // Serialize object into a string representation
        // and insert into the DB
    }
}

class Students {
    private var id: String = ""
    private var dob: Date = Date()
    private var address: String = ""
    private var repository: Repository
    
    init(repository: Repository) {
        self.repository = repository
    }
    
    func save() {
        repository.save()
    }
    
    func getId() -> String {
        return id
    }
    
    func setId(_ id: String){
        self.id = id
    }
}
