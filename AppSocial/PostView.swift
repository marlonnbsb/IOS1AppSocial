//
//  PostView.swift
//  AppSocial
//
//  Created by Marlon Machado on 12/04/21.
//

import SwiftUI

struct PostView: View {
    
    @EnvironmentObject
    var viewModel: PostViewModel
    
    var userID: Int
    
    var body: some View {
        Group {
            if viewModel.loading {
                showLoading()
            } else {
                List {
                    ForEach (viewModel.posts) { post in
                        VStack(alignment: .leading) {
                            Text(post.title).font(.title2).fontWeight(.bold)
                            Text(post.body).font(.subheadline).padding(.top, 2)
                        }
                    }
                }
            }
        }
        .navigationTitle("Post")
        .onAppear {
            viewModel.buscarPostsUsuario(userId: userID)
        }
    }
    
    func showLoading() -> some View {
        return VStack {
            ProgressView()
            Text("Aguarde!")
        }
    }
}

//struct PostView_Previews: PreviewProvider {
//    static var previews: some View {
//        PostView()
//    }
//}
