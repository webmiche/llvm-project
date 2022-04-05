; ModuleID = 'theoabort.ll'
source_filename = "theoabort.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@g1 = dso_local local_unnamed_addr global i32 0, align 4
@g2 = dso_local local_unnamed_addr global i32 0, align 4

; Function Attrs: mustprogress nofree norecurse nosync nounwind readonly uwtable willreturn
define dso_local i32 @foo(i32* noalias readnone %0, i32* noalias readnone %1) local_unnamed_addr #0 {
  %3 = icmp eq i32* %0, %1
  %4 = load i32, i32* @g2, align 4
  %5 = shl nsw i32 %4, 1
  %.0 = select i1 %3, i32 -1, i32 %5
  ret i32 %.0
}

attributes #0 = { mustprogress nofree norecurse nosync nounwind readonly uwtable willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"uwtable", i32 1}
!2 = !{!"Ubuntu clang version 13.0.1-++20220120110924+75e33f71c2da-1~exp1~20220120231001.58"}
