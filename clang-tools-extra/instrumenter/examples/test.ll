; ModuleID = './examples/test.cpp'
source_filename = "./examples/test.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@__const._Z11is_attackedi.coll = private unnamed_addr constant [3 x i32] [i32 1, i32 2, i32 3], align 4

; Function Attrs: mustprogress noinline optnone uwtable
define dso_local void @_Z11is_attackedi(i32 noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca [3 x i32], align 4
  %7 = alloca [3 x i32]*, align 8
  %8 = alloca i32*, align 8
  %9 = alloca i32*, align 8
  %10 = alloca i32, align 4
  %11 = alloca [3 x i32]*, align 8
  %12 = alloca i32*, align 8
  %13 = alloca i32*, align 8
  %14 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %15 = load i32, i32* %2, align 4
  %16 = load i32, i32* %3, align 4
  %17 = add nsw i32 %15, %16
  store i32 %17, i32* %2, align 4
  %18 = load i32, i32* %2, align 4
  %19 = load i32, i32* %2, align 4
  %20 = add nsw i32 %18, %19
  store i32 %20, i32* %2, align 4
  %21 = load i32, i32* %2, align 4
  %22 = add nsw i32 %21, 1
  call void @_Z11is_attackedi(i32 noundef %22)
  %23 = load i32, i32* %3, align 4
  call void @_Z11is_attackedi(i32 noundef %23)
  %24 = load i32, i32* %3, align 4
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %26, label %27

26:                                               ; preds = %1
  br label %137

27:                                               ; preds = %1
  %28 = load i32, i32* %3, align 4
  call void @_Z11is_attackedi(i32 noundef %28)
  %29 = load i32, i32* %2, align 4
  %30 = load i32, i32* %3, align 4
  %31 = add nsw i32 %29, %30
  store i32 %31, i32* %2, align 4
  %32 = load i32, i32* %3, align 4
  %33 = icmp ne i32 %32, 0
  br i1 %33, label %34, label %38

34:                                               ; preds = %27
  %35 = load i32, i32* %2, align 4
  %36 = load i32, i32* %3, align 4
  %37 = add nsw i32 %35, %36
  store i32 %37, i32* %2, align 4
  br label %42

38:                                               ; preds = %27
  %39 = load i32, i32* %2, align 4
  %40 = load i32, i32* %3, align 4
  %41 = add nsw i32 %39, %40
  store i32 %41, i32* %2, align 4
  br label %42

42:                                               ; preds = %38, %34
  br label %43

43:                                               ; preds = %47, %42
  %44 = load i32, i32* %2, align 4
  %45 = load i32, i32* %3, align 4
  %46 = add nsw i32 %44, %45
  store i32 %46, i32* %2, align 4
  br label %47

47:                                               ; preds = %43
  %48 = load i32, i32* %3, align 4
  %49 = icmp ne i32 %48, 0
  br i1 %49, label %43, label %50, !llvm.loop !6

50:                                               ; preds = %47
  br label %51

51:                                               ; preds = %55, %50
  %52 = load i32, i32* %2, align 4
  %53 = load i32, i32* %3, align 4
  %54 = add nsw i32 %52, %53
  store i32 %54, i32* %2, align 4
  br label %55

55:                                               ; preds = %51
  %56 = load i32, i32* %3, align 4
  %57 = icmp ne i32 %56, 0
  br i1 %57, label %51, label %58, !llvm.loop !8

58:                                               ; preds = %55
  br label %59

59:                                               ; preds = %62, %58
  %60 = load i32, i32* %3, align 4
  %61 = icmp ne i32 %60, 0
  br i1 %61, label %62, label %66

62:                                               ; preds = %59
  %63 = load i32, i32* %2, align 4
  %64 = load i32, i32* %3, align 4
  %65 = add nsw i32 %63, %64
  store i32 %65, i32* %2, align 4
  br label %59, !llvm.loop !9

66:                                               ; preds = %59
  br label %67

67:                                               ; preds = %70, %66
  %68 = load i32, i32* %3, align 4
  %69 = icmp ne i32 %68, 0
  br i1 %69, label %70, label %74

70:                                               ; preds = %67
  %71 = load i32, i32* %2, align 4
  %72 = load i32, i32* %3, align 4
  %73 = add nsw i32 %71, %72
  store i32 %73, i32* %2, align 4
  br label %67, !llvm.loop !10

74:                                               ; preds = %67
  store i32 0, i32* %4, align 4
  br label %75

75:                                               ; preds = %82, %74
  %76 = load i32, i32* %4, align 4
  %77 = icmp slt i32 %76, 10
  br i1 %77, label %78, label %85

78:                                               ; preds = %75
  %79 = load i32, i32* %2, align 4
  %80 = load i32, i32* %3, align 4
  %81 = add nsw i32 %79, %80
  store i32 %81, i32* %2, align 4
  br label %82

82:                                               ; preds = %78
  %83 = load i32, i32* %4, align 4
  %84 = add nsw i32 %83, 1
  store i32 %84, i32* %4, align 4
  br label %75, !llvm.loop !11

85:                                               ; preds = %75
  store i32 0, i32* %5, align 4
  br label %86

86:                                               ; preds = %93, %85
  %87 = load i32, i32* %5, align 4
  %88 = icmp slt i32 %87, 10
  br i1 %88, label %89, label %96

89:                                               ; preds = %86
  %90 = load i32, i32* %2, align 4
  %91 = load i32, i32* %3, align 4
  %92 = add nsw i32 %90, %91
  store i32 %92, i32* %2, align 4
  br label %93

93:                                               ; preds = %89
  %94 = load i32, i32* %5, align 4
  %95 = add nsw i32 %94, 1
  store i32 %95, i32* %5, align 4
  br label %86, !llvm.loop !12

96:                                               ; preds = %86
  %97 = bitcast [3 x i32]* %6 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* align 4 %97, i8* align 4 bitcast ([3 x i32]* @__const._Z11is_attackedi.coll to i8*), i64 12, i1 false)
  store [3 x i32]* %6, [3 x i32]** %7, align 8
  %98 = load [3 x i32]*, [3 x i32]** %7, align 8
  %99 = getelementptr inbounds [3 x i32], [3 x i32]* %98, i64 0, i64 0
  store i32* %99, i32** %8, align 8
  %100 = load [3 x i32]*, [3 x i32]** %7, align 8
  %101 = getelementptr inbounds [3 x i32], [3 x i32]* %100, i64 0, i64 0
  %102 = getelementptr inbounds i32, i32* %101, i64 3
  store i32* %102, i32** %9, align 8
  br label %103

