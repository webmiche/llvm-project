; ModuleID = 'april/4.c'
source_filename = "april/4.c"
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
  %17 = icmp ne i32 %16, 5
  br i1 %17, label %18, label %35

18:                                               ; preds = %3
  %19 = load %struct.Point*, %struct.Point** %7, align 8, !tbaa !3
  %20 = getelementptr inbounds %struct.Point, %struct.Point* %19, i32 0, i32 0
  store i32 50, i32* %20, align 4, !tbaa !9
  %21 = load %struct.Point*, %struct.Point** %7, align 8, !tbaa !3
  %22 = getelementptr inbounds %struct.Point, %struct.Point* %21, i32 0, i32 1
  store i32 100, i32* %22, align 4, !tbaa !11
  %23 = bitcast i32* %9 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %23) #2
  %24 = load %struct.Point*, %struct.Point** %7, align 8, !tbaa !3
  %25 = getelementptr inbounds %struct.Point, %struct.Point* %24, i32 0, i32 0
  %26 = load i32, i32* %25, align 4, !tbaa !9
  store i32 %26, i32* %9, align 4, !tbaa !7
  %27 = load i32, i32* %9, align 4, !tbaa !7
  %28 = icmp eq i32 %27, 50
  br i1 %28, label %29, label %30

29:                                               ; preds = %18
  store i32 -2, i32* %4, align 4
  store i32 1, i32* %10, align 4
  br label %31

30:                                               ; preds = %18
  store i32 0, i32* %10, align 4
  br label %31

31:                                               ; preds = %30, %29
  %32 = bitcast i32* %9 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %32) #2
  %33 = load i32, i32* %10, align 4
  switch i32 %33, label %46 [
    i32 0, label %34
  ]

34:                                               ; preds = %31
  br label %35

35:                                               ; preds = %34, %3
  %36 = load i32, i32* %8, align 4, !tbaa !7
  %37 = icmp eq i32 %36, 5
  br i1 %37, label %38, label %44

38:                                               ; preds = %35
  %39 = load i32*, i32** %6, align 8, !tbaa !3
  %40 = load i32*, i32** %5, align 8, !tbaa !3
  %41 = icmp eq i32* %39, %40
  br i1 %41, label %42, label %43

42:                                               ; preds = %38
  store i32 -1, i32* %4, align 4
  store i32 1, i32* %10, align 4
  br label %46

43:                                               ; preds = %38
  br label %44

44:                                               ; preds = %43, %35
  %45 = load i32, i32* %8, align 4, !tbaa !7
  store i32 %45, i32* %4, align 4
  store i32 1, i32* %10, align 4
  br label %46

46:                                               ; preds = %44, %42, %31
  %47 = bitcast i32* %8 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %47) #2
  %48 = load i32, i32* %4, align 4
  ret i32 %48
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
!9 = !{!10, !8, i64 0}
!10 = !{!"Point", !8, i64 0, !8, i64 4}
!11 = !{!10, !8, i64 4}
