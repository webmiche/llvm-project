; ModuleID = 'april/source_var_test.c'
source_filename = "april/source_var_test.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@g = dso_local global i32 0, align 4, !dbg !0

; Function Attrs: nounwind uwtable
define dso_local i32 @foo(i32* noundef %0, i32* noundef %1, i32* noundef %2, i32* noundef %3) #0 !dbg !13 {
  %5 = alloca i32, align 4
  %6 = alloca i32*, align 8
  %7 = alloca i32*, align 8
  %8 = alloca i32*, align 8
  %9 = alloca i32*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store i32* %0, i32** %6, align 8, !tbaa !28
  call void @llvm.dbg.declare(metadata i32** %6, metadata !18, metadata !DIExpression()), !dbg !32
  store i32* %1, i32** %7, align 8, !tbaa !28
  call void @llvm.dbg.declare(metadata i32** %7, metadata !19, metadata !DIExpression()), !dbg !33
  store i32* %2, i32** %8, align 8, !tbaa !28
  call void @llvm.dbg.declare(metadata i32** %8, metadata !20, metadata !DIExpression()), !dbg !34
  store i32* %3, i32** %9, align 8, !tbaa !28
  call void @llvm.dbg.declare(metadata i32** %9, metadata !21, metadata !DIExpression()), !dbg !35
  %14 = load i32*, i32** %6, align 8, !dbg !36, !tbaa !28
  store i32 5, i32* %14, align 4, !dbg !37, !tbaa !38
  %15 = load i32*, i32** %7, align 8, !dbg !40, !tbaa !28
  store i32 10, i32* %15, align 4, !dbg !41, !tbaa !38
  %16 = load i32*, i32** %6, align 8, !dbg !42, !tbaa !28
  %17 = icmp eq i32* %16, @g, !dbg !44
  br i1 %17, label %18, label %19, !dbg !45

18:                                               ; preds = %4
  store i32 0, i32* %5, align 4, !dbg !46
  br label %43, !dbg !46

19:                                               ; preds = %4
  %20 = bitcast i32* %10 to i8*, !dbg !48
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %20) #3, !dbg !48
  call void @llvm.dbg.declare(metadata i32* %10, metadata !22, metadata !DIExpression()), !dbg !49
  %21 = load i32*, i32** %6, align 8, !dbg !50, !tbaa !28
  %22 = load i32, i32* %21, align 4, !dbg !51, !tbaa !38
  store i32 %22, i32* %10, align 4, !dbg !49, !tbaa !38
  %23 = load i32, i32* %10, align 4, !dbg !52, !tbaa !38
  %24 = icmp eq i32 %23, 5, !dbg !53
  br i1 %24, label %25, label %33, !dbg !54

25:                                               ; preds = %19
  %26 = load i32*, i32** %8, align 8, !dbg !55, !tbaa !28
  store i32 50, i32* %26, align 4, !dbg !56, !tbaa !38
  %27 = load i32*, i32** %9, align 8, !dbg !57, !tbaa !28
  store i32 100, i32* %27, align 4, !dbg !58, !tbaa !38
  %28 = bitcast i32* %11 to i8*, !dbg !59
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %28) #3, !dbg !59
  call void @llvm.dbg.declare(metadata i32* %11, metadata !23, metadata !DIExpression()), !dbg !60
  %29 = load i32*, i32** %8, align 8, !dbg !61, !tbaa !28
  %30 = load i32, i32* %29, align 4, !dbg !62, !tbaa !38
  store i32 %30, i32* %11, align 4, !dbg !60, !tbaa !38
  %31 = load i32, i32* %11, align 4, !dbg !63, !tbaa !38
  store i32 %31, i32* %5, align 4, !dbg !64
  store i32 1, i32* %12, align 4
  %32 = bitcast i32* %11 to i8*, !dbg !65
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %32) #3, !dbg !65
  br label %41

