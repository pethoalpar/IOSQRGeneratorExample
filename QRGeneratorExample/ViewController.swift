//
//  ViewController.swift
//  QRGeneratorExample
//
//  Created by Petho Alpar on 14/06/2017.
//  Copyright © 2017 Petho Alpar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var editTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func generate(_ sender: Any) {
        let image = generateQrImage(from: editTextField.text!)
        imageView.image = image
    }
    
    func generateQrImage(from text: String) -> UIImage?{
        let data = text.data(using: String.Encoding.ascii)
        
        if let filter = CIFilter(name: "CIQRCodeGenerator"){
            filter.setValue(data, forKey: "inputMessage")
            let transform = CGAffineTransform(scaleX: 3, y:3)
            if let output = filter.outputImage?.applying(transform){
                return UIImage(ciImage: output)
            }
        }
        return nil
    }

}

