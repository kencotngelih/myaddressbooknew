//
//  AddNewSeller.swift
//  MyAddressBookKavsoft
//
//  Created by Robby Suliantoro on 05/05/22.
//

import SwiftUI

struct AddNewSeller: View {
    
    @EnvironmentObject var sellerModel: SellerViewModel
    // MARK: All Environment Values in one Variable
    @Environment(\.self) var env
    @Namespace var animation
    
    @State var bolehEditSeller: Bool = true
    
    //@State private var address01: Bool = true
    //@State private var address02: Bool = false
    //@State private var address03: Bool = false
    
    var infoNavigasiSeller: some View {
        Group {
            VStack (spacing:12){
                //crete new customer dan belum pencet add
                    if (sellerModel.editSeller == nil && bolehEditSeller) {
                        Text("New Seller")
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
                            .overlay(alignment: .trailing){
                                // MARK: Save Button
                                // MARK: If Success Closing View
                                Button {
                                    // MARK: If Success Closing View
                                    bolehEditSeller.toggle()
                                } label: {
                                    Text("Add")
                                        .font(.callout)
                                        .fontWeight(.semibold)
                                        .padding(.vertical,12)
                                        .foregroundColor(.black)
                                }
                                //.disabled(custModel.custName == "")
                                //.opacity(custModel.custName == "" ? 0.6 : 1)
                                
                            }
                    }
                
                    //crete new customer dan sudah pencet add
                else if (sellerModel.editSeller == nil && !bolehEditSeller) {
                        
                            Text("New Seller")
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
                                .overlay(alignment: .trailing){
                                    // MARK: Save Button
                                    // MARK: If Success Closing View
                                    Button {
                                        
                                        if sellerModel.addSeller(context: env.managedObjectContext) {
                                            env.dismiss()
                                        }
                                    } label: {
                                        Text("Save")
                                            .font(.callout)
                                            .fontWeight(.semibold)
                                            .padding(.vertical,12)
                                            .foregroundColor(.black)
                                    }
                                    .disabled(sellerModel.sellerName == "")
                                    .opacity(sellerModel.sellerName == "" ? 0.6 : 1)
                                    
                                }
                    }
                
                    // edit customer dan belum pencet edit
                else if (sellerModel.editSeller != nil && bolehEditSeller) {
                        Text("View Seller")
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
                            .overlay(alignment: .trailing){
                                Button {
                                        bolehEditSeller.toggle()
                                } label: {
                                    Text("Edit")
                                        .font(.callout)
                                        .fontWeight(.semibold)
                                        .padding(.vertical,12)
                                        .foregroundColor(.black)
                                }
                                .disabled(sellerModel.sellerName == "")
                                .opacity(sellerModel.sellerName == "" ? 0.6 : 1)
                                
                            }
                    }
                
                    // edit customer dan sudah pencet edit
                else {
                        Text("Edit Seller")
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
                            .overlay(alignment: .trailing){
                                // MARK: Save Button
                                // MARK: If Success Closing View
                                Button {
                                    // MARK: If Success Closing View
                                    if sellerModel.addSeller(context: env.managedObjectContext) {
                                        env.dismiss()
                                    }
                                } label: {
                                    Text("Save")
                                        .font(.callout)
                                        .fontWeight(.semibold)
                                        .padding(.vertical,12)
                                        .foregroundColor(.black)
                                }
                                .disabled(sellerModel.sellerName == "")
                                .opacity(sellerModel.sellerName == "" ? 0.6 : 1)
                                
                            }
                    }
            }
        }
    }
    