33:                                               ; preds = %19
  %34 = load i32*, i32** %8, align 8, !dbg !66, !tbaa !28
  store i32 50, i32* %34, align 4, !dbg !67, !tbaa !38
  %35 = load i32*, i32** %9, align 8, !dbg !68, !tbaa !28
  store i32 100, i32* %35, align 4, !dbg !69, !tbaa !38
  %36 = bitcast i32* %13 to i8*, !dbg !70
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %36) #3, !dbg !70
  call void @llvm.dbg.declare(metadata i32* %13, metadata !26, metadata !DIExpression()), !dbg !71
  %37 = load i32*, i32** %8, align 8, !dbg !72, !tbaa !28
  %38 = load i32, i32* %37, align 4, !dbg !73, !tbaa !38
  store i32 %38, i32* %13, align 4, !dbg !71, !tbaa !38
  %39 = load i32, i32* %13, align 4, !dbg !74, !tbaa !38
  store i32 %39, i32* %5, align 4, !dbg !75
  store i32 1, i32* %12, align 4
  %40 = bitcast i32* %13 to i8*, !dbg !76
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %40) #3, !dbg !76
  br label %41

41:                                               ; preds = %33, %25
  %42 = bitcast i32* %10 to i8*, !dbg !77
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %42) #3, !dbg !77
  br label %43

43:                                               ; preds = %41, %18
  %44 = load i32, i32* %5, align 4, !dbg !77
  ret i32 %44, !dbg !77
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: nounwind uwtable
define dso_local i32 @foo2(i32* noundef %0, i32* noundef %1, i32* noundef %2, i32* noundef %3) #0 !dbg !78 {
  %5 = alloca i32, align 4
  %6 = alloca i32*, align 8
  %7 = alloca i32*, align 8
  %8 = alloca i32*, align 8
  %9 = alloca i32*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store i32* %0, i32** %6, align 8, !tbaa !28
  call void @llvm.dbg.declare(metadata i32** %6, metadata !80, metadata !DIExpression()), !dbg !90
  store i32* %1, i32** %7, align 8, !tbaa !28
  call void @llvm.dbg.declare(metadata i32** %7, metadata !81, metadata !DIExpression()), !dbg !91
  store i32* %2, i32** %8, align 8, !tbaa !28
  call void @llvm.dbg.declare(metadata i32** %8, metadata !82, metadata !DIExpression()), !dbg !92
  store i32* %3, i32** %9, align 8, !tbaa !28
  call void @llvm.dbg.declare(metadata i32** %9, metadata !83, metadata !DIExpression()), !dbg !93
  %14 = load i32*, i32** %6, align 8, !dbg !94, !tbaa !28
  store i32 5, i32* %14, align 4, !dbg !95, !tbaa !38
  %15 = load i32*, i32** %7, align 8, !dbg !96, !tbaa !28
  store i32 10, i32* %15, align 4, !dbg !97, !tbaa !38
  %16 = load i32*, i32** %6, align 8, !dbg !98, !tbaa !28
  %17 = icmp eq i32* %16, @g, !dbg !100
  br i1 %17, label %18, label %19, !dbg !101

18:                                               ; preds = %4
  store i32 0, i32* %5, align 4, !dbg !102
  br label %43, !dbg !102

19:                                               ; preds = %4
  %20 = bitcast i32* %10 to i8*, !dbg !104
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %20) #3, !dbg !104
  call void @llvm.dbg.declare(metadata i32* %10, metadata !84, metadata !DIExpression()), !dbg !105
  %21 = load i32*, i32** %6, align 8, !dbg !106, !tbaa !28
  %22 = load i32, i32* %21, align 4, !dbg !107, !tbaa !38
  store i32 %22, i32* %10, align 4, !dbg !105, !tbaa !38
  %23 = load i32, i32* %10, align 4, !dbg !108, !tbaa !38
  %24 = icmp eq i32 %23, 5, !dbg !109
  br i1 %24, label %25, label %33, !dbg !110

