//
//  FetchGiveawaysRequest.swift
//
//
//  Created by AmrFawaz on 14/05/2024.
//

import Foundation
import NetworkManager
import Alamofire
import AppConfigurations

struct FetchGiveawaysRequest: NetworkRequest {
    var method: HTTPMethod {
        .get
    }
    var url: String {
        AppConstants.baseUrl.rawValue + "/giveaways"
    }
    let headers: [String: String]
    var params: [String : String]?
}
