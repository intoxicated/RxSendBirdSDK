//
//  SBDOpenChannel+Rx.swift
//  RxSendBirdSDK
//
//  Created by Wooyoung Chung on 5/20/20.
//  Copyright © 2020 SendBird. All rights reserved.
//

import Foundation
import RxSwift
import SendBirdSDK

public extension Reactive where Base : SBDOpenChannel {
  //MARK: CRUD
  func refresh() -> Observable<Void> {
    return Observable.create { observer in
      self.base.refresh { error in
        if let error = error {
          observer.onError(error)
        } else {
          observer.onNext(())
          observer.onCompleted()
        }
      }
      return Disposables.create()
    }
  }
  
  static func get(with channelId: String) -> Observable<SBDOpenChannel?> {
    return Observable.create { observer in
      SBDOpenChannel.getWithUrl(channelId) { channel, error in
        if let error = error {
          observer.onError(error)
        } else {
          observer.onNext(channel)
          observer.onCompleted()
        }
      }
      return Disposables.create()
    }
  }
  
  static func create() -> Observable<SBDOpenChannel?> {
    return Observable.create { observer in
      SBDOpenChannel.createChannel { channel, error in
        if let error = error {
          observer.onError(error)
        } else {
          observer.onNext(channel)
          observer.onCompleted()
        }
      }
      return Disposables.create()
    }
  }
  
  static func create(
    with params: RxSBDOpenChannelParams) -> Observable<(SBDOpenChannel?, Float)> {
    guard
      let imageData = params.coverImage,
      let imageName = params.coverImageName else {
        let error = SBDError(
          domain: "Image name and data has to be provided",
          code: SBDErrorCode.invalidParameter.rawValue,
          userInfo: nil
        )
        return .error(error)
    }
    
    return Observable.create { observer in
      SBDOpenChannel.createChannel(
        withName: params.name,
        channelUrl: params.channelUrl,
        coverImage: imageData,
        coverImageName: imageName,
        data: params.data,
        operatorUserIds: params.operatorUserIds,
        customType: params.customType,
        progressHandler: { (sent, total, expect) in
          observer.onNext((nil, Float(total)/Float(expect)))
        }
      ) { channel, error in
        if let error = error {
          observer.onError(error)
        } else {
          observer.onNext((channel, 1))
          observer.onCompleted()
        }
      }
      return Disposables.create()
    }
  }
  
  func update(
    with params: RxSBDOpenChannelParams) -> Observable<(SBDOpenChannel?, Float)> {
    return Observable.create { observer in
      self.base.update(
        withName: params.name,
        coverImage: params.coverImage,
        coverImageName: params.coverImageName,
        data: params.data,
        operatorUserIds: params.operatorUserIds,
        customType: params.customType,
        progressHandler: { (sent, total, expect) in
          observer.onNext((nil, Float(total)/Float(expect)))
        }
      ) { channel, error in
        if let error = error {
          observer.onError(error)
        } else {
          observer.onNext((channel, 1))
          observer.onCompleted()
        }
      }
      return Disposables.create()
    }
  }
  
  func delete() -> Observable<Void> {
    return Observable.create { observer in
      self.base.delete { error in
        if let error = error {
          observer.onError(error)
        } else {
          observer.onNext(())
          observer.onCompleted()
        }
      }
      return Disposables.create()
    }
  }
  
  // MARK: Actions
  
  func enter() -> Observable<Void> {
    return Observable.create { observer in
      self.base.enter { error in
        if let error = error {
          observer.onError(error)
        } else {
          observer.onNext(())
          observer.onCompleted()
        }
      }
      return Disposables.create()
    }
  }
  
  func exit() -> Observable<Void> {
    return Observable.create { observer in
      self.base.exitChannel { error in
        if let error = error {
          observer.onError(error)
        } else {
          observer.onNext(())
          observer.onCompleted()
        }
      }
      return Disposables.create()
    }
  }
}