103:                                              ; preds = %113, %96
  %104 = load i32*, i32** %8, align 8
  %105 = load i32*, i32** %9, align 8
  %106 = icmp ne i32* %104, %105
  br i1 %106, label %107, label %116

107:                                              ; preds = %103
  %108 = load i32*, i32** %8, align 8
  %109 = load i32, i32* %108, align 4
  store i32 %109, i32* %10, align 4
  %110 = load i32, i32* %2, align 4
  %111 = load i32, i32* %3, align 4
  %112 = add nsw i32 %110, %111
  store i32 %112, i32* %2, align 4
  br label %113

113:                                              ; preds = %107
  %114 = load i32*, i32** %8, align 8
  %115 = getelementptr inbounds i32, i32* %114, i32 1
  store i32* %115, i32** %8, align 8
  br label %103

116:                                              ; preds = %103
  store [3 x i32]* %6, [3 x i32]** %11, align 8
  %117 = load [3 x i32]*, [3 x i32]** %11, align 8
  %118 = getelementptr inbounds [3 x i32], [3 x i32]* %117, i64 0, i64 0
  store i32* %118, i32** %12, align 8
  %119 = load [3 x i32]*, [3 x i32]** %11, align 8
  %120 = getelementptr inbounds [3 x i32], [3 x i32]* %119, i64 0, i64 0
  %121 = getelementptr inbounds i32, i32* %120, i64 3
  store i32* %121, i32** %13, align 8
  br label %122

122:                                              ; preds = %132, %116
  %123 = load i32*, i32** %12, align 8
  %124 = load i32*, i32** %13, align 8
  %125 = icmp ne i32* %123, %124
  br i1 %125, label %126, label %135

126:                                              ; preds = %122
  %127 = load i32*, i32** %12, align 8
  %128 = load i32, i32* %127, align 4
  store i32 %128, i32* %14, align 4
  %129 = load i32, i32* %2, align 4
  %130 = load i32, i32* %3, align 4
  %131 = add nsw i32 %129, %130
  store i32 %131, i32* %2, align 4
  br label %132

132:                                              ; preds = %126
  %133 = load i32*, i32** %12, align 8
  %134 = getelementptr inbounds i32, i32* %133, i32 1
  store i32* %134, i32** %12, align 8
  br label %122

135:                                              ; preds = %122
  %136 = load i32, i32* %3, align 4
  call void @_Z11is_attackedi(i32 noundef %136)
  br label %137

137:                                              ; preds = %135, %26
  ret void
}

; Function Attrs: argmemonly nofree nounwind willreturn
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* noalias nocapture writeonly, i8* noalias nocapture readonly, i64, i1 immarg) #1

attributes #0 = { mustprogress noinline optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly nofree nounwind willreturn }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 1}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 14.0.0-++20220316013304+add3ab7f4c8a-1~exp1~20220316133356.105"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
