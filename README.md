<h1>IOS QR code generator example<h1>

```swift
let data = textToBeInQR.data(using: String.Encoding.ascii)
if let filter = CIFilter(name: "CIQRCodeGenerator"){
  filter.setValue(data, forKey: "inputMessage")
  let transform = CGAffineTransform(scaleX: 3, y:3)
  if let output = filter.outputImage?.applying(transform){
    qrImage = UIImage(ciImage: output)
  }
}       
```

