//
//  SBDBaseChannel+Rx.swift
//  RxSendBirdSDK
//
//  Created by Wooyoung Chung on 5/20/20.
//  Copyright © 2020 SendBird. All rights reserved.
//

import Foundation
import RxSwift
import SendBirdSDK

extension Reactive where Base : SBDBaseChannel {
  public func sendUserMessage(
    with params: SBDUserMessageParams) -> Observable<SBDUserMessage?> {
    return Observable.create { observer in
      self.base.sendUserMessage(with: params) { message, error in
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
  
  public func resendUserMessage(
    with failedMessage: SBDUserMessage) -> Observable<SBDUserMessage?> {
    return Observable.create { observer in
      self.base.resendUserMessage(with: failedMessage) { message, error in
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
  
  public func updateUserMessage(
    with messageId: Int64, params: SBDUserMessageParams) -> Observable<SBDUserMessage?> {
    return Observable.create { observer in
      self.base.updateUserMessage(
        withMessageId: messageId,
        userMessageParams: params
      ) { (message, error) in
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
  
  public func copyUserMessage(
    with message: SBDUserMessage,
    targetChannel: SBDBaseChannel) -> Observable<SBDUserMessage?> {
    return Observable.create { observer in
      self.base.copy(message, toTargetChannel: targetChannel) { (message, error) in
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
  
  public func sendFileMessage(
    with params: SBDFileMessageParams) -> Observable<(SBDFileMessage?, Float)> {
    return Observable.create { observer in
      self.base.sendFileMessage(with: params, progressHandler: { sent, total, expect in
        observer.onNext((nil, Float(total)/Float(expect)))
      }) {  message, error in
        if let error = error {
          observer.onError(error)
        } else {
          observer.onNext((message, 1))
          observer.onCompleted()
        }
      }
      return Disposables.create()
    }
  }
  
  public func resendFileMessage(
    with failedMessage: SBDFileMessage,
    binaryData: Data?) -> Observable<(SBDFileMessage?, Float)> {
    return Observable.create { observer in
      self.base.resendFileMessage(
        with: failedMessage,
        binaryData: binaryData,
        progressHandler: { (sent, total, expect) in
        observer.onNext((nil, Float(total)/Float(expect)))
      }) {  message, error in
        if let error = error {
          observer.onError(error)
        } else {
          observer.onNext((message, 1))
          observer.onCompleted()
        }
      }
      return Disposables.create()
    }
  }
  
  public func updateFileMessage(
    with messageId: Int64, params: SBDFileMessageParams) -> Observable<SBDFileMessage?> {
    return Observable.create { observer in
      self.base.updateFileMessage(
        withMessageId: messageId,
        fileMessageParams: params
      ) { message, error in
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
  
  public func cancelUploadingFileMessage(
    with requestId: String) -> Observable<Bool> {
    return Observable.create { observer in
      SBDBaseChannel.cancelUploadingFileMessage(
        withRequestId: requestId
      ) { success, error in
        if let error = error {
          observer.onError(error)
        } else {
          observer.onNext(success)
          observer.onCompleted()
        }
      }
      return Disposables.create()
    }
  }
  
  public func copyFileMessage(
    with message: SBDFileMessage,
    targetChannel: SBDBaseChannel) -> Observable<SBDFileMessage?> {
    return Observable.create { observer in
      self.base.copy(message, toTargetChannel: targetChannel) { message, error in
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
  
  public func deleteMessage(with messageId: Int64) -> Observable<Void> {
    return Observable.create { observer in
      self.base.deleteMessage(withMessageId: messageId) { error in
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
    
  // MARK: MetaCounter
  public func createMetaCounters(
    with counters:SBDMetaCounter) -> Observable<SBDMetaCounter?> {
    return Observable.create { observer in
      self.base.createMetaCounters(
        counters.mapValues { NSNumber(integerLiteral: $0) }
      ) { result, error in
        if let error = error {
          observer.onError(error)
        } else {
          observer.onNext(result?.mapValues { $0.intValue })
          observer.onCompleted()
        }
      }
      return Disposables.create()
    }
  }
  
  public func updateMetaCounters(
    with counters: SBDMetaCounter) -> Observable<SBDMetaCounter?> {
    return Observable.create { observer in
      self.base.updateMetaCounters(
        counters.mapValues { NSNumber(integerLiteral: $0) }
      ) { result, error in
        if let error = error {
          observer.onError(error)
        } else {
          observer.onNext(result?.mapValues { $0.intValue })
          observer.onCompleted()
        }
      }
      return Disposables.create()
    }
  }
  
  public func getMetaCounters(with keys: [String]) -> Observable<SBDMetaCounter?> {
    return Observable.create { observer in
      self.base.getMetaCounters(withKeys: keys) { result, error in
        if let error = error {
          observer.onError(error)
        } else {
          observer.onNext(result?.mapValues { $0.intValue })
          observer.onCompleted()
        }
      }
      return Disposables.create()
    }
  }
  
  public func getAllMetaCounters() -> Observable<SBDMetaCounter?> {
    return Observable.create { observer in
      self.base.getAllMetaCounters { result, error in
        if let error = error {
          observer.onError(error)
        } else {
          observer.onNext(result?.mapValues { $0.intValue })
          observer.onCompleted()
        }
      }
      return Disposables.create()
    }
  }
  
  public func increaseMetaCounters(
    with counters: SBDMetaCounter) -> Observable<SBDMetaCounter?> {
    return Observable.create { observer in
      self.base.increaseMetaCounters(
        counters.mapValues { NSNumber(integerLiteral: $0) }
      ) { result, error in
        if let error = error {
          observer.onError(error)
        } else {
          observer.onNext(result?.mapValues { $0.intValue })
          observer.onCompleted()
        }
      }
      return Disposables.create()
    }
  }
  
  public func decreaseMetaCounters(
    with counters: SBDMetaCounter) -> Observable<SBDMetaCounter?> {
    return Observable.create { observer in
      self.base.decreaseMetaCounters(
        counters.mapValues { NSNumber(integerLiteral: $0) }
      ) { result, error in
        if let error = error {
          observer.onError(error)
        } else {
          observer.onNext(result?.mapValues { $0.intValue })
          observer.onCompleted()
        }
      }
      return Disposables.create()
    }
  }
  
  public func deleteMetaCounters(with key: String) -> Observable<Void> {
    return Observable.create { observer in
      self.base.deleteMetaCounters(withKey: key) { error in
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
  
  public func deleteAllMetaCounters() -> Observable<Void> {
    return Observable.create { observer in
      self.base.deleteAllMetaCounters { error in
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
  
  // MARK: MetaData
  public func createMetaData(with data:SBDMetaData) -> Observable<SBDMetaData?> {
    return Observable.create { observer in
      self.base.createMetaData(data) { result, error in
        if let error = error {
          observer.onError(error)
        } else {
          observer.onNext(result)
          observer.onCompleted()
        }
      }
      return Disposables.create()
    }
  }
  
  public func updateMetaData(with data: SBDMetaData) -> Observable<SBDMetaData?> {
    return Observable.create { observer in
      self.base.updateMetaData(data) { result, error in
        if let error = error {
          observer.onError(error)
        } else {
          observer.onNext(result?.compactMapValues { $0 })
          observer.onCompleted()
        }
      }
      return Disposables.create()
    }
  }
  
  public func getMetaData(with keys: [String]) -> Observable<SBDMetaData?> {
    return Observable.create { observer in
      self.base.getMetaData(withKeys: keys) { result, error in
        if let error = error {
          observer.onError(error)
        } else {
          observer.onNext(result?.compactMapValues { $0 })
          observer.onCompleted()
        }
      }
      return Disposables.create()
    }
  }
  
  public func getAllMetaData() -> Observable<SBDMetaData?> {
    return Observable.create { observer in
      self.base.getAllMetaData { result, error in
        if let error = error {
          observer.onError(error)
        } else {
          observer.onNext(result?.compactMapValues { $0 })
          observer.onCompleted()
        }
      }
      return Disposables.create()
    }
  }
  
  public func deleteMetaData(with key: String) -> Observable<Void> {
    return Observable.create { observer in
      self.base.deleteMetaData(withKey: key) { error in
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
  
  public func deleteAllMetaData() -> Observable<Void> {
    return Observable.create { observer in
      self.base.deleteAllMetaData { error in
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
  
  // MARK: MetaArray
  public func createMessageMetaArray(
    with message: SBDBaseMessage,
    keys: [String]) -> Observable<SBDBaseMessage?> {
    return Observable.create { observer in
      self.base.createMessageMetaArrayKeys(
        with: message,
        keys: keys
      ) { message, error in
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
  
  public func addMessageMetaArray(
    with message: SBDBaseMessage,
    metaArrays: [SBDMessageMetaArray]) -> Observable<SBDBaseMessage?> {
    return Observable.create { observer in
      self.base.addMessageMetaArrayValues(
        with: message,
        metaArrays: metaArrays
      ) { message, error in
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
  
  public func deleteMessageMetaArray(
    with message: SBDBaseMessage,
    keys: [String]) -> Observable<SBDBaseMessage?> {
    return Observable.create { observer in
      self.base.deleteMessageMetaArrayKeys(
        with: message, keys: keys
      ) { message, error in
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
  
  public func removeMessageMetaArray(
    with message: SBDBaseMessage,
    metaArrays: [SBDMessageMetaArray]) -> Observable<SBDBaseMessage?> {
    return Observable.create { observer in
      self.base.removeMessageMetaArrayValues(
        with: message,
        metaArrays: metaArrays
      ) { (message, error) in
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

  // MARK: Retreive messages
  public func getMessages(
    timestamp: Int64,
    params: SBDMessageListParams) -> Observable<[SBDBaseMessage]?> {
    return Observable.create { observer in
      self.base.getMessagesByTimestamp(timestamp, params: params) { messages, error in
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

  public func getMessages(
    messageId: Int64,
    params: SBDMessageListParams) -> Observable<[SBDBaseMessage]?> {
    return Observable.create { observer in
      self.base.getMessagesByMessageId(messageId, params: params) { messages, error in
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

  
  public func getMessageChangeLogs(
    token: String?,
    params: SBDMessageChangeLogsParams) -> Observable<SBDMessageChangeLogsResult> {
    return Observable.create { observer in
      self.base.getMessageChangeLogs(
        sinceToken: token, params: params
      ) { updated, deleted, hasMore, token, error in
        if let error = error {
          observer.onError(error)
        } else {
          observer.onNext((
            updated,
            deleted?.map { $0.intValue },
            hasMore,
            token
          ))
          observer.onCompleted()
        }
      }
      return Disposables.create()
    }
  }
  
  public func getMessageChangeLogs(
    timestamp: Int64,
    params: SBDMessageChangeLogsParams) -> Observable<SBDMessageChangeLogsResult> {
    return Observable.create { observer in
      self.base.getMessageChangeLogs(
        sinceTimestamp: timestamp, params: params
      ) { updated, deleted, hasMore, token, error in
        if let error = error {
          observer.onError(error)
        } else {
          observer.onNext((
            updated,
            deleted?.map { $0.intValue },
            hasMore,
            token
          ))
          observer.onCompleted()
        }
      }
      return Disposables.create()
    }
  }
  
  // MARK: Misc
  public func translate(
    with userMessage:SBDUserMessage,
    targetLanguages: [String]) -> Observable<SBDUserMessage?> {
    return Observable.create { observer in
      self.base.translate(
        userMessage,
        targetLanguages: targetLanguages
      ) { message, error in
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
  
  public func getMyMutedInfo() -> Observable<SBDMyMutedInfoResult> {
    return Observable.create { observer in
      self.base.getMyMutedInfo { (muted, description, start, end, duration, error) in
        if let error = error {
          observer.onError(error)
        } else {
          observer.onNext((muted, description, start, end, duration))
          observer.onCompleted()
        }
      }
      return Disposables.create()
    }
  }
  
  // MARK: Report
  public func reportUser(
    user: SBDUser,
    category: SBDReportCategory,
    description: String? = nil) -> Observable<Void> {
    return Observable.create { observer in
      self.base.report(
        user,
        reportCategory: category,
        reportDescription: description
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
  
  public func reportChannel(
    with category: SBDReportCategory,
    description: String? = nil) -> Observable<Void> {
    return Observable.create { observer in
      self.base.report(
        with: category,
        reportDescription: description
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
  
  public func reportMessage(
    message: SBDBaseMessage,
    category: SBDReportCategory,
    description: String) -> Observable<Void> {
    return Observable.create { observer in
      self.base.report(
        message,
        reportCategory: category,
        reportDescription: description
      ) { error in
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
  
  // MARK: Reaction
  public func addReaction(
    to message: SBDBaseMessage,
    key: String) -> Observable<SBDReactionEvent?> {
    return Observable.create { observer in
      self.base.addReaction(with: message, key: key) { event, error in
        if let error = error {
          observer.onError(error)
        } else {
          observer.onNext(event)
          observer.onCompleted()
        }
      }
      return Disposables.create()
    }
  }
  
  public func deleteReaction(
    from message: SBDBaseMessage,
    key: String) -> Observable<SBDReactionEvent?> {
    return Observable.create { observer in
      self.base.deleteReaction(with: message, key: key) { event, error in
        if let error = error {
          observer.onError(error)
        } else {
          observer.onNext(event)
          observer.onCompleted()
        }
      }
      return Disposables.create()
    }
  }
  
  // MARK: Moderation
  
  public func banUser(
    with userId: String,
    seconds: Int,
    description: String? = nil) -> Observable<Void> {
    return Observable.create { observer in
      if let base = self.base as? SBDOpenChannel {
        base.banUser(
          withUserId: userId,
          seconds: Int32(seconds)
        ) { error in
          if let error = error {
            observer.onError(error)
          } else {
            observer.onNext(())
            observer.onCompleted()
          }
        }
      } else if let base = self.base as? SBDGroupChannel {
        base.banUser(
          withUserId: userId,
          seconds: seconds,
          description: description
        ) { error in
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
  
  public func unban(with userId: String) -> Observable<Void> {
    return Observable.create { observer in
      if let base = self.base as? SBDOpenChannel {
        base.unbanUser(withUserId: userId) { error in
          if let error = error {
            observer.onError(error)
          } else {
            observer.onNext(())
            observer.onCompleted()
          }
        }
      } else if let base = self.base as? SBDGroupChannel {
        base.unbanUser(withUserId: userId) { error in
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
  
  public func mute(
    with userId: String,
    seconds: Int? = nil,
    description: String? = nil) -> Observable<Void> {
    return Observable.create { observer in
      let seconds = seconds ?? -1
      
      if let base = self.base as? SBDOpenChannel {
        base.muteUser(
          withUserId: userId,
          seconds: seconds,
          description: description
        ) { error in
          if let error = error {
            observer.onError(error)
          } else {
            observer.onNext(())
            observer.onCompleted()
          }
        }
      } else if let base = self.base as? SBDGroupChannel {
        base.muteUser(
          withUserId: userId,
          seconds: seconds,
          description: description
        ) { error in
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
  
  public func unmute(with userId: String) -> Observable<Void> {
    return Observable.create { observer in
      if let base = self.base as? SBDOpenChannel {
        base.unmuteUser(withUserId: userId) { error in
          if let error = error {
            observer.onError(error)
          } else {
            observer.onNext(())
            observer.onCompleted()
          }
        }
      } else if let base = self.base as? SBDGroupChannel {
        base.unmuteUser(withUserId: userId) { error in
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
  
  public func freeze() -> Observable<Void> {
    return Observable.create { observer in
      if let _ = self.base as? SBDOpenChannel {
        let error = SBDError(
          domain: "freeze not support for open channel",
          code: SBDErrorCode.invalidParameterValue.rawValue,
          userInfo: nil
        )
        observer.onError(error)
      } else if let base = self.base as? SBDGroupChannel {
        base.freeze { error in
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
  
  public func unfreeze() -> Observable<Void> {
    return Observable.create { observer in
      if let _ = self.base as? SBDOpenChannel {
        let error = SBDError(
          domain: "freeze not support for open channel",
          code: SBDErrorCode.invalidParameterValue.rawValue,
          userInfo: nil
        )
        observer.onError(error)
      } else if let base = self.base as? SBDGroupChannel {
        base.unfreeze { error in
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
}
