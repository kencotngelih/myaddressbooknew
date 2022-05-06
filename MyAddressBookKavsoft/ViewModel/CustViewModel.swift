//
//  CustViewModel.swift
//  MyAddressBookKavsoft
//
//  Created by Robby Suliantoro on 04/05/22.
//

import SwiftUI
import CoreData

class CustViewModel: ObservableObject {
    
    // MARK: New Task Properties
    @Published var openEditCust: Bool = false
    
    @Published var openPickAddress01: Bool = false
    @Published var openPickAddress02: Bool = false
    @Published var openPickAddress03: Bool = false

    @Published var custName: String = ""
    @Published var custHP: String = ""
    
    @Published var receiverLabel01: String = ""
    @Published var receiverName01: String = ""
    @Published var receiverHP01: String = ""
    @Published var receiverAddress01: String = ""
    @Published var receiverLatLong01: String = ""
    @Published var receiverNote01: String = ""
    
    @Published var receiverLabel02: String = ""
    @Published var receiverName02: String = ""
    @Published var receiverHP02: String = ""
    @Published var receiverAddress02: String = ""
    @Published var receiverLatLong02: String = ""
    @Published var receiverNote02: String = ""
    
    @Published var receiverLabel03: String = ""
    @Published var receiverName03: String = ""
    @Published var receiverHP03: String = ""
    @Published var receiverAddress03: String = ""
    @Published var receiverLatLong03: String = ""
    @Published var receiverNote03: String = ""
    
    // MARK: Editing Existing Task Data
    @Published var editCust: Cust?
    
    // MARK: Adding Task To Core Data
    func addCust(context: NSManagedObjectContext)->Bool {
        
        // MARK: Updating Existing Data in Core Data
        var cust: Cust!
        if let editCust = editCust {
            cust = editCust
        } else {
            cust = Cust(context: context)
        }
        cust.name = custName
        cust.hp = custHP
        
        cust.reclabel01 = receiverLabel01
        cust.recname01 = receiverName01
        cust.rechp01 = receiverHP01
        cust.recaddress01 = receiverAddress01
        cust.reclatlong01 = receiverLatLong01
        cust.recnote01 = receiverNote01
        
        cust.reclabel02 = receiverLabel02
        cust.recname02 = receiverName02
        cust.rechp02 = receiverHP02
        cust.recaddress02 = receiverAddress02
        cust.reclatlong02 = receiverLatLong02
        cust.recnote02 = receiverNote02
        
        cust.reclabel03 = receiverLabel03
        cust.recname03 = receiverName03
        cust.rechp03 = receiverHP03
        cust.recaddress03 = receiverAddress03
        cust.reclatlong03 = receiverLatLong03
        cust.recnote03 = receiverNote03
                
        if let _ = try? context.save() {
            return true
        }
        return false
    }
    
    // MARK: Resetting Data
    func resetCustData() {
        custName = ""
        custHP = ""
        
        receiverLabel01 = ""
        receiverName01 = ""
        receiverHP01 = ""
        receiverAddress01 = ""
        receiverLatLong01 = ""
        receiverNote01 = ""
        
        receiverLabel02 = ""
        receiverName02 = ""
        receiverHP02 = ""
        receiverAddress02 = ""
        receiverLatLong02 = ""
        receiverNote02 = ""
        
        receiverLabel03 = ""
        receiverName03 = ""
        receiverHP03 = ""
        receiverAddress03 = ""
        receiverLatLong03 = ""
        receiverNote03 = ""
        
        editCust = nil
    }
    
    // MARK: If Edit Task Is Available then Setting Existing Data
    func setupCust() {
        if let editCust = editCust {
            custName = editCust.name ?? ""
            custHP = editCust.hp ?? ""
            
            receiverLabel01 = editCust.reclabel01 ?? ""
            receiverName01 = editCust.recname01 ?? ""
            receiverHP01 = editCust.rechp01 ?? ""
            receiverAddress01 = editCust.recaddress01 ?? ""
            receiverLatLong01 = editCust.reclatlong01 ?? ""
            receiverNote01 = editCust.recnote01 ?? ""
            
            receiverLabel02 = editCust.reclabel02 ?? ""
            receiverName02 = editCust.recname02 ?? ""
            receiverHP02 = editCust.rechp02 ?? ""
            receiverAddress02 = editCust.recaddress02 ?? ""
            receiverLatLong02 = editCust.reclatlong02 ?? ""
            receiverNote02 = editCust.recnote02 ?? ""
            
            receiverLabel03 = editCust.reclabel03 ?? ""
            receiverName03 = editCust.recname03 ?? ""
            receiverHP03 = editCust.rechp03 ?? ""
            receiverAddress03 = editCust.recaddress03 ?? ""
            receiverLatLong03 = editCust.reclatlong03 ?? ""
            receiverNote03 = editCust.recnote03 ?? ""
        }
    }
}
