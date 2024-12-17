; ModuleID = 'class_idea.cpp'
source_filename = "class_idea.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%class.Tracker = type { ptr, i64, ptr }

@foo_name = dso_local global [4 x i8] c"foo\00", align 1
@foo_tracker = dso_local global %class.Tracker zeroinitializer, align 8
@bat_name = dso_local global [4 x i8] c"bat\00", align 1
@bat_tracker = dso_local global %class.Tracker zeroinitializer, align 8
@baz_name = dso_local global [4 x i8] c"baz\00", align 1
@baz_tracker = dso_local global %class.Tracker zeroinitializer, align 8
@__dso_handle = external hidden global i8
@.str = private unnamed_addr constant [13 x i8] c"Tracker %s: \00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"%ld \00", align 1
@llvm.global_ctors = appending global [1 x { i32, ptr, ptr }] [{ i32, ptr, ptr } { i32 65535, ptr @_GLOBAL__sub_I_class_idea.cpp, ptr null }]

; Function Attrs: noinline nounwind sspstrong uwtable
define internal fastcc void @__cxx_global_var_init() unnamed_addr #0 section ".text.startup" {
  tail call void @_ZN7TrackerC2EPc(ptr noundef nonnull align 8 dereferenceable(24) @foo_tracker, ptr noundef nonnull @foo_name)
  tail call void @_ZN7TrackerC2EPc(ptr noundef nonnull align 8 dereferenceable(24) @bat_tracker, ptr noundef nonnull @bat_name)
  tail call void @_ZN7TrackerC2EPc(ptr noundef nonnull align 8 dereferenceable(24) @baz_tracker, ptr noundef nonnull @baz_name)
  %1 = tail call i32 @__cxa_atexit(ptr nonnull @_ZN7TrackerD2Ev, ptr nonnull @foo_tracker, ptr nonnull @__dso_handle) #9
  %2 = tail call i32 @__cxa_atexit(ptr nonnull @_ZN7TrackerD2Ev, ptr nonnull @bat_tracker, ptr nonnull @__dso_handle) #9
  %3 = tail call i32 @__cxa_atexit(ptr nonnull @_ZN7TrackerD2Ev, ptr nonnull @baz_tracker, ptr nonnull @__dso_handle) #9
  ret void
}

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr dso_local void @_ZN7TrackerC2EPc(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %1) unnamed_addr #1  align 2 {
  %3 = getelementptr inbounds %class.Tracker, ptr %0, i64 0, i32 1
  store i64 0, ptr %3, align 8, !tbaa !5
  %4 = tail call noalias dereferenceable_or_null(800) ptr @malloc(i64 noundef 800) #10
  store ptr %4, ptr %0, align 8, !tbaa !11
  %5 = getelementptr inbounds %class.Tracker, ptr %0, i64 0, i32 2
  store ptr %1, ptr %5, align 8, !tbaa !12
  ret void
}

; Function Attrs: mustprogress noinline nounwind sspstrong uwtable
define linkonce_odr dso_local void @_ZN7TrackerD2Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) unnamed_addr #1  align 2 personality ptr @__gxx_personality_v0 {
  invoke void @_ZN7Tracker5printEv(ptr noundef nonnull align 8 dereferenceable(24) %0)
          to label %2 unwind label %7

2:                                                ; preds = %1
  %3 = load ptr, ptr %0, align 8, !tbaa !11
  %4 = icmp eq ptr %3, null
  br i1 %4, label %6, label %5

5:                                                ; preds = %2
  tail call void @_ZdaPv(ptr noundef nonnull %3) #11
  br label %6

6:                                                ; preds = %5, %2
  ret void

7:                                                ; preds = %1
  %8 = landingpad { ptr, i32 }
          catch ptr null
  %9 = extractvalue { ptr, i32 } %8, 0
  tail call void @__clang_call_terminate(ptr %9) #12
  unreachable
}

; Function Attrs: nofree nounwind
declare i32 @__cxa_atexit(ptr, ptr, ptr) local_unnamed_addr #2

define i1 @foo() {
  tail call void @_ZN7Tracker3addEl(ptr noundef nonnull align 8 dereferenceable(24) @foo_tracker, i64 0)
  ret i1 false
}

