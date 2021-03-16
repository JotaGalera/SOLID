// Interfaz Segregation principle

// Description: No client should be forced to depend on methods it does not use

// For a couple of printer you have an interfaz:
import Foundation

protocol MultifunctionPrinter {
    func scan()
    func scanPhoto()
    func fax()
    func internetFax()
}

class ProfessionalPrinter: MultifunctionPrinter {
    func scan() {
        print("Scanning...")
    }
    
    func scanPhoto() {
        print("Sanning photo...")
    }
    
    func fax() {
        print("Sending fax...")
    }
    
    func internetFax() {
        print("Sending internal fax...")
    }
}
// The problem is the Normal Printer does not have a fax module, so it cannot implement that functions.
class NormalPrinter: MultifunctionPrinter {
    func scan() {
        print("Scanning...")
    }
    
    func scanPhoto() {
        print("Sanning photo...")
    }
    
    func fax() {
        //It does not have fax module
    }
    
    func internetFax() {
        //It does not have fax module
    }
}

// Solution: Interfaz segregation properly
protocol ScanModule {
    func scan()
    func scanPhoto()
}
protocol FaxModule {
    func fax()
    func internetFax()
}
// In that way, each class only need to implement her desired interfaz
class ProfessionalPrinterr: ScanModule, FaxModule {
    func scan() {
        print("Scanning...")
    }
    
    func scanPhoto() {
        print("Sanning photo...")
    }
    
    func fax() {
        print("Sending fax...")
    }
    
    func internetFax() {
        print("Sending internal fax...")
    }
}
class NormalPrinterr: ScanModule {
    func scan() {
        print("Scanning...")
    }
    
    func scanPhoto() {
        print("Sanning photo...")
    }
}
