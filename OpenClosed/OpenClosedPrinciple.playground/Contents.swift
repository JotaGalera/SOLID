// Open Closed Principle

// Description: Software components should be closed for modification, but open for extension
// A software component should be extendable to add a new feature or to add a new behaviour to it.

// We are an insurance company, in this case we provide a discount over the health insurance price in case the client is a loyal customer.

class InsurancePremiumDiscountCalculator {
    func calculatePremiumDiscountPercent(customer: HealthInsuranceCustomerProfile) -> Int {
        if customer.isLoyalCustomer() {
            return 20
        }
        return 0;
    }
}

class HealthInsuranceCustomerProfile {
    func isLoyalCustomer() -> Bool {
        return true; // or false
    }
}

// In the future, the company grows and it introduce a new car insurance. Besides, the company decide to apply the same discount in case the client is a loyal customer. So...

class InsurancePremiumDiscountCalculatorr {
    func calculatePremiumDiscountPercent(customer: HealthInsuranceCustomerProfile) -> Int {
        if customer.isLoyalCustomer() {
            return 20
        }
        return 0;
    }
    
    // You can check how the Open Closed Principle is been violated, because the class has been modified
    func calculatePremiumDiscountPercent(customer: CarInsuranceCustomerProfilee) -> Int {
        if customer.isLoyalCustomer() {
            return 20
        }
        return 0;
    }
}

class HealthInsuranceCustomerProfilee {
    func isLoyalCustomer() -> Bool {
        return true; // or false
    }
}

class CarInsuranceCustomerProfilee {
    func isLoyalCustomer() -> Bool {
        return true; // or false
    }
}

// Following the Open Closed Principle:

class InsurancePremiumDiscountCalculatorrr {
    func calculatePremiumDiscountPercent(customer: customer) -> Int {
        if customer.isLoyalCustomer() {
            return 20
        }
        return 0;
    }
}
// If in the future, the company decide to add new insurance, it only needs to inherit from the customer. In this way, the classes are opened to extensions but closed to modifications.
protocol customer {
    func isLoyalCustomer() -> Bool
}

class HealthInsuranceCustomerProfileee: customer {
    func isLoyalCustomer() -> Bool {
        return true; // or false
    }
}

class CarInsuranceCustomerProfileee: customer {
    func isLoyalCustomer() -> Bool {
        return true; // or false
    }
}
