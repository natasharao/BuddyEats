//
//  ChatService.swift
//  BuddyEats2.0
//
//  Created by Natasha Rao on 9/15/19.
//  Copyright © 2019 Natasha Rao. All rights reserved.
//

import Foundation
import Scaledrone

class ChatService: ScaledroneDelegate, ScaledroneRoomDelegate {
    private let scaledrone: Scaledrone
    private let messageCallback: (Message)-> Void
    private var room: ScaledroneRoom?
    
    init(member: Member, onRecievedMessage: @escaping (Message)-> Void) {
        self.messageCallback = onRecievedMessage
        self.scaledrone = Scaledrone(
            channelID: "TtdUCWBS1ZbTbRYl",
            data: member.toJSON)
        scaledrone.delegate = self
    }
    
    func connect() {
        scaledrone.connect()
    }
    
   
    func scaledroneDidConnect(scaledrone: Scaledrone, error: Error?) {
            print("Connected to Scaledrone")
            room = scaledrone.subscribe(roomName: "observable-room")
            room?.delegate = self
        }
        
    func scaledroneDidReceiveError(scaledrone: Scaledrone, error: Error?) {
            print("Scaledrone error", error ?? "")
        }
        
    func scaledroneDidDisconnect(scaledrone: Scaledrone, error: Error?) {
            print("Scaledrone disconnected", error ?? "")
        }
    
    func scaledroneRoomDidConnect(room: ScaledroneRoom, error: Error?) {
            print("Connected to room!")
        }
        
        func scaledroneRoomDidReceiveMessage(
            room: ScaledroneRoom,
            message: Any,
            member: ScaledroneMember?) {
            
            guard
                let text = message as? String,
                let memberData = member?.clientData,
                let member = Member(fromJSON: memberData)
                else {
                    print("Could not parse data.")
                    return
            }
            
            let message = Message(
                member: member,
                text: text,
                messageId: UUID().uuidString)
            messageCallback(message)
        }
    
    func sendMessage(_ message: String) {
        room?.publish(message: message)
    }
    
}
