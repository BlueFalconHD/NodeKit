//
//  NodeView.swift
//  NodeKit
//
//  Created by Hayes Dombroski on 1/9/25.
//

import SwiftUI

public protocol NodeView: View {
    init(node: any Node)
}
