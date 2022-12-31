# [CallBuddy](https://youtu.be/l-wLCfLDrNc)
<img width="300" alt="スクリーンショット 2022-12-31 12 34 22" src="https://user-images.githubusercontent.com/47273077/210123559-9ebd65e4-d4be-4502-9efe-66a7345698a8.gif">

ViewController
```swift
final class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startDemo()
    }

    func startDemo() {
        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
            let callManger = CallManager()
            let id = UUID()
            callManger.reportIncomingCall(id: id, handle: "Tim Cook")
        })
    }

}
```

CallManager
```swift

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
```

<img width="990" alt="スクリーンショット_2022_12_31_12_39" src="https://user-images.githubusercontent.com/47273077/210123643-a2998eea-8976-4564-b7c1-f50c69cd023a.png">


