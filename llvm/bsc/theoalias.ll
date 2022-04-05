; ModuleID = 'theoalias.c'
source_filename = "theoalias.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@g1 = dso_local global i32 0, align 4
@g2 = dso_local global i32 0, align 4

; Function Attrs: nounwind uwtable
define dso_local i32 @foo(i32* noalias %0, i32* noalias %1) #0 {
  %3 = alloca i32*, align 8
  %4 = alloca i32*, align 8
  %5 = alloca i32*, align 8
  %6 = alloca i32*, align 8
  store i32* %0, i32** %3, align 8, !tbaa !3
  store i32* %1, i32** %4, align 8, !tbaa !3
  %7 = bitcast i32** %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %7) #2
  store i32* @g1, i32** %5, align 8, !tbaa !3
  %8 = bitcast i32** %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %8) #2
  store i32* @g1, i32** %6, align 8, !tbaa !3
  %9 = load i32*, i32** %3, align 8, !tbaa !3
  %10 = load i32*, i32** %4, align 8, !tbaa !3
  %11 = icmp ne i32* %9, %10
  br i1 %11, label %12, label %14

12:                                               ; preds = %2
  %13 = load i32*, i32** %6, align 8, !tbaa !3
  store i32* %13, i32** %5, align 8, !tbaa !3
  br label %14

14:                                               ; preds = %12, %2
  %15 = load i32*, i32** %5, align 8, !tbaa !3
  %16 = load i32, i32* %15, align 4, !tbaa !7
  %17 = load i32*, i32** %6, align 8, !tbaa !3
  %18 = load i32, i32* %17, align 4, !tbaa !7
  %19 = add nsw i32 %16, %18
  %20 = bitcast i32** %6 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %20) #2
  %21 = bitcast i32** %5 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %21) #2
  ret i32 %19
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
