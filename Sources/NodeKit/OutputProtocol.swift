//
//  OutputProtocol.swift
//  NodeKit
//
//  Created by Hayes Dombroski on 1/9/25.
//

import Foundation

public protocol OutputProtocol: AnyObject {
    var name: String { get }
    var id: UUID { get }
    var value: Any { get set }
    var connectedInputs: [InputProtocol] { get set }
    func propagateValue()
}