    var groupSeller: some View {
        Group {
            VStack(alignment: .leading, spacing:12) {
                
                Text("Seller Name")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                TextField("", text: $sellerModel.sellerName)
                    .disabled(bolehEditSeller)
                    .disableAutocorrection(true)
                    .foregroundColor(bolehEditSeller ? .black : .white)
                    .frame(maxWidth: .infinity)
                    .padding(10)
                    .background(bolehEditSeller ? Color("lightgray"): Color("grayapple"))
                    .cornerRadius(10)
                
                    Text("Seller HP")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    TextField("", text: $sellerModel.sellerHP)
                    .disabled(bolehEditSeller)
                    .disableAutocorrection(true)
                    .foregroundColor(bolehEditSeller ? .black : .white)
                    .frame(maxWidth: .infinity)
                    .padding(10)
                    .background(bolehEditSeller ? Color("lightgray"): Color("grayapple"))
                    .cornerRadius(10)
                
                
                Divider()
            }
        }
    }
    
//    var inputAddRecChoice: some View {
//        Group {
//            VStack(alignment: .leading, spacing:12) {
//
//                // create new dan belum pencet add
//                if (custModel.editCust == nil && bolehEdit) {
//
//                }
//                // create new dan sudah pencet add
//                else if (custModel.editCust == nil && !bolehEdit) {
//
//                }
//                // edit customer [masih di view] dan di opsi address 1,2,3
//                else if (custModel.editCust != nil && bolehEdit) {
//                    HStack {
//                        Button {
//                            address01 = true
//                            address02 = false
//                            address03 = false
//                        } label: {
//                            Text("Address 01\n\(custModel.receiverLabel01)")
//                                .font(.callout)
//                                .fontWeight(.bold)
//                                .foregroundColor(address01 ? .white : .black)
//                                .padding(.vertical,6)
//                                .frame(maxWidth: .infinity)
//                                .background {
//                                    Capsule()
//                                        .fill(address01 ? .blue : .white)
//                                }
//                        }
//
//                        Button{
//                            address01 = false
//                            address02 = true
//                            address03 = false
//                        } label: {
//                            Text("Address 02\n\(custModel.receiverLabel02)")
//                                .font(.callout)
//                                .fontWeight(.bold)
//                                .foregroundColor(address02 ? .white : .black)
//                                .padding(.vertical,6)
//                                .frame(maxWidth: .infinity)
//                                .background {
//                                    Capsule()
//                                        .fill(address02 ? .blue : .white)
//                                }
//                        }
//
//                        Button{
//                            address01 = false
//                            address02 = false
//                            address03 = true
//                        } label: {
//                            Text("Address 03\n\(custModel.receiverLabel03)")
//                                .font(.callout)
//                                .fontWeight(.bold)
//                                .foregroundColor(address03 ? .white : .black)
//                                .padding(.vertical,6)
//                                .frame(maxWidth: .infinity)
//                                .background {
//                                    Capsule()
//                                        .fill(address03 ? .blue : .white)
//                                }
//                        }
//                    }
//                    .padding(.top, 0)
//                    .padding(.bottom, 0)
//                    .padding(.leading, 16)
//                    .padding(.trailing, 16)
//                }
//                // edit customer [masih di view] dan di opsi address 2
////                else if (custModel.editCust != nil && bolehEdit && address02) {
////
////                }
//                // edit customer [masih di view] dan di opsi address 3
////                else if (custModel.editCust != nil && bolehEdit && address03) {
////
////                }
//                // edit customer, sudah pencet edit, dan di opsi address 1 (tidak bisa loncat)
//                else if (custModel.editCust != nil && !bolehEdit && address01) {
//
//                }
//                // edit customer, sudah pencet edit, dan di opsi address 2 (tidak bisa loncat)
//                else if (custModel.editCust != nil && !bolehEdit && address02) {
//
//                }
//                // edit customer, sudah pencet edit, dan di opsi address 3 (tidak bisa loncat)
//                else if (custModel.editCust != nil && !bolehEdit && address03) {
//
//                }
//                // yang tidak masuk scope (harusnya gak ada sih)
//                else {
//                    Text("KOSONG")
//                }
//            }
//        }
//    }
    
//    var groupReceiver1View: some View {
//        Group {
//            HStack {
//                Text("Address 01")
//                        .font(.body)
//                        .foregroundColor(.black)
//
//                Spacer()
//
//                Button {
//                        custModel.openPickAddress01.toggle()
//                } label: {
//                        Image(systemName: "arrow.right")
//                            .foregroundColor(.black)
//                }
//            }
//        }
//    }
//
//    var groupReceiver1Edit: some View {
//        Group {
//            HStack {
//                Text("Address 01")
//                        .font(.body)
//                        .foregroundColor(.black)
//                Spacer()
//            }
//        }
//    }
//
//    var groupReceiver2View: some View {
//        Group {
//            HStack {
//                Text("Address 02")
//                        .font(.body)
//                        .foregroundColor(.black)
//
//                Spacer()
//
//                Button {
//                        custModel.openPickAddress02.toggle()
//                } label: {
//                        Image(systemName: "arrow.right")
//                            .foregroundColor(.black)
//                }
//            }
//        }
//    }
//
//    var groupReceiver2Edit: some View {
//        Group {
//            HStack {
//                Text("Address 02")
//                        .font(.body)
//                        .foregroundColor(.black)
//                Spacer()
//            }
//        }
//    }
//
//    var groupReceiver3View: some View {
//        Group {
//            HStack {
//                Text("Address 03")
//                        .font(.body)
//                        .foregroundColor(.black)
//
//                Spacer()
//
//                Button {
//                        custModel.openPickAddress03.toggle()
//                } label: {
//                        Image(systemName: "arrow.right")
//                            .foregroundColor(.black)
//                }
//            }
//        }
//    }
//
//    var groupReceiver3Edit: some View {
//        Group {
//            HStack {
//                Text("Address 03")
//                        .font(.body)
//                        .foregroundColor(.black)
//                Spacer()
//            }
//        }
//    }
    
