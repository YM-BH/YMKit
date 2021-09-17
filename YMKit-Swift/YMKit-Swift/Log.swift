//
//  Log.swift
//  YMKit-Swift
//
//  Created by 白晗 on 2021/9/17.
//

import Foundation

func printLog<T>(_ message: T, file: String = #file, method: String = #function, line: Int = #line ) {
    #if DEBUG
    print("\((file as NSString).lastPathComponent) 行号：\(line) 方法名：\(method)：\(message)")
    #endif
}
