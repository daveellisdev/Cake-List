//
//  ContentView.swift
//  Shared
//
//  Created by Dave on 14/03/2022.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var data = DataController.shared
    
    var body: some View {
        NavigationView {
//            CakeListView(cakes: [cake1, cake2, cake3])
            CakeListView(cakes: data.cakes)

                .navigationTitle("Cakes")
                .onAppear(){
                    // load cakes first, in case of no connection
                    data.loadCakes()
                    
                    // download fresh cakes (yum)
                    data.getCakes()
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
