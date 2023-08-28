; ModuleID = 'implicit_preprocessed_try_all.c'
source_filename = "implicit_preprocessed_try_all.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@e = dso_local global ptr null, align 8, !dbg !0
@a = dso_local global i32 0, align 4, !dbg !5
@f = dso_local global ptr null, align 8, !dbg !14
@g = dso_local global i32 0, align 4, !dbg !12
@d = dso_local global i32 0, align 4, !dbg !10
@c = dso_local global i32 0, align 4, !dbg !8

; Function Attrs: minsize nounwind optsize sspstrong uwtable
define dso_local i32 @price_out_impl() #0 !dbg !24 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  call void @llvm.lifetime.start.p0(i64 4, ptr %2) #6, !dbg !33
  call void @llvm.dbg.declare(metadata ptr %2, metadata !28, metadata !DIExpression()), !dbg !34
  call void @llvm.lifetime.start.p0(i64 8, ptr %3) #6, !dbg !35
  call void @llvm.dbg.declare(metadata ptr %3, metadata !29, metadata !DIExpression()), !dbg !36
  call void @llvm.lifetime.start.p0(i64 8, ptr %4) #6, !dbg !35
  call void @llvm.dbg.declare(metadata ptr %4, metadata !32, metadata !DIExpression()), !dbg !37
  %5 = call ptr @malloc(i64 noundef 8) #7, !dbg !38
  store ptr %5, ptr %4, align 8, !dbg !39, !tbaa !40
  store ptr %5, ptr %3, align 8, !dbg !44, !tbaa !40
  %6 = load ptr, ptr @e, align 8, !dbg !45, !tbaa !40
  %7 = icmp ne ptr %6, null, !dbg !45
  br i1 %7, label %8, label %12, !dbg !47

8:                                                ; preds = %0
  %9 = load i32, ptr @a, align 4, !dbg !48, !tbaa !49
  %10 = sext i32 %9 to i64, !dbg !48
  %11 = call ptr @calloc(i64 noundef 1, i64 noundef %10) #8, !dbg !51
  store ptr %11, ptr @f, align 8, !dbg !52, !tbaa !40
  br label %12, !dbg !53

12:                                               ; preds = %8, %0
  br label %13, !dbg !54

13:                                               ; preds = %43, %12
  %14 = load i32, ptr @g, align 4, !dbg !55, !tbaa !49
  %15 = icmp ne i32 %14, 0, !dbg !54
  br i1 %15, label %16, label %44, !dbg !54

16:                                               ; preds = %13
  %17 = load ptr, ptr @e, align 8, !dbg !56, !tbaa !40
  %18 = icmp ne ptr %17, null, !dbg !56
  br i1 %18, label %19, label %43, !dbg !58

19:                                               ; preds = %16
  %20 = call i32 (...) @b() #9, !dbg !59
  %21 = load ptr, ptr %3, align 8, !dbg !61, !tbaa !40
  %22 = load i32, ptr %2, align 4, !dbg !62, !tbaa !49
  %23 = sext i32 %22 to i64, !dbg !61
  %24 = getelementptr inbounds i64, ptr %21, i64 %23, !dbg !61
  %25 = load i64, ptr %24, align 8, !dbg !63, !tbaa !64
  %26 = add nsw i64 %25, 1, !dbg !63
  store i64 %26, ptr %24, align 8, !dbg !63, !tbaa !64
  %27 = load ptr, ptr @e, align 8, !dbg !66, !tbaa !40
  %28 = load i32, ptr %27, align 4, !dbg !67, !tbaa !49
  store i32 %28, ptr @d, align 4, !dbg !68, !tbaa !49
  %29 = load ptr, ptr %4, align 8, !dbg !69, !tbaa !40
  %30 = load i32, ptr %2, align 4, !dbg !71, !tbaa !49
  %31 = sext i32 %30 to i64, !dbg !69
  %32 = getelementptr inbounds i64, ptr %29, i64 %31, !dbg !69
  %33 = load i64, ptr %32, align 8, !dbg !69, !tbaa !64
  %34 = load i32, ptr @c, align 4, !dbg !72, !tbaa !49
  %35 = sext i32 %34 to i64, !dbg !72
  %36 = icmp eq i64 %33, %35, !dbg !73
  br i1 %36, label %37, label %42, !dbg !74

