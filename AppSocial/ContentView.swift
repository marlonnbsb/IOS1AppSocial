//
//  ContentView.swift
//  AppSocial
//
//  Created by Marlon Machado on 12/04/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject
    var viewModel: UserViewModel
    
    var body: some View {
        NavigationView {
            Group {
                if viewModel.loading {
                    showLoading()
                } else {
                    List {
                        ForEach(viewModel.users) { user in
                            NavigationLink(destination: PostView(userID: user.id)){
                                VStack(alignment: .leading) {
                                    Text(user.name).font(.title2).bold()
                                    Text(user.email).font(.subheadline).padding(.top, 2)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Usuários")
            .environmentObject(PostViewModel())
        }
        .onAppear {
            viewModel.buscarUsuarios()
        }
    }
    
    func showLoading() -> some View {
        return VStack {
            ProgressView()
            Text("Aguarde!")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: UserViewModel())
    }
}
