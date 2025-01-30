; ModuleID = 'test.ll'
source_filename = "test.ll"

@0 = private unnamed_addr constant [19 x i8] c"function_trace.txt\00", align 1
@1 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@2 = private unnamed_addr constant [10 x i8] c"foo %lld\0A\00", align 1
@3 = private unnamed_addr constant [10 x i8] c"baz %lld\0A\00", align 1

define i1 @foo() {
  br label %access

access:                                           ; preds = %0
  %1 = call i32 @access(ptr @0, i32 0)
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %print, label %return

print:                                            ; preds = %access
  %3 = call ptr @fopen(ptr @0, ptr @1)
  call void (ptr, ...) @fprintf(ptr %3, ptr @2, i1 false)
  %4 = call i32 @fclose(ptr %3)
  br label %return

return:                                           ; preds = %print, %access
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
  br label %access

access:                                           ; preds = %end
  %2 = call i32 @access(ptr @0, i32 0)
  %3 = icmp eq i32 %2, 0
  br i1 %3, label %print, label %return

print:                                            ; preds = %access
  %4 = call ptr @fopen(ptr @0, ptr @1)
  call void (ptr, ...) @fprintf(ptr %4, ptr @3, i32 5)
  %5 = call i32 @fclose(ptr %4)
  br label %return

return:                                           ; preds = %print, %access
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

declare i32 @access(ptr, i32)

declare void @fprintf(ptr, ...)

declare i32 @fclose(ptr)

declare ptr @fopen(ptr, ptr)