37:                                               ; preds = %19
  %38 = load ptr, ptr %4, align 8, !dbg !75, !tbaa !40
  %39 = load i32, ptr %2, align 4, !dbg !76, !tbaa !49
  %40 = sext i32 %39 to i64, !dbg !75
  %41 = getelementptr inbounds i64, ptr %38, i64 %40, !dbg !75
  store i64 0, ptr %41, align 8, !dbg !77, !tbaa !64
  br label %42, !dbg !75

42:                                               ; preds = %37, %19
  br label %43, !dbg !78

43:                                               ; preds = %42, %16
  br label %13, !dbg !54, !llvm.loop !79

44:                                               ; preds = %13
  call void @llvm.lifetime.end.p0(i64 8, ptr %4) #6, !dbg !82
  call void @llvm.lifetime.end.p0(i64 8, ptr %3) #6, !dbg !82
  call void @llvm.lifetime.end.p0(i64 4, ptr %2) #6, !dbg !82
  %45 = load i32, ptr %1, align 4, !dbg !82
  ret i32 %45, !dbg !82
}

; Function Attrs: argmemonly nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare void @llvm.dbg.declare(metadata, metadata, metadata) #2

; Function Attrs: minsize optsize allocsize(0)
declare ptr @malloc(i64 noundef) #3

; Function Attrs: minsize optsize allocsize(0,1)
declare ptr @calloc(i64 noundef, i64 noundef) #4

; Function Attrs: minsize optsize
declare !dbg !83 i32 @b(...) #5

; Function Attrs: argmemonly nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

