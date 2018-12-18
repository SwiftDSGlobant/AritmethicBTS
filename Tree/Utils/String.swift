//
//  String.swift
//  Tree
//
//  Created by Aldo Antonio Martinez Avalos on 12/17/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import Foundation

extension String {
    
    var isOperator: Bool {
        return Constants.operands.contains(self)
    }
    
    var isOperand: Bool {
        return !isOperator
    }
    
    var isOpenBracket: Bool {
        return self == "("
    }
    
    var isClosingBracket: Bool {
        return self == ")"
    }
    
    var intValue: Int? {
        return Int(self)
    }
    
    var squished: String {
        return replacingOccurrences(of: " ", with: "")
    }
    
}
