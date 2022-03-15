//
//  CakeDetailView.swift
//  Cake List
//
//  Created by Dave on 15/03/2022.
//

import SwiftUI

struct CakeDetailView: View {
    
    var cake: Cake
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: cake.image)) { phase in
                if let image = phase.image {
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                } else {
                    Image(systemName: "xmark.octagon")
                        .padding()
                }
            }
                .cornerRadius(10)
            Text(cake.title)
                .font(.title)
                .fontWeight(.bold)
            Text(cake.desc)
            Spacer()
            
        }.padding()
    }
}

struct CakeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CakeDetailView(cake: cake1)
    }
}
