; ModuleID = 'ranpi.c'
source_filename = "ranpi.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [16 x i8] c"Starting PI...\0A\00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c" x=%8.5f y=%8.5f low=%7d j=%7d\0A\00", align 1
@.str.2 = private unnamed_addr constant [33 x i8] c"Pi = %9.6f ztot=%12.2f itot=%8d\0A\00", align 1

; Function Attrs: nounwind uwtable
define dso_local i32 @main(i32 %0, i8** %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca float, align 4
  %7 = alloca float, align 4
  %8 = alloca float, align 4
  %9 = alloca float, align 4
  %10 = alloca float, align 4
  %11 = alloca float, align 4
  %12 = alloca float, align 4
  %13 = alloca float, align 4
  %14 = alloca float, align 4
  %15 = alloca i64, align 8
  %16 = alloca i64, align 8
  %17 = alloca i64, align 8
  %18 = alloca i64, align 8
  %19 = alloca i64, align 8
  store i32 0, i32* %3, align 4
  store i32 %0, i32* %4, align 4, !tbaa !3
  store i8** %1, i8*** %5, align 8, !tbaa !7
  %20 = bitcast float* %6 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %20) #3
  %21 = bitcast float* %7 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %21) #3
  %22 = bitcast float* %8 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %22) #3
  %23 = bitcast float* %9 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %23) #3
  %24 = bitcast float* %10 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %24) #3
  %25 = bitcast float* %11 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %25) #3
  %26 = bitcast float* %12 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %26) #3
  %27 = bitcast float* %13 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %27) #3
  %28 = bitcast float* %14 to i8*
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %28) #3
  %29 = bitcast i64* %15 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %29) #3
  %30 = bitcast i64* %16 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %30) #3
  %31 = bitcast i64* %17 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %31) #3
  %32 = bitcast i64* %18 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %32) #3
  %33 = bitcast i64* %19 to i8*
  call void @llvm.lifetime.start.p0i8(i64 8, i8* %33) #3
  %34 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str, i64 0, i64 0))
  store float 0.000000e+00, float* %6, align 4, !tbaa !9
  store i64 1, i64* %15, align 8, !tbaa !11
  store i64 1907, i64* %16, align 8, !tbaa !11
  store float 5.813000e+03, float* %7, align 4, !tbaa !9
  store float 1.307000e+03, float* %8, align 4, !tbaa !9
  store float 5.471000e+03, float* %9, align 4, !tbaa !9
  store i64 1200000, i64* %17, align 8, !tbaa !11
  store i64 1, i64* %18, align 8, !tbaa !11
  br label %35

35:                                               ; preds = %81, %2
  %36 = load i64, i64* %18, align 8, !tbaa !11
  %37 = load i64, i64* %17, align 8, !tbaa !11
  %38 = icmp sle i64 %36, %37
  br i1 %38, label %39, label %84

39:                                               ; preds = %35
  %40 = load i64, i64* %16, align 8, !tbaa !11
  %41 = mul nsw i64 27611, %40
  store i64 %41, i64* %19, align 8, !tbaa !11
  %42 = load i64, i64* %19, align 8, !tbaa !11
  %43 = load i64, i64* %19, align 8, !tbaa !11
  %44 = sdiv i64 %43, 74383
  %45 = mul nsw i64 74383, %44
  %46 = sub nsw i64 %42, %45
  store i64 %46, i64* %16, align 8, !tbaa !11
  %47 = load i64, i64* %16, align 8, !tbaa !11
  %48 = sitofp i64 %47 to float
  %49 = fpext float %48 to double
  %50 = fdiv double %49, 7.438300e+04
  %51 = fptrunc double %50 to float
  store float %51, float* %10, align 4, !tbaa !9
  %52 = load float, float* %8, align 4, !tbaa !9
  %53 = load float, float* %7, align 4, !tbaa !9
  %54 = fmul float %52, %53
  store float %54, float* %14, align 4, !tbaa !9
  %55 = load float, float* %14, align 4, !tbaa !9
  %56 = load float, float* %9, align 4, !tbaa !9
  %57 = load float, float* %14, align 4, !tbaa !9
  %58 = load float, float* %9, align 4, !tbaa !9
  %59 = fdiv float %57, %58
  %60 = fptosi float %59 to i64
  %61 = sitofp i64 %60 to float
  %62 = fmul float %56, %61
  %63 = fsub float %55, %62
  store float %63, float* %7, align 4, !tbaa !9
  %64 = load float, float* %7, align 4, !tbaa !9
  %65 = load float, float* %9, align 4, !tbaa !9
  %66 = fdiv float %64, %65
  store float %66, float* %11, align 4, !tbaa !9
  %67 = load float, float* %10, align 4, !tbaa !9
  %68 = load float, float* %10, align 4, !tbaa !9
  %69 = fmul float %67, %68
  %70 = load float, float* %11, align 4, !tbaa !9
  %71 = load float, float* %11, align 4, !tbaa !9
  %72 = fmul float %70, %71
  %73 = fadd float %69, %72
  store float %73, float* %12, align 4, !tbaa !9
  call void @myadd(float* %6, float* %12)
  %74 = load float, float* %12, align 4, !tbaa !9
  %75 = fpext float %74 to double
  %76 = fcmp ole double %75, 1.000000e+00
  br i1 %76, label %77, label %80

