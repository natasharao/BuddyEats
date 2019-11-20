//
//  ProfileViewController.swift
//  BuddyEats2.0
//
//  Created by Natasha Rao on 9/14/19.
//  Copyright © 2019 Natasha Rao. All rights reserved.
//
/*
import UIKit
class ProfileViewController: UIView {
 
    let nibName = "ReusableCustomView"
    var contentView: UIView?
 
    @IBOutlet weak var label: UILabel!
    @IBAction func buttonTap(_ sender: UIButton) {
        label.text = "Hi"
    }
 
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
 
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
        contentView = view
    }
 
    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
}
 */
 import UIKit

 class ProfileViewController:
UIViewController {
 
    @IBAction func goEat(_ sender: UIButton) {
    }
    @IBAction func goProfile(_ sender: Any) {
    }
    override func viewDidLoad() {
 super.viewDidLoad()
 
 // Do any additional setup after loading the view.
 }
 
 
    @IBAction func MessageBuddy(_ sender: Any) {
    }
    /*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */
 
 }

