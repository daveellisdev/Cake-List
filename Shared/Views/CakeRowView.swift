//
//  CakeRowView.swift
//  Cake List
//
//  Created by Dave on 14/03/2022.
//

import SwiftUI

struct CakeRowView: View {
    
    var cake: Cake
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: cake.image)) { phase in
                if let image = phase.image {
                    image.resizable()

                } else {
                    Image(systemName: "xmark.octagon")
                } 
            }
                .frame(width: 70, height: 70)
                .cornerRadius(10)

            VStack(alignment: .leading, spacing: 5) {
                Text(cake.title)
                    .font(.title)
                    .fontWeight(.bold)
                Text(cake.desc)
            }
            Spacer()
        }
    }
}

struct CakeRow_Previews: PreviewProvider {
    static var previews: some View {
        CakeRowView(cake: cake1)
            .previewLayout(.sizeThatFits)
            .padding()
            .frame(height: 100)
    }
}
