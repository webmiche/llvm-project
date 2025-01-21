; ModuleID = 'test.ll'
source_filename = "test.ll"

%Tracker = type { ptr, i64, ptr }

@0 = private unnamed_addr constant [5 x i8] c"%s: \00", align 1
@file_permission = private unnamed_addr constant [2 x i8] c"a\00", align 1
@instr_file = private unnamed_addr constant [19 x i8] c"function_trace.txt\00", align 1
@1 = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@instr_file.1 = private unnamed_addr constant [19 x i8] c"function_trace.txt\00", align 1
@llvm.global_dtors = appending global [1 x { i32, ptr, ptr }] [{ i32, ptr, ptr } { i32 0, ptr @_GLOBAL__destructor_test.ll, ptr null }]
@foo_name = private unnamed_addr constant [5 x i8] c"foo \00", align 1
@foo_tracker = private global %Tracker zeroinitializer
@bat_name = private unnamed_addr constant [5 x i8] c"bat \00", align 1
@bat_tracker = private global %Tracker zeroinitializer
@baz_name = private unnamed_addr constant [5 x i8] c"baz \00", align 1
@baz_tracker = private global %Tracker zeroinitializer

define i1 @foo() {
  call void @add(ptr @foo_tracker, i64 0, ptr @foo_name)
  ret i1 false
}

define i32 @bat() {
  call void @add(ptr @bat_tracker, i64 0, ptr @bat_name)
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
  call void @add(ptr @baz_tracker, i64 5, ptr @baz_name)
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

define private void @Constructor(ptr %0, ptr %1) {
entry:
  %2 = getelementptr inbounds %Tracker, ptr %0, i32 0, i32 1
  store i64 0, ptr %2, align 4
  %3 = call ptr @malloc(i64 800)
  %4 = getelementptr inbounds %Tracker, ptr %0, i32 0, i32 0
  store ptr %3, ptr %4, align 8
  %5 = getelementptr inbounds %Tracker, ptr %0, i32 0, i32 2
  store ptr %1, ptr %5, align 8
  ret void
}

declare ptr @malloc(i64)

define private void @print(ptr %0) {
entry:
  %1 = icmp eq ptr %0, null
  br i1 %1, label %then, label %else

then:                                             ; preds = %entry
  ret void

else:                                             ; preds = %entry
  %2 = getelementptr inbounds %Tracker, ptr %0, i32 0, i32 2
  %3 = load ptr, ptr %2, align 8
  %4 = call ptr @fopen(ptr @instr_file, ptr @file_permission)
  call void (ptr, ...) @fprintf(ptr %4, ptr @0, ptr %3)
  %5 = getelementptr inbounds %Tracker, ptr %0, i32 0, i32 1
  %6 = load i64, ptr %5, align 4
  %7 = getelementptr inbounds %Tracker, ptr %0, i32 0, i32 0
  %8 = load ptr, ptr %7, align 8
  br label %loop

loop:                                             ; preds = %loop, %else
  %9 = phi i64 [ 0, %else ], [ %12, %loop ]
  %10 = getelementptr ptr, ptr %8, i64 %9
  %11 = load i64, ptr %10, align 4
  call void (ptr, ...) @fprintf(ptr %4, ptr @1, i64 %11)
  %12 = add i64 %9, 1
  %13 = icmp eq i64 %12, %6
  br i1 %13, label %end, label %loop

end:                                              ; preds = %loop
  call void (ptr, ...) @fprintf(ptr %4, ptr @2)
  %14 = call i32 @fclose(ptr %4)
  ret void
}

declare i32 @fclose(ptr)

declare ptr @fopen(ptr, ptr)

declare void @fprintf(ptr, ...)

define private void @add(ptr %0, i64 %1, ptr %2) {
entry:
  %3 = load i64, ptr %0, align 4
  %4 = icmp eq i64 %3, -1
  br i1 %4, label %neg, label %else

neg:                                              ; preds = %entry
  ret void

else:                                             ; preds = %entry
  %5 = icmp eq i64 %3, 0
  br i1 %5, label %null, label %not_null

null:                                             ; preds = %else
  %6 = call i32 @access(ptr @instr_file.1, i32 0)
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %access, label %non_access

not_null:                                         ; preds = %access, %else
  %8 = getelementptr inbounds %Tracker, ptr %0, i32 0, i32 1
  %9 = load i64, ptr %8, align 4
  %10 = getelementptr inbounds %Tracker, ptr %0, i32 0, i32 0
  %11 = load ptr, ptr %10, align 8
  %12 = getelementptr ptr, ptr %11, i64 %9
  store i64 %1, ptr %12, align 4
  %13 = add i64 %9, 1
  store i64 %13, ptr %8, align 4
  %14 = icmp eq i64 %13, 100
  br i1 %14, label %then, label %end

access:                                           ; preds = %null
  call void @Constructor(ptr %0, ptr %2)
  br label %not_null

non_access:                                       ; preds = %null
  store i64 -1, ptr %0, align 4
  ret void

then:                                             ; preds = %not_null
  call void @print(ptr %0)
  store i64 0, ptr %8, align 4
  br label %end

end:                                              ; preds = %then, %not_null
  ret void
}

declare i32 @access(ptr, i32)

define private void @Destructor(ptr %0) {
entry:
  %1 = load i64, ptr %0, align 4
  %2 = icmp eq i64 %1, 0
  %3 = icmp eq i64 %1, -1
  %4 = or i1 %2, %3
  br i1 %4, label %then, label %else

then:                                             ; preds = %entry
  ret void

else:                                             ; preds = %entry
  call void @print(ptr %0)
  %5 = getelementptr inbounds %Tracker, ptr %0, i32 0, i32 0
  %6 = load ptr, ptr %5, align 8
  %7 = icmp eq ptr %6, null
  br i1 %7, label %end, label %then1

then1:                                            ; preds = %else
  call void @_ZdaPv(ptr %6)
  br label %end

end:                                              ; preds = %then1, %else
  ret void
}

declare void @_ZdaPv(ptr)

define private void @__cxx_global_var_destruct() section ".text.startup" {
entry:
  call void @Destructor(ptr @baz_tracker)
  call void @Destructor(ptr @bat_tracker)
  call void @Destructor(ptr @foo_tracker)
  ret void
}

define private void @_GLOBAL__destructor_test.ll() section ".text.startup" {
entry:
  call void @__cxx_global_var_destruct()
  ret void
}
