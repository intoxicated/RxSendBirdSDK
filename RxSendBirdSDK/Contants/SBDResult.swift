//
//  SBDResult.swift
//  RxSendBirdSDK
//
//  Created by Wooyoung Chung on 5/20/20.
//  Copyright © 2020 SendBird. All rights reserved.
//
import SendBirdSDK

public typealias SBDPushTokenResult = ([String],SBDPushTokenType, Bool, String?)
public typealias SBDDoNotDisturbResult = (Bool, Int32, Int32, Int32, Int32, String)
public typealias SBDSnoozeResult = (Bool, Int64, Int64)
public typealias SBDChannelChangeLogsResult = ([SBDGroupChannel], [String], Bool, String?)
