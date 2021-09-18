//
//  Macro.swift
//  YMKit-Swift
//
//  Created by 白晗 on 2021/9/18.
//

import UIKit

extension Double {
    /// 动画时长
    static let ANIMATION_DURATION = 0.25
    /// 时间间隔
    static var TIME_INTERVAL: Double { 1.0 }
}

extension UIColor {
    /// 主题色
    static let THEME_COLOR = UIColor.orange
}

extension UIFont {
    
    /// 设置系统字体
    /// - Parameters:
    ///   - size: 字体大小
    ///   - weight: 字体粗细，默认是 regular
    static func setSystemFont(_ size: CGFloat, weight: Weight = .regular) -> UIFont {
        systemFont(ofSize: size, weight: weight)
    }
}
