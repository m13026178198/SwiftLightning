//
//  PayConfirmPresenter.swift
//  SwiftLightning
//
//  Created by Howard Lee on 2018-04-28.
//  Copyright (c) 2018 BiscottiGelato. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol PayConfirmPresentationLogic {
  func presentRefresh<C: Currency>(response: PayConfirm.Refresh.Response<C>)
}

class PayConfirmPresenter: PayConfirmPresentationLogic {
  weak var viewController: PayConfirmDisplayLogic?
  
  
  // MARK: Refresh
  
  func presentRefresh<C: Currency>(response: PayConfirm.Refresh.Response<C>) {
    let viewModel = PayConfirm.Refresh.ViewModel(amount: response.amount.formattedInSatoshis() + " sat",
                                                 refAmt: "",
                                                 address: response.address,
                                                 description: response.description,
                                                 confSpeed: response.confSpeed?.description,
                                                 amtToSend: response.amount.formattedInSatoshis(),
                                                 fee: response.fee?.formattedInSatoshis() ?? "auto",
                                                 totalAmt: response.totalAmount.formattedInSatoshis(),
                                                 paymentType: response.paymentType)
    
    viewController?.displayRefresh(viewModel: viewModel)
  }
}