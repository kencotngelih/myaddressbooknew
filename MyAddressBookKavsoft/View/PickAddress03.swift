//
//  PickAddress03.swift
//  MyAddressBookKavsoft
//
//  Created by Robby Suliantoro on 04/05/22.
//

import SwiftUI

struct PickAddress03: View {
    
    @EnvironmentObject var custModel: CustViewModel
    // MARK: All Environment Values in one Variable
    @Environment(\.self) var env
    @Namespace var animation
    
    var titlePickAddress03: some View {
        Group {
            VStack (spacing:12){
                Text("Pick Address")
                    .font(.title3.bold())
                    .frame(maxWidth: .infinity)
                    .overlay(alignment: .leading) {
                        Button {
                            env.dismiss()
                        } label: {
                            Image(systemName: "arrow.left")
                                .font(.title3)
                                .foregroundColor(.black)
                        }
                    }
            }
        }
    }
    
    var bodyPengirimPickAddress03: some View {
        Group {
                VStack (alignment: .leading, spacing:12){
                    Text("Pengirim :")
                    Text("Kopi Arasta")
                    Text("08127272782")
                    Text("Jalan Merdeka No. 5, Purwokerto")
                    Text("Di Dalam Kafe")
                    Divider()
                        .background(.black)
                }
            }
        
    }
    
    var bodyPemesanPickAddress03: some View {
        Group {
                VStack (alignment: .leading, spacing:12){
                    Text("Pemesan :")
                    Text("\(custModel.custName)")
                    Text("\(custModel.custHP)")
                    Divider()
                        .background(.black)
                }
            }
        
    }
    
    var bodyPenerimaPickAddress03: some View {
        Group {
                VStack (alignment: .leading, spacing:12){
                    Text("Penerima :")
                    Text("\(custModel.receiverLabel01)")
                    Text("\(custModel.receiverName01)")
                    Text("\(custModel.receiverHP01)")
                    Text("\(custModel.receiverAddress01)")
                    Text("\(custModel.receiverLatLong01)")
                    Text("\(custModel.receiverNote01)")
                    Divider()
                        .background(.black)
                }
            }
        
    }
    
    var body: some View {
        VStack {
            
            titlePickAddress03
            
            ScrollView {
                bodyPengirimPickAddress03
                bodyPemesanPickAddress03
                bodyPenerimaPickAddress03
                
            }
            
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .padding()
        
        
    }
}


struct PickAddress03_Previews: PreviewProvider {
    static var previews: some View {
        PickAddress03()
            .environmentObject(CustViewModel())
    }
}
