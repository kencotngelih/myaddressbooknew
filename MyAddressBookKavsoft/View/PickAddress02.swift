//
//  PickAddress02.swift
//  MyAddressBookKavsoft
//
//  Created by Robby Suliantoro on 04/05/22.
//

import SwiftUI

struct PickAddress02: View {
    
    @EnvironmentObject var custModel: CustViewModel
    // MARK: All Environment Values in one Variable
    @Environment(\.self) var env
    @Namespace var animation
    
    var titlePickAddress02: some View {
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
    
    var bodyPengirimPickAddress02: some View {
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
    
    var bodyPemesanPickAddress02: some View {
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
    
    var bodyPenerimaPickAddress02: some View {
        Group {
                VStack (alignment: .leading, spacing:12){
                    Text("Penerima :")
                    Text("\(custModel.receiverLabel02)")
                    Text("\(custModel.receiverName02)")
                    Text("\(custModel.receiverHP02)")
                    Text("\(custModel.receiverAddress02)")
                    Text("\(custModel.receiverLatLong02)")
                    Text("\(custModel.receiverNote02)")
                    Divider()
                        .background(.black)
                }
            }
        
    }
    
    var body: some View {
        VStack {
            
            titlePickAddress02
            
            ScrollView {
                bodyPengirimPickAddress02
                bodyPemesanPickAddress02
                bodyPenerimaPickAddress02
                
            }
            
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .padding()
        
        
    }
}


struct PickAddress02_Previews: PreviewProvider {
    static var previews: some View {
        PickAddress02()
            .environmentObject(CustViewModel())
    }
}