    var groupSeller1A: some View {
        Group {
            VStack(alignment: .leading, spacing:12){
                
                Text("Seller Segment")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                TextField("", text: $sellerModel.sellerSegment)
                .disabled(bolehEditSeller)
                .disableAutocorrection(true)
                .foregroundColor(bolehEditSeller ? .black : .white)
                .frame(maxWidth: .infinity)
                .padding(10)
                .background(bolehEditSeller ? Color("lightgray"): Color("grayapple"))
                .cornerRadius(10)
                
            }
            
        }
    }
    
    var groupSeller1B: some View {
        Group {
            VStack(alignment: .leading, spacing:12){
                Text("Seller Address")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                TextField("", text: $sellerModel.sellerAddress)
                .disabled(bolehEditSeller)
                .disableAutocorrection(true)
                .foregroundColor(bolehEditSeller ? .black : .white)
                .frame(maxWidth: .infinity)
                .padding(10)
                .background(bolehEditSeller ? Color("lightgray"): Color("grayapple"))
                .cornerRadius(10)
            
                Text("Seller Lat Long")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                TextField("", text: $sellerModel.sellerLatLong)
                .disabled(bolehEditSeller)
                .disableAutocorrection(true)
                .foregroundColor(bolehEditSeller ? .black : .white)
                .frame(maxWidth: .infinity)
                .padding(10)
                .background(bolehEditSeller ? Color("lightgray"): Color("grayapple"))
                .cornerRadius(10)
            
                Text("Seller Note")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                TextField("", text: $sellerModel.sellerNote)
                .disabled(bolehEditSeller)
                .disableAutocorrection(true)
                .foregroundColor(bolehEditSeller ? .black : .white)
                .frame(maxWidth: .infinity)
                .padding(10)
                .background(bolehEditSeller ? Color("lightgray"): Color("grayapple"))
                .cornerRadius(10)
            }
        }
    }
    
//    var groupReceiver2A: some View {
//        Group {
//            VStack(alignment: .leading, spacing:12){
//
//                Text("Receiver Label 02")
//                    .font(.caption)
//                    .foregroundColor(.gray)
//
//                TextField("", text: $custModel.receiverLabel02)
//                .disabled(bolehEdit)
//                .disableAutocorrection(true)
//                .foregroundColor(bolehEdit ? .black : .white)
//                .frame(maxWidth: .infinity)
//                .padding(10)
//                .background(bolehEdit ? Color("lightgray"): Color("grayapple"))
//                .cornerRadius(10)
//
//                Text("Receiver Name 02")
//                    .font(.caption)
//                    .foregroundColor(.gray)
//
//                TextField("", text: $custModel.receiverName02)
//                .disabled(bolehEdit)
//                .disableAutocorrection(true)
//                .foregroundColor(bolehEdit ? .black : .white)
//                .frame(maxWidth: .infinity)
//                .padding(10)
//                .background(bolehEdit ? Color("lightgray"): Color("grayapple"))
//                .cornerRadius(10)
//
//                Text("Receiver HP 02")
//                    .font(.caption)
//                    .foregroundColor(.gray)
//
//                TextField("", text: $custModel.receiverHP02)
//                .disabled(bolehEdit)
//                .disableAutocorrection(true)
//                .foregroundColor(bolehEdit ? .black : .white)
//                .frame(maxWidth: .infinity)
//                .padding(10)
//                .background(bolehEdit ? Color("lightgray"): Color("grayapple"))
//                .cornerRadius(10)
//
//            }
//
//        }
//    }
//
//    var groupReceiver2B: some View {
//        Group {
//            VStack(alignment: .leading, spacing:12){
//                Text("Receiver Address 02")
//                    .font(.caption)
//                    .foregroundColor(.gray)
//
//                TextField("", text: $custModel.receiverAddress02)
//                .disabled(bolehEdit)
//                .disableAutocorrection(true)
//                .foregroundColor(bolehEdit ? .black : .white)
//                .frame(maxWidth: .infinity)
//                .padding(10)
//                .background(bolehEdit ? Color("lightgray"): Color("grayapple"))
//                .cornerRadius(10)
//
//                Text("Receiver Lat Long 02")
//                    .font(.caption)
//                    .foregroundColor(.gray)
//
//                TextField("", text: $custModel.receiverLatLong02)
//                .disabled(bolehEdit)
//                .disableAutocorrection(true)
//                .foregroundColor(bolehEdit ? .black : .white)
//                .frame(maxWidth: .infinity)
//                .padding(10)
//                .background(bolehEdit ? Color("lightgray"): Color("grayapple"))
//                .cornerRadius(10)
//
//                Text("Receiver Note 02")
//                    .font(.caption)
//                    .foregroundColor(.gray)
//
//                TextField("", text: $custModel.receiverNote02)
//                .disabled(bolehEdit)
//                .disableAutocorrection(true)
//                .foregroundColor(bolehEdit ? .black : .white)
//                .frame(maxWidth: .infinity)
//                .padding(10)
//                .background(bolehEdit ? Color("lightgray"): Color("grayapple"))
//                .cornerRadius(10)
//            }
//        }
//    }
//
//    var groupReceiver3A: some View {
//        Group {
//            VStack(alignment: .leading, spacing:12){
//
//                Text("Receiver Label 03")
//                    .font(.caption)
//                    .foregroundColor(.gray)
//
//                TextField("", text: $custModel.receiverLabel03)
//                .disabled(bolehEdit)
//                .disableAutocorrection(true)
//                .foregroundColor(bolehEdit ? .black : .white)
//                .frame(maxWidth: .infinity)
//                .padding(10)
//                .background(bolehEdit ? Color("lightgray"): Color("grayapple"))
//                .cornerRadius(10)
//
//                Text("Receiver Name 03")
//                    .font(.caption)
//                    .foregroundColor(.gray)
//
//                TextField("", text: $custModel.receiverName03)
//                .disabled(bolehEdit)
//                .disableAutocorrection(true)
//                .foregroundColor(bolehEdit ? .black : .white)
//                .frame(maxWidth: .infinity)
//                .padding(10)
//                .background(bolehEdit ? Color("lightgray"): Color("grayapple"))
//                .cornerRadius(10)
//
//                Text("Receiver HP 03")
//                    .font(.caption)
//                    .foregroundColor(.gray)
//
//                TextField("", text: $custModel.receiverHP03)
//                .disabled(bolehEdit)
//                .disableAutocorrection(true)
//                .foregroundColor(bolehEdit ? .black : .white)
//                .frame(maxWidth: .infinity)
//                .padding(10)
//                .background(bolehEdit ? Color("lightgray"): Color("grayapple"))
//                .cornerRadius(10)
//
//            }
//
//        }
//    }
//
//    var groupReceiver3B: some View {
//        Group {
//            VStack(alignment: .leading, spacing:12){
//                Text("Receiver Address 03")
//                    .font(.caption)
//                    .foregroundColor(.gray)
//
//                TextField("", text: $custModel.receiverAddress03)
//                .disabled(bolehEdit)
//                .disableAutocorrection(true)
//                .foregroundColor(bolehEdit ? .black : .white)
//                .frame(maxWidth: .infinity)
//                .padding(10)
//                .background(bolehEdit ? Color("lightgray"): Color("grayapple"))
//                .cornerRadius(10)
//
//                Text("Receiver Lat Long 03")
//                    .font(.caption)
//                    .foregroundColor(.gray)
//
//                TextField("", text: $custModel.receiverLatLong03)
//                .disabled(bolehEdit)
//                .disableAutocorrection(true)
//                .foregroundColor(bolehEdit ? .black : .white)
//                .frame(maxWidth: .infinity)
//                .padding(10)
//                .background(bolehEdit ? Color("lightgray"): Color("grayapple"))
//                .cornerRadius(10)
//
//                Text("Receiver Note 03")
//                    .font(.caption)
//                    .foregroundColor(.gray)
//
//                TextField("", text: $custModel.receiverNote03)
//                .disabled(bolehEdit)
//                .disableAutocorrection(true)
//                .foregroundColor(bolehEdit ? .black : .white)
//                .frame(maxWidth: .infinity)
//                .padding(10)
//                .background(bolehEdit ? Color("lightgray"): Color("grayapple"))
//                .cornerRadius(10)
//            }
//        }
//    }
    
//    var detailSeller: some View {
//        Group {
//            VStack {
//                            
//                            // create new dan belum pencet add
//                            if (sellerModel.editSeller == nil && bolehEditSeller) {
//                                
//                                groupSeller
//                                
//                                groupSeller1A
//                                
//                                groupSeller1B
//
//                            }
//                            // create new dan sudah pencet add
//                            else if (sellerModel.editSeller == nil && !bolehEditSeller) {
//                                
//                                groupSeller
//                                
//                                groupSeller1A
//                                
//                                groupSeller1B
//                                
//                            }
//                            // edit customer [masih di view] dan di opsi address 1
//                            else if (sellerModel.editSeller != nil && bolehEditSeller) {
//                                    
//                                groupSeller
//                                
//                                groupSeller1A
//                                
//                                groupSeller1B
//                                
//                                
//                            }
//                
//                // edit customer, sudah pencet edit, dan di opsi address 1 (tidak bisa loncat)
//                else if (custModel.editCust != nil && !bolehEdit && address01) {
//                    
//                    groupReceiver1Edit
//                        
//                    groupReceiver1A
//                    
//                    groupReceiver1B
//                        
//                        
//                }
//                // yang tidak masuk scope (harusnya gak ada sih)
//                else {
//                    VStack {
//                        Text("KOSONG")
//                    }
//                }
//}
//}
//}
//
//var editDelete: some View {
//Group {
//VStack {
//    HStack {
//        // MARK: muncul Delete waktu edit
//        if (!bolehEdit) {
//            Button {
//                if let editCust = custModel.editCust {
//                    env.managedObjectContext.delete(editCust)
//                    try? env.managedObjectContext.save()
//                    env.dismiss()
//                }
//            } label: {
//                Text("Delete")
//                    .font(.title3)
//                    .foregroundColor(.red)
//                    .padding(.top,10)
//            }
//            .opacity(custModel.editCust == nil ? 0 : 1)
//        }
//
//        Spacer()
//    }
//}
//}
//}

