//
//  UserVIewModel.swift
//  AppSocial
//
//  Created by Marlon Machado on 12/04/21.
//

import Foundation
import Combine

class UserViewModel: ObservableObject {
    
    private let kBaseURL = "https://jsonplaceholder.typicode.com"
    
    @Published
    private(set) var loading = false
    
    @Published
    private(set) var users = [User]() {
        didSet {
            loading = false
        }
    }
    private var usersCancellarionToken: AnyCancellable?
    
    func buscarUsuarios() {
        usersCancellarionToken?.cancel()
        
        if let urlUser = URL(string: "\(kBaseURL)/users") {
            let request = URLRequest(url: urlUser)
            let session = URLSession.shared
            
            loading = true
            
            usersCancellarionToken = session.dataTaskPublisher(for: request)
                .tryMap(session.map(_:))
                .decode(type: [User].self, decoder: JSONDecoder())
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: sinkError(_:)) { self.users = $0}

        }
    }
}
