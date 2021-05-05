//
//  DynamicValue.swift
//  BasicMVVM
//
//  Created by artjoms.vorona on 05/05/2021.
//

import Foundation

class DynamicValue<T> {
    typealias CompletionHandler = ((T) -> Void)
    
    var value: T {
        didSet {
            self.notify()
        }
    }
    
    private var observers = [String: CompletionHandler]()
    
    init(_ value: T) {
        self.value = value
    }
    
    public func addObserver(_ observer: NSObject, completionHandler: @escaping CompletionHandler) {
        observers[observer.description] = completionHandler
    }
    
    public func addObserverAndNotify(_ observer: NSObject, completionHandler: @escaping CompletionHandler) {
        self.addObserver(observer, completionHandler: completionHandler)
        self.notify()
    }
    
    private func notify() {
        observers.forEach({ $0.value(value) })
    }
    
    deinit {
        self.observers.removeAll()
    }
}
