//
//  CallManager.swift
//  CallBuddy
//
//  Created by 山本響 on 2022/12/31.
//

import CallKit
import Foundation

final class CallManager: NSObject, CXProviderDelegate {
    
    let provider = CXProvider(configuration: CXProviderConfiguration())
    let callController = CXCallController()
    
    override init() {
        super.init()
        provider.setDelegate(self, queue: nil)
    }
    
    public func reportIncomingCall(id: UUID, handle: String) {
        let update = CXCallUpdate()
        update.remoteHandle = CXHandle(type: .generic, value: handle)
        provider.reportNewIncomingCall(with: id, update: update) { error in
            if let error = error {
                print(String(describing: error))
            } else {
                print("Call Reported")
            }
        }
    }
    
    public func startCall(id: UUID, handle: String) {
        let handle = CXHandle(type: .generic, value: handle)
        let action = CXStartCallAction(call: id, handle: handle)
        let transaction = CXTransaction(action: action)
        callController.request(transaction) { error in
            if let error = error {
                print(String(describing: error))
            } else {
                print("Call Reported")
            }
        }
    }
    
    
    // MARK: -Delegate
    func providerDidReset(_ provider: CXProvider) {
        
    }
}
