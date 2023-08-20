//
//  CardView.swift
//  Swift_Concurrency
//
//  Created by Muhammad Farid Ullah on 19/08/2023.
//

import SwiftUI

struct CardView: View {
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack {
                Image("image3")
                .resizable()
                .scaledToFill()
                //.frame(width: 140, height: 140) //MARK: change the width of the card.
                .frame(width: 150, height: 150) //MARK: change the width of the card.
                .cornerRadius(10)
                .padding(.vertical, 8)
                
                Spacer()
                

                Text("Morty Smith")
                .font(
                Font.custom("Gilroy", size: 17)
                .weight(.semibold)
                )
                .foregroundColor(.white)
                
                
                Spacer()
            }
        }
        .foregroundColor(.clear)
        .frame(width: 170, height: 202)
        .background(Color(red: 0.15, green: 0.16, blue: 0.22))
        .cornerRadius(16)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
