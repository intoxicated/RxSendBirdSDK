//
//  SBDMain+Rx.swift
//  RxSendBirdSDK
//
//  Created by Wooyoung Chung on 5/20/20.
//  Copyright © 2020 SendBird. All rights reserved.
//

import RxSwift
import SendBirdSDK
import Foundation

extension Reactive where Base : SBDMain {
  public static func connect(
    with userId: String,
    accessToken: String? = nil,
    apiHost: String? = nil,
    wsHost: String? = nil) -> Observable<SBDUser?> {
    return Observable.create { observer in
      SBDMain.connect(
        withUserId: userId,
        accessToken: accessToken,
        apiHost: apiHost,
        wsHost: wsHost) { (user, error) in
        if let error = error {
          observer.onError(error)
        } else {
          observer.onNext(user)
          observer.onCompleted()
        }
      }

      return Disposables.create()
    }
  }

  public static func disconnect() -> Observable<Any?> {
    return Observable.create { observer in
      SBDMain.disconnect {
        observer.onNext(nil)
        observer.onCompleted()
      }
      return Disposables.create()
    }
  }
  
  public static func reconnect() -> Observable<Bool> {
    return Observable.create { observer in
      if (!SBDMain.reconnect()) {
        observer.onNext(false)
        observer.onCompleted()
        return Disposables.create()
      }
      
      let rl = SBDRxConnectionEventListener()
      let signal = rl.didReconnect()
        .take(1)
        .subscribe(onNext: { _ in
          observer.onNext(true)
          observer.onCompleted()
        })
      
      return Disposables.create {
        signal.dispose()
      }
    }
  }
  
  // MARK: Emoji
  public static func getAllEmojis() -> Observable<SBDEmojiContainer?> {
    return Observable.create { observer in
      SBDMain.getAllEmojis { (container, error) in
        if let error = error {
          observer.onError(error)
        } else {
          observer.onNext(container)
          observer.onCompleted()
        }
      }
      return Disposables.create()
    }
  }
  
  public static func getEmoji(with key: String) -> Observable<SBDEmoji?> {
    return Observable.create { observer in
      SBDMain.getEmoji(key) { (emoji, error) in
        if let error = error {
          observer.onError(error)
        } else {
          observer.onNext(emoji)
          observer.onCompleted()
        }
      }
      return Disposables.create()
    }
  }
  
  public static func getEmojiCategory(with id: Int64) -> Observable<SBDEmojiCategory?> {
    return Observable.create { observer in
      SBDMain.getEmojiCategory(id) { (category, error) in
        if let error = error {
          observer.onError(error)
        } else {
          observer.onNext(category)
          observer.onCompleted()
        }
      }
      return Disposables.create()
    }
  }
}
