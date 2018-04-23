//
//  RootModels.swift
//  SwiftLightning
//
//  Created by Howard Lee on 2018-04-20.
//  Copyright (c) 2018 BiscottiGelato. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum Root
{
  enum WalletPresenceRouting
  {
    struct Constants {
      static let checkWalletTryCount = 11
      static let timeBetweenCheckRetry = 1.0  // seconds
    }
    struct Request
    {
    }
    struct Response
    {
      var walletPresent: Bool?
    }
    struct ViewModel
    {
      var errorTitle: String
      var errorMsg: String
    }
  }
  
  enum ConfirmWalletUnlock {
    struct Request {
    }
    struct Response {
      var isWalletUnlocked: Bool
    }
    struct ViewModel {
      var errTitle: String
      var errMsg: String
    }
  }
  
}
