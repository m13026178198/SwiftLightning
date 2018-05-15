//
//  NeutrinoPeersPresenter.swift
//  SwiftLightning
//
//  Created by Howard Lee on 2018-05-13.
//  Copyright (c) 2018 BiscottiGelato. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol NeutrinoPeersPresentationLogic {
  func presentCurrentPeers(response: NeutrinoPeers.CurrentPeers.Response)
  func presentWritePeers(response: NeutrinoPeers.WritePeers.Response)
}


class NeutrinoPeersPresenter: NeutrinoPeersPresentationLogic {
  weak var viewController: NeutrinoPeersDisplayLogic?
  
  // MARK: Current Peers
  
  func presentCurrentPeers(response: NeutrinoPeers.CurrentPeers.Response) {
    switch response.result {
    case .success(let peers):
      let viewModel = NeutrinoPeers.CurrentPeers.ViewModel(peers: peers)
      viewController?.displayCurrentPeers(viewModel: viewModel)
      
    case .failure(let error):
      let viewModel = NeutrinoPeers.ErrorVM(errTitle: "Read Peers Error",
                                            errMsg: error.localizedDescription)
      viewController?.displayError(viewModel: viewModel)
    }
  }
  
  
  // MARK: Update Peers by Writing
  func presentWritePeers(response: NeutrinoPeers.WritePeers.Response) {
    switch response.result {
    case .success(()):
      let viewModel = NeutrinoPeers.WritePeers.ViewModel(dialogTitle: "Peers Updated",
                                                         dialogMsg: "Lnd.conf have been updated. Please retart app for the update to take effect")
      viewController?.displayPeersWritten(viewModel: viewModel)
      
    case .failure(let error):
      let viewModel = NeutrinoPeers.ErrorVM(errTitle: "Write Peers Error",
                                            errMsg: error.localizedDescription)
      viewController?.displayError(viewModel: viewModel)
    }
  }
}
