//
//  SBDMessageListQuery+Rx.swift
//  RxSendBirdSDK
//
//  Created by Wooyoung Chung on 5/20/20.
//  Copyright © 2020 SendBird. All rights reserved.
//

import Foundation
import RxSwift
import SendBirdSDK

extension Reactive where Base : SBDPreviousMessageListQuery {
  public func load() -> Observable<[SBDBaseMessage]?> {
    return Observable.create { observer in
      self.base.load { messages, error in
        if let error = error {
          observer.onError(error)
        } else {
          observer.onNext(messages)
          observer.onCompleted()
        }
      }
      return Disposables.create()
    }
  }
}
