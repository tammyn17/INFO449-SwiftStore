//
//  main.swift
//  Store
//
//  Created by Ted Neward on 2/29/24.
//

import Foundation

protocol SKU {
    var name : String { get }
    func price() -> Int
}

class Item: SKU {
    var name : String
    var priceEach : Int
    
    init(name: String, priceEach: Int) {
        self.name = name
        self.priceEach = priceEach
    }
    
    func price() -> Int {
        return priceEach
    }
}

class Receipt {
    var scannedItems : [SKU] = []
    
    func add(item: SKU){
        scannedItems.append(item)
    }
    
    func items()-> [SKU] {
        return scannedItems
    }
    
    func output() -> String {
        var result = "Receipt:\n"
        result += scannedItems.map { "\($0.name): $\(String(format: "%.2f", Double($0.price())/100))" }.joined(separator: "\n")
        result += "\n------------------\n"
        result += "TOTAL: $\(String(format: "%.2f", Double(total())/100))"
        return result
    }
    
    func total() -> Int {
        return scannedItems.reduce(0) { $0 + $1.price() }
    }
}

class Register {
    var receipt: Receipt
    
    init() {
        receipt = Receipt()
    }
    
    func scan(_ item: SKU) {
        receipt.add(item: item)
    }
    
    func subtotal() -> Int {
        return receipt.items().reduce(0) { $0 + $1.price() }
    }
    
    func total() -> Receipt {
        return receipt
    }
}

class Store {
    let version = "0.1"
    func helloWorld() -> String {
        return "Hello world"
    }
}
