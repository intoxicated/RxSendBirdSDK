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

public enum SBDRxChannelEventResult {
  case message(SBDBaseChannel, SBDBaseMessage)
  case messageDeleted(SBDBaseChannel, Int64)
  case channel(SBDBaseChannel)
  case channelDeleted(String, SBDChannelType)
  case user(SBDBaseChannel, SBDUser)
  case metaKey(SBDBaseChannel, [String]?)
  case metaData(SBDBaseChannel, [String: String]?)
  case metaCounter(SBDBaseChannel, [String: Int]?)
  case reaction(SBDBaseChannel, SBDReactionEvent)
  case invite(SBDBaseChannel, [SBDUser]?, SBDUser?)
  case decline(SBDBaseChannel, SBDUser, SBDUser?)
}

class SBDRxChannelEventListener: NSObject {
  private let mrPublisher = PublishSubject<SBDRxChannelEventResult>()
  private let muPublisher = PublishSubject<SBDRxChannelEventResult>()
  private let mmPublisher = PublishSubject<SBDRxChannelEventResult>()
  private let mdPublisher = PublishSubject<SBDRxChannelEventResult>()
  
  private let ccPublisher = PublishSubject<SBDRxChannelEventResult>()
  private let cfPublisher = PublishSubject<SBDRxChannelEventResult>()
  private let cufPublisher = PublishSubject<SBDRxChannelEventResult>()
  private let cuoPublisher = PublishSubject<SBDRxChannelEventResult>()
  private let chPublisher = PublishSubject<SBDRxChannelEventResult>()
  private let crrPublisher = PublishSubject<SBDRxChannelEventResult>()
  private let ctPublisher = PublishSubject<SBDRxChannelEventResult>()
  private let cdrPublisher = PublishSubject<SBDRxChannelEventResult>()
  private let cdPublisher = PublishSubject<SBDRxChannelEventResult>()
  
  private let ujPublisher = PublishSubject<SBDRxChannelEventResult>()
  private let ulPublisher = PublishSubject<SBDRxChannelEventResult>()
  private let uenPublisher = PublishSubject<SBDRxChannelEventResult>()
  private let uexPublisher = PublishSubject<SBDRxChannelEventResult>()
  private let umPublisher = PublishSubject<SBDRxChannelEventResult>()
  private let uumPublisher = PublishSubject<SBDRxChannelEventResult>()
  private let ubPublisher = PublishSubject<SBDRxChannelEventResult>()
  private let uubPublisher = PublishSubject<SBDRxChannelEventResult>()
  
  private let mdcPublisher = PublishSubject<SBDRxChannelEventResult>()
  private let mduPublisher = PublishSubject<SBDRxChannelEventResult>()
  private let mddPublisher = PublishSubject<SBDRxChannelEventResult>()
  private let mccPublisher = PublishSubject<SBDRxChannelEventResult>()
  private let mcuPublisher = PublishSubject<SBDRxChannelEventResult>()
  private let mcdPublisher = PublishSubject<SBDRxChannelEventResult>()
  
  private let ruPublisher = PublishSubject<SBDRxChannelEventResult>()
  private let uiPublisher = PublishSubject<SBDRxChannelEventResult>()
  private let uidPublisher = PublishSubject<SBDRxChannelEventResult>()
  
  override init() {
    super.init()
    SBDMain.add(self, identifier: NSStringFromClass(type(of: self)))
  }
  
  deinit {
    SBDMain.removeChannelDelegate(forIdentifier: NSStringFromClass(type(of: self)))
  }
  
  // MARK: Message
  public func receiveMessage() -> Observable<SBDRxChannelEventResult> {
    return self.mrPublisher.asObservable()
  }
  
  public func updateMessage() -> Observable<SBDRxChannelEventResult> {
    return self.muPublisher.asObservable()
  }
  
  public func receiveMention() -> Observable<SBDRxChannelEventResult> {
    return self.mmPublisher.asObservable()
  }
  
  public func deleteMessage() -> Observable<SBDRxChannelEventResult> {
    return self.mdPublisher.asObservable()
  }
  
  // MARK: Channel
  public func changeChannel() -> Observable<SBDRxChannelEventResult> {
    return self.ccPublisher.asObservable()
  }
  
