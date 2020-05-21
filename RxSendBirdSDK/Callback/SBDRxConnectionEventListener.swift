//
//  SBDConnectionDelegate+Rx.swift
//  RxSendBirdSDK
//
//  Created by Wooyoung Chung on 5/20/20.
//  Copyright © 2020 SendBird. All rights reserved.
//

import RxSwift
import SendBirdSDK

public class SBDRxConnectionEventListener : NSObject {
  private let rPublisher = PublishSubject<Any?>()
  private let rsPublisher = PublishSubject<Any?>()
  private let rfPublisher = PublishSubject<Any?>()
  private let rcPublisher = PublishSubject<Any?>()
  
  public override init() {
    super.init()
    SBDMain.add(self, identifier: NSStringFromClass(type(of: self)))
  }
  
  deinit {
    SBDMain.removeConnectionDelegate(forIdentifier: NSStringFromClass(type(of: self)))
  }
  
  public func reconnect() -> Observable<Any?> {
    return self.rPublisher.asObservable()
  }
  
  public func didReconnect() -> Observable<Any?> {
    return self.rsPublisher.asObservable()
  }
  
  public func didFailReconnect() -> Observable<Any?> {
    return self.rfPublisher.asObservable()
  }
  
  public func cancelReconnect() -> Observable<Any?> {
    return self.rcPublisher.asObservable()
  }
}

extension SBDRxConnectionEventListener : SBDConnectionDelegate {
  public func didStartReconnection() {
    self.rfPublisher.onNext(nil)
  }
  
  public func didSucceedReconnection() {
    self.rsPublisher.onNext(nil)
  }
  
  public func didFailReconnection() {
    self.rfPublisher.onNext(nil)
  }
  
  public func didCancelReconnection() {
    self.rcPublisher.onNext(nil)
  }
}
