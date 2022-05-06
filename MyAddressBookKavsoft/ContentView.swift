//
//  ContentView.swift
//  MyAddressBookKavsoft
//
//  Created by Robby Suliantoro on 04/05/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var custModel: CustViewModel = .init()
    @StateObject var sellerModel: SellerViewModel = .init()
    @Environment(\.self) var env
    
    var body: some View {
        NavigationView {
            
            Home(custModel: custModel, sellerModel: sellerModel)
                .navigationBarTitle("Customers")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            custModel.openEditCust.toggle()
                        }label: {
                            Image(systemName: "plus")
                                .foregroundColor(.black)
                        }
                    }
                }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
