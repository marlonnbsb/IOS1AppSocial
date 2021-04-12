//
//  ObservableObject+Utils.swift
//  AppSocial
//
//  Created by Marlon Machado on 12/04/21.
//

import Foundation
import Combine

extension ObservableObject {
    internal func sinkError(_ completion: Subscribers.Completion<Error>) {
        switch completion {
            case .failure(let error): debugPrint(error)
            default: break
        }
    }
}
