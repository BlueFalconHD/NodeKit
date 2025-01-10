//
//  String+removingPrefix.swift
//  NodeKit
//
//  Created by Hayes Dombroski on 1/9/25.
//

extension String {
    func removingPrefix(_ prefix: String) -> String {
        guard self.hasPrefix(prefix) else { return self }
        return String(self.dropFirst(prefix.count))
    }
}
