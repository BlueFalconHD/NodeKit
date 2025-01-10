//
//  Input.swift
//  NodeKit
//
//  Created by Hayes Dombroski on 1/9/25.
//

import Foundation
import Combine

@propertyWrapper
public class Input<Value>: InputProtocol, Identifiable {
    public let name: String
    public let id: UUID = UUID()
    private var cancellable: AnyCancellable?
    
    public var defaultValue: Any
    public var wrappedValue: Value {
        didSet {
            // You can add didSet logic here if needed
        }
    }
    public var projectedValue: Input<Value> {
        return self
    }
    
    public var connectedOutput: OutputProtocol? {
        didSet {
            establishBinding()
        }
    }
    
    public var value: Any {
        get { wrappedValue }
        set { wrappedValue = newValue as! Value }
    }
    
    init(wrappedValue: Value, _ name: String, defaultValue: Value) {
        self.wrappedValue = wrappedValue
        self.name = name
        self.defaultValue = defaultValue
    }
    
    public func updateValueFromConnection() {
        if let outputValue = connectedOutput?.value as? Value {
            wrappedValue = outputValue
        }
    }
    
    private func establishBinding() {
        if let output = connectedOutput as? Output<Value> {
            // Use Combine to observe changes in the output's value
            cancellable = output.$wrappedValue.sink { [weak self] newValue in
                self?.wrappedValue = newValue
            }
        }
    }
}