25:                                               ; preds = %19
  %26 = load i32*, i32** %8, align 8, !dbg !111, !tbaa !28
  store i32 50, i32* %26, align 4, !dbg !112, !tbaa !38
  %27 = load i32*, i32** %9, align 8, !dbg !113, !tbaa !28
  store i32 100, i32* %27, align 4, !dbg !114, !tbaa !38
  %28 = bitcast i32* %11 to i8*, !dbg !115
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %28) #3, !dbg !115
  call void @llvm.dbg.declare(metadata i32* %11, metadata !85, metadata !DIExpression()), !dbg !116
  %29 = load i32*, i32** %8, align 8, !dbg !117, !tbaa !28
  %30 = load i32, i32* %29, align 4, !dbg !118, !tbaa !38
  store i32 %30, i32* %11, align 4, !dbg !116, !tbaa !38
  %31 = load i32, i32* %11, align 4, !dbg !119, !tbaa !38
  store i32 %31, i32* %5, align 4, !dbg !120
  store i32 1, i32* %12, align 4
  %32 = bitcast i32* %11 to i8*, !dbg !121
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %32) #3, !dbg !121
  br label %41

33:                                               ; preds = %19
  %34 = load i32*, i32** %8, align 8, !dbg !122, !tbaa !28
  store i32 50, i32* %34, align 4, !dbg !123, !tbaa !38
  %35 = load i32*, i32** %9, align 8, !dbg !124, !tbaa !28
  store i32 100, i32* %35, align 4, !dbg !125, !tbaa !38
  %36 = bitcast i32* %13 to i8*, !dbg !126
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %36) #3, !dbg !126
  call void @llvm.dbg.declare(metadata i32* %13, metadata !88, metadata !DIExpression()), !dbg !127
  %37 = load i32*, i32** %8, align 8, !dbg !128, !tbaa !28
  %38 = load i32, i32* %37, align 4, !dbg !129, !tbaa !38
  store i32 %38, i32* %13, align 4, !dbg !127, !tbaa !38
  %39 = load i32, i32* %13, align 4, !dbg !130, !tbaa !38
  store i32 %39, i32* %5, align 4, !dbg !131
  store i32 1, i32* %12, align 4
  %40 = bitcast i32* %13 to i8*, !dbg !132
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %40) #3, !dbg !132
  br label %41

41:                                               ; preds = %33, %25
  %42 = bitcast i32* %10 to i8*, !dbg !133
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %42) #3, !dbg !133
  br label %43

43:                                               ; preds = %41, %18
  %44 = load i32, i32* %5, align 4, !dbg !133
  ret i32 %44, !dbg !133
}

