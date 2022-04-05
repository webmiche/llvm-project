; ModuleID = 'april/6.c'
source_filename = "april/6.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define dso_local i32 @foo(i32* %0, i32* %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32*, align 8
  %5 = alloca i32*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32* %0, i32** %4, align 8, !tbaa !3
  store i32* %1, i32** %5, align 8, !tbaa !3
  %8 = load i32*, i32** %4, align 8, !tbaa !3
  store i32 5, i32* %8, align 4, !tbaa !7
  %9 = load i32*, i32** %5, align 8, !tbaa !3
  store i32 10, i32* %9, align 4, !tbaa !7
  %10 = bitcast i32* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %10) #2
  %11 = load i32*, i32** %4, align 8, !tbaa !3
  %12 = load i32, i32* %11, align 4, !tbaa !7
  store i32 %12, i32* %6, align 4, !tbaa !7
  %13 = load i32, i32* %6, align 4, !tbaa !7
  %14 = icmp eq i32 %13, 5
  br i1 %14, label %15, label %16

15:                                               ; preds = %2
  store i32 2, i32* %3, align 4
  store i32 1, i32* %7, align 4
  br label %18

16:                                               ; preds = %2
  %17 = load i32, i32* %6, align 4, !tbaa !7
  store i32 %17, i32* %3, align 4
  store i32 1, i32* %7, align 4
  br label %18

18:                                               ; preds = %16, %15
  %19 = bitcast i32* %6 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %19) #2
  %20 = load i32, i32* %3, align 4
  ret i32 %20
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly nofree nosync nounwind willreturn }
attributes #2 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"uwtable", i32 1}
!2 = !{!"Ubuntu clang version 13.0.1-++20220120110924+75e33f71c2da-1~exp1~20220120231001.58"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"int", !5, i64 0}
