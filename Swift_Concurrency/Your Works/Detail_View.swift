//
//  Detail_View.swift
//  Swift_Concurrency
//
//  Created by Muhammad Farid Ullah on 19/08/2023.
//

import SwiftUI

struct Detail_View: View {
    
    //MARK: var character: Character
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("backgroundColor_app")
                    .ignoresSafeArea()
                ScrollView {
                    //The Image section
                    VStack {
                        Image("image3")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 148, height: 148)
                        .cornerRadius(16)
                        
                        Text("Rick Sanchez")
                        .font(
                        Font.custom("Gilroy", size: 22)
                        .weight(.bold)
                        )
                        .foregroundColor(.white)
                        .padding(.top, 24)  //Manage the space here from the top
                        
                        Text("Alive")
                          .font(
                            Font.custom("Gilroy", size: 16)
                              .weight(.medium)
                          )
                          .multilineTextAlignment(.trailing)
                          .foregroundColor(Color(red: 0.28, green: 0.77, blue: 0.04))
                          .padding(.top, 1)
                    }
                    
                    //The info section
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Info")
                            .font(
                            Font.custom("Gilroy", size: 17)
                            .weight(.semibold)
                            )
                            .foregroundColor(.white)
                            .padding(.top, 24)
                            .padding(.horizontal, 24)
                            Spacer()
                        }
                        
                        VStack(spacing: 16) {
                            HStack(spacing: 16) {
                                Text("Species:")
                                  .font(
                                    Font.custom("Gilroy", size: 16)
                                      .weight(.medium)
                                  )
                                  .foregroundColor(Color(red: 0.77, green: 0.79, blue: 0.81))
                                  .frame(width: 64.9201, alignment: .topLeading)
                                  .padding(.horizontal, 16)
                                
                                Spacer()
                                
                                Text("Human")
                                  .font(
                                    Font.custom("Gilroy", size: 16)
                                      .weight(.medium)
                                  )
                                  .multilineTextAlignment(.trailing)
                                  .foregroundColor(.white)
                                  .padding(.horizontal, 16)
                                
                                //Spacer()
                                
                            }
                            
                            HStack(spacing: 16) {
                                Text("Type:")
                                  .font(
                                    Font.custom("Gilroy", size: 16)
                                      .weight(.medium)
                                  )
                                  .foregroundColor(Color(red: 0.77, green: 0.79, blue: 0.81))
                                  .frame(width: 64.9201, alignment: .topLeading)
                                  .padding(.horizontal, 16)
                                
                                Spacer()
                                
                                Text("Human")
                                  .font(
                                    Font.custom("Gilroy", size: 16)
                                      .weight(.medium)
                                  )
                                  .multilineTextAlignment(.trailing)
                                  .foregroundColor(.white)
                                  .padding(.horizontal, 16)
                                
                                //Spacer()
                                
                            }
                            
                            HStack(spacing: 16) {
                                Text("Gender:")
                                  .font(
                                    Font.custom("Gilroy", size: 16)
                                      .weight(.medium)
                                  )
                                  .foregroundColor(Color(red: 0.77, green: 0.79, blue: 0.81))
                                  .frame(width: 64.9201, alignment: .topLeading)
                                  .padding(.horizontal, 16)
                                
                                Spacer()
                                
                                Text("Human")
                                  .font(
                                    Font.custom("Gilroy", size: 16)
                                      .weight(.medium)
                                  )
                                  .multilineTextAlignment(.trailing)
                                  .foregroundColor(.white)
                                  .padding(.horizontal, 16)
                                
                                //Spacer()
                                
                            }
                        }
                        .foregroundColor(.clear)
                        .frame(height: 124)
                        .background(.white.opacity(0.2))// Upadate your colour accordingly
                        //.background(Color(red: 0.15, green: 0.16, blue: 0.22))
                        .cornerRadius(16)
                        .padding(.horizontal, 24)
                        
                        
                    }
                    
                    
                    //The Origin
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Origin")
                            .font(
                            Font.custom("Gilroy", size: 17)
                            .weight(.semibold)
                            )
                            .foregroundColor(.white)
                            .padding(.top, 24)
                            .padding(.horizontal, 24)
                            Spacer()
                        }
                        
                        VStack(spacing: 16) {
                            HStack(spacing: 16) {
                                Rectangle()
                                    .frame(width: 64, height: 64)
                                    .background(Color(red: 0.1, green: 0.11, blue: 0.16))
                                    .cornerRadius(10)
                                    .padding(.horizontal)
                                    .overlay {
                                        Image("earth")
                                    }
                                
                                VStack(spacing: 8) {
                                    Text("Earth")
                                    .font(
                                    Font.custom("Gilroy", size: 17)
                                    .weight(.semibold)
                                    )
                                    .foregroundColor(.white)
                                    
                                    // Body Small
                                    Text("Planet")
                                      .font(
                                        Font.custom("Gilroy", size: 13)
                                          .weight(.medium)
                                      )
                                      .foregroundColor(Color(red: 0.28, green: 0.77, blue: 0.04))

                                }
                                
                                Spacer()
                                
                            }
                        }
                        .foregroundColor(.clear)
                        .frame(height: 80)
                        .background(.white.opacity(0.2))// Upadate your colour accordingly
                        //.background(Color(red: 0.15, green: 0.16, blue: 0.22))
                        .cornerRadius(16)
                        .padding(.horizontal, 24)

                        
                        
                    }
                    
                    
                    //The Edisodes. MARK: put a foreach loop on the episodes...
                    HStack {
                        Text("Episodes")
                        .font(
                        Font.custom("Gilroy", size: 17)
                        .weight(.semibold)
                        )
                        .foregroundColor(.white)
                        .padding(.top, 24)
                        .padding(.horizontal, 24)
                        Spacer()
                    }
                    VStack {
                        ForEach(0..<10, id: \.self) { item in
                            VStack(alignment: .leading, spacing: 16) {
                                
                                Text("Pilot")
                                    .font(
                                        Font.custom("Gilroy", size: 17)
                                            .weight(.semibold)
                                    )
                                    .foregroundColor(.white)
                                
                                
                                HStack {
                                    Text("Episode: 1, Season: 1")
                                        .font(
                                            Font.custom("Gilroy", size: 13)
                                                .weight(.medium)
                                        )
                                        .foregroundColor(Color(red: 0.28, green: 0.77, blue: 0.04))
                                    
                                    Spacer()
                                    
                                    Text("December 16, 2013")
                                        .font(
                                            Font.custom("Gilroy", size: 12)
                                                .weight(.medium)
                                        )
                                        .multilineTextAlignment(.trailing)
                                        .foregroundColor(Color(red: 0.58, green: 0.6, blue: 0.61))
                                        .padding(.horizontal, 16)
                                }
                            }
                            .padding(.leading)
                            .foregroundColor(.clear)
                            .frame(width: 360, height: 86)
                            .background(.white.opacity(0.2))// Upadate your colour accordingly
                            //.background(Color(red: 0.15, green: 0.16, blue: 0.22))
                            .cornerRadius(16)
                            .padding(.horizontal, 24)
                            .padding(.vertical, 4)
                        }
                    }
                    
                    Spacer()
                }

            }
        }.toolbarRole(.editor)
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct Detail_View_Previews: PreviewProvider {
    static var previews: some View {
        Detail_View()
    }
}
