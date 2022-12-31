//
//  ViewController.swift
//  CallBuddy
//
//  Created by 山本響 on 2022/12/31.
//

import UIKit

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

