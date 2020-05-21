//
//  SBDMainChannel+Rx.swift
//  RxSendBirdSDK
//
//  Created by Wooyoung Chung on 5/20/20.
//  Copyright © 2020 SendBird. All rights reserved.
//

import RxSwift
import SendBirdSDK
import Foundation

extension Reactive where Base : SBDMain {
  public static func markAsReadAll() -> Observable<Any?> {
    return Observable.create { observer in
      SBDMain.markAsReadAll { (error) in
        if let error = error {
          observer.onError(error)
        } else {
          observer.onNext(nil)
          observer.onCompleted()
        }
      }
      return Disposables.create()
    }
  }
  
  public static func markAsRead(with channelUrls: [String]) -> Observable<Any?> {
    return Observable.create { observer in
      SBDMain.markAsRead(withChannelUrls: channelUrls) { (error) in
        if let error = error {
          observer.onError(error)
        } else {
          observer.onNext(nil)
          observer.onCompleted()
        }
      }
      return Disposables.create()
    }
  }
  
//  public static func getMyGroupChannelChangeLogs(token: String?, params: SBDChannelChangeLogsParams) -> Observable<SBDChannelChangeLogsResult> {
//    return Observable.create { observer in
//      SBDMain.getMyGroupChannelChangeLogs(byToken: token, params: params) { channels, deleted, hasMore, token, error in
//        if let error = error {
//          observer.onError(error)
//        } else {
//          observer.onNext((channels, deleted, hasMore, token))
//          observer.onCompleted()
//        }
//      }
//      return Disposables.create()
//    }
//  }
  
//  public static func getMyGroupChannelChangeLogs(timestamp: Int64, params: SBDChannelChangeLogsParams) -> Observable<SBDChannelChangeLogsResult> {
//    return Observable.create { observer in
//      SBDMain.getMyGroupChannelChangeLogs(byTimestamp: timestamp, params: params) { channels, deleted, hasMore, token, error in
//        if let error = error {
//          observer.onError(error)
//        } else {
//          observer.onNext((channels, deleted, hasMore, token))
//          observer.onCompleted()
//        }
//      }
//      return Disposables.create()
//    }
//  }
  
}