    var editDeleteSeller: some View {
        Group {
            VStack {
                HStack {
                    // MARK: muncul Delete waktu edit
                    if (!bolehEditSeller) {
                        Button {
                            if let editSeller = sellerModel.editSeller {
                                env.managedObjectContext.delete(editSeller)
                                try? env.managedObjectContext.save()
                                env.dismiss()
                            }
                        } label: {
                            Text("Delete")
                                .font(.title3)
                                .foregroundColor(.red)
                                .padding(.top,10)
                        }
                        .opacity(sellerModel.editSeller == nil ? 0 : 1)
                    }
                    
                    Spacer()
                }
            }
        }
    }
    
var body: some View {
    VStack {

        infoNavigasiSeller

        ScrollView {
    
            groupSeller
            
            groupSeller1A
            
            groupSeller1B
    
    editDeleteSeller
    
        }

    }
    .frame(maxHeight: .infinity, alignment: .top)
    .padding()
//
//.fullScreenCover(isPresented: $custModel.openPickAddress01) {
////custModel.resetCustData()
//} content: {
//PickAddress01()
//    .environmentObject(custModel)
//}
//
//.fullScreenCover(isPresented: $custModel.openPickAddress02) {
////custModel.resetCustData()
//} content: {
//PickAddress02()
//    .environmentObject(custModel)
//}
//
//.fullScreenCover(isPresented: $custModel.openPickAddress03) {
////custModel.resetCustData()
//} content: {
//PickAddress03()
//    .environmentObject(custModel)
//}
    }
}



struct AddNewSeller_Previews: PreviewProvider {
    static var previews: some View {
        AddNewSeller()
            .environmentObject(SellerViewModel())
    }
}
