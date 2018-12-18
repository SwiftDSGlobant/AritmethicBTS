//
//  Stack.swift
//  Tree
//
//  Created by Aldo Antonio Martinez Avalos on 12/17/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import Foundation

struct Stack<T> {

    fileprivate var array: [T] = []
    
    mutating func push(_ element: T) {
        array.append(element)
    }
    
    mutating func pop() -> T? {
        return array.popLast()
    }
    
    func peek() -> T? {
        return array.last
    }
    
    public var isEmpty: Bool {
        return array.isEmpty
    }
    
    public var count: Int {
        return array.count
    }
    
}

extension Stack: Sequence {
    public func makeIterator() -> AnyIterator<T> {
        var curr = self
        return AnyIterator { curr.pop() }
    }
}
