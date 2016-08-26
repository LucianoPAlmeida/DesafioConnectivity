//
//  IOSMessageController.swift
//  DesafioConnectivity
//
//  Created by Luciano Almeida on 3/29/16.
//  Copyright © 2016 Luciano Almeida. All rights reserved.
//

import Foundation
import WatchConnectivity

class DefaultMessageController: NSObject, MessageController, WCSessionDelegate {

    private var session: WCSession?
    
    private(set) var messages: [Message] = []
    
    var delegate: MessageControllerDelegate?
    
    
    override init() {
        super.init()
        if WCSession.isSupported() {
            self.session = WCSession.defaultSession()
            self.session?.delegate = self
            self.session?.activateSession()
            
        }
    }
    
    func sendMessage(message: Message) -> Void {
        if message.isTextMessage {
            if let text = message.text {
                self.messages.append(message)
                self.session?.transferUserInfo(["text" : text])
            }
        }else{
            
        }
    }
    
    //MARK:- WCSession Delegate
    func session(session: WCSession, didReceiveUserInfo userInfo: [String : AnyObject]) {
        if let text = userInfo["text"] as? String{
            let message = Message(text: text, isReceived: true)
            self.messages.append(message)
            dispatch_sync(dispatch_get_main_queue(), {
                self.delegate?.didReceiveMessage(self)
            })
        }
    }
    
    func session(session: WCSession, didFinishUserInfoTransfer userInfoTransfer: WCSessionUserInfoTransfer, error: NSError?) {
        if error == nil {
            dispatch_sync(dispatch_get_main_queue(), {
                self.delegate?.didSendMessage(self)
            })
        }
    }
    
    
    
}
