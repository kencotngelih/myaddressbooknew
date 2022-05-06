//
//  PickAddress01.swift
//  MyAddressBookKavsoft
//
//  Created by Robby Suliantoro on 04/05/22.
//

import SwiftUI

struct PickAddress01: View {
    
    // MARK: Fetching Task
    @FetchRequest(entity: Cust.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Cust.name, ascending: true)], predicate: nil, animation: .easeInOut) var custs: FetchedResults<Cust>
    
    // MARK: Fetching Task
    @FetchRequest(entity: Seller.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Seller.sellername, ascending: true)], predicate: nil, animation: .easeInOut) var sellers: FetchedResults<Seller>
    
    @EnvironmentObject var custModel: CustViewModel
    @EnvironmentObject var sellerModel: SellerViewModel
    // MARK: All Environment Values in one Variable
    @Environment(\.self) var env
    @Namespace var animation
    
    var titlePickAddress01: some View {
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
    
    var bodyPengirimPickAddress01: some View {
        Group {
                VStack (alignment: .leading, spacing:12){
                    //Text("\(sellerModel.sellerName)")
                    //Text("\(sellerModel.sellerHP)")
                    //Text("\(sellerModel.sellerSegment)")
                    //Text("\(sellerModel.sellerAddress)")
                    //Text("\(sellerModel.sellerLatLong)")
                    //("\(sellerModel.sellerNote)")
                    Divider()
                        .background(.black)
                }
            }
        
    }
    
    var bodyPemesanPickAddress01: some View {
        Group {
                VStack (alignment: .leading, spacing:12){
                    Text("Pemesan :")
                        .font(.body.bold())
                        .foregroundColor(.black)
                    Text("\(custModel.custName)")
                    Text("\(custModel.custHP)")
                    Divider()
                        .background(.black)
                }
            }
        
    }
    
    var bodyPenerimaPickAddress01: some View {
        Group {
                VStack (alignment: .leading, spacing:12){
                    Text("Penerima :")
                        .font(.body.bold())
                        .foregroundColor(.black)
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
            
            titlePickAddress01
            
            ScrollView {
                
                SellerViewAddress()
                bodyPemesanPickAddress01
                bodyPenerimaPickAddress01
                
            }
            
        }
        .frame(maxHeight: .infinity, alignment: .top)
        .padding()
        
        
    }
    
    
    //FOR SELLER
    
    // MARK: TaskView
    @ViewBuilder
    func SellerViewAddress() -> some View {
        
        
            LazyVStack(spacing:0) {
                ForEach(sellers){seller in
                    SellerRowViewAddress(seller: seller)
                }
            }
            .padding(.top,10)
        
    }
    
    // MARK: Task Row View
    @ViewBuilder
    func SellerRowViewAddress(seller: Seller) -> some View {
        VStack (alignment: .leading, spacing:12) {
            Text("Pengirim :")
                .font(.body.bold())
                .foregroundColor(.black)
            Text(seller.sellername ?? "")
            Text(seller.sellerhp ?? "")
            Text(seller.sellersegment ?? "")
            Text(seller.selleraddress ?? "")
            Text(seller.sellerlatlong ?? "")
            Text(seller.sellernote ?? "")
            
//            HStack {
//                Text(seller.sellername ?? "")
//                    .font(.body.bold())
//                    .foregroundColor(.black)
//                Text(seller.sellerhp ?? "")
//                    .font(.body.bold())
//                    .foregroundColor(.black)
//                Spacer()
//
//                // MARK: Edit Button Only for Non Completed Tasks
//
//                VStack {
//                    Button {
//                        sellerModel.openEditSeller = true
//                    } label: {
//                        Image(systemName: "circle.fill")
//                            .foregroundColor(.black)
//                    }
//
//                    Button {
//                        sellerModel.editSeller = seller
//                        sellerModel.openEditSeller = true
//                        sellerModel.setupSeller()
//                    } label: {
//                        Image(systemName: "triangle.fill")
//                            .foregroundColor(.black)
//                    }
//                }
//
//
//            }
            Divider().background(Color("grayapple"))
        }
        //.padding(.leading, 10)
        //.padding(.trailing, 10)
        .frame(maxWidth: .infinity)
    }
}

struct PickAddress01_Previews: PreviewProvider {
    static var previews: some View {
        PickAddress01()
            .environmentObject(CustViewModel())
    }
}

  //YANG DIPERBAIKI DAHULU ADALAH
//done //1. MENYIAPKAN TAMPILAN SELLER (IF 0 SELLER --> KLIK UNTUK TAMBAH INFO SELLER)
//pending //2. APABILA BELUM ADA SELLER, MAKA BELUM BISA NAMBAH CUSTOMER (DI HIDE, TOMBOL + NYA
//done //3. DIRAPIKAN TAMPILAN DEPAN, JIKA SUDAH ADA 1 SELLER, TIDAK BISA NAMBAH SELLER (DI HIDE ADD SELLER)
//4. KEMUDIAN LANGSUNG KE HALAMAN PICK ADDRESS 01, PICK ADDRESS 02, PICK ADDRESS 03
//   MASING-MASING MENG-GET DARI COREDATA UNTUK INFO SELLER NYA

// YANG DITAMPILAN DI HALAMAN DEPAN NAMA SELLER DAN NO HP SELLER SECARA VSTACK
// KEMUDIAN ADA INFORMASI JUMLAH CUSTOMERS COUNT... JUMLAH CUSTOMERS : ....
// KEMUDIAN DIBERI DIVIDER DAN PADDING (MASUK SCROLLVIEW)
