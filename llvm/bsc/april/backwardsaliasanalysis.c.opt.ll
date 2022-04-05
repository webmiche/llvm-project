; ModuleID = 'april/backwardsaliasanalysis.c.ll'
source_filename = "april/backwardsaliasanalysis.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Point = type { i32, i32 }

; Function Attrs: mustprogress nofree norecurse nosync nounwind uwtable willreturn
define dso_local i32 @foo(i32* nocapture %0, i32* nocapture writeonly %1, %struct.Point* nocapture readnone %2) local_unnamed_addr #0 {
  store i32 5, i32* %0, align 4, !tbaa !3
  store i32 10, i32* %1, align 4, !tbaa !3
  %4 = load i32, i32* %0, align 4, !tbaa !3
  %5 = icmp eq i32 %4, 5
  br i1 %5, label %6, label %8

6:                                                ; preds = %3
  store i32 50, i32* %0, align 4, !tbaa !3
  store i32 100, i32* %1, align 4, !tbaa !3
  %7 = load i32, i32* %0, align 4, !tbaa !3
  br label %8

8:                                                ; preds = %3, %6
  %.0 = phi i32 [ %7, %6 ], [ %4, %3 ]
  ret i32 %.0
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind uwtable willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"uwtable", i32 1}
!2 = !{!"Ubuntu clang version 13.0.1-++20220120110924+75e33f71c2da-1~exp1~20220120231001.58"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
