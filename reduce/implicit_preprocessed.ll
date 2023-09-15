; ModuleID = 'implicit_preprocessed_try_all_any_diff.c'
source_filename = "implicit_preprocessed_try_all_any_diff.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@b = dso_local global i32 0, align 4, !dbg !0
@a = dso_local global i32 0, align 4, !dbg !5
@d = dso_local global ptr null, align 8, !dbg !10
@c = dso_local global i32 0, align 4, !dbg !8

; Function Attrs: minsize nounwind optsize sspstrong uwtable
define dso_local i32 @price_out_impl() #0 !dbg !21 {
  %1 = alloca i32, align 4
  br label %2, !dbg !25

2:                                                ; preds = %15, %0
  %3 = load i32, ptr @b, align 4, !dbg !26, !tbaa !27
  %4 = icmp ne i32 %3, 0, !dbg !25
  br i1 %4, label %5, label %16, !dbg !25

5:                                                ; preds = %2
  %6 = load i32, ptr @a, align 4, !dbg !31, !tbaa !27
  %7 = sext i32 %6 to i64, !dbg !31
  %8 = inttoptr i64 %7 to ptr, !dbg !31
  %9 = icmp eq ptr @malloc, %8, !dbg !33
  br i1 %9, label %10, label %15, !dbg !34

10:                                               ; preds = %5
  %11 = load ptr, ptr @d, align 8, !dbg !35, !tbaa !36
  %12 = load i32, ptr @c, align 4, !dbg !38, !tbaa !27
  %13 = sext i32 %12 to i64, !dbg !35
  %14 = getelementptr inbounds i64, ptr %11, i64 %13, !dbg !35
  store i64 0, ptr %14, align 8, !dbg !39, !tbaa !40
  br label %15, !dbg !35

15:                                               ; preds = %10, %5
  br label %2, !dbg !25, !llvm.loop !42

16:                                               ; preds = %2
  %17 = load i32, ptr %1, align 4, !dbg !45
  ret i32 %17, !dbg !45
}

; Function Attrs: minsize optsize allocsize(0)
declare ptr @malloc(i64 noundef) #1

attributes #0 = { minsize nounwind optsize sspstrong uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { minsize optsize allocsize(0) "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!14, !15, !16, !17, !18, !19}
!llvm.ident = !{!20}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "b", scope: !2, file: !3, line: 1, type: !7, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 15.0.7", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, globals: !4, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "implicit_preprocessed_try_all_any_diff.c", directory: "/home/michel/ETH/AST/llvm-project/reduce", checksumkind: CSK_MD5, checksum: "6f2204f5409873cc3a97be766ec19b89")
!4 = !{!5, !0, !8, !10}
!5 = !DIGlobalVariableExpression(var: !6, expr: !DIExpression())
!6 = distinct !DIGlobalVariable(name: "a", scope: !2, file: !3, line: 1, type: !7, isLocal: false, isDefinition: true)
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "c", scope: !2, file: !3, line: 1, type: !7, isLocal: false, isDefinition: true)
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "d", scope: !2, file: !3, line: 2, type: !12, isLocal: false, isDefinition: true)
!12 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !13, size: 64)
!13 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!14 = !{i32 7, !"Dwarf Version", i32 5}
!15 = !{i32 2, !"Debug Info Version", i32 3}
!16 = !{i32 1, !"wchar_size", i32 4}
!17 = !{i32 7, !"PIC Level", i32 2}
!18 = !{i32 7, !"PIE Level", i32 2}
!19 = !{i32 7, !"uwtable", i32 2}
!20 = !{!"clang version 15.0.7"}
!21 = distinct !DISubprogram(name: "price_out_impl", scope: !3, file: !3, line: 3, type: !22, scopeLine: 3, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !24)
!22 = !DISubroutineType(types: !23)
!23 = !{!7}
!24 = !{}
!25 = !DILocation(line: 4, column: 3, scope: !21)
!26 = !DILocation(line: 4, column: 10, scope: !21)
!27 = !{!28, !28, i64 0}
!28 = !{!"int", !29, i64 0}
!29 = !{!"omnipotent char", !30, i64 0}
!30 = !{!"Simple C/C++ TBAA"}
!31 = !DILocation(line: 5, column: 19, scope: !32)
!32 = distinct !DILexicalBlock(scope: !21, file: !3, line: 5, column: 9)
!33 = !DILocation(line: 5, column: 16, scope: !32)
!34 = !DILocation(line: 5, column: 9, scope: !21)
!35 = !DILocation(line: 6, column: 7, scope: !32)
!36 = !{!37, !37, i64 0}
!37 = !{!"any pointer", !29, i64 0}
!38 = !DILocation(line: 6, column: 9, scope: !32)
!39 = !DILocation(line: 6, column: 12, scope: !32)
!40 = !{!41, !41, i64 0}
!41 = !{!"long", !29, i64 0}
!42 = distinct !{!42, !25, !43, !44}
!43 = !DILocation(line: 6, column: 14, scope: !21)
!44 = !{!"llvm.loop.mustprogress"}
!45 = !DILocation(line: 7, column: 1, scope: !21)
