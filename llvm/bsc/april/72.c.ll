; ModuleID = 'april/72.c'
source_filename = "april/72.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@g = dso_local global i32 0, align 4, !dbg !0

; Function Attrs: nounwind uwtable
define dso_local i32 @foo(i32* %0, i32* %1, i32* %2, i32* %3) #0 !dbg !12 {
  %5 = alloca i32, align 4
  %6 = alloca i32*, align 8
  %7 = alloca i32*, align 8
  %8 = alloca i32*, align 8
  %9 = alloca i32*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store i32* %0, i32** %6, align 8, !tbaa !27
  call void @llvm.dbg.declare(metadata i32** %6, metadata !17, metadata !DIExpression()), !dbg !31
  store i32* %1, i32** %7, align 8, !tbaa !27
  call void @llvm.dbg.declare(metadata i32** %7, metadata !18, metadata !DIExpression()), !dbg !32
  store i32* %2, i32** %8, align 8, !tbaa !27
  call void @llvm.dbg.declare(metadata i32** %8, metadata !19, metadata !DIExpression()), !dbg !33
  store i32* %3, i32** %9, align 8, !tbaa !27
  call void @llvm.dbg.declare(metadata i32** %9, metadata !20, metadata !DIExpression()), !dbg !34
  %14 = load i32*, i32** %6, align 8, !dbg !35, !tbaa !27
  store i32 5, i32* %14, align 4, !dbg !36, !tbaa !37
  %15 = load i32*, i32** %7, align 8, !dbg !39, !tbaa !27
  store i32 10, i32* %15, align 4, !dbg !40, !tbaa !37
  %16 = load i32*, i32** %6, align 8, !dbg !41, !tbaa !27
  %17 = icmp eq i32* %16, @g, !dbg !43
  br i1 %17, label %18, label %19, !dbg !44

18:                                               ; preds = %4
  store i32 0, i32* %5, align 4, !dbg !45
  br label %43, !dbg !45

19:                                               ; preds = %4
  %20 = bitcast i32* %10 to i8*, !dbg !47
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %20) #3, !dbg !47
  call void @llvm.dbg.declare(metadata i32* %10, metadata !21, metadata !DIExpression()), !dbg !48
  %21 = load i32*, i32** %6, align 8, !dbg !49, !tbaa !27
  %22 = load i32, i32* %21, align 4, !dbg !50, !tbaa !37
  store i32 %22, i32* %10, align 4, !dbg !48, !tbaa !37
  %23 = load i32, i32* %10, align 4, !dbg !51, !tbaa !37
  %24 = icmp eq i32 %23, 5, !dbg !52
  br i1 %24, label %25, label %33, !dbg !53

25:                                               ; preds = %19
  %26 = load i32*, i32** %8, align 8, !dbg !54, !tbaa !27
  store i32 50, i32* %26, align 4, !dbg !55, !tbaa !37
  %27 = load i32*, i32** %9, align 8, !dbg !56, !tbaa !27
  store i32 100, i32* %27, align 4, !dbg !57, !tbaa !37
  %28 = bitcast i32* %11 to i8*, !dbg !58
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %28) #3, !dbg !58
  call void @llvm.dbg.declare(metadata i32* %11, metadata !22, metadata !DIExpression()), !dbg !59
  %29 = load i32*, i32** %8, align 8, !dbg !60, !tbaa !27
  %30 = load i32, i32* %29, align 4, !dbg !61, !tbaa !37
  store i32 %30, i32* %11, align 4, !dbg !59, !tbaa !37
  %31 = load i32, i32* %11, align 4, !dbg !62, !tbaa !37
  store i32 %31, i32* %5, align 4, !dbg !63
  store i32 1, i32* %12, align 4
  %32 = bitcast i32* %11 to i8*, !dbg !64
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %32) #3, !dbg !64
  br label %41

33:                                               ; preds = %19
  %34 = load i32*, i32** %8, align 8, !dbg !65, !tbaa !27
  store i32 50, i32* %34, align 4, !dbg !66, !tbaa !37
  %35 = load i32*, i32** %9, align 8, !dbg !67, !tbaa !27
  store i32 100, i32* %35, align 4, !dbg !68, !tbaa !37
  %36 = bitcast i32* %13 to i8*, !dbg !69
  call void @llvm.lifetime.start.p0i8(i64 4, i8* %36) #3, !dbg !69
  call void @llvm.dbg.declare(metadata i32* %13, metadata !25, metadata !DIExpression()), !dbg !70
  %37 = load i32*, i32** %8, align 8, !dbg !71, !tbaa !27
  %38 = load i32, i32* %37, align 4, !dbg !72, !tbaa !37
  store i32 %38, i32* %13, align 4, !dbg !70, !tbaa !37
  %39 = load i32, i32* %13, align 4, !dbg !73, !tbaa !37
  store i32 %39, i32* %5, align 4, !dbg !74
  store i32 1, i32* %12, align 4
  %40 = bitcast i32* %13 to i8*, !dbg !75
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %40) #3, !dbg !75
  br label %41

41:                                               ; preds = %33, %25
  %42 = bitcast i32* %10 to i8*, !dbg !76
  call void @llvm.lifetime.end.p0i8(i64 4, i8* %42) #3, !dbg !76
  br label %43

43:                                               ; preds = %41, %18
  %44 = load i32, i32* %5, align 4, !dbg !76
  ret i32 %44, !dbg !76
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0i8(i64 immarg, i8* nocapture) #2

; Function Attrs: argmemonly nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0i8(i64 immarg, i8* nocapture) #2

