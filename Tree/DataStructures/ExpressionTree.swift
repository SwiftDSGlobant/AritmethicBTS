//
//  ExpressionTree.swift
//  Tree
//
//  Created by Aldo Antonio Martinez Avalos on 12/17/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import Foundation

struct ExpressionTree {
    
    private static func compute(operand: String, a: Int, b: Int) -> Int {
        switch operand {
        case "+":
            return a + b
        case "-":
            return a - b
        case "*":
            return a * b
        case "/":
            return a / b
        default: return 0
        }
    }
    
    private static var values: Stack<Int> = Stack<Int>()
    
    
    static func compute(expression: String) -> Int? {
        let tree = make(with: expression)
        return compute(tree: tree)
    }
    
    @discardableResult
    static func compute(tree: BinaryTree<String>) -> Int? {
        if case let .node(left, value, right) = tree {
            compute(tree: left)
            compute(tree: right)
            
            if !value.isOperator, let intValue = value.intValue {
                values.push(intValue)
            } else {
                guard let b = values.pop(), let a = values.pop() else { return 0 }
                let tempResult = compute(operand: value, a: a, b: b)
                values.push(tempResult)
            }
            return values.peek()
        }
        return 0
    }
    
    static func make(with expression: String) -> BinaryTree<String> {
        let tokenizedExpression = createTokenizedExpression(expression: expression)
        var treeStack = Stack<BinaryTree<String>>()
        
        for token in ShuntingYard().reversePolishNotation(tokenizedExpression).squished {
           insert(token: String(token), stack: &treeStack)
        }
        let tree = treeStack.pop()
        return tree == nil ? .empty : tree!
    }
    
    private static func insert(token: String, stack: inout Stack<BinaryTree<String>>) {
        if token.isOperand {
            stack.push(BinaryTree<String>.node(.empty, token, .empty))
        } else {
            if let right = stack.pop(), let left = stack.pop() {
                let parent = BinaryTree<String>.node(left, token, right)
                stack.push(parent)
            }
        }
    }

    private static func createTokenizedExpression(expression: String) -> [Token]  {
        let expressionBuilder = InfixExpressionBuilder()
        for character in expression.squished {
            let character = String(character)
            
            if character.isOperator, let op = OperatorType.fromString(character) {
                expressionBuilder.addOperator(op)
                continue
            }
            
            if character.isOperand, let intValue = character.intValue {
                expressionBuilder.addOperand(intValue)
                continue
            }
            
            if character.isOpenBracket {
                expressionBuilder.addOpenBracket()
                continue
            }
            
            if character.isClosingBracket {
                expressionBuilder.addCloseBracket()
                continue
            }
        }
        return expressionBuilder.build()
    }
    
}