77:                                               ; preds = %39
  %78 = load i64, i64* %15, align 8, !tbaa !11
  %79 = add nsw i64 %78, 1
  store i64 %79, i64* %15, align 8, !tbaa !11
  br label %80

80:                                               ; preds = %77, %39
  br label %81

81:                                               ; preds = %80
  %82 = load i64, i64* %18, align 8, !tbaa !11
  %83 = add nsw i64 %82, 1
  store i64 %83, i64* %18, align 8, !tbaa !11
  br label %35, !llvm.loop !13

84:                                               ; preds = %35
  %85 = load float, float* %10, align 4, !tbaa !9
  %86 = fpext float %85 to double
  %87 = load float, float* %11, align 4, !tbaa !9
  %88 = fpext float %87 to double
  %89 = load i64, i64* %15, align 8, !tbaa !11
  %90 = load i64, i64* %18, align 8, !tbaa !11
  %91 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i64 0, i64 0), double %86, double %88, i64 %89, i64 %90)
  %92 = load i64, i64* %15, align 8, !tbaa !11
  %93 = sitofp i64 %92 to float
  %94 = fpext float %93 to double
  %95 = fmul double 4.000000e+00, %94
  %96 = load i64, i64* %17, align 8, !tbaa !11
  %97 = sitofp i64 %96 to float
  %98 = fpext float %97 to double
  %99 = fdiv double %95, %98
  %100 = fptrunc double %99 to float
  store float %100, float* %13, align 4, !tbaa !9
  %101 = load float, float* %13, align 4, !tbaa !9
  %102 = fpext float %101 to double
  %103 = load float, float* %6, align 4, !tbaa !9
  %104 = fpext float %103 to double
  %105 = load i64, i64* %17, align 8, !tbaa !11
  %106 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.2, i64 0, i64 0), double %102, double %104, i64 %105)
  %107 = bitcast i64* %19 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %107) #3
  %108 = bitcast i64* %18 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %108) #3
  %109 = bitcast i64* %17 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %109) #3
  %110 = bitcast i64* %16 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %110) #3
  %111 = bitcast i64* %15 to i8*
  call void @llvm.lifetime.end.p0i8(i64 8, i8* %111) #3
  %112 = bitcast float* %14 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %112) #3
  %113 = bitcast float* %13 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %113) #3
  %114 = bitcast float* %12 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %114) #3
  %115 = bitcast float* %11 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %115) #3
  %116 = bitcast float* %10 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %116) #3
  %117 = bitcast float* %9 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %117) #3
  %118 = bitcast float* %8 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %118) #3
  %119 = bitcast float* %7 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %119) #3
  %120 = bitcast float* %6 to i8*
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %120) #3
  ret i32 0
}

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #1

declare dso_local i32 @printf(i8*, ...) #2

; Function Attrs: nounwind uwtable
define dso_local void @myadd(float* %0, float* %1) #0 {
  %3 = alloca float*, align 8
  %4 = alloca float*, align 8
  store float* %0, float** %3, align 8, !tbaa !7
  store float* %1, float** %4, align 8, !tbaa !7
  %5 = load float*, float** %3, align 8, !tbaa !7
  %6 = load float, float* %5, align 4, !tbaa !9
  %7 = load float*, float** %4, align 8, !tbaa !7
  %8 = load float, float* %7, align 4, !tbaa !9
  %9 = fadd float %6, %8
  %10 = load float*, float** %3, align 8, !tbaa !7
  store float %9, float* %10, align 4, !tbaa !9
  ret void
}

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
!9 = !{!10, !10, i64 0}
!10 = !{!"float", !5, i64 0}
!11 = !{!12, !12, i64 0}
!12 = !{!"long", !5, i64 0}
!13 = distinct !{!13, !14, !15}
!14 = !{!"llvm.loop.mustprogress"}
!15 = !{!"llvm.loop.unroll.disable"}