define i32 @bat() {
  tail call void @_ZN7Tracker3addEl(ptr noundef nonnull align 8 dereferenceable(24) @bat_tracker, i64 0)
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
  tail call void @_ZN7Tracker3addEl(ptr noundef nonnull align 8 dereferenceable(24) @baz_tracker, i64 5)
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
; Function Attrs: mustprogress noinline sspstrong uwtable
define linkonce_odr dso_local void @_ZN7Tracker3addEl(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %1) local_unnamed_addr #3  align 2 {
  %3 = load ptr, ptr %0, align 8, !tbaa !11
  %4 = getelementptr inbounds %class.Tracker, ptr %0, i64 0, i32 1
  %5 = load i64, ptr %4, align 8, !tbaa !5
  %6 = getelementptr inbounds i64, ptr %3, i64 %5
  store i64 %1, ptr %6, align 8, !tbaa !13
  %7 = load i64, ptr %4, align 8, !tbaa !5
  %8 = add nsw i64 %7, 1
  store i64 %8, ptr %4, align 8, !tbaa !5
  %9 = icmp eq i64 %8, 100
  br i1 %9, label %10, label %11

10:                                               ; preds = %2
  tail call void @_ZN7Tracker5printEv(ptr noundef nonnull align 8 dereferenceable(24) %0)
  store i64 0, ptr %4, align 8, !tbaa !5
  br label %11

11:                                               ; preds = %10, %2
  ret void
}

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite)
declare noalias noundef ptr @malloc(i64 noundef) local_unnamed_addr #5

; Function Attrs: mustprogress noinline sspstrong uwtable
define linkonce_odr dso_local void @_ZN7Tracker5printEv(ptr noundef nonnull align 8 dereferenceable(24) %0) local_unnamed_addr #3  align 2 {
  %2 = getelementptr inbounds %class.Tracker, ptr %0, i64 0, i32 2
  %3 = load ptr, ptr %2, align 8, !tbaa !12
  %4 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str, ptr noundef %3)
  %5 = getelementptr inbounds %class.Tracker, ptr %0, i64 0, i32 1
  %6 = load i64, ptr %5, align 8, !tbaa !5
  %7 = icmp sgt i64 %6, 0
  br i1 %7, label %10, label %8

8:                                                ; preds = %10, %1
  %9 = tail call i32 @putchar(i32 10)
  ret void

10:                                               ; preds = %1, %10
  %11 = phi i64 [ %16, %10 ], [ 0, %1 ]
  %12 = load ptr, ptr %0, align 8, !tbaa !11
  %13 = getelementptr inbounds i64, ptr %12, i64 %11
  %14 = load i64, ptr %13, align 8, !tbaa !13
  %15 = tail call i32 (ptr, ...) @printf(ptr noundef nonnull dereferenceable(1) @.str.1, i64 noundef %14)
  %16 = add nuw nsw i64 %11, 1
  %17 = load i64, ptr %5, align 8, !tbaa !5
  %18 = icmp sgt i64 %17, %16
  br i1 %18, label %10, label %8, !llvm.loop !14
}

declare i32 @__gxx_personality_v0(...)

; Function Attrs: noinline noreturn nounwind sspstrong uwtable
define linkonce_odr hidden void @__clang_call_terminate(ptr noundef %0) local_unnamed_addr #6  {
  %2 = tail call ptr @__cxa_begin_catch(ptr %0) #9
  tail call void @_ZSt9terminatev() #12
  unreachable
}

declare ptr @__cxa_begin_catch(ptr) local_unnamed_addr

declare void @_ZSt9terminatev() local_unnamed_addr

; Function Attrs: nobuiltin nounwind
declare void @_ZdaPv(ptr noundef) local_unnamed_addr #7

; Function Attrs: nofree nounwind
declare noundef i32 @printf(ptr nocapture noundef readonly, ...) local_unnamed_addr #8

; Function Attrs: noinline nounwind sspstrong uwtable
define internal void @_GLOBAL__sub_I_class_idea.cpp() #0 section ".text.startup" {
  tail call fastcc void @__cxx_global_var_init()
  ret void
}

; Function Attrs: nofree nounwind
declare noundef i32 @putchar(i32 noundef) local_unnamed_addr #2

attributes #0 = { noinline nounwind sspstrong uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress noinline nounwind sspstrong uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nofree nounwind }
attributes #3 = { mustprogress noinline sspstrong uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { mustprogress noinline norecurse sspstrong uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { noinline noreturn nounwind sspstrong uwtable "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { nobuiltin nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { nounwind }
attributes #10 = { nounwind allocsize(0) }
attributes #11 = { builtin nounwind }
attributes #12 = { noreturn nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"clang version 18.1.8"}
!5 = !{!6, !10, i64 8}
!6 = !{!"_ZTS7Tracker", !7, i64 0, !10, i64 8, !7, i64 16}
!7 = !{!"any pointer", !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = !{!"long", !8, i64 0}
!11 = !{!6, !7, i64 0}
!12 = !{!6, !7, i64 16}
!13 = !{!10, !10, i64 0}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.mustprogress"}
