//
//  SBDGroupChannel+Rx.swift
//  RxSendBirdSDK
//
//  Created by Wooyoung Chung on 5/20/20.
//  Copyright © 2020 SendBird. All rights reserved.
//

import Foundation
import RxSwift
import SendBirdSDK

public extension Reactive where Base : SBDGroupChannel {
  // MARK: CRUD
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
  
  static func get(with channelUrl: String) -> Observable<SBDGroupChannel?> {
    return Observable.create { observer in
      SBDGroupChannel.getWithUrl(channelUrl) { channel, error in
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
    with params: SBDGroupChannelParams) -> Observable<SBDGroupChannel?> {
    return Observable.create { observer in
      SBDGroupChannel.createChannel(with: params) { channel, error in
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
  
  func update(
    with params: SBDGroupChannelParams) -> Observable<SBDGroupChannel?> {
    return Observable.create { observer in
      self.base.update(with: params) { channel, error in
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
  
  // MARK: Actions
  
  func invite(userIds: [String]) -> Observable<Void> {
    return Observable.create { observer in
      self.base.inviteUserIds(userIds) { error in
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
  
  func join(with accessCode: String? = nil) -> Observable<Void> {
    return Observable.create { observer in
      if let code = accessCode {
        self.base.join(withAccessCode: code) { error in
          if let error = error {
            observer.onError(error)
          } else {
            observer.onNext(())
            observer.onCompleted()
          }
        }
      } else {
        self.base.join { error in
          if let error = error {
            observer.onError(error)
          } else {
            observer.onNext(())
            observer.onCompleted()
          }
        }
      }
      return Disposables.create()
    }
  }
  
  func leave() -> Observable<Void> {
    return Observable.create { observer in
      self.base.leave { error in
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
  
  func acceptInvitation(with accessCode: String? = nil) -> Observable<Void> {
    return Observable.create { observer in
      if let code = accessCode {
        self.base.acceptInvitation(withAccessCode: code) { error in
          if let error = error {
            observer.onError(error)
          } else {
            observer.onNext(())
            observer.onCompleted()
          }
        }
      } else {
        self.base.acceptInvitation() { error in
          if let error = error {
            observer.onError(error)
          } else {
            observer.onNext(())
            observer.onCompleted()
          }
        }
      }
      return Disposables.create()
    }
  }
  
  func declineInvitation() -> Observable<Void> {
    return Observable.create { observer in
      self.base.declineInvitation { error in
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
  
  func resetMyHistory() -> Observable<Void> {
    return Observable.create { observer in
      self.base.resetMyHistory { error in
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
  
  func hide(
    with hidePreviousMessage: Bool,
    allowAutoUnhide: Bool) -> Observable<Void> {
    return Observable.create { observer in
      self.base.hide(withHidePreviousMessages: hidePreviousMessage) { error in
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
  
  func unhide() -> Observable<Void> {
    return Observable.create { observer in
      self.base.unhideChannel { error in
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

  // MARK: Configuration
  
  func setPushTriggerOption(
    with option: SBDGroupChannelPushTriggerOption) -> Observable<Void> {
    return Observable.create { observer in
      self.base.setMyPushTriggerOption(option) { error in
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
  
  func getPushTriggerOption() -> Observable<SBDGroupChannelPushTriggerOption> {
    return Observable.create { observer in
      self.base.getMyPushTriggerOption { option, error in
        if let error = error {
          observer.onError(error)
        } else {
          observer.onNext(option)
          observer.onCompleted()
        }
      }
      return Disposables.create()
    }
  }
  
  // MARK: Misc
  
  func setMyCountPreference(
    preference: SBDCountPreference) -> Observable<Void> {
    return Observable.create { observer in
      self.base.setMyCountPreference(preference) { error in
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
  
  func registerScheduleUserMessage(
    with params: SBDScheduledUserMessageParams) -> Observable<SBDScheduledUserMessage?> {
    return Observable.create { observer in
      self.base.registerScheduledUserMessage(with: params) { message, error in
        if let error = error {
          observer.onError(error)
        } else {
          observer.onNext(message)
          observer.onCompleted()
        }
      }
      return Disposables.create()
    }
  }
  
  func notifyScreenshotWasTaken() -> Observable<Void> {
    return Observable.create { observer in
      self.base.notifyScreenshotWasTaken { error in
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
