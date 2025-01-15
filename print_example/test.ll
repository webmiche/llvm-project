; ModuleID = 'test.ll'
source_filename = "test.ll"

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
  %1 = call i1 @foo()
  br i1 %1, label %then, label %else

then:                                             ; preds = %0
  br label %end

else:                                             ; preds = %0
  br label %end

end:                                              ; preds = %else, %then
  ret i32 5
}

define i32 @qux() {
  %1 = call i32 @bat()
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %then, label %else

then:                                             ; preds = %0
  br label %end

else:                                             ; preds = %0
  br label %end

end:                                              ; preds = %else, %then
  ret i32 5
}

define i32 @quuz() {
  %1 = call i32 @baz()
  %2 = call i32 @bat()
  %3 = add i32 %1, %2
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %then, label %else

then:                                             ; preds = %0
  br label %end

else:                                             ; preds = %0
  br label %end

end:                                              ; preds = %else, %then
  ret i32 5
}

define i32 @quux() {
  %1 = call i32 @bat()
  %2 = call i32 @bat()
  %3 = add i32 %1, %2
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %then, label %else

then:                                             ; preds = %0
  br label %end

else:                                             ; preds = %0
  br label %end

end:                                              ; preds = %else, %then
  ret i32 5
}
