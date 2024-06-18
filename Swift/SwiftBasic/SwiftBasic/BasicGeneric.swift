//
//  BasicGeneric.swift
//  SwiftBasic
//
//  Created by 박승찬 on 6/18/24.
//

import SwiftUI

struct MyStack {
    var data: [Int] = []

    mutating func insertValue(input: Int) {
        data.append(input)
    }

    func showData() {
        data.forEach { item in
            print(item)
        }
    }
}

struct MyGenericStack<T> {
    var data: [T] = []

    mutating func insertValue(input: T) {
        data.append(input)
    }

    func showData() {
        data.forEach { item in
            print(item)
        }
    }

}

struct BasicGeneric: View {
    @State var input = ""
    @State var mystack = MyStack()
    @State var myGenericStack = MyGenericStack<String>()

    var body: some View {
        TextField("text를 입력하세요", text: $input)
        Button {
            mystack.insertValue(input: Int(input) ?? 0)
        } label: {
            Text("저장")
        }
        Button {
            mystack.showData()
        } label: {
            Text("데이터 보기")
        }

        Button {
            myGenericStack.insertValue(input: String(input))
        } label: {
            Text("제네릭 데이터 저장")
        }
        Button {
            myGenericStack.showData()
        } label: {
            Text("제네릭 데이터 보기")
        }

    }
}

#Preview {
    BasicGeneric()
}
