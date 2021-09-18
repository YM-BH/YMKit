//
//  LogViewController.swift
//  YMKit-Swift
//
//  Created by 白晗 on 2021/9/17.
//

import UIKit
import SnapKit

/// 学习 Swift 中的 Log 输出
class LogViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()

    }
    
    private func setupUI() {

        let contentLabel = UILabel()
        contentLabel.text = """
            在 Swift 中，可以使用 print 函数进行 log 的输出，但是这仅仅是内容的打印，在真实开发中，我们其实还是需要更多的信息
            比如 log 输出所在文件，行号，方法名等信息。
            Swift 的编译器为我们准备了一些很有用的编译符号，就可以用来处理我们的需求：
            #file      String 类型，包含这个符号的文件的路径
            #line      Int    类型，符号出现的行号
            #column    Int    类型，符号出现的列
            #function  String 类型，包含这个符号的方法名称
            
            log 的输出一般是在开发调试阶段，过多的输出会影响运行的性能。在 Release 版本中关闭控制台的输出很有必要。
            可以利用条件编译，在 Release 版本中，不会输出 log。使 log 方法变成一个空方法，在新版本的 LLVM 编译器遇到
            空方法的时候，会直接将这个方法去掉。
            """
        contentLabel.numberOfLines = 0
        view.addSubview(contentLabel)
        
        contentLabel.snp.makeConstraints { make in
            make.center.equalTo(view)
            make.left.equalTo(view).offset(16)
            make.right.equalTo(view).offset(-16)
        }
    }
}

/**
 在 Swift 中，可以使用 print 函数进行 log 的输出，但是这仅仅是内容的打印，在真实开发中，我们其实还是需要更多的信息
 比如 log 输出所在文件，行号，方法名等信息。
 Swift 的编译器为我们准备了一些很有用的编译符号，就可以用来处理我们的需求：
 #file      String 类型，包含这个符号的文件的路径
 #line      Int    类型，符号出现的行号
 #column    Int    类型，符号出现的列
 #function  String 类型，包含这个符号的方法名称
 
 log 的输出一般是在开发调试阶段，过多的输出会影响运行的性能。在 Release 版本中关闭控制台的输出很有必要。
 可以利用条件编译，在 Release 版本中，不会输出 log。使 log 方法变成一个空方法，在新版本的 LLVM 编译器遇到
 空方法的时候，会直接将这个方法去掉。
 */
