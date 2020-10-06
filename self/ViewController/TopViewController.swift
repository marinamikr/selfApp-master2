//
//  TopViewController.swift
//  self
//
//  Created by 原田摩利奈 on 2020/02/17.
//  Copyright © 2020 原田摩利奈. All rights reserved.
//

import UIKit
import Firebase

class TopViewController: UIViewController {
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var iconImageView: UIImageView!
    var selectedImage:UIImage!
    let userDefaults = UserDefaults.standard
    
    var DBRef:DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userDefaults.register(defaults: ["isFirst":false])
        
        nameTextField.delegate = self as! UITextFieldDelegate
        DBRef = Database.database().reference()
        
    }
    
    @IBAction func chooseIcon(_ sender: Any) {
        // カメラロールが利用可能か？
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            // 写真を選ぶビュー
            let pickerView = UIImagePickerController()
            // 写真の選択元をカメラロールにする
            // 「.camera」にすればカメラを起動できる
            pickerView.sourceType = .photoLibrary
            // デリゲート
            pickerView.delegate = self as! UIImagePickerControllerDelegate & UINavigationControllerDelegate
            // ビューに表示
            self.present(pickerView, animated: true)
        }
    }
    
    func uploadIcon(name: String,pic: UIImage){
        // strageの一番トップのReferenceを指定
        let storage = Storage.storage()
        let storageRef = storage.reference()
        
        //変数dataにpicをNSDataにしたものを指定
        if let data = Util.resizeImage(src: pic, max: 200).jpegData(compressionQuality: 0.8) {
            // トップReferenceの一つ下の固有IDの枝を指定
            let riversRef = storageRef.child(Util.getUUID()).child(String.getRandomStringWithLength(length: 60))
            
            // strageに画像をアップロード
            riversRef.putData(data, metadata: nil, completion: { metaData, error in
                guard let metadata = metaData else {
                    return
                }
                riversRef.downloadURL { (url, error) in
                    guard let downloadURL = url else {
                        return
                    }
                    let data = ["name": name,"iconURL": downloadURL] as [String : Any]
                    let ref = Database.database().reference()
                    ref.child(Util.getUUID()).child("userData").setValue(data)
                }
                
            })
            userDefaults.set(true, forKey: "isFirst")
            dismiss(animated: true, completion: nil)
        }
    }
    
    
    
    //
    //        func upload(name: String) {
    //            let ref = Database.database().reference()
    //            let data = ["name": name]
    //            ref.child("userData").child(Util.getUUID()).setValue(data)
    //            userDefaults.set(true, forKey: "isFirst")
    //            dismiss(animated: true, completion: nil)
    //
    //        }
    
    @IBAction func nextButton() {
        if nameTextField.text != "" && iconImageView.image != nil {
            uploadIcon(name: nameTextField.text!, pic: iconImageView.image!)
        } else {
            makeAleart(title: "名前を入力してください", message: "全て入力してください", okText: "OK")
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        return true
    }
    
    func makeAleart(title: String, message: String, okText: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okayButton = UIAlertAction(title: okText, style: UIAlertAction.Style.cancel, handler: nil)
        alert.addAction(okayButton)
        present(alert, animated: true, completion: nil)
    }
    
}

extension TopViewController :UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension TopViewController : UIImagePickerControllerDelegate ,UINavigationControllerDelegate {
    
    // 写真を選んだ後に呼ばれる処理
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        selectedImage = info[.originalImage] as? UIImage
        // ビューに表示する
        self.iconImageView.image = selectedImage
        
        // 写真を選ぶビューを引っ込める
        self.dismiss(animated: true)
    }
}
