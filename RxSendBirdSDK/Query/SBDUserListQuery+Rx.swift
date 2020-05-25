//
//  SBDUserListQuery+Rx.swift
//  RxSendBirdSDK
//
//  Created by Wooyoung Chung on 5/20/20.
//  Copyright © 2020 SendBird. All rights reserved.
//

import Foundation
import RxSwift
import SendBirdSDK

extension Reactive where Base : SBDUserListQuery {
  public func load() -> Observable<[SBDUser]?> {
    return Observable.create { observer in
      self.base.loadNextPage { users, error in
        if let error = error {
          observer.onError(error)
        } else {
          observer.onNext(users)
          observer.onCompleted()
        }
      }
      return Disposables.create()
    }
  }
}

extension Reactive where Base : SBDApplicationUserListQuery {
  public func load() -> Observable<[SBDUser]?> {
    return Observable.create { observer in
      self.base.loadNextPage { users, error in
        if let error = error {
          observer.onError(error)
        } else {
          observer.onNext(users)
          observer.onCompleted()
        }
      }
      return Disposables.create()
    }
  }
}

extension Reactive where Base : SBDBlockedUserListQuery {
  public func load() -> Observable<[SBDUser]?> {
    return Observable.create { observer in
      self.base.loadNextPage { users, error in
        if let error = error {
          observer.onError(error)
        } else {
          observer.onNext(users)
          observer.onCompleted()
        }
      }
      return Disposables.create()
    }
  }
}

extension Reactive where Base : SBDBannedUserListQuery {
  public func load() -> Observable<[SBDUser]?> {
    return Observable.create { observer in
      self.base.loadNextPage { users, error in
        if let error = error {
          observer.onError(error)
        } else {
          observer.onNext(users)
          observer.onCompleted()
        }
      }
      return Disposables.create()
    }
  }
}

extension Reactive where Base : SBDMutedUserListQuery {
  public func load() -> Observable<[SBDUser]?> {
    return Observable.create { observer in
      self.base.loadNextPage { users, error in
        if let error = error {
          observer.onError(error)
        } else {
          observer.onNext(users)
          observer.onCompleted()
        }
      }
      return Disposables.create()
    }
  }
}

extension Reactive where Base : SBDOperatorListQuery {
  public func load() -> Observable<[SBDUser]?> {
    return Observable.create { observer in
      self.base.loadNextPage { users, error in
        if let error = error {
          observer.onError(error)
        } else {
          observer.onNext(users)
          observer.onCompleted()
        }
      }
      return Disposables.create()
    }
  }
}

extension Reactive where Base : SBDGroupChannelMemberListQuery {
  public func load() -> Observable<[SBDMember]?> {
    return Observable.create { observer in
      self.base.loadNextPage { members, error in
        if let error = error {
          observer.onError(error)
        } else {
          observer.onNext(members)
          observer.onCompleted()
        }
      }
      return Disposables.create()
    }
  }
}
