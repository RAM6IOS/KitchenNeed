//
//  UploadProductViewModel.swift
//  KitchenNeed
import Foundation
import Firebase
class UploadProductViewModel: ObservableObject {
    @Published var name = ""
    @Published var quantity = ""
    @Published var details = ""
    @Published var types = ["vegetable", "meat","seafood", "fruits", "bread" , "milk","dairy-products" ,"spice" ,"canned-food" ,"snacks","cleaning-materials","PersonalHygiene","stationery"]
    @Published var  type = "vegetable"
    @Published var heightOptions = ["Item","L","mL", "kg" ,"g"]
    @Published var heights = ""
    @Published var price = ""
    @Published var currency = ""
    @Published var currencySymbol = ["$","€", "£" ,"¥"]
    func uploadProduct(withCaption name: String , quantity: String ,type: String ,currency: String ,price: String ,heights: String ,type2:String) {
        uploadProduct(name: name, quantity: quantity, type: type , currency: currency , price: price,heights:heights ,type2:type2) { success in
            if success {
            } else {
            }
        }
    }
    func uploadProduct(name: String,quantity: String,type: String, currency: String ,price:String,heights:String,type2:String,completion: @escaping(Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let data = ["uid": uid,
                            "name": name,
                             "quantity": quantity,
                             "type":type,
                             "heights":heights,
                             "price":price,
                             "currency": currency,
                             "type2":type2,
                            "timestamp": Timestamp(date: Date())] as [String: Any]
        Firestore.firestore()
                    .collection("product")
                    .document()
                    .setData(data) { error in
                        if let error = error {
                            completion(false)
                            return
                        }
                        completion(true)
                        }
    }
}
