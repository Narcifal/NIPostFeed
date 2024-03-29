//
//  EndPoint.swift
//  NIPostFeed
//
//  Created by Denys Niestierov on 30.08.2023.
//

import Foundation
import Alamofire

private struct EndPointConstants {
    static let urlScheme = "https"
    static let urlHost = "raw.githubusercontent.com"
    static let jsonFormat = ".json"
}

enum APIConstant {

    enum EndPointPostPath: String {
        case listPath = "/anton-natife/jsons/master/api/main.json"
        case detailsPath = "/anton-natife/jsons/master/api/posts/"
    }
}

enum EndPoint {
    case list
    case details(id: Int)
    
    var host: String {
        switch self {
        case .list, .details:
            return EndPointConstants.urlHost
        }
    }
    
    var path: String {
        switch self {
        case .list:
            return APIConstant.EndPointPostPath.listPath.rawValue
        case .details(let id):
            let stringId = String(id)
            return APIConstant.EndPointPostPath.detailsPath.rawValue + stringId + EndPointConstants.jsonFormat
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .list,
             .details:
            return .get
        }
    }
    
    var encoding: ParameterEncoding {
        switch self {
        case .list,
             .details:
            return URLEncoding.default
        }
    }
    
    func completeUrl() -> URL? {
        var urlBuilder = URLComponents()
        urlBuilder.scheme = EndPointConstants.urlScheme
        urlBuilder.host = EndPointConstants.urlHost
        urlBuilder.path = self.path
        guard let url = urlBuilder.url else {
            return nil
        }
        return url
    }
}
