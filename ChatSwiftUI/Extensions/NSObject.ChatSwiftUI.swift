//
//  NSObject.ChatSwiftUI.swift
//  ChatSwiftUI
//
//  Created by Jaesung Lee on 2021/06/20.
//

import Foundation

protocol DeclarativeObject {
    associatedtype Value
    
    @discardableResult
    func set(_ closure: (_ value: Value) -> Void) -> Value
}

extension DeclarativeObject {
    @discardableResult
    func set(_ closure: (_ value: Self) -> Void) -> Self {
        closure(self)
        return self
    }
}

extension NSObject: DeclarativeObject {
    
}

