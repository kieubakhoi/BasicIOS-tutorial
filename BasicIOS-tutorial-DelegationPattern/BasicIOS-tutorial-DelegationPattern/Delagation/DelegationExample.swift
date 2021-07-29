//
//  DelegationExample.swift
//  BasicIOS-tutorial-DelegationPattern
//
//  Created by Apple on 30/07/2021.
//

import UIKit
protocol SubViewADelegate {
    func passData(data: String)
}

// MARK: class View A
class ViewA {
    init() {}
}

//MARK: SubviewA Delegate
extension ViewA: SubViewADelegate {
    //MARK: SubviewA Delegate
    func passData(data: String) {
        print("Show Data \(data)")
    }
}
//MARK: class Sub-View A
class SubViewA {
    var delegate: SubViewADelegate?
    init() {}
    
    //action
    func doSomething(data: String) {
        if let delegate = delegate {
            delegate.passData(data: data)
        }
    }
}

//MARK: Do something
var view = ViewA()
var subView = SubViewA()
//pass data
//subView.delegate = view       it has not runned
//subView.doSomething(data: "Hello everybody")


