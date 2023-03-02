; ModuleID = 'tmp2.c'
source_filename = "tmp2.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind sspstrong uwtable
define dso_local i32 @foo(i32* noundef %0, i32* noundef %1) #0 !dbg !9 {
  %3 = alloca i32*, align 8
  %4 = alloca i32*, align 8
  store i32* %0, i32** %3, align 8, !tbaa !17
  call void @llvm.dbg.declare(metadata i32** %3, metadata !15, metadata !DIExpression()), !dbg !21
  store i32* %1, i32** %4, align 8, !tbaa !17
  call void @llvm.dbg.declare(metadata i32** %4, metadata !16, metadata !DIExpression()), !dbg !22
  %5 = load i32*, i32** %4, align 8, !dbg !23, !tbaa !17
  store i32 2, i32* %5, align 4, !dbg !24, !tbaa !25
  %6 = load i32*, i32** %3, align 8, !dbg !27, !tbaa !17
  store i32 1, i32* %6, align 4, !dbg !28, !tbaa !25
  %7 = load i32*, i32** %4, align 8, !dbg !29, !tbaa !17
  %8 = load i32, i32* %7, align 4, !dbg !30, !tbaa !25
  ret i32 %8, !dbg !31
}

; Function Attrs: nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

attributes #0 = { nounwind sspstrong uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nofree nosync nounwind readnone speculatable willreturn }

!llvm.dbg.cu = !{!0}
!llvm.module.flags = !{!2, !3, !4, !5, !6, !7}
!llvm.ident = !{!8}

!0 = distinct !DICompileUnit(language: DW_LANG_C99, file: !1, producer: "clang version 14.0.6", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false, nameTableKind: None)
!1 = !DIFile(filename: "tmp2.c", directory: "/home/michel/ETH/AST/llvm-project/clang-tools-extra/instrumenter", checksumkind: CSK_MD5, checksum: "0c7388062ffa3b92f4b5c7ca78518e69")
!2 = !{i32 7, !"Dwarf Version", i32 5}
!3 = !{i32 2, !"Debug Info Version", i32 3}
!4 = !{i32 1, !"wchar_size", i32 4}
!5 = !{i32 7, !"PIC Level", i32 2}
!6 = !{i32 7, !"PIE Level", i32 2}
!7 = !{i32 7, !"uwtable", i32 1}
!8 = !{!"clang version 14.0.6"}
!9 = distinct !DISubprogram(name: "foo", scope: !1, file: !1, line: 4, type: !10, scopeLine: 4, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !0, retainedNodes: !14)
!10 = !DISubroutineType(types: !11)
!11 = !{!12, !13, !13}
!12 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!13 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!14 = !{!15, !16}
!15 = !DILocalVariable(name: "x", arg: 1, scope: !9, file: !1, line: 4, type: !13)
!16 = !DILocalVariable(name: "y", arg: 2, scope: !9, file: !1, line: 4, type: !13)
!17 = !{!18, !18, i64 0}
!18 = !{!"any pointer", !19, i64 0}
!19 = !{!"omnipotent char", !20, i64 0}
!20 = !{!"Simple C/C++ TBAA"}
!21 = !DILocation(line: 4, column: 14, scope: !9)
!22 = !DILocation(line: 4, column: 22, scope: !9)
!23 = !DILocation(line: 8, column: 4, scope: !9)
!24 = !DILocation(line: 8, column: 6, scope: !9)
!25 = !{!26, !26, i64 0}
!26 = !{!"int", !19, i64 0}
!27 = !DILocation(line: 12, column: 4, scope: !9)
!28 = !DILocation(line: 12, column: 6, scope: !9)
!29 = !DILocation(line: 16, column: 11, scope: !9)
!30 = !DILocation(line: 16, column: 10, scope: !9)
!31 = !DILocation(line: 16, column: 3, scope: !9)
