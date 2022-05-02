; ModuleID = 'april/722.c.ll'
source_filename = "april/722.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@g = dso_local global i32 0, align 4, !dbg !0

; Function Attrs: mustprogress nofree norecurse nosync nounwind uwtable willreturn
define dso_local i32 @foo(i32* noundef writeonly %0, i32* nocapture noundef writeonly %1, i32* nocapture noundef %2, i32* nocapture noundef writeonly %3) local_unnamed_addr #0 !dbg !13 {
  call void @llvm.dbg.value(metadata i32* %0, metadata !18, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.value(metadata i32* %1, metadata !19, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.value(metadata i32* %2, metadata !20, metadata !DIExpression()), !dbg !28
  call void @llvm.dbg.value(metadata i32* %3, metadata !21, metadata !DIExpression()), !dbg !28
  store i32 5, i32* %0, align 4, !dbg !29, !tbaa !30
  store i32 10, i32* %1, align 4, !dbg !34, !tbaa !30
  %5 = icmp eq i32* %0, @g, !dbg !35
  br i1 %5, label %7, label %6, !dbg !37

6:                                                ; preds = %4
  store i32 50, i32* %2, align 4, !dbg !38, !tbaa !30
  store i32 100, i32* %3, align 4, !dbg !38, !tbaa !30
  %.0 = load i32, i32* %2, align 4, !dbg !38, !tbaa !30
  br label %7

7:                                                ; preds = %4, %6
  %.1 = phi i32 [ %.0, %6 ], [ 0, %4 ], !dbg !28
  ret i32 %.1, !dbg !39
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind uwtable willreturn
define dso_local i32 @foo2(i32* noundef writeonly %0, i32* nocapture noundef writeonly %1, i32* nocapture noundef %2, i32* nocapture noundef writeonly %3) local_unnamed_addr #0 !dbg !40 {
  call void @llvm.dbg.value(metadata i32* %0, metadata !42, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.value(metadata i32* %1, metadata !43, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.value(metadata i32* %2, metadata !44, metadata !DIExpression()), !dbg !52
  call void @llvm.dbg.value(metadata i32* %3, metadata !45, metadata !DIExpression()), !dbg !52
  store i32 5, i32* %0, align 4, !dbg !53, !tbaa !30
  store i32 10, i32* %1, align 4, !dbg !54, !tbaa !30
  %5 = icmp eq i32* %0, @g, !dbg !55
  br i1 %5, label %7, label %6, !dbg !57

6:                                                ; preds = %4
  store i32 50, i32* %2, align 4, !dbg !58, !tbaa !30
  store i32 100, i32* %3, align 4, !dbg !58, !tbaa !30
  %.0 = load i32, i32* %2, align 4, !dbg !58, !tbaa !30
  br label %7

7:                                                ; preds = %4, %6
  %.1 = phi i32 [ %.0, %6 ], [ 0, %4 ], !dbg !52
  ret i32 %.1, !dbg !59
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind uwtable willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!6, !7, !8, !9, !10, !11}
!llvm.ident = !{!12}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "g", scope: !2, file: !3, line: 2, type: !5, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 14.0.0-++20220316013304+add3ab7f4c8a-1~exp1~20220316133356.105", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, globals: !4, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "april/722.c", directory: "/home/nius/eth/bachelorsthesis/llvm-project/llvm/bsc", checksumkind: CSK_MD5, checksum: "f3dc65871edcec838c5bfa212f2d392f")
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
!28 = !DILocation(line: 0, scope: !13)
!29 = !DILocation(line: 5, column: 8, scope: !13)
!30 = !{!31, !31, i64 0}
!31 = !{!"int", !32, i64 0}
!32 = !{!"omnipotent char", !33, i64 0}
!33 = !{!"Simple C/C++ TBAA"}
!34 = !DILocation(line: 6, column: 8, scope: !13)
!35 = !DILocation(line: 8, column: 11, scope: !36)
!36 = distinct !DILexicalBlock(scope: !13, file: !3, line: 8, column: 9)
!37 = !DILocation(line: 8, column: 9, scope: !13)
!38 = !DILocation(line: 0, scope: !25)
!39 = !DILocation(line: 29, column: 1, scope: !13)
!40 = distinct !DISubprogram(name: "foo2", scope: !3, file: !3, line: 31, type: !14, scopeLine: 31, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !41)
!41 = !{!42, !43, !44, !45, !46, !47, !50}
!42 = !DILocalVariable(name: "x", arg: 1, scope: !40, file: !3, line: 31, type: !16)
!43 = !DILocalVariable(name: "a", arg: 2, scope: !40, file: !3, line: 31, type: !16)
!44 = !DILocalVariable(name: "n", arg: 3, scope: !40, file: !3, line: 31, type: !16)
!45 = !DILocalVariable(name: "m", arg: 4, scope: !40, file: !3, line: 31, type: !16)
!46 = !DILocalVariable(name: "val", scope: !40, file: !3, line: 37, type: !5)
!47 = !DILocalVariable(name: "val2", scope: !48, file: !3, line: 45, type: !5)
!48 = distinct !DILexicalBlock(scope: !49, file: !3, line: 39, column: 19)
!49 = distinct !DILexicalBlock(scope: !40, file: !3, line: 39, column: 9)
!50 = !DILocalVariable(name: "val2", scope: !51, file: !3, line: 51, type: !5)
!51 = distinct !DILexicalBlock(scope: !49, file: !3, line: 47, column: 12)
!52 = !DILocation(line: 0, scope: !40)
!53 = !DILocation(line: 32, column: 8, scope: !40)
!54 = !DILocation(line: 33, column: 8, scope: !40)
!55 = !DILocation(line: 35, column: 11, scope: !56)
!56 = distinct !DILexicalBlock(scope: !40, file: !3, line: 35, column: 9)
!57 = !DILocation(line: 35, column: 9, scope: !40)
!58 = !DILocation(line: 0, scope: !49)
!59 = !DILocation(line: 56, column: 1, scope: !40)
