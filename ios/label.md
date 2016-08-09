http://www.apptuitions.com/programmatically-creating-uibuttonuilabeluitextfield-using-swift/

Also,

override func viewDidLoad()
{
  super.viewDidLoad()
  var label = UILabel(frame: CGRectMake(0, 0, 200, 21))
  label.center = CGPointMake(160, 284)
  label.textAlignment = NSTextAlignment.Center
  label.text = "I'am a test label"
  self.view.addSubview(label)
}  



In iOS app development, sometime we need to add Textfields, textviews, labels etc programmatically. It gives you control over customizing styles, size and position of them. I’m going to place codes (swift Language) here so that you can get all of them from one place.
UITextField:

func textField() {
        let textField = UITextField(frame: CGRectMake(20.0, 30.0, 100.0, 30.0))
        textField.textAlignment = NSTextAlignment.Center
        textField.textColor = UIColor.blueColor()
        textField.borderStyle = UITextBorderStyle.Line
        textField.autocapitalizationType = UITextAutocapitalizationType.Words // If you need any capitalization
        self.view.addSubview(textField)
    }


TextView:

func textView() {
        let textView = UITextView(frame: CGRectMake(20.0, 30.0, 300.0, 30.0))
        textView.textAlignment = NSTextAlignment.Center
        textView.textColor = UIColor.blueColor()
        textView.backgroundColor = UIColor.redColor()
        self.view.addSubview(textView)
    }


Label:

    func textView() {
        let textView = UITextView(frame: CGRectMake(20.0, 30.0, 300.0, 30.0))
        textView.textAlignment = NSTextAlignment.Center
        textView.textColor = UIColor.blueColor()
        textView.backgroundColor = UIColor.redColor()
        self.view.addSubview(textView)
    }

