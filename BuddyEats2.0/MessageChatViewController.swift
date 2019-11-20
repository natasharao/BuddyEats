//
//  MessageChatViewController.swift
//  BuddyEats2.0
//
//  Created by Natasha Rao on 9/14/19.
//  Copyright © 2019 Natasha Rao. All rights reserved.
//

import UIKit
import MessageKit
//import MessageInputBar

class MessageChatViewController: MessagesViewController, MessagesDataSource, MessagesLayoutDelegate, MessagesDisplayDelegate, MessageInputBarDelegate {
    var chatService: ChatService!
    var messages: [Message] = []
    var member: Member!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        member = Member(name: .randomName, color: .random)
        messagesCollectionView.messagesDataSource = self
        messagesCollectionView.messagesLayoutDelegate = self
        messageInputBar.delegate = self
        messagesCollectionView.messagesDisplayDelegate = self
        // Do any additional setup after loading the view.
        chatService = ChatService(member: member!, onRecievedMessage: {
            [weak self] message in
            self?.messages.append(message)
            self?.messagesCollectionView.reloadData()
            self?.messagesCollectionView.scrollToBottom(animated: true)
        })
        
        chatService.connect()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
        func numberOfSections(
            in messagesCollectionView: MessagesCollectionView) -> Int {
            return messages.count
        }

    func currentSender() -> SenderType {
        return Sender(id: member?.name ?? "", displayName: member?.name ?? "")
    }

//        func currentSender() -> Sender {
//            return Sender(id: member?.name ?? "", displayName: member?.name ?? "")
//        }

        func messageForItem(
            at indexPath: IndexPath,
            in messagesCollectionView: MessagesCollectionView) -> MessageType {

            return messages[indexPath.section]
        }

        func messageTopLabelHeight(
            for message: MessageType,
            at indexPath: IndexPath,
            in messagesCollectionView: MessagesCollectionView) -> CGFloat {

            return 12
        }

        func messageTopLabelAttributedText(
            for message: MessageType,
            at indexPath: IndexPath) -> NSAttributedString? {

            return NSAttributedString(
                string: message.sender.displayName,
                attributes: [.font: UIFont.systemFont(ofSize: 12)])
        }

    func heightForLocation(message: MessageType,
                           at indexPath: IndexPath,
                           with maxWidth: CGFloat,
                           in messagesCollectionView: MessagesCollectionView) -> CGFloat {

        return 0
    }
//
    func configureAvatarView(
        _ avatarView: AvatarView,
        for message: MessageType,
        at indexPath: IndexPath,
        in messagesCollectionView: MessagesCollectionView) {

        let message = messages[indexPath.section]
        let color = message.member.color
        avatarView.backgroundColor = color
    }
//    func currentSender() -> SenderType {
//        return Sender(id: member!.name, displayName: member!.name)
//    }
//
    func messageForItem(at indexPath: IndexPath!, in messagesCollectionView: MessagesCollectionView) -> MessageType {
        return messages[indexPath.section]
    }

//    func numberOfSections(in messagesCollectionView: MessagesCollectionView) -> Int {
//
//        print("in here")
//        return messages.count
//    }
    

    func inputBar(
        _ inputBar: MessageInputBar,
        didPressSendButtonWith text: String) {

        print("finished appending messsage")
        let newMessage = Message(member: member!,
            text: text,
            messageId: UUID().uuidString)

        inputBar.inputTextView.text = ""
        chatService.sendMessage(text)
        messages.append(newMessage)
        inputBar.inputTextView.text = ""
        messagesCollectionView.reloadData()
        messagesCollectionView.scrollToBottom(animated: true)

    }
    
    
}
