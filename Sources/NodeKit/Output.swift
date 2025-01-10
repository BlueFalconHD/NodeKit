//
//  Output.swift
//  NodeKit
//
//  Created by Hayes Dombroski on 1/9/25.
//

import Foundation

@propertyWrapper
class Output<Value>: OutputProtocol, Identifiable, ObservableObject {
    let name: String
    let id: UUID = UUID()
    var connectedInputs: [InputProtocol] = []
    
    @Published var wrappedValue: Value {
        didSet {
            propagateValue()
        }
    }
    var projectedValue: Output<Value> {
        return self
    }
    
    var value: Any {
        get { wrappedValue }
        set { wrappedValue = newValue as! Value }
    }
    
    init(wrappedValue: Value, _ name: String) {
        self.wrappedValue = wrappedValue
        self.name = name
    }
    
    func propagateValue() {
        for input in connectedInputs {
            (input as? Input<Value>)?.wrappedValue = wrappedValue
        }
    }
}
