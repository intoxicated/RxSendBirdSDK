//
//  RxSBDOpenChannelParams.swift
//  RxSendBirdSDK
//
//  Created by Wooyoung Chung on 5/22/20.
//  Copyright © 2020 SendBird. All rights reserved.
//

import Foundation

public struct RxSBDOpenChannelParams {
  public var name: String?
  public var coverImage: Data?
  public var coverImageName: String?
  public var data: String?
  public var customType: String?
  public var operatorUserIds: [String]
  
  //this property will be ingored for update
  public var channelUrl: String?
}
