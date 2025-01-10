//
//  Output.swift
//  NodeKit
//
//  Created by Hayes Dombroski on 1/9/25.
//

import Foundation

@propertyWrapper
public class Output<Value>: OutputProtocol, Identifiable, ObservableObject {
    public let name: String
    public let id: UUID = UUID()
    public var connectedInputs: [InputProtocol] = []
    
    @Published public var wrappedValue: Value {
        didSet {
            propagateValue()
        }
    }
    public var projectedValue: Output<Value> {
        return self
    }
    
    public var value: Any {
        get { wrappedValue }
        set { wrappedValue = newValue as! Value }
    }
    
    init(wrappedValue: Value, _ name: String) {
        self.wrappedValue = wrappedValue
        self.name = name
    }
    
    public func propagateValue() {
        for input in connectedInputs {
            (input as? Input<Value>)?.wrappedValue = wrappedValue
        }
    }
}
