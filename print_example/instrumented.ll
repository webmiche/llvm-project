; ModuleID = 'test.ll'
source_filename = "test.ll"

%Tracker = type { ptr, i64, ptr }

@0 = private unnamed_addr constant [13 x i8] c"Tracker %s: \00", align 1
@file_permission = private unnamed_addr constant [2 x i8] c"a\00", align 1
@instr_file = private unnamed_addr constant [19 x i8] c"function_trace.txt\00", align 1
@1 = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@2 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@instr_file.1 = private unnamed_addr constant [19 x i8] c"function_trace.txt\00", align 1
@__dso_handle = external hidden global i8
@llvm.global_ctors = appending global [1 x { i32, ptr, ptr }] [{ i32, ptr, ptr } { i32 65535, ptr @_GLOBAL__sub_test.ll, ptr null }]
@foo_name = private unnamed_addr constant [5 x i8] c"foo \00", align 1
@foo_tracker = private global %Tracker zeroinitializer
@bat_name = private unnamed_addr constant [5 x i8] c"bat \00", align 1
@bat_tracker = private global %Tracker zeroinitializer
@baz_name = private unnamed_addr constant [5 x i8] c"baz \00", align 1
@baz_tracker = private global %Tracker zeroinitializer

define i1 @foo() {
  call void @add(ptr @foo_tracker, i64 0)
  ret i1 false
}

define i32 @bat() {
  call void @add(ptr @bat_tracker, i64 0)
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
  call void @add(ptr @baz_tracker, i64 5)
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

define linkonce_odr void @Constructor(ptr %0, ptr %1) {
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

define linkonce_odr void @print(ptr %0) {
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

define linkonce_odr void @add(ptr %0, i64 %1) {
entry:
  %2 = load i64, ptr %0, align 4
  %3 = icmp eq i64 %2, 0
  br i1 %3, label %null, label %else

null:                                             ; preds = %entry
  ret void

else:                                             ; preds = %entry
  %4 = getelementptr inbounds %Tracker, ptr %0, i32 0, i32 1
  %5 = load i64, ptr %4, align 4
  %6 = getelementptr inbounds %Tracker, ptr %0, i32 0, i32 0
  %7 = load ptr, ptr %6, align 8
  %8 = getelementptr ptr, ptr %7, i64 %5
  store i64 %1, ptr %8, align 4
  %9 = add i64 %5, 1
  store i64 %9, ptr %4, align 4
  %10 = icmp eq i64 %9, 100
  br i1 %10, label %then, label %end

then:                                             ; preds = %else
  call void @print(ptr %0)
  store i64 0, ptr %4, align 4
  br label %end

end:                                              ; preds = %then, %else
  ret void
}

define linkonce_odr void @Destructor(ptr %0) {
entry:
  call void @print(ptr %0)
  %1 = getelementptr inbounds %Tracker, ptr %0, i32 0, i32 0
  %2 = load ptr, ptr %1, align 8
  %3 = icmp eq ptr %2, null
  br i1 %3, label %end, label %then

then:                                             ; preds = %entry
  call void @_ZdaPv(ptr %2)
  br label %end

end:                                              ; preds = %then, %entry
  ret void
}

declare void @_ZdaPv(ptr)

define private void @__cxx_global_var_init() section ".text.startup" {
entry:
  %0 = call i32 @access(ptr @instr_file.1, i32 0)
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %then, label %end

then:                                             ; preds = %entry
  call void @Constructor(ptr @foo_tracker, ptr @foo_name)
  %2 = call i32 @__cxa_atexit(ptr @Destructor, ptr @foo_tracker, ptr @__dso_handle)
  call void @Constructor(ptr @bat_tracker, ptr @bat_name)
  %3 = call i32 @__cxa_atexit(ptr @Destructor, ptr @bat_tracker, ptr @__dso_handle)
  call void @Constructor(ptr @baz_tracker, ptr @baz_name)
  %4 = call i32 @__cxa_atexit(ptr @Destructor, ptr @baz_tracker, ptr @__dso_handle)
  ret void

end:                                              ; preds = %entry
  store i64 0, ptr @foo_tracker, align 4
  store i64 0, ptr @bat_tracker, align 4
  store i64 0, ptr @baz_tracker, align 4
  ret void
}

declare i32 @access(ptr, i32)

define private void @_GLOBAL__sub_test.ll() section ".text.startup" {
entry:
  call void @__cxx_global_var_init()
  ret void
}

declare i32 @__cxa_atexit(ptr, ptr, ptr)
