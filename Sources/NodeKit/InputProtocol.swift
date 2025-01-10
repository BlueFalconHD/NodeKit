//
//  InputProtocol.swift
//  NodeKit
//
//  Created by Hayes Dombroski on 1/9/25.
//

import Foundation

public protocol InputProtocol: AnyObject {
    var name: String { get }
    var id: UUID { get }
    var value: Any { get set }
    var defaultValue: Any { get }
    var connectedOutput: OutputProtocol? { get set }
    func updateValueFromConnection()
}
