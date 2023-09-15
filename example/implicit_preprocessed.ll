; ModuleID = 'implicit_preprocessed.c'
source_filename = "implicit_preprocessed.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@g = dso_local global i32 0, align 4, !dbg !0
@d = dso_local global i32 0, align 4, !dbg !5

; Function Attrs: minsize nounwind optsize sspstrong uwtable
define dso_local i32 @foo() #0 !dbg !15 {
  %1 = alloca ptr, align 8
  call void @llvm.lifetime.start.p0(i64 8, ptr %1) #4, !dbg !21
  call void @llvm.dbg.declare(metadata ptr %1, metadata !19, metadata !DIExpression()), !dbg !22
  %2 = call ptr @malloc(i64 noundef 8) #5, !dbg !23
  store ptr %2, ptr %1, align 8, !dbg !22, !tbaa !24
  br label %3, !dbg !28

3:                                                ; preds = %23, %0
  %4 = load i32, ptr @g, align 4, !dbg !29, !tbaa !30
  %5 = icmp ne i32 %4, 0, !dbg !28
  br i1 %5, label %6, label %24, !dbg !28

6:                                                ; preds = %3
  %7 = load i32, ptr @d, align 4, !dbg !32, !tbaa !30
  %8 = icmp ne i32 %7, 0, !dbg !32
  br i1 %8, label %9, label %23, !dbg !34

9:                                                ; preds = %6
  %10 = load ptr, ptr %1, align 8, !dbg !35, !tbaa !24
  %11 = getelementptr inbounds i32, ptr %10, i64 0, !dbg !35
  %12 = load i32, ptr %11, align 4, !dbg !37, !tbaa !30
  %13 = add nsw i32 %12, 1, !dbg !37
  store i32 %13, ptr %11, align 4, !dbg !37, !tbaa !30
  store i32 0, ptr @d, align 4, !dbg !38, !tbaa !30
  %14 = load ptr, ptr %1, align 8, !dbg !39, !tbaa !24
  %15 = getelementptr inbounds i32, ptr %14, i64 0, !dbg !39
  %16 = load i32, ptr %15, align 4, !dbg !39, !tbaa !30
  %17 = load i32, ptr @g, align 4, !dbg !41, !tbaa !30
  %18 = icmp eq i32 %16, %17, !dbg !42
  br i1 %18, label %19, label %22, !dbg !43

19:                                               ; preds = %9
  %20 = load ptr, ptr %1, align 8, !dbg !44, !tbaa !24
  %21 = getelementptr inbounds i32, ptr %20, i64 0, !dbg !44
  store i32 0, ptr %21, align 4, !dbg !45, !tbaa !30
  br label %22, !dbg !44

22:                                               ; preds = %19, %9
  br label %23, !dbg !46

23:                                               ; preds = %22, %6
  br label %3, !dbg !28, !llvm.loop !47

24:                                               ; preds = %3
  %25 = load i32, ptr @d, align 4, !dbg !50, !tbaa !30
  call void @llvm.lifetime.end.p0(i64 8, ptr %1) #4, !dbg !51
  ret i32 %25, !dbg !52
}

; Function Attrs: argmemonly nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: minsize optsize allocsize(0)
declare ptr @malloc(i64 noundef) #3

; Function Attrs: argmemonly nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

attributes #0 = { minsize nounwind optsize sspstrong uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly nocallback nofree nosync nounwind willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { minsize optsize allocsize(0) "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }
attributes #5 = { minsize optsize allocsize(0) }

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
!11 = !{i32 7, !"PIC Level", i32 2}
!12 = !{i32 7, !"PIE Level", i32 2}
!13 = !{i32 7, !"uwtable", i32 2}
!14 = !{!"clang version 15.0.7"}
!15 = distinct !DISubprogram(name: "foo", scope: !3, file: !3, line: 2, type: !16, scopeLine: 2, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !18)
!16 = !DISubroutineType(types: !17)
!17 = !{!7}
!18 = !{!19}
!19 = !DILocalVariable(name: "i", scope: !15, file: !3, line: 3, type: !20)
!20 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!21 = !DILocation(line: 3, column: 3, scope: !15)
!22 = !DILocation(line: 3, column: 8, scope: !15)
!23 = !DILocation(line: 3, column: 12, scope: !15)
!24 = !{!25, !25, i64 0}
!25 = !{!"any pointer", !26, i64 0}
!26 = !{!"omnipotent char", !27, i64 0}
!27 = !{!"Simple C/C++ TBAA"}
!28 = !DILocation(line: 4, column: 3, scope: !15)
!29 = !DILocation(line: 4, column: 10, scope: !15)
!30 = !{!31, !31, i64 0}
!31 = !{!"int", !26, i64 0}
!32 = !DILocation(line: 5, column: 9, scope: !33)
!33 = distinct !DILexicalBlock(scope: !15, file: !3, line: 5, column: 9)
!34 = !DILocation(line: 5, column: 9, scope: !15)
!35 = !DILocation(line: 6, column: 7, scope: !36)
!36 = distinct !DILexicalBlock(scope: !33, file: !3, line: 5, column: 12)
!37 = !DILocation(line: 6, column: 11, scope: !36)
!38 = !DILocation(line: 7, column: 9, scope: !36)
!39 = !DILocation(line: 8, column: 11, scope: !40)
!40 = distinct !DILexicalBlock(scope: !36, file: !3, line: 8, column: 11)
!41 = !DILocation(line: 8, column: 19, scope: !40)
!42 = !DILocation(line: 8, column: 16, scope: !40)
!43 = !DILocation(line: 8, column: 11, scope: !36)
!44 = !DILocation(line: 9, column: 9, scope: !40)
!45 = !DILocation(line: 9, column: 14, scope: !40)
!46 = !DILocation(line: 10, column: 5, scope: !36)
!47 = distinct !{!47, !28, !48, !49}
!48 = !DILocation(line: 10, column: 5, scope: !15)
!49 = !{!"llvm.loop.mustprogress"}
!50 = !DILocation(line: 11, column: 10, scope: !15)
!51 = !DILocation(line: 12, column: 1, scope: !15)
!52 = !DILocation(line: 11, column: 3, scope: !15)
