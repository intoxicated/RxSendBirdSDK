//
//  SBDMainUser+Rx.swift
//  RxSendBirdSDK
//
//  Created by Wooyoung Chung on 5/20/20.
//  Copyright © 2020 SendBird. All rights reserved.
//

import RxSwift
import SendBirdSDK
import Foundation

extension Reactive where Base : SBDMain {
  public static func updateUserInfo(
    with nickName: String,
    profileUrl: String? = nil) -> Observable<Void> {
    return Observable.create { observer in
      SBDMain.updateCurrentUserInfo(
        withNickname: nickName,
        profileUrl: profileUrl) { (error) in
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
  
  public static func updateUserInfo(
    with nickname: String,
    profileImage: Data?) -> Observable<Void> {
    return Observable.create { observer in
      SBDMain.updateCurrentUserInfo(
        withNickname: nickname,
        profileImage: profileImage) { (error) in
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
  
  public static func blockUser(with userId: String) -> Observable<SBDUser?> {
    return Observable.create { observer in
      SBDMain.blockUserId(userId) { (user, error) in
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
  
  public static func unblockUser(with userId: String) -> Observable<Void> {
    return Observable.create { observer in
      SBDMain.unblockUserId(userId) { error in
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
  
  // MARK: Invitation
  public static func setChannelInvitationPreference(with autoAccept: Bool) -> Observable<Void> {
    return Observable.create { observer in
      SBDMain.setChannelInvitationPreferenceAutoAccept(autoAccept) { error in
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
  
  public static func getChannelInvitationPreference() -> Observable<Bool> {
    return Observable.create { observer in
      SBDMain.getChannelInvitationPreferenceAutoAccept() { (autoAccept, error) in
        if let error = error {
          observer.onError(error)
        } else {
          observer.onNext(autoAccept)
          observer.onCompleted()
        }
      }
      return Disposables.create()
    }
  }
  
  // MARK: Friend
  //TODO: TBD
//  public static func addFriendsWithUserIds(userIds: [String]) -> Observable<[SBDUser]> {
//    
//  }
//  
//  public static func deleteFriendsWithUserIds(userIds: [String]) -> Observable<Any?> {
//    
//  }
//
//  public static func deleteFriendsWithDiscoveries(discoveryKeys: [String]) -> Observable<Any?> {
//    
//  }
//  
//  public static func uploadFirendDiscoveries(discoveries: [String: String]) -> Observable<Any?> {
//    
//  }
//  
//  public static func getFriendChangeLogs(by token: String?) -> Observable<[SBDUser]?> {
//    
//  }
}