attributes #0 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nosync nounwind willreturn }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "g", scope: !2, file: !3, line: 2, type: !5, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-++20220316013304+add3ab7f4c8a-1~exp1~20220316133356.105", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, globals: !4, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "april/source_var_test.c", directory: "/home/nius/eth/bachelorsthesis/llvm-project/llvm/bsc", checksumkind: CSK_MD5, checksum: "f3dc65871edcec838c5bfa212f2d392f")
!4 = !{!0}
!5 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!6 = !{i32 7, !"Dwarf Version", i32 5}
!7 = !{i32 2, !"Debug Info Version", i32 3}
!8 = !{i32 1, !"wchar_size", i32 4}
!9 = !{i32 7, !"PIC Level", i32 2}
!10 = !{i32 7, !"PIE Level", i32 2}
!11 = !{i32 7, !"uwtable", i32 1}
!12 = !{!"Ubuntu clang version 14.0.0-++20220316013304+add3ab7f4c8a-1~exp1~20220316133356.105"}
!13 = distinct !DISubprogram(name: "foo", scope: !3, file: !3, line: 4, type: !14, scopeLine: 4, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !17)
!14 = !DISubroutineType(types: !15)
!15 = !{!5, !16, !16, !16, !16}
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!17 = !{!18, !19, !20, !21, !22, !23, !26}
!18 = !DILocalVariable(name: "x", arg: 1, scope: !13, file: !3, line: 4, type: !16)
!19 = !DILocalVariable(name: "a", arg: 2, scope: !13, file: !3, line: 4, type: !16)
!20 = !DILocalVariable(name: "n", arg: 3, scope: !13, file: !3, line: 4, type: !16)
!21 = !DILocalVariable(name: "m", arg: 4, scope: !13, file: !3, line: 4, type: !16)
!22 = !DILocalVariable(name: "val", scope: !13, file: !3, line: 10, type: !5)
!23 = !DILocalVariable(name: "val2", scope: !24, file: !3, line: 18, type: !5)
!24 = distinct !DILexicalBlock(scope: !25, file: !3, line: 12, column: 19)
!25 = distinct !DILexicalBlock(scope: !13, file: !3, line: 12, column: 9)
!26 = !DILocalVariable(name: "val2", scope: !27, file: !3, line: 24, type: !5)
!27 = distinct !DILexicalBlock(scope: !25, file: !3, line: 20, column: 12)
!28 = !{!29, !29, i64 0}
!29 = !{!"any pointer", !30, i64 0}
!30 = !{!"omnipotent char", !31, i64 0}
!31 = !{!"Simple C/C++ TBAA"}
!32 = !DILocation(line: 4, column: 14, scope: !13)
!33 = !DILocation(line: 4, column: 22, scope: !13)
!34 = !DILocation(line: 4, column: 30, scope: !13)
!35 = !DILocation(line: 4, column: 38, scope: !13)
!36 = !DILocation(line: 5, column: 6, scope: !13)
!37 = !DILocation(line: 5, column: 8, scope: !13)
!38 = !{!39, !39, i64 0}
!39 = !{!"int", !30, i64 0}
!40 = !DILocation(line: 6, column: 6, scope: !13)
!41 = !DILocation(line: 6, column: 8, scope: !13)
!42 = !DILocation(line: 8, column: 9, scope: !43)
!43 = distinct !DILexicalBlock(scope: !13, file: !3, line: 8, column: 9)
!44 = !DILocation(line: 8, column: 11, scope: !43)
!45 = !DILocation(line: 8, column: 9, scope: !13)
!46 = !DILocation(line: 8, column: 19, scope: !47)
!47 = distinct !DILexicalBlock(scope: !43, file: !3, line: 8, column: 18)
!48 = !DILocation(line: 10, column: 5, scope: !13)
!49 = !DILocation(line: 10, column: 9, scope: !13)
!50 = !DILocation(line: 10, column: 16, scope: !13)
!51 = !DILocation(line: 10, column: 15, scope: !13)
!52 = !DILocation(line: 12, column: 9, scope: !25)
!53 = !DILocation(line: 12, column: 13, scope: !25)
!54 = !DILocation(line: 12, column: 9, scope: !13)
!55 = !DILocation(line: 15, column: 10, scope: !24)
!56 = !DILocation(line: 15, column: 12, scope: !24)
!57 = !DILocation(line: 16, column: 10, scope: !24)
!58 = !DILocation(line: 16, column: 12, scope: !24)
!59 = !DILocation(line: 18, column: 9, scope: !24)
!60 = !DILocation(line: 18, column: 13, scope: !24)
!61 = !DILocation(line: 18, column: 21, scope: !24)
!62 = !DILocation(line: 18, column: 20, scope: !24)
!63 = !DILocation(line: 19, column: 16, scope: !24)
!64 = !DILocation(line: 19, column: 9, scope: !24)
!65 = !DILocation(line: 20, column: 5, scope: !25)
!66 = !DILocation(line: 21, column: 10, scope: !27)
!67 = !DILocation(line: 21, column: 12, scope: !27)
!68 = !DILocation(line: 22, column: 10, scope: !27)
!69 = !DILocation(line: 22, column: 12, scope: !27)
!70 = !DILocation(line: 24, column: 9, scope: !27)
!71 = !DILocation(line: 24, column: 13, scope: !27)
!72 = !DILocation(line: 24, column: 21, scope: !27)
!73 = !DILocation(line: 24, column: 20, scope: !27)
!74 = !DILocation(line: 25, column: 16, scope: !27)
!75 = !DILocation(line: 25, column: 9, scope: !27)
!76 = !DILocation(line: 26, column: 5, scope: !25)
!77 = !DILocation(line: 29, column: 1, scope: !13)
!78 = distinct !DISubprogram(name: "foo2", scope: !3, file: !3, line: 31, type: !14, scopeLine: 31, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !79)
!79 = !{!80, !81, !82, !83, !84, !85, !88}
!80 = !DILocalVariable(name: "x", arg: 1, scope: !78, file: !3, line: 31, type: !16)
!81 = !DILocalVariable(name: "a", arg: 2, scope: !78, file: !3, line: 31, type: !16)
!82 = !DILocalVariable(name: "n", arg: 3, scope: !78, file: !3, line: 31, type: !16)
!83 = !DILocalVariable(name: "m", arg: 4, scope: !78, file: !3, line: 31, type: !16)
!84 = !DILocalVariable(name: "val", scope: !78, file: !3, line: 37, type: !5)
!85 = !DILocalVariable(name: "val2", scope: !86, file: !3, line: 45, type: !5)
!86 = distinct !DILexicalBlock(scope: !87, file: !3, line: 39, column: 19)
!87 = distinct !DILexicalBlock(scope: !78, file: !3, line: 39, column: 9)
!88 = !DILocalVariable(name: "val2", scope: !89, file: !3, line: 51, type: !5)
!89 = distinct !DILexicalBlock(scope: !87, file: !3, line: 47, column: 12)
!90 = !DILocation(line: 31, column: 15, scope: !78)
!91 = !DILocation(line: 31, column: 23, scope: !78)
!92 = !DILocation(line: 31, column: 31, scope: !78)
!93 = !DILocation(line: 31, column: 39, scope: !78)
!94 = !DILocation(line: 32, column: 6, scope: !78)
!95 = !DILocation(line: 32, column: 8, scope: !78)
!96 = !DILocation(line: 33, column: 6, scope: !78)
!97 = !DILocation(line: 33, column: 8, scope: !78)
!98 = !DILocation(line: 35, column: 9, scope: !99)
!99 = distinct !DILexicalBlock(scope: !78, file: !3, line: 35, column: 9)
!100 = !DILocation(line: 35, column: 11, scope: !99)
!101 = !DILocation(line: 35, column: 9, scope: !78)
!102 = !DILocation(line: 35, column: 19, scope: !103)
!103 = distinct !DILexicalBlock(scope: !99, file: !3, line: 35, column: 18)
!104 = !DILocation(line: 37, column: 5, scope: !78)
!105 = !DILocation(line: 37, column: 9, scope: !78)
!106 = !DILocation(line: 37, column: 16, scope: !78)
!107 = !DILocation(line: 37, column: 15, scope: !78)
!108 = !DILocation(line: 39, column: 9, scope: !87)
!109 = !DILocation(line: 39, column: 13, scope: !87)
!110 = !DILocation(line: 39, column: 9, scope: !78)
!111 = !DILocation(line: 42, column: 10, scope: !86)
!112 = !DILocation(line: 42, column: 12, scope: !86)
!113 = !DILocation(line: 43, column: 10, scope: !86)
!114 = !DILocation(line: 43, column: 12, scope: !86)
!115 = !DILocation(line: 45, column: 9, scope: !86)
!116 = !DILocation(line: 45, column: 13, scope: !86)
!117 = !DILocation(line: 45, column: 21, scope: !86)
!118 = !DILocation(line: 45, column: 20, scope: !86)
!119 = !DILocation(line: 46, column: 16, scope: !86)
!120 = !DILocation(line: 46, column: 9, scope: !86)
!121 = !DILocation(line: 47, column: 5, scope: !87)
!122 = !DILocation(line: 48, column: 10, scope: !89)
!123 = !DILocation(line: 48, column: 12, scope: !89)
!124 = !DILocation(line: 49, column: 10, scope: !89)
!125 = !DILocation(line: 49, column: 12, scope: !89)
!126 = !DILocation(line: 51, column: 9, scope: !89)
!127 = !DILocation(line: 51, column: 13, scope: !89)
!128 = !DILocation(line: 51, column: 21, scope: !89)
!129 = !DILocation(line: 51, column: 20, scope: !89)
!130 = !DILocation(line: 52, column: 16, scope: !89)
!131 = !DILocation(line: 52, column: 9, scope: !89)
!132 = !DILocation(line: 53, column: 5, scope: !87)
!133 = !DILocation(line: 56, column: 1, scope: !78)
