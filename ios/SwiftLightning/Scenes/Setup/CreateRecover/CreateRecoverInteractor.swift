//
//  CreateRecoverInteractor.swift
//  SwiftLightning
//
//  Created by Howard Lee on 2018-04-14.
//  Copyright (c) 2018 BiscottiGelato. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol CreateRecoverBusinessLogic
{
  func doSomething(request: CreateRecover.Something.Request)
}

protocol CreateRecoverDataStore
{
  //var name: String { get set }
}

class CreateRecoverInteractor: CreateRecoverBusinessLogic, CreateRecoverDataStore
{
  var presenter: CreateRecoverPresentationLogic?
  var worker: CreateRecoverWorker?
  //var name: String = ""
  
  // MARK: Do something
  
  func doSomething(request: CreateRecover.Something.Request)
  {
    worker = CreateRecoverWorker()
    worker?.doSomeWork()
    
    let response = CreateRecover.Something.Response()
    presenter?.presentSomething(response: response)
  }
}
