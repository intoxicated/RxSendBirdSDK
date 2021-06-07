//
//  SBDMainPush+Rx.swift
//  RxSendBirdSDK
//
//  Created by Wooyoung Chung on 5/20/20.
//  Copyright © 2020 SendBird. All rights reserved.
//

import RxSwift
import SendBirdSDK
import Foundation

extension Reactive where Base : SBDMain {
  public static func registerPush(
    with deviceToken: Data, isUnique: Bool) -> Observable<SBDPushTokenRegistrationStatus> {
    return Observable.create { observer in
      SBDMain.registerDevicePushToken(deviceToken, unique: isUnique) { (status, error) in
        if let error = error {
          observer.onError(error)
        } else {
          observer.onNext(status)
          observer.onCompleted()
        }
      }
      return Disposables.create()
    }
  }
  
  public static func unregisterPush(with deviceToken: Data) -> Observable<[AnyHashable:Any]?> {
    return Observable.create { observer in
      SBDMain.unregisterPushToken(deviceToken) { (response, error) in
        if let error = error {
          observer.onError(error)
        } else {
          observer.onNext(response)
          observer.onCompleted()
        }
      }
      return Disposables.create()
    }
  }
  
  public static func unregisterAllPushToken() -> Observable<[AnyHashable:Any]?> {
    return Observable.create { observer in
      SBDMain.unregisterAllPushToken { (response, error) in
        if let error = error {
          observer.onError(error)
        } else {
          observer.onNext(response)
          observer.onCompleted()
        }
      }
      return Disposables.create()
    }
  }
  
  public static func registerPushKit(
    with deviceToken: Data, isUnique: Bool) -> Observable<SBDPushTokenRegistrationStatus> {
    return Observable.create { observer in
      SBDMain.registerDevicePushKitToken(deviceToken, unique: isUnique) { (status, error) in
        if let error = error {
          observer.onError(error)
        } else {
          observer.onNext(status)
          observer.onCompleted()
        }
      }
      return Disposables.create()
    }
  }
  
  public static func unregisterPushKit(with deviceToken: Data) -> Observable<[AnyHashable:Any]?> {
    return Observable.create { observer in
      SBDMain.unregisterPushKitToken(deviceToken) { (response, error) in
        if let error = error {
          observer.onError(error)
        } else {
          observer.onNext(response)
          observer.onCompleted()
        }
      }
      return Disposables.create()
    }
  }
  
  public static func unregisterAllPushKitToken() -> Observable<[AnyHashable:Any]?> {
    return Observable.create { observer in
      SBDMain.unregisterAllPushKitToken { (response, error) in
        if let error = error {
          observer.onError(error)
        } else {
          observer.onNext(response)
          observer.onCompleted()
        }
      }
      return Disposables.create()
    }
  }
  
  public static func getMyPuhsTokens(
    by token: String?, type: SBDPushTokenType) -> Observable<SBDPushTokenResult> {
    return Observable.create { observer in
      SBDMain.getMyPushTokens(
        byToken: token, pushTokenType: type
      ) { (tokens, type, hasNext, nextToken, error) in
        if let error = error {
          observer.onError(error)
        } else {
          observer.onNext((tokens, type, hasNext, nextToken))
          observer.onCompleted()
        }
      }
      return Disposables.create()
    }
  }
  
  public static func setDoNotDisturb(
    with enable:Bool,
    startHour: Int32,
    startMin: Int32,
    endHour: Int32,
    endMin: Int32,
    timezone: String) -> Observable<Void> {
    return Observable.create { observer in
      SBDMain.setDoNotDisturbWithEnable(
        enable,
        startHour: startHour,
        startMin: startMin,
        endHour: endHour,
        endMin: endMin,
        timezone: timezone
      ) { (error) in
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
  
  public static func getDoNotDisturb() -> Observable<SBDDoNotDisturbResult> {
    return Observable.create { observer in
      SBDMain.getDoNotDisturb { (enable, sh, sm, eh, em, tz, error) in
        if let error = error {
          observer.onError(error)
        } else {
          observer.onNext((enable, sh, sm, eh, em, tz))
          observer.onCompleted()
        }
      }
      return Disposables.create()
    }
  }
  
  public static func setSnoozePeriod(
    with enable: Bool,
    startTimestamp: Int64,
    endTimestamp: Int64) -> Observable<Void> {
    return Observable.create { observer in
      SBDMain.setSnoozePeriodEnable(
        enable,
        startTimestamp: startTimestamp,
        endTimestamp: endTimestamp
      ) { (error) in
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
  
  public static func getSnoozePeriod() -> Observable<SBDSnoozeResult> {
    return Observable.create { observer in
      SBDMain.getSnoozePeriod { (enable, startTimestamp, endTimestamp, error) in
        if let error = error {
          observer.onError(error)
        } else {
          observer.onNext((enable, startTimestamp, endTimestamp))
          observer.onCompleted()
        }
      }
      return Disposables.create()
    }
  }
  
  public static func setPushTriggerOption(with option: SBDPushTriggerOption) -> Observable<Void> {
    return Observable.create { observer in
      SBDMain.setPushTriggerOption(option) { (error) in
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
  
  public static func getPushTriggerOption() -> Observable<SBDPushTriggerOption> {
    return Observable.create { observer in
      SBDMain.getPushTriggerOption() { (option, error) in
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
  
  public static func setPushSound(with sound: String) -> Observable<Void> {
    return Observable.create { observer in
      SBDMain.setPushSound(sound) { (error) in
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
  
  public static func getPushSound() -> Observable<String?> {
    return Observable.create { observer in
      SBDMain.getPushSound() { (sound, error) in
        if let error = error {
          observer.onError(error)
        } else {
          observer.onNext(sound)
          observer.onCompleted()
        }
      }
      return Disposables.create()
    }
  }
  
  public static func setPushTemplate(with name: String) -> Observable<Void> {
    return Observable.create { observer in
      SBDMain.setPushTemplateWithName(name) { error in
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
  
  public static func getPushTemplate() -> Observable<String?> {
    return Observable.create { observer in
      SBDMain.getPushTemplate() { (template, error) in
        if let error = error {
          observer.onError(error)
        } else {
          observer.onNext(template)
          observer.onCompleted()
        }
      }
      return Disposables.create()
    }
  }
}
