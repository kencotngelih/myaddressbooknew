//
//  SellerViewModel.swift
//  MyAddressBookKavsoft
//
//  Created by Robby Suliantoro on 05/05/22.
//

import SwiftUI
import CoreData

class SellerViewModel: ObservableObject {
    
    // MARK: New Task Properties
    @Published var openEditSeller: Bool = false
    
    //@Published var openPickAddress01: Bool = false
    //@Published var openPickAddress02: Bool = false
    //@Published var openPickAddress03: Bool = false

    @Published var sellerName: String = ""
    @Published var sellerHP: String = ""
    @Published var sellerSegment: String = ""
    @Published var sellerAddress: String = ""
    @Published var sellerLatLong: String = ""
    @Published var sellerNote: String = ""
    
    // MARK: Editing Existing Task Data
    @Published var editSeller: Seller?
    
    // MARK: Adding Task To Core Data
    func addSeller(context: NSManagedObjectContext)->Bool {
        
        // MARK: Updating Existing Data in Core Data
        var seller: Seller!
        if let editSeller = editSeller {
            seller = editSeller
        } else {
            seller = Seller(context: context)
        }
        
        seller.sellername = sellerName
        seller.sellerhp = sellerHP
        seller.sellersegment = sellerSegment
        seller.selleraddress = sellerAddress
        seller.sellerlatlong = sellerLatLong
        seller.sellernote = sellerNote
                
        if let _ = try? context.save() {
            return true
        }
        return false
    }
    
    // MARK: Resetting Data
    func resetSellerData() {
        
        sellerName = ""
        sellerHP = ""
        sellerSegment = ""
        sellerAddress = ""
        sellerLatLong = ""
        sellerNote = ""
        
        editSeller = nil
    }
    
    // MARK: If Edit Task Is Available then Setting Existing Data
    func setupSeller() {
        if let editSeller = editSeller {
            sellerName = editSeller.sellername ?? ""
            sellerHP = editSeller.sellerhp ?? ""
            sellerSegment = editSeller.sellersegment ?? ""
            sellerAddress = editSeller.selleraddress ?? ""
            sellerLatLong = editSeller.sellerlatlong ?? ""
            sellerNote = editSeller.sellernote ?? ""
        }
    }
}