attributes #0 = { nounwind uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nofree nosync nounwind willreturn }
attributes #3 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "g", scope: !2, file: !3, line: 2, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 13.0.1-++20220120110924+75e33f71c2da-1~exp1~20220120231001.58", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "april/72.c", directory: "/home/nius/eth/bachelorsthesis/llvm-project/llvm/bsc")
!4 = !{}
!5 = !{!0}
!6 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!7 = !{i32 7, !"Dwarf Version", i32 4}
!8 = !{i32 2, !"Debug Info Version", i32 3}
!9 = !{i32 1, !"wchar_size", i32 4}
!10 = !{i32 7, !"uwtable", i32 1}
!11 = !{!"Ubuntu clang version 13.0.1-++20220120110924+75e33f71c2da-1~exp1~20220120231001.58"}
!12 = distinct !DISubprogram(name: "foo", scope: !3, file: !3, line: 4, type: !13, scopeLine: 4, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !16)
!13 = !DISubroutineType(types: !14)
!14 = !{!6, !15, !15, !15, !15}
!15 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !6, size: 64)
!16 = !{!17, !18, !19, !20, !21, !22, !25}
!17 = !DILocalVariable(name: "x", arg: 1, scope: !12, file: !3, line: 4, type: !15)
!18 = !DILocalVariable(name: "a", arg: 2, scope: !12, file: !3, line: 4, type: !15)
!19 = !DILocalVariable(name: "n", arg: 3, scope: !12, file: !3, line: 4, type: !15)
!20 = !DILocalVariable(name: "m", arg: 4, scope: !12, file: !3, line: 4, type: !15)
!21 = !DILocalVariable(name: "val", scope: !12, file: !3, line: 10, type: !6)
!22 = !DILocalVariable(name: "val2", scope: !23, file: !3, line: 18, type: !6)
!23 = distinct !DILexicalBlock(scope: !24, file: !3, line: 12, column: 19)
!24 = distinct !DILexicalBlock(scope: !12, file: !3, line: 12, column: 9)
!25 = !DILocalVariable(name: "val2", scope: !26, file: !3, line: 24, type: !6)
!26 = distinct !DILexicalBlock(scope: !24, file: !3, line: 20, column: 12)
!27 = !{!28, !28, i64 0}
!28 = !{!"any pointer", !29, i64 0}
!29 = !{!"omnipotent char", !30, i64 0}
!30 = !{!"Simple C/C++ TBAA"}
!31 = !DILocation(line: 4, column: 14, scope: !12)
!32 = !DILocation(line: 4, column: 22, scope: !12)
!33 = !DILocation(line: 4, column: 30, scope: !12)
!34 = !DILocation(line: 4, column: 38, scope: !12)
!35 = !DILocation(line: 5, column: 6, scope: !12)
!36 = !DILocation(line: 5, column: 8, scope: !12)
!37 = !{!38, !38, i64 0}
!38 = !{!"int", !29, i64 0}
!39 = !DILocation(line: 6, column: 6, scope: !12)
!40 = !DILocation(line: 6, column: 8, scope: !12)
!41 = !DILocation(line: 8, column: 9, scope: !42)
!42 = distinct !DILexicalBlock(scope: !12, file: !3, line: 8, column: 9)
!43 = !DILocation(line: 8, column: 11, scope: !42)
!44 = !DILocation(line: 8, column: 9, scope: !12)
!45 = !DILocation(line: 8, column: 19, scope: !46)
!46 = distinct !DILexicalBlock(scope: !42, file: !3, line: 8, column: 18)
!47 = !DILocation(line: 10, column: 5, scope: !12)
!48 = !DILocation(line: 10, column: 9, scope: !12)
!49 = !DILocation(line: 10, column: 16, scope: !12)
!50 = !DILocation(line: 10, column: 15, scope: !12)
!51 = !DILocation(line: 12, column: 9, scope: !24)
!52 = !DILocation(line: 12, column: 13, scope: !24)
!53 = !DILocation(line: 12, column: 9, scope: !12)
!54 = !DILocation(line: 15, column: 10, scope: !23)
!55 = !DILocation(line: 15, column: 12, scope: !23)
!56 = !DILocation(line: 16, column: 10, scope: !23)
!57 = !DILocation(line: 16, column: 12, scope: !23)
!58 = !DILocation(line: 18, column: 9, scope: !23)
!59 = !DILocation(line: 18, column: 13, scope: !23)
!60 = !DILocation(line: 18, column: 21, scope: !23)
!61 = !DILocation(line: 18, column: 20, scope: !23)
!62 = !DILocation(line: 19, column: 16, scope: !23)
!63 = !DILocation(line: 19, column: 9, scope: !23)
!64 = !DILocation(line: 20, column: 5, scope: !24)
!65 = !DILocation(line: 21, column: 10, scope: !26)
!66 = !DILocation(line: 21, column: 12, scope: !26)
!67 = !DILocation(line: 22, column: 10, scope: !26)
!68 = !DILocation(line: 22, column: 12, scope: !26)
!69 = !DILocation(line: 24, column: 9, scope: !26)
!70 = !DILocation(line: 24, column: 13, scope: !26)
!71 = !DILocation(line: 24, column: 21, scope: !26)
!72 = !DILocation(line: 24, column: 20, scope: !26)
!73 = !DILocation(line: 25, column: 16, scope: !26)
!74 = !DILocation(line: 25, column: 9, scope: !26)
!75 = !DILocation(line: 26, column: 5, scope: !24)
!76 = !DILocation(line: 29, column: 1, scope: !12)
