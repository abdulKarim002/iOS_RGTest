//
//  APIManager.swift
//  Test
//
//  Created by abdul on 17/04/20.
//  Copyright © 2020 abdul. All rights reserved.
//

import Foundation

protocol APIDelegates: class {
    func didStartAPICall()
    func didFinishAPICallWithSuccess()
    func didFinishAPICallWithError()
    func parsingError()
}
