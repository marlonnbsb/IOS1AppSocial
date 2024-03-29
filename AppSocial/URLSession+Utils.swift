//
//  URLSession+Utils.swift
//  AppSocial
//
//  Created by Marlon Machado on 12/04/21.
//

import Foundation


extension URLSession {
    internal func map(_ entity: (Data, URLResponse)) throws -> Data {
        let (data, resp) = entity
        guard let response = resp as? HTTPURLResponse,
              response.statusCode >= 200,
              response.statusCode < 300 else {
            throw URLError(.badServerResponse)
        }
        return data
    }
}
