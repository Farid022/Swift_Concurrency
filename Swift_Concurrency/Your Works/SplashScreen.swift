//
//  SplashScreen.swift
//  Swift_Concurrency
//
//  Created by Muhammad Farid Ullah on 20/08/2023.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        ZStack {
            Color("backgroundColor_app")
                .ignoresSafeArea()
            
            
            VStack(spacing: 36) {
                Image("splashScreen_image2")
                .frame(width: 140, height: 40)
                .overlay {
                    HStack {
                        
                        Image("Ellipse_small")
                            .padding(.trailing, 300)
                        
                        Spacer()
                        Image("Ellipse_large")
                            .padding(.top)
                    }
                }
                
                Image("splashScreen_Image1")
                    .frame(width: 140, height: 228)
                    .overlay {
                        VStack {
                            Spacer()
                            Image("Ellipse_large")
                                .padding(.top, 300)
                        }
                    }
            }
            
            VStack {
                HStack(spacing: 150) {
                    Image("Ellipse_small")
                    
                    Image("Ellipse_small")
                        .padding(.top)
                    
                    Image("Ellipse_small")
                        .padding(.top,40)
                }
                
                Spacer()
            }
            .padding(.top, 80)
            
            
            VStack {
                HStack(spacing: 150) {
                    Image("Ellipse_small").padding(.leading)
                    
                    Image("Ellipse_small")
                        .padding(.top)
                    
                    Image("Ellipse_small")
                        .padding(.top,40)
                }
                
                //Spacer()
            }
            .padding(.top, 80)
            
            VStack {
                Spacer()
                VStack {
                    HStack(spacing: 150) {
                        Image("Ellipse_small")
                        
                        Image("Ellipse_small")
                            .padding(.top)
                        
                        Image("Ellipse_small")
                            .padding(.bottom, 40)
                    }
                    
                    //Spacer()
                }
                .padding(.bottom, 40)
            }
            
            
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
