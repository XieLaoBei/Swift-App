//
//  AddTableViewController.swift
//  FoodPin
//
//  Created by LaoBei Xie on 05/02/2017.
//  Copyright © 2017 LaoBeiXie. All rights reserved.
//

import UIKit

class AddTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var typeTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle { get { return .lightContent}}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.contentMode = UIViewContentMode.scaleAspectFill
        imageView.clipsToBounds = true

    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            
        choosePictureSource()
            
        }
        // improve selectd Row animation
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    func choosePictureSource () {
        let shareMenu = UIAlertController(title: nil, message: "Pick image using", preferredStyle: .actionSheet)
        let album = UIAlertAction(title: "Album", style: UIAlertActionStyle.default, handler:  {
            (UIAlertAction) in
            let imagePicker = UIImagePickerController()
            imagePicker.allowsEditing = false
            imagePicker.sourceType = .photoLibrary
            imagePicker.delegate = self
            self.present(imagePicker, animated: true, completion: nil)
        })
        
        let takePhoto = UIAlertAction(title: "Camera", style: UIAlertActionStyle.default) {(UIAlertAction) in
            let imagePicker = UIImagePickerController()
            imagePicker.allowsEditing = false
            imagePicker.sourceType = .camera
            imagePicker.delegate = self
            self.present(imagePicker, animated: true, completion: nil)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil)
        
        shareMenu.addAction(album)
        shareMenu.addAction(takePhoto)
        shareMenu.addAction(cancelAction)
        
        self.present(shareMenu, animated:true, completion: nil)
    }

    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.imageView.image = image
            
        }
        dismiss(animated: true, completion: nil)
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


   
}
