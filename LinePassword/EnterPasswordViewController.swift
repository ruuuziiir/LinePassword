//
//  EnterPasswordViewController.swift
//  LinePassword
//
//  Created by 7 on 2021/3/23.
//

import UIKit


class EnterPasswordViewController: UIViewController {
    
    
    @IBOutlet weak var statusLabel: UILabel!
    
    // UIButton 的 Outlet Collection
    @IBOutlet var numButton: [UIButton]!
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var passwordImage: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
    

    }
    
    // 圖片陣列
    let pics = ["0", "1", "2", "3", "4"]
    
    // 密碼
    let password = "1234"
    
    // 輸入密碼，初始值為空字串
    var keyin = ""
    
    
    // 計算輸入次數
    var count = 0
    
    // --------------------------------------------------------

    
    @IBAction func enterPassword(_ sender: UIButton) {
        
        // 次數 < 4 可以繼續輸入
        if count < 4 {
            
            
            let num = numButton.firstIndex(of: sender)
            keyin += String(num!)
            
            passwordImage.image = UIImage(named: pics[count + 1])
            // print(keyin) 可以檢查輸入情況
            
            // count + 1
            count += 1

        }
        
        // count == 4 ，判斷密碼正確與否
        if count == 4 {
            
            judge()
        }
    }
    
    
    // 刪除上個輸入的數字
    @IBAction func backspace(_ sender: Any) {
        
        if count != 0 {
            
            // button 可以按
            backButton.isEnabled = true
            
            count -= 1
            passwordImage.image = UIImage(named: pics[count])
            keyin.removeLast()
            // print(keyin) 可以檢查輸入情況
            
        } else {
            
            // button 不能按
            backButton.isEnabled = false
        }
    }
    
    // --------------------------------------------------------
    
    // 判斷密碼正不正確，判斷完畢會重置頁面
    func judge() {
        
        if keyin == password {
            statusLabel.text = "請輸入密碼。ˇ"
            self.performSegue(withIdentifier: "line", sender: self)

        }
        else {
            statusLabel.text = "密碼錯誤。"
        }
        
        // 重置設定
        count = 0
        passwordImage.image = UIImage(named: pics[count])
        keyin = ""
    }
    

    
    

}
