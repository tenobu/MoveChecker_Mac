//: Playground - noun: a place where people can play

import Cocoa

//  Write some awesome Swift code, or import libraries like "Foundation",
//  "Dispatch", or "Glibc"

var numbers = [1,4,2,3,6,5]

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

//names.sort(>)
let a = names.sort()

print(1, names)
print(2, a)

names.sort {$0 > $1}

print(2, names)