  public func frozenChannel() -> Observable<SBDRxChannelEventResult> {
    return self.cfPublisher.asObservable()
  }
  
  public func unfrozenChannel() -> Observable<SBDRxChannelEventResult> {
    return self.cufPublisher.asObservable()
  }
  
  public func hiddenChannel() -> Observable<SBDRxChannelEventResult> {
    return self.chPublisher.asObservable()
  }
  
  public func updateOperators() -> Observable<SBDRxChannelEventResult> {
    return self.cuoPublisher.asObservable()
  }
  
  public func updateReadReceipt() -> Observable<SBDRxChannelEventResult> {
    return self.crrPublisher.asObservable()
  }
  
  public func updateTyping() -> Observable<SBDRxChannelEventResult> {
    return self.ctPublisher.asObservable()
  }
  
  public func deleteChannel() -> Observable<SBDRxChannelEventResult> {
    return self.cdPublisher.asObservable()
  }
  
  // MARK: User
  public func joinUser() -> Observable<SBDRxChannelEventResult> {
    return self.ujPublisher.asObservable()
  }
  
  public func leaveUser() -> Observable<SBDRxChannelEventResult> {
    return self.ulPublisher.asObservable()
  }
  
  public func enterUser() -> Observable<SBDRxChannelEventResult> {
    return self.uenPublisher.asObservable()
  }
  
  public func exitUser() -> Observable<SBDRxChannelEventResult> {
    return self.uexPublisher.asObservable()
  }
  
  public func muteUser() -> Observable<SBDRxChannelEventResult> {
    return self.umPublisher.asObservable()
  }
  
  public func ummuteUser() -> Observable<SBDRxChannelEventResult> {
    return self.uumPublisher.asObservable()
  }
  
  public func banUser() -> Observable<SBDRxChannelEventResult> {
    return self.ubPublisher.asObservable()
  }
  
  public func unbanUser() -> Observable<SBDRxChannelEventResult> {
    return self.uubPublisher.asObservable()
  }
  
  // MARK: Meta
  public func createMetaData() -> Observable<SBDRxChannelEventResult> {
    return self.mdcPublisher.asObservable()
  }
  
  public func upateMetaData() -> Observable<SBDRxChannelEventResult> {
    return self.mduPublisher.asObservable()
  }
  
  public func deleteMetaData() -> Observable<SBDRxChannelEventResult> {
    return self.mddPublisher.asObservable()
  }
  
  public func createMetaCounter() -> Observable<SBDRxChannelEventResult> {
    return self.mccPublisher.asObservable()
  }
  
  public func updateMetaCounter() -> Observable<SBDRxChannelEventResult> {
    return self.mcuPublisher.asObservable()
  }
  
  public func deleteMetaCounter() -> Observable<SBDRxChannelEventResult> {
    return self.mcdPublisher.asObservable()
  }
  
  // MARK: Reaction
  public func updateReaction() -> Observable<SBDRxChannelEventResult> {
    return self.ruPublisher.asObservable()
  }
  
  // MARK: Invitation
  public func receiveInvitation() -> Observable<SBDRxChannelEventResult> {
    return self.uiPublisher.asObservable()
  }
  
  public func declineInvitation() -> Observable<SBDRxChannelEventResult> {
    return self.uidPublisher.asObservable()
  }
}

extension SBDRxChannelEventListener : SBDChannelDelegate {
  func channel(_ sender: SBDBaseChannel, didReceive message: SBDBaseMessage) {
    self.mrPublisher.onNext(.message(sender, message))
  }
  
  func channel(_ sender: SBDBaseChannel, didUpdate message: SBDBaseMessage) {
    self.muPublisher.onNext(.message(sender, message))
  }
  
  func channel(_ channel: SBDBaseChannel, didReceiveMention message: SBDBaseMessage) {
    self.mmPublisher.onNext(.message(channel, message))
  }
  
  func channel(_ sender: SBDBaseChannel, messageWasDeleted messageId: Int64) {
    self.mdPublisher.onNext(.messageDeleted(sender, messageId))
  }

  func channelWasChanged(_ sender: SBDBaseChannel) {
    self.ccPublisher.onNext(.channel(sender))
  }
  
  func channelWasFrozen(_ sender: SBDBaseChannel) {
    self.cfPublisher.onNext(.channel(sender))
  }
  
