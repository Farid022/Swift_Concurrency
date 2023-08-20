//
//  HomeScreenRickandMorty.swift
//  Swift_Concurrency
//
//  Created by Muhammad Farid Ullah on 19/08/2023.
//

import SwiftUI

struct HomeScreenRickandMorty: View {
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)] //Manage the horizental spacing.
    init() {
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    
    //Manage the splash screen
    @State private var splashScreen = true
    var body: some View {
        ZStack {
            if splashScreen {
                SplashScreen()
            } else {
                NavigationView {
                    ZStack {
                        Color("backgroundColor_app")
                            .ignoresSafeArea()
                        
                        ScrollView {
                            LazyVGrid(columns: columns, spacing: 16) {  //Manage the vertical spacing.
                              //MARK: ForEach(characters, id: \.self) { character in
                                ForEach(1..<10, id: \.self) { character in
                                    NavigationLink {
                                        Detail_View() //This will accept a character.
                                    } label: {
                                        CardView()
                                    }
                                }
                            }
                            .padding()
                        }.navigationTitle("Charachter")
                    }
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.splashScreen = false
            }
        }
        
        
    }
}

struct HomeScreenRickandMorty_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenRickandMorty()
    }
}
