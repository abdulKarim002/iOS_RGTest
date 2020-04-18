//
//  Urls.swift
//  Test
//
//  Created by abdul on 17/04/20.
//  Copyright © 2020 abdul. All rights reserved.
//

import Foundation

struct Urls {
    
    struct Domain {
        static let PROD = "https://blog.personalcapital.com"
        /* if any other url like staging or QA
         example -  static let QA = "testurl.qa.com"
        */
    }
    
    static var BASE_URL = Domain.PROD
    
    struct getData {
        static let feeds = "\(BASE_URL)/feed/?cat=3,891,890,68,284"
    }
}
