//
//  CakeListView.swift
//  Cake List
//
//  Created by Dave on 14/03/2022.
//

import SwiftUI

struct CakeListView: View {
    
    var cakes: [Cake]
    
    var body: some View {
        ScrollView {
            LazyVStack{
                ForEach(cakes) { cake in
                    NavigationLink(destination: CakeDetailView(cake: cake)){
                        CakeRowView(cake: cake)
                    }
                    .buttonStyle(.plain)
                }
            }.padding()
        }
    }
}

struct CakeListView_Previews: PreviewProvider {
    static var previews: some View {
        CakeListView(cakes: [cake1, cake2, cake3])
    }
}
