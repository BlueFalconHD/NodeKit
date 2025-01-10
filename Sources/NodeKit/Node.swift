//
//  Node.swift
//  NodeKit
//
//  Created by Hayes Dombroski on 1/8/25.
//

protocol Node: AnyObject {
    func process()
}

extension Node {
    var inputs: [String: InputProtocol] {
        var inputs = [String: InputProtocol]()
        let mirror = Mirror(reflecting: self)
        for child in mirror.children {
            guard let label = child.label else { continue }
            let name = label.removingPrefix("_")
            if let input = child.value as? InputProtocol {
                inputs[name] = input
            }
        }
        return inputs
    }

    var outputs: [String: OutputProtocol] {
        var outputs = [String: OutputProtocol]()
        let mirror = Mirror(reflecting: self)
        for child in mirror.children {
            guard let label = child.label else { continue }
            let name = label.removingPrefix("_")
            if let output = child.value as? OutputProtocol {
                outputs[name] = output
            }
        }
        return outputs
    }
}
