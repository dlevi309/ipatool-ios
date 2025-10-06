//
//  URLSession.swift
//  IPATool
//
//  Created by Majd Alfhaily on 22.05.21.
//

import Foundation

protocol URLSessionInterface {
    func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask
}

final class URLSessionNoRedirectDelegate: NSObject, URLSessionDataDelegate {
    static var shared = URLSessionNoRedirectDelegate()

    func urlSession(_ session: URLSession,
                    task: URLSessionTask,
                    willPerformHTTPRedirection response: HTTPURLResponse,
                    newRequest request: URLRequest,
                    completionHandler: @escaping (URLRequest?) -> Void) {
        completionHandler(nil)
    }
}

extension URLSession: URLSessionInterface {
    static var noRedirect = URLSession(configuration: .default,
                                       delegate: URLSessionNoRedirectDelegate.shared,
                                       delegateQueue: nil)
}
