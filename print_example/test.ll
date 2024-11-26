define i1 @foo() {
  ret i1 false
}
define i32 @bat() {
  ret i32 0
}

define void @bar() {
  ret void
}

define i32 @baz() {
  %2 = call i1 @foo()
  br i1 %2, label %then, label %else

then:
  br label %end

else:
  br label %end

end:
  ret i32 5
}

define i32 @qux() {
  %2 = call i32 @bat()
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %then, label %else

then:
  br label %end

else:
  br label %end

end:
  ret i32 5
}

define i32 @quuz() {
  %2 = call i32 @baz()
  %3 = call i32 @bat()
  %4 = add i32 %2, %3
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %then, label %else

then:
  br label %end

else:
  br label %end

end:
  ret i32 5
}

define i32 @quux() {
  %2 = call i32 @bat()
  %3 = call i32 @bat()
  %4 = add i32 %2, %3
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %then, label %else

then:
  br label %end

else:
  br label %end

end:
  ret i32 5
}
