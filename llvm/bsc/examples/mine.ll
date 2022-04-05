; ModuleID = 'mine.c'
source_filename = "mine.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"%d\00", align 1

; Function Attrs: nounwind uwtable
define dso_local i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32*, align 8
  %4 = alloca i32*, align 8
  %5 = alloca i32, align 4
  %6 = bitcast i32* %1 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %6) #3
  store i32 0, i32* %1, align 4, !tbaa !3
  %7 = bitcast i32* %2 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %7) #3
  store i32 0, i32* %2, align 4, !tbaa !3
  %8 = call i32 (i32*, i32*, ...) bitcast (i32 (...)* @foo to i32 (i32*, i32*, ...)*)(i32* %1, i32* %2)
  %9 = bitcast i32** %3 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %9) #3
  store i32* %1, i32** %3, align 8, !tbaa !7
  %10 = bitcast i32** %4 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %10) #3
  store i32* %2, i32** %4, align 8, !tbaa !7
  %11 = load i32*, i32** %3, align 8, !tbaa !7
  store i32 5, i32* %11, align 4, !tbaa !3
  %12 = load i32*, i32** %4, align 8, !tbaa !7
  store i32 10, i32* %12, align 4, !tbaa !3
  %13 = bitcast i32* %5 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %13) #3
  %14 = load i32*, i32** %3, align 8, !tbaa !7
  %15 = load i32, i32* %14, align 4, !tbaa !3
  store i32 %15, i32* %5, align 4, !tbaa !3
  %16 = load i32, i32* %5, align 4, !tbaa !3
  %17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i64 0, i64 0), i32 %16)
  %18 = bitcast i32* %5 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %18) #3
  %19 = bitcast i32** %4 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %19) #3
  %20 = bitcast i32** %3 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %20) #3
  %21 = bitcast i32* %2 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %21) #3
  %22 = bitcast i32* %1 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %22) #3
  ret i32 0
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

declare dso_local i32 @foo(...) #2

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #1

attributes #0 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly nofree nosync nounwind willreturn }
attributes #2 = { "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1}
!llvm.ident = !{!2}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"uwtable", i32 1}
!2 = !{!"Ubuntu clang version 13.0.1-++20211108052949+d5159b99105d-1~exp1~20211108173542.20"}
!3 = !{!4, !4, i64 0}
!4 = !{!"int", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C/C++ TBAA"}
!7 = !{!8, !8, i64 0}
!8 = !{!"any pointer", !5, i64 0}
