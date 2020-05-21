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
  private let rPublisher = PublishSubject<Void>()
  private let rsPublisher = PublishSubject<Void>()
  private let rfPublisher = PublishSubject<Void>()
  private let rcPublisher = PublishSubject<Void>()
  
  public override init() {
    super.init()
    SBDMain.add(self, identifier: NSStringFromClass(type(of: self)))
  }
  
  deinit {
    SBDMain.removeConnectionDelegate(forIdentifier: NSStringFromClass(type(of: self)))
  }
  
  public func reconnect() -> Observable<Void> {
    return self.rPublisher.asObservable()
  }
  
  public func didReconnect() -> Observable<Void> {
    return self.rsPublisher.asObservable()
  }
  
  public func didFailReconnect() -> Observable<Void> {
    return self.rfPublisher.asObservable()
  }
  
  public func cancelReconnect() -> Observable<Void> {
    return self.rcPublisher.asObservable()
  }
}

extension SBDRxConnectionEventListener : SBDConnectionDelegate {
  public func didStartReconnection() {
    self.rfPublisher.onNext(())
  }
  
  public func didSucceedReconnection() {
    self.rsPublisher.onNext(())
  }
  
  public func didFailReconnection() {
    self.rfPublisher.onNext(())
  }
  
  public func didCancelReconnection() {
    self.rcPublisher.onNext(())
  }
}
