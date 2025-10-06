//
//  StoreEndpoint.swift
//  IPATool
//
//  Created by Majd Alfhaily on 22.05.21.
//

import Foundation

enum StoreEndpoint {
    case authenticate
    case download(guid: String)
}

extension StoreEndpoint: HTTPEndpoint {
    var url: URL {
        var components = URLComponents(string: path)!
        components.scheme = "https"
        components.host = host
        return components.url!
    }
    
    private var host: String {
        switch self {
        case .authenticate:
            return "buy.itunes.apple.com"
        case .download:
            return "p25-buy.itunes.apple.com"
        }
    }
    
    private var path: String {
        switch self {
        case .authenticate:
            return "/WebObjects/MZFinance.woa/wa/authenticate"
        case let .download(guid):
            return "/WebObjects/MZFinance.woa/wa/volumeStoreDownloadProduct?guid=\(guid)"
        }
    }
}
