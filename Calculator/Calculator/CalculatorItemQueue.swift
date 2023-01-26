//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by 천승현 on 2023/01/25.
//

import Foundation

struct CalculatorItemQueue<Item: CalculatorItem> {
    
    private(set) var enqueueStack: [Item] = []
    private(set) var dequeueStack: [Item] = []
    
    var isEmpty: Bool {
        return enqueueStack.isEmpty && dequeueStack.isEmpty
    }
    
    mutating func removeAllElement() {
        enqueueStack.removeAll()
        dequeueStack.removeAll()
    }
    
    mutating func enqueue(_ element: Item) {
        enqueueStack.append(element)
    }
    
    @discardableResult
    mutating func dequeue() -> Item? {
        if dequeueStack.isEmpty {
            dequeueStack = enqueueStack.reversed()
            enqueueStack.removeAll()
        }
        return dequeueStack.popLast()
    }
}
