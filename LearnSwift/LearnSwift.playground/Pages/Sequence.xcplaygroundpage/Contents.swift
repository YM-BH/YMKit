import Foundation

/// 学习 Sequence 相关内容
/// Swift 的 for...in 可以用在所有实现了 Sequence 协议的类型上
/// 为了实现 Sequence 首先需要实现 IteratorProtocol 协议
/// 下面实现了反向的 iterator 和 sequence

class ReverseIterator<T>: IteratorProtocol {

    typealias Element = T
    
    var array: [Element]
    var currentIndex = 0
    
    init(array: [Element]) {
        self.array = array
        currentIndex = array.count - 1
    }
    
    func next() -> Element? {
        if currentIndex < 0 {
            return nil
        } else {
            let element = array[currentIndex]
            currentIndex -= 1
            return element
        }
    }
    
}

struct ReverseSequence<T>: Sequence {

    var array: [T]
    
    init(array: [T]) {
        self.array = array
    }
    
    typealias Iterator = ReverseIterator<T>
    
    __consuming func makeIterator() -> ReverseIterator<T> {
        return ReverseIterator(array: self.array)
    }
}


let array = [1, 2, 3, 4]

for i in ReverseSequence(array: array) {
    print(i)
}

print("------------------------")

for i in array.reversed() {
    print(i)
}

print("------------------------")

func mapf(item: Int) -> Int {
    return item * 2
}

let newArray = array.map {$0 * 2}
print(newArray)


