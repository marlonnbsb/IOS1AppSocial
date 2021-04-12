//
//  PostViewModel.swift
//  AppSocial
//
//  Created by Marlon Machado on 12/04/21.
//

import Foundation
import Combine

class PostViewModel: ObservableObject {
    private let kBaseURL = "https://jsonplaceholder.typicode.com"
    
    @Published
    private(set) var loading = false
    
    @Published
    private(set) var posts = [Post]() {
        didSet {
            loading = false
        }
    }
    
    private var usersCancellarionToken: AnyCancellable?
    
    func buscarPostsUsuario (userId: Int) {
        if let urlPosts = URL(string: "\(kBaseURL)/users/\(userId)/posts") {
            let request = URLRequest(url: urlPosts)
            let session = URLSession.shared
            
            loading = true
            
            usersCancellarionToken = session.dataTaskPublisher(for: request)
                .tryMap(session.map(_:))
                .decode(type: [Post].self, decoder: JSONDecoder())
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: sinkError(_:)) { self.posts = $0}

        }
    }
}
