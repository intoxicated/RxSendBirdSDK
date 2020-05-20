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
  /**
   *
   */
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
  
  /**
   *
   */
  public static func disconnect() -> Observable<Any?> {
    return Observable.create { observer in
      SBDMain.disconnect {
        observer.onNext(nil)
        observer.onCompleted()
      }
      return Disposables.create()
    }
  }
  
  /**
   *
   */
  public static func updateUserInfo(
    with nickName: String,
    profileUrl: String? = nil) -> Observable<Any?> {
    return Observable.create { observer in
      SBDMain.updateCurrentUserInfo(
        withNickname: nickName,
        profileUrl: profileUrl) { (error) in
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
  
  /**
   *
   */
  public static func updateUserInfo(
    with nickname: String,
    profileImage: Data?) -> Observable<Any?> {
    return Observable.create { observer in
      SBDMain.updateCurrentUserInfo(
        withNickname: nickname,
        profileImage: profileImage) { (error) in
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
  
  /**
   *
   */
  public static func updateUserInfo(
    with nickname: String,
    profilePath: String? = nil) -> Observable<Float> {
    return Observable.create { observer in
      SBDMain.updateCurrentUserInfo(
        withNickname: nickname,
        profileImageFilePath: profilePath,
        progressHandler: { (sent, total, expect) in
        observer.onNext(Float(total)/Float(expect))
        if total == expect {
          observer.onCompleted()
        }
      }) { (error) in
        if let error = error {
          observer.onError(error)
        }
      }
      return Disposables.create()
    }
  }
}
