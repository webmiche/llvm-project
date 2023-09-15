; ModuleID = 'implicit_preprocessed.ll'
source_filename = "implicit_preprocessed.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@g = dso_local local_unnamed_addr global i32 0, align 4, !dbg !0
@d = dso_local local_unnamed_addr global i32 0, align 4, !dbg !5

; Function Attrs: minsize nofree nounwind optsize sspstrong memory(readwrite, argmem: none) uwtable
define dso_local i32 @foo() local_unnamed_addr #0 !dbg !15 {
  call void @llvm.dbg.value(metadata ptr poison, metadata !19, metadata !DIExpression()), !dbg !21
  %1 = load i32, ptr @g, align 4, !tbaa !22
  %.not = icmp eq i32 %1, 0
  br i1 %.not, label %2, label %.critedge, !dbg !26

.critedge:                                        ; preds = %0, %.critedge
  br label %.critedge, !dbg !27

2:                                                ; preds = %0
  %d.promoted = load i32, ptr @d, align 4, !tbaa !22
  ret i32 %d.promoted, !dbg !28
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.value(metadata, metadata, metadata) #1

attributes #0 = { minsize nofree nounwind optsize sspstrong memory(readwrite, argmem: none) uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!8, !9, !10, !11, !12, !13}
!llvm.ident = !{!14}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "g", scope: !2, file: !3, line: 1, type: !7, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 15.0.7", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, globals: !4, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "implicit_preprocessed.c", directory: "/home/michel/ETH/AST/llvm-project/example", checksumkind: CSK_MD5, checksum: "81ce551684fbaa4f3b88065f26c1ce40")
!4 = !{!5, !0}
!5 = !DIGlobalVariableExpression(var: !6, expr: !DIExpression())
!6 = distinct !DIGlobalVariable(name: "d", scope: !2, file: !3, line: 1, type: !7, isLocal: false, isDefinition: true)
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !{i32 7, !"Dwarf Version", i32 5}
!9 = !{i32 2, !"Debug Info Version", i32 3}
!10 = !{i32 1, !"wchar_size", i32 4}
!11 = !{i32 8, !"PIC Level", i32 2}
!12 = !{i32 7, !"PIE Level", i32 2}
!13 = !{i32 7, !"uwtable", i32 2}
!14 = !{!"clang version 15.0.7"}
!15 = distinct !DISubprogram(name: "foo", scope: !3, file: !3, line: 2, type: !16, scopeLine: 2, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !18)
!16 = !DISubroutineType(types: !17)
!17 = !{!7}
!18 = !{!19}
!19 = !DILocalVariable(name: "i", scope: !15, file: !3, line: 3, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!21 = !DILocation(line: 0, scope: !15)
!22 = !{!23, !23, i64 0}
!23 = !{!"int", !24, i64 0}
!24 = !{!"omnipotent char", !25, i64 0}
!25 = !{!"Simple C/C++ TBAA"}
!26 = !DILocation(line: 4, column: 3, scope: !15)
!27 = !DILocation(line: 5, column: 9, scope: !15)
!28 = !DILocation(line: 11, column: 3, scope: !15)
