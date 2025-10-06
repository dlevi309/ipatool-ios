//
//  RedirectEndpoint.swift
//  ipatool
//
//  Created by Vladislav Iakovlev on 06.10.25.
//

import Foundation

class RedirectEndpoint: HTTPEndpoint {
    var url: URL

    init?(location: Any?) {
        guard let location = location as? String, let url = URL(string: location) else {
            return nil
        }

        self.url = url
    }
}
