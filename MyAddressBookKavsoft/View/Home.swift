//
//  Home.swift
//  MyAddressBookKavsoft
//
//  Created by Robby Suliantoro on 04/05/22.
//

import SwiftUI

struct Home: View {
    
    @StateObject var custModel: CustViewModel
    @StateObject var sellerModel: SellerViewModel
    
    // MARK: Matched Geometry Namespace
    @Namespace var animation
    
    // MARK: Fetching Task
    @FetchRequest(entity: Cust.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Cust.name, ascending: true)], predicate: nil, animation: .easeInOut) var custs: FetchedResults<Cust>
    
    // MARK: Fetching Task
    @FetchRequest(entity: Seller.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Seller.sellername, ascending: true)], predicate: nil, animation: .easeInOut) var sellers: FetchedResults<Seller>
    
    // MARK: Environment Values
    @Environment(\.self) var env
    
    //@State private var searchTerm = ""
    @State private var queryName = ""
    @State private var queryHP = ""
    
    @State private var searchByName: Bool = true
    @State private var searchByHP: Bool = false
    
    @State var namaSeller: String = ""
    
    var body: some View {
        
        VStack {
            HStack {
                Button {
                    searchByName = true
                    searchByHP = false
                    queryName = ""
                    queryHP = ""
                    custModel.resetCustData()
                } label: {
                    Text("By Name")
                        .font(.callout)
                        .fontWeight(.bold)
                        .foregroundColor(searchByName ? .white : .black)
                        .padding(.vertical,6)
                        .frame(maxWidth: .infinity)
                        .background {
                            Capsule()
                                .fill(searchByName ? .blue : .white)
                        }
                }
                
                Button{
                    searchByName = false
                    searchByHP = true
                    queryName = ""
                    queryHP = ""
                    custModel.resetCustData()
                } label: {
                    Text("By HP")
                        .font(.callout)
                        .fontWeight(.bold)
                        .foregroundColor(searchByHP ? .white : .black)
                        .padding(.vertical,6)
                        .frame(maxWidth: .infinity)
                        .background {
                            Capsule()
                                .fill(searchByHP ? .blue : .white)
                        }
                }
            }
            .padding(.top, 0)
            .padding(.bottom, 0)
            .padding(.leading, 16)
            .padding(.trailing, 16)

            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    if (!queryName.isEmpty || !queryHP.isEmpty) {
                        Text("Search Result : \(custs.count) customer(s).")
                    } else if (sellers.count == 0) {
                        //profil seller masuk sini
                        //Text("KOPI ARASTA")
                        //Text("Total Customer : \(custs.count) customer.")
                        Button {
                            sellerModel.openEditSeller = true
                        } label: {
                            Text("Click Here for Add Seller Info")
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .frame(maxWidth: .infinity)
                                .padding(16)
                                .background{
                                    Capsule()
                                        .fill(Color("grayapple"))
                                }
                            //Text("Untuk add info seller")
                            //    .foregroundColor(.black)
                            //Image(systemName: "circle.fill")
                            //    .foregroundColor(.black)
                        }
                        
                    } else {
                        SellerView()
                    }
                    
                    
                    // MARK: Cust View
                    CustView()
                }
                .padding(.top, 0)
                .padding(.bottom, 0)
                .padding(.leading, 16)
                .padding(.trailing, 16)
            }
                
        }
        .fullScreenCover(isPresented: $custModel.openEditCust) {
            custModel.resetCustData()
        } content: {
            AddNewCust()
                .environmentObject(custModel)
        }
        
        .fullScreenCover(isPresented: $sellerModel.openEditSeller) {
            sellerModel.resetSellerData()
        } content: {
            AddNewSeller()
                .environmentObject(sellerModel)
        }
    }
    
    // MARK: TaskView
    @ViewBuilder
    func CustView() -> some View {
        
        if searchByName {
            LazyVStack(spacing:20) {
                ForEach(custs){cust in
                    CustRowView(cust: cust)
                }
            }
            .searchable(text: $queryName,
              placement: .navigationBarDrawer(displayMode: .always),  prompt: "Search Customer Name")
            .disableAutocorrection(true)
            .onChange(of: queryName) { newValue in
              custs.nsPredicate = searchPredicateName(query: newValue)
            }
            .padding(.top,10)
        } else {
            LazyVStack(spacing:20) {
                ForEach(custs){cust in
                    CustRowView(cust: cust)
                }
            }
            .searchable(text: $queryHP,
              placement: .navigationBarDrawer(displayMode: .always),  prompt: "Search Customer HP")
            .disableAutocorrection(true)
            .onChange(of: queryHP) { newValue in
              custs.nsPredicate = searchPredicateHP(query: newValue)
            }
            .padding(.top,10)
        }
    }
    
    // MARK: Task Row View
    @ViewBuilder
    func CustRowView(cust: Cust) -> some View {
        VStack (alignment: .leading, spacing:10) {
            HStack {
                Text(cust.name ?? "")
                    .font(.body.bold())
                    .foregroundColor(.black)
                Text(cust.hp ?? "")
                    .font(.body.bold())
                    .foregroundColor(.black)
                Spacer()
                
                // MARK: Edit Button Only for Non Completed Tasks
                
                    Button {
                        custModel.editCust = cust
                        custModel.openEditCust = true
                        custModel.setupCust()
                        self.queryName = ""
                        self.queryHP = ""
                    } label: {
                        Image(systemName: "arrow.right")
                            .foregroundColor(.black)
                    }
                
            } 
            Divider().background(Color("grayapple"))
        }
        .padding(.leading, 10)
        .padding(.trailing, 10)
        .frame(maxWidth: .infinity)
    }
    
    //FOR SELLER
    
    // MARK: TaskView
    @ViewBuilder
    func SellerView() -> some View {
            LazyVStack {
                ForEach(sellers){seller in
                    SellerRowView(seller: seller)
                }
            }
            .padding(.top,10)
    }
    
    // MARK: Task Row View
    @ViewBuilder
    func SellerRowView(seller: Seller) -> some View {
        HStack {
            Spacer()
            //VStack  {
                HStack {
                    VStack (alignment: .leading, spacing:10){
                        Text(seller.sellername ?? "")
                            .font(.body.bold())
                            .foregroundColor(.white)
                        Text(seller.sellerhp ?? "")
                            .font(.body.bold())
                            .foregroundColor(.white)
                        Text("Total : \(custs.count) customer(s).")
                            .font(.caption.bold())
                            .foregroundColor(.white)
                    }
                    Spacer()
                    
                    // MARK: Edit Button Only for Non Completed Tasks
                    
                    VStack {
                        
                        Button {
                            sellerModel.editSeller = seller
                            sellerModel.openEditSeller = true
                            sellerModel.setupSeller()
                        } label: {
                            Image(systemName: "square.and.pencil")
                                .foregroundColor(.white)
                        }
                    }
                    
                    
                }
                .padding(10)
                .padding(.horizontal,5)
                .background(Color("grayapple"))
                .cornerRadius(10)
                .padding(.leading, 60)
                .padding(.trailing, 60)
                .frame(maxWidth: .infinity)
        }
        
        Spacer()
    }
    
    private func searchPredicateName(query: String) -> NSPredicate? {
      if queryName.isEmpty { return nil }
        return NSPredicate(format: "%K CONTAINS[cd] %@", #keyPath(Cust.name), query)
      }
    
    private func searchPredicateHP(query: String) -> NSPredicate? {
      if queryHP.isEmpty { return nil }
        return NSPredicate(format: "%K CONTAINS[cd] %@", #keyPath(Cust.hp), query)
      }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
