//
//  SBDGroupChannelListQuery+Rx.swift
//  RxSendBirdSDK
//
//  Created by Wooyoung Chung on 5/20/20.
//  Copyright © 2020 SendBird. All rights reserved.
//

import Foundation
import RxSwift
import SendBirdSDK

extension Reactive where Base : SBDGroupChannelListQuery {
  public func load() -> Observable<[SBDGroupChannel]?> {
    return Observable.create { observer in
      self.base.loadNextPage { channels, error in
        if let error = error {
          observer.onError(error)
        } else {
          observer.onNext(channels)
          observer.onCompleted()
        }
      }
      return Disposables.create()
    }
  }
}

extension Reactive where Base : SBDPublicGroupChannelListQuery {
  public func load() -> Observable<[SBDGroupChannel]?> {
    return Observable.create { observer in
      self.base.loadNextPage { channels, error in
        if let error = error {
          observer.onError(error)
        } else {
          observer.onNext(channels)
          observer.onCompleted()
        }
      }
      return Disposables.create()
    }
  }
}

extension Reactive where Base : SBDOpenChannelListQuery {
  public func load() -> Observable<[SBDOpenChannel]?> {
    return Observable.create { observer in
      self.base.loadNextPage { channels, error in
        if let error = error {
          observer.onError(error)
        } else {
          observer.onNext(channels)
          observer.onCompleted()
        }
      }
      return Disposables.create()
    }
  }
}
