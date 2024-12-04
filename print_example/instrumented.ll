; ModuleID = 'test.ll'
source_filename = "test.ll"

@0 = private unnamed_addr constant [19 x i8] c"function_trace.txt\00", align 1
@1 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@2 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@3 = private unnamed_addr constant [24 x i8] c"foo return value: %lld\0A\00", align 1
@4 = private unnamed_addr constant [19 x i8] c"function_trace.txt\00", align 1
@5 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@6 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@7 = private unnamed_addr constant [24 x i8] c"bat return value: %lld\0A\00", align 1
@8 = private unnamed_addr constant [19 x i8] c"function_trace.txt\00", align 1
@9 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@10 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@11 = private unnamed_addr constant [24 x i8] c"baz return value: %lld\0A\00", align 1

define i1 @foo() {
  br label %open

open:                                             ; preds = %0
  %1 = call ptr @fopen(ptr @0, ptr @2)
  %2 = icmp ne ptr %1, null
  br i1 %2, label %print, label %return

print:                                            ; preds = %open
  %3 = call i32 @fclose(ptr %1)
  %4 = call ptr @fopen(ptr @0, ptr @1)
  call void (ptr, ...) @fprintf(ptr %4, ptr @3, i1 false)
  %5 = call i32 @fclose(ptr %4)
  br label %return

return:                                           ; preds = %print, %open
  ret i1 false
}

define i32 @bat() {
  br label %open

open:                                             ; preds = %0
  %1 = call ptr @fopen(ptr @4, ptr @6)
  %2 = icmp ne ptr %1, null
  br i1 %2, label %print, label %return

print:                                            ; preds = %open
  %3 = call i32 @fclose(ptr %1)
  %4 = call ptr @fopen(ptr @4, ptr @5)
  call void (ptr, ...) @fprintf(ptr %4, ptr @7, i32 0)
  %5 = call i32 @fclose(ptr %4)
  br label %return

return:                                           ; preds = %print, %open
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
  br label %open

open:                                             ; preds = %end
  %2 = call ptr @fopen(ptr @8, ptr @10)
  %3 = icmp ne ptr %2, null
  br i1 %3, label %print, label %return

print:                                            ; preds = %open
  %4 = call i32 @fclose(ptr %2)
  %5 = call ptr @fopen(ptr @8, ptr @9)
  call void (ptr, ...) @fprintf(ptr %5, ptr @11, i32 5)
  %6 = call i32 @fclose(ptr %5)
  br label %return

return:                                           ; preds = %print, %open
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

declare ptr @fopen(ptr, ptr)

declare void @fprintf(ptr, ...)

declare i32 @fclose(ptr)
