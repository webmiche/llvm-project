; ModuleID = 'april/backwardsaliasanalysis.c'
source_filename = "april/backwardsaliasanalysis.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.Point = type { i32, i32 }

; Function Attrs: nounwind uwtable
define dso_local i32 @foo(i32* %0, i32* %1, %struct.Point* %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32*, align 8
  %6 = alloca i32*, align 8
  %7 = alloca %struct.Point*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store i32* %0, i32** %5, align 8, !tbaa !3
  store i32* %1, i32** %6, align 8, !tbaa !3
  store %struct.Point* %2, %struct.Point** %7, align 8, !tbaa !3
  %11 = load i32*, i32** %5, align 8, !tbaa !3
  store i32 5, i32* %11, align 4, !tbaa !7
  %12 = load i32*, i32** %6, align 8, !tbaa !3
  store i32 10, i32* %12, align 4, !tbaa !7
  %13 = bitcast i32* %8 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %13) #2
  %14 = load i32*, i32** %5, align 8, !tbaa !3
  %15 = load i32, i32* %14, align 4, !tbaa !7
  store i32 %15, i32* %8, align 4, !tbaa !7
  %16 = load i32, i32* %8, align 4, !tbaa !7
  %17 = icmp eq i32 %16, 5
  br i1 %17, label %18, label %26

18:                                               ; preds = %3
  %19 = load i32*, i32** %5, align 8, !tbaa !3
  store i32 50, i32* %19, align 4, !tbaa !7
  %20 = load i32*, i32** %6, align 8, !tbaa !3
  store i32 100, i32* %20, align 4, !tbaa !7
  %21 = bitcast i32* %9 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %21) #2
  %22 = load i32*, i32** %5, align 8, !tbaa !3
  %23 = load i32, i32* %22, align 4, !tbaa !7
  store i32 %23, i32* %9, align 4, !tbaa !7
  %24 = load i32, i32* %9, align 4, !tbaa !7
  store i32 %24, i32* %4, align 4
  store i32 1, i32* %10, align 4
  %25 = bitcast i32* %9 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %25) #2
  br label %28

26:                                               ; preds = %3
  %27 = load i32, i32* %8, align 4, !tbaa !7
  store i32 %27, i32* %4, align 4
  store i32 1, i32* %10, align 4
  br label %28

28:                                               ; preds = %26, %18
  %29 = bitcast i32* %8 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %29) #2
  %30 = load i32, i32* %4, align 4
  ret i32 %30
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
