//
//  SBDChannelDelegate+Rx.swift
//  RxSendBirdSDK
//
//  Created by Wooyoung Chung on 5/20/20.
//  Copyright © 2020 SendBird. All rights reserved.
//

import Foundation
import RxSwift
import SendBirdSDK

public enum RxSBDChannelCallbackResult {
  case message(SBDBaseChannel, SBDBaseMessage)
  case messageId(SBDBaseChannel, Int64)
  case channel(SBDBaseChannel)
  case channelDeleted(String, SBDChannelType)
  case user(SBDBaseChannel, SBDUser)
  case metaKey(SBDBaseChannel, [String]?)
  case metaData(SBDBaseChannel, [String: String]?)
  case metaCounter(SBDBaseChannel, [String: Int]?)
}

class RxSBDChannelCallback: NSObject {
  private let messagePublisher = PublishSubject<RxSBDChannelCallbackResult>()
  private let channelPublisher = PublishSubject<RxSBDChannelCallbackResult>()
  private let userPublisher = PublishSubject<RxSBDChannelCallbackResult>()
  
  override init() {
    super.init()
    SBDMain.add(self, identifier: "RxChannelCallback")
  }
  
  deinit {
    SBDMain.removeChannelDelegate(forIdentifier: "RxChannelCallback")
  }
  
  public func receiveMessage() -> Observable<RxSBDChannelCallbackResult> {
    return self.messagePublisher.asObservable()
  }
  
  public func updateMessage() -> Observable<RxSBDChannelCallbackResult> {
    return self.messagePublisher.asObservable()
  }
}

extension RxSBDChannelCallback: SBDChannelDelegate {
  // MARK: Message
  func channel(_ sender: SBDBaseChannel, didReceive message: SBDBaseMessage) {
    self.messagePublisher.onNext(.message(sender, message))
  }
  
  func channel(_ sender: SBDBaseChannel, didUpdate message: SBDBaseMessage) {
    self.messagePublisher.onNext(.message(sender, message))
  }
  
  func channel(_ channel: SBDBaseChannel, didReceiveMention message: SBDBaseMessage) {
    self.messagePublisher.onNext(.message(channel, message))
  }
  
  func channel(_ sender: SBDBaseChannel, messageWasDeleted messageId: Int64) {
    self.messagePublisher.onNext(.messageId(sender, messageId))
  }
  
  // MARK: Channel
  func channelWasChanged(_ sender: SBDBaseChannel) {
    self.channelPublisher.onNext(.channel(sender))
  }
  
  func channelWasFrozen(_ sender: SBDBaseChannel) {
    self.channelPublisher.onNext(.channel(sender))
  }
  
  func channelWasHidden(_ sender: SBDGroupChannel) {
    self.channelPublisher.onNext(.channel(sender))
  }
  
  func channelWasUnfrozen(_ sender: SBDBaseChannel) {
    self.channelPublisher.onNext(.channel(sender))
  }
  
  func channelDidUpdateOperators(_ sender: SBDBaseChannel) {
    self.channelPublisher.onNext(.channel(sender))
  }
  
  func channelDidUpdateReadReceipt(_ sender: SBDGroupChannel) {
    self.channelPublisher.onNext(.channel(sender))
  }
  
  func channelDidUpdateTypingStatus(_ sender: SBDGroupChannel) {
    self.channelPublisher.onNext(.channel(sender))
  }
  
  func channelDidUpdateDeliveryReceipt(_ sender: SBDGroupChannel) {
    self.channelPublisher.onNext(.channel(sender))
  }
  
  func channelWasDeleted(_ channelUrl: String, channelType: SBDChannelType) {
    
  }
  
  // MARK: User
  func channel(_ sender: SBDGroupChannel, userDidJoin user: SBDUser) {
    
  }
  
  func channel(_ sender: SBDGroupChannel, userDidLeave user: SBDUser) {
    
  }
  
  func channel(_ sender: SBDOpenChannel, userDidEnter user: SBDUser) {
    
  }
  
  func channel(_ sender: SBDOpenChannel, userDidExit user: SBDUser) {
    
  }
  
  func channel(_ sender: SBDBaseChannel, userWasMuted user: SBDUser) {
    
  }
  
  func channel(_ sender: SBDBaseChannel, userWasUnmuted user: SBDUser) {
    
  }
  
  func channel(_ sender: SBDBaseChannel, userWasBanned user: SBDUser) {
    
  }
  
  func channel(_ sender: SBDBaseChannel, userWasUnbanned user: SBDUser) {
    
  }
  
  // MARK: Meta
  func channel(_ sender: SBDBaseChannel, createdMetaData: [String : String]?) {
    
  }
  
  func channel(_ sender: SBDBaseChannel, deletedMetaDataKeys: [String]?) {
    
  }
  
  func channel(_ sender: SBDBaseChannel, deletedMetaCountersKeys: [String]?) {
    
  }
  
  func channel(_ sender: SBDBaseChannel, updatedMetaData: [String : String]?) {
    
  }
  
  func channel(_ sender: SBDBaseChannel, createdMetaCounters: [String : NSNumber]?) {
    
  }
  
  func channel(_ sender: SBDBaseChannel, updatedMetaCounters: [String : NSNumber]?) {
    
  }
  
  // MARK: Reaction
  func channel(_ sender: SBDBaseChannel, updatedReaction reactionEvent: SBDReactionEvent) {
    
  }
  
  // MARK: Invitation
  func channel(_ sender: SBDGroupChannel, didDeclineInvitation invitee: SBDUser, inviter: SBDUser?) {
    
  }
  
  func channel(_ sender: SBDGroupChannel, didReceiveInvitation invitees: [SBDUser]?, inviter: SBDUser?) {
    
  }
}
