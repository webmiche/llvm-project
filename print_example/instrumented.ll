; ModuleID = 'test.ll'
source_filename = "test.ll"

@initfoo = private constant i32 0
@0 = private unnamed_addr constant [19 x i8] c"function_trace.txt\00", align 1
@1 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@2 = private unnamed_addr constant [10 x i8] c"foo %lld\0A\00", align 1
@initbat = private constant i32 0
@3 = private unnamed_addr constant [10 x i8] c"bat %lld\0A\00", align 1
@initbaz = private constant i32 0
@4 = private unnamed_addr constant [10 x i8] c"baz %lld\0A\00", align 1

define i1 @foo() {
  br label %access_check

access_check:                                     ; preds = %0
  %1 = load i32, ptr @initfoo, align 4
  %2 = icmp eq i32 %1, 1
  br i1 %2, label %print, label %no_init_check

no_init_check:                                    ; preds = %access_check
  %3 = icmp eq i32 %1, -1
  br i1 %3, label %return, label %access

access:                                           ; preds = %no_init_check
  %4 = call i32 @access(ptr @0, i32 0)
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %update, label %no_access

update:                                           ; preds = %access
  store i32 1, ptr @initfoo, align 4
  br label %print

no_access:                                        ; preds = %access
  store i32 -1, ptr @initfoo, align 4
  br label %return

print:                                            ; preds = %update, %access_check
  %6 = call ptr @fopen(ptr @0, ptr @1)
  call void (ptr, ...) @fprintf(ptr %6, ptr @2, i1 false)
  %7 = call i32 @fclose(ptr %6)
  br label %return

return:                                           ; preds = %print, %no_access, %no_init_check
  ret i1 false
}

define i32 @bat() {
  br label %access_check

access_check:                                     ; preds = %0
  %1 = load i32, ptr @initbat, align 4
  %2 = icmp eq i32 %1, 1
  br i1 %2, label %print, label %no_init_check

no_init_check:                                    ; preds = %access_check
  %3 = icmp eq i32 %1, -1
  br i1 %3, label %return, label %access

access:                                           ; preds = %no_init_check
  %4 = call i32 @access(ptr @0, i32 0)
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %update, label %no_access

update:                                           ; preds = %access
  store i32 1, ptr @initbat, align 4
  br label %print

no_access:                                        ; preds = %access
  store i32 -1, ptr @initbat, align 4
  br label %return

print:                                            ; preds = %update, %access_check
  %6 = call ptr @fopen(ptr @0, ptr @1)
  call void (ptr, ...) @fprintf(ptr %6, ptr @3, i32 0)
  %7 = call i32 @fclose(ptr %6)
  br label %return

return:                                           ; preds = %print, %no_access, %no_init_check
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
  br label %access_check

access_check:                                     ; preds = %end
  %2 = load i32, ptr @initbaz, align 4
  %3 = icmp eq i32 %2, 1
  br i1 %3, label %print, label %no_init_check

no_init_check:                                    ; preds = %access_check
  %4 = icmp eq i32 %2, -1
  br i1 %4, label %return, label %access

access:                                           ; preds = %no_init_check
  %5 = call i32 @access(ptr @0, i32 0)
  %6 = icmp eq i32 %5, 0
  br i1 %6, label %update, label %no_access

update:                                           ; preds = %access
  store i32 1, ptr @initbaz, align 4
  br label %print

no_access:                                        ; preds = %access
  store i32 -1, ptr @initbaz, align 4
  br label %return

print:                                            ; preds = %update, %access_check
  %7 = call ptr @fopen(ptr @0, ptr @1)
  call void (ptr, ...) @fprintf(ptr %7, ptr @4, i32 5)
  %8 = call i32 @fclose(ptr %7)
  br label %return

return:                                           ; preds = %print, %no_access, %no_init_check
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
