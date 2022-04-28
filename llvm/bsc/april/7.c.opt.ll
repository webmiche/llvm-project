; ModuleID = 'april/7.c.ll'
source_filename = "april/7.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@g = dso_local global i32 0, align 4, !dbg !0

; Function Attrs: mustprogress nofree norecurse nosync nounwind uwtable willreturn
define dso_local i32 @foo(i32* writeonly %0, i32* nocapture writeonly %1, i32* nocapture %2, i32* nocapture writeonly %3) local_unnamed_addr #0 !dbg !12 {
  call void @llvm.dbg.value(metadata i32* %0, metadata !17, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.value(metadata i32* %1, metadata !18, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.value(metadata i32* %2, metadata !19, metadata !DIExpression()), !dbg !27
  call void @llvm.dbg.value(metadata i32* %3, metadata !20, metadata !DIExpression()), !dbg !27
  store i32 5, i32* %0, align 4, !dbg !28, !tbaa !29
  store i32 10, i32* %1, align 4, !dbg !33, !tbaa !29
  %5 = icmp eq i32* %0, @g, !dbg !34
  br i1 %5, label %7, label %6, !dbg !36

6:                                                ; preds = %4
  store i32 50, i32* %2, align 4, !dbg !37, !tbaa !29
  store i32 100, i32* %3, align 4, !dbg !37, !tbaa !29
  %.0 = load i32, i32* %2, align 4, !dbg !37, !tbaa !29
  br label %7

7:                                                ; preds = %4, %6
  %.1 = phi i32 [ %.0, %6 ], [ 0, %4 ], !dbg !27
  ret i32 %.1, !dbg !38
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind uwtable willreturn "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!7, !8, !9, !10}
!llvm.ident = !{!11}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "g", scope: !2, file: !3, line: 2, type: !6, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "Ubuntu clang version 13.0.1-++20220120110924+75e33f71c2da-1~exp1~20220120231001.58", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, globals: !5, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "april/7.c", directory: "/home/nius/eth/bachelorsthesis/llvm-project/llvm/bsc")
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
!27 = !DILocation(line: 0, scope: !12)
!28 = !DILocation(line: 5, column: 8, scope: !12)
!29 = !{!30, !30, i64 0}
!30 = !{!"int", !31, i64 0}
!31 = !{!"omnipotent char", !32, i64 0}
!32 = !{!"Simple C/C++ TBAA"}
!33 = !DILocation(line: 6, column: 8, scope: !12)
!34 = !DILocation(line: 8, column: 11, scope: !35)
!35 = distinct !DILexicalBlock(scope: !12, file: !3, line: 8, column: 9)
!36 = !DILocation(line: 8, column: 9, scope: !12)
!37 = !DILocation(line: 0, scope: !24)
!38 = !DILocation(line: 29, column: 1, scope: !12)