attributes #0 = { minsize nounwind optsize sspstrong uwtable "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { argmemonly nocallback nofree nosync nounwind willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { minsize optsize allocsize(0) "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { minsize optsize allocsize(0,1) "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { minsize optsize "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { minsize optsize allocsize(0) }
attributes #8 = { minsize optsize allocsize(0,1) }
attributes #9 = { minsize optsize }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!17, !18, !19, !20, !21, !22}
!llvm.ident = !{!23}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "e", scope: !2, file: !3, line: 1, type: !16, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 15.0.7", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, globals: !4, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "implicit_preprocessed_try_all.c", directory: "/home/michel/ETH/AST/llvm-project/reduce", checksumkind: CSK_MD5, checksum: "a8e208d400ea6b3d3e77d7cc4dbffc4e")
!4 = !{!5, !8, !10, !0, !12, !14}
!5 = !DIGlobalVariableExpression(var: !6, expr: !DIExpression())
!6 = distinct !DIGlobalVariable(name: "a", scope: !2, file: !3, line: 1, type: !7, isLocal: false, isDefinition: true)
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "c", scope: !2, file: !3, line: 1, type: !7, isLocal: false, isDefinition: true)
!10 = !DIGlobalVariableExpression(var: !11, expr: !DIExpression())
!11 = distinct !DIGlobalVariable(name: "d", scope: !2, file: !3, line: 1, type: !7, isLocal: false, isDefinition: true)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(name: "g", scope: !2, file: !3, line: 1, type: !7, isLocal: false, isDefinition: true)
!14 = !DIGlobalVariableExpression(var: !15, expr: !DIExpression())
!15 = distinct !DIGlobalVariable(name: "f", scope: !2, file: !3, line: 2, type: !16, isLocal: false, isDefinition: true)
!16 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!17 = !{i32 7, !"Dwarf Version", i32 5}
!18 = !{i32 2, !"Debug Info Version", i32 3}
!19 = !{i32 1, !"wchar_size", i32 4}
!20 = !{i32 7, !"PIC Level", i32 2}
!21 = !{i32 7, !"PIE Level", i32 2}
!22 = !{i32 7, !"uwtable", i32 2}
!23 = !{!"clang version 15.0.7"}
!24 = distinct !DISubprogram(name: "price_out_impl", scope: !3, file: !3, line: 3, type: !25, scopeLine: 3, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !27)
!25 = !DISubroutineType(types: !26)
!26 = !{!7}
!27 = !{!28, !29, !32}
!28 = !DILocalVariable(name: "h", scope: !24, file: !3, line: 4, type: !7)
!29 = !DILocalVariable(name: "i", scope: !24, file: !3, line: 5, type: !30)
!30 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !31, size: 64)
!31 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!32 = !DILocalVariable(name: "j", scope: !24, file: !3, line: 5, type: !30)
!33 = !DILocation(line: 4, column: 3, scope: !24)
!34 = !DILocation(line: 4, column: 7, scope: !24)
!35 = !DILocation(line: 5, column: 3, scope: !24)
!36 = !DILocation(line: 5, column: 9, scope: !24)
!37 = !DILocation(line: 5, column: 13, scope: !24)
!38 = !DILocation(line: 6, column: 11, scope: !24)
!39 = !DILocation(line: 6, column: 9, scope: !24)
!40 = !{!41, !41, i64 0}
!41 = !{!"any pointer", !42, i64 0}
!42 = !{!"omnipotent char", !43, i64 0}
!43 = !{!"Simple C/C++ TBAA"}
!44 = !DILocation(line: 6, column: 5, scope: !24)
!45 = !DILocation(line: 7, column: 7, scope: !46)
!46 = distinct !DILexicalBlock(scope: !24, file: !3, line: 7, column: 7)
!47 = !DILocation(line: 7, column: 7, scope: !24)
!48 = !DILocation(line: 8, column: 19, scope: !46)
!49 = !{!50, !50, i64 0}
!50 = !{!"int", !42, i64 0}
!51 = !DILocation(line: 8, column: 9, scope: !46)
!52 = !DILocation(line: 8, column: 7, scope: !46)
!53 = !DILocation(line: 8, column: 5, scope: !46)
!54 = !DILocation(line: 9, column: 3, scope: !24)
!55 = !DILocation(line: 9, column: 10, scope: !24)
!56 = !DILocation(line: 10, column: 9, scope: !57)
!57 = distinct !DILexicalBlock(scope: !24, file: !3, line: 10, column: 9)
!58 = !DILocation(line: 10, column: 9, scope: !24)
!59 = !DILocation(line: 11, column: 7, scope: !60)
!60 = distinct !DILexicalBlock(scope: !57, file: !3, line: 10, column: 12)
!61 = !DILocation(line: 12, column: 7, scope: !60)
!62 = !DILocation(line: 12, column: 9, scope: !60)
!63 = !DILocation(line: 12, column: 11, scope: !60)
!64 = !{!65, !65, i64 0}
!65 = !{!"long", !42, i64 0}
!66 = !DILocation(line: 13, column: 12, scope: !60)
!67 = !DILocation(line: 13, column: 11, scope: !60)
!68 = !DILocation(line: 13, column: 9, scope: !60)
!69 = !DILocation(line: 14, column: 11, scope: !70)
!70 = distinct !DILexicalBlock(scope: !60, file: !3, line: 14, column: 11)
!71 = !DILocation(line: 14, column: 13, scope: !70)
!72 = !DILocation(line: 14, column: 19, scope: !70)
!73 = !DILocation(line: 14, column: 16, scope: !70)
!74 = !DILocation(line: 14, column: 11, scope: !60)
!75 = !DILocation(line: 15, column: 9, scope: !70)
!76 = !DILocation(line: 15, column: 11, scope: !70)
!77 = !DILocation(line: 15, column: 14, scope: !70)
!78 = !DILocation(line: 16, column: 5, scope: !60)
!79 = distinct !{!79, !54, !80, !81}
!80 = !DILocation(line: 16, column: 5, scope: !24)
!81 = !{!"llvm.loop.mustprogress"}
!82 = !DILocation(line: 17, column: 1, scope: !24)
!83 = !DISubprogram(name: "b", scope: !3, file: !3, line: 11, type: !25, flags: DIFlagArtificial, spFlags: DISPFlagOptimized, retainedNodes: !84)
!84 = !{}