  func channelWasHidden(_ sender: SBDGroupChannel) {
    self.chPublisher.onNext(.channel(sender))
  }
  
  func channelWasUnfrozen(_ sender: SBDBaseChannel) {
    self.cufPublisher.onNext(.channel(sender))
  }
  
  func channelDidUpdateOperators(_ sender: SBDBaseChannel) {
    self.cuoPublisher.onNext(.channel(sender))
  }
  
  func channelDidUpdateReadReceipt(_ sender: SBDGroupChannel) {
    self.crrPublisher.onNext(.channel(sender))
  }
  
  func channelDidUpdateTypingStatus(_ sender: SBDGroupChannel) {
    self.ctPublisher.onNext(.channel(sender))
  }
  
  func channelDidUpdateDeliveryReceipt(_ sender: SBDGroupChannel) {
    self.cdrPublisher.onNext(.channel(sender))
  }
  
  func channelWasDeleted(_ channelUrl: String, channelType: SBDChannelType) {
    self.cdPublisher.onNext(.channelDeleted(channelUrl, channelType))
  }

  func channel(_ sender: SBDGroupChannel, userDidJoin user: SBDUser) {
    self.ujPublisher.onNext(.user(sender, user))
  }
  
  func channel(_ sender: SBDGroupChannel, userDidLeave user: SBDUser) {
    self.ulPublisher.onNext(.user(sender, user))
  }
  
  func channel(_ sender: SBDOpenChannel, userDidEnter user: SBDUser) {
    self.uenPublisher.onNext(.user(sender, user))
  }
  
  func channel(_ sender: SBDOpenChannel, userDidExit user: SBDUser) {
    self.uexPublisher.onNext(.user(sender, user))
  }
  
  func channel(_ sender: SBDBaseChannel, userWasMuted user: SBDUser) {
    self.umPublisher.onNext(.user(sender, user))
  }
  
  func channel(_ sender: SBDBaseChannel, userWasUnmuted user: SBDUser) {
    self.uumPublisher.onNext(.user(sender, user))
  }
  
  func channel(_ sender: SBDBaseChannel, userWasBanned user: SBDUser) {
    self.ubPublisher.onNext(.user(sender, user))
  }
  
  func channel(_ sender: SBDBaseChannel, userWasUnbanned user: SBDUser) {
    self.uubPublisher.onNext(.user(sender, user))
  }
  
  func channel(_ sender: SBDBaseChannel, createdMetaData: [String : String]?) {
    self.mdcPublisher.onNext(.metaData(sender, createdMetaData))
  }
  
  func channel(_ sender: SBDBaseChannel, deletedMetaDataKeys: [String]?) {
    self.mddPublisher.onNext(.metaKey(sender, deletedMetaDataKeys))
  }
  
  func channel(_ sender: SBDBaseChannel, deletedMetaCountersKeys: [String]?) {
    self.mcdPublisher.onNext(.metaKey(sender, deletedMetaCountersKeys))
  }
  
  func channel(_ sender: SBDBaseChannel, updatedMetaData: [String : String]?) {
    self.mduPublisher.onNext(.metaData(sender, updatedMetaData))
  }
  
  func channel(_ sender: SBDBaseChannel, createdMetaCounters: [String : NSNumber]?) {
    let numbers = createdMetaCounters?.mapValues { $0.intValue }
    self.mccPublisher.onNext(.metaCounter(sender, numbers))
  }
  
  func channel(_ sender: SBDBaseChannel, updatedMetaCounters: [String : NSNumber]?) {
    let numbers = updatedMetaCounters?.mapValues { $0.intValue }
    self.mcuPublisher.onNext(.metaCounter(sender, numbers))
  }
  
  func channel(_ sender: SBDBaseChannel, updatedReaction reactionEvent: SBDReactionEvent) {
    self.ruPublisher.onNext(.reaction(sender, reactionEvent))
  }
  
  func channel(_ sender: SBDGroupChannel, didDeclineInvitation invitee: SBDUser, inviter: SBDUser?) {
    self.uidPublisher.onNext(.decline(sender, invitee, inviter))
  }
  
  func channel(_ sender: SBDGroupChannel, didReceiveInvitation invitees: [SBDUser]?, inviter: SBDUser?) {
    self.uiPublisher.onNext(.invite(sender, invitees, inviter))
  }
}
