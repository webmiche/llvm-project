; ModuleID = 'implicit_preprocessed.c'
source_filename = "implicit_preprocessed.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.a = type { i64 }
%struct.d = type { ptr }

@e = dso_local global i32 0, align 4, !dbg !0
@k = dso_local global ptr null, align 8, !dbg !13
@j = dso_local global ptr null, align 8, !dbg !11
@h = dso_local global ptr null, align 8, !dbg !8
@g = dso_local global i32 0, align 4, !dbg !5

; Function Attrs: minsize nounwind optsize sspstrong uwtable
define dso_local i32 @price_out_impl() #0 !dbg !22 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca ptr, align 8
  call void @llvm.lifetime.start.p0(i64 8, ptr %2) #6, !dbg !47
  call void @llvm.dbg.declare(metadata ptr %2, metadata !26, metadata !DIExpression()), !dbg !48
  call void @llvm.lifetime.start.p0(i64 8, ptr %3) #6, !dbg !47
  call void @llvm.dbg.declare(metadata ptr %3, metadata !28, metadata !DIExpression()), !dbg !49
  call void @llvm.lifetime.start.p0(i64 8, ptr %4) #6, !dbg !47
  call void @llvm.dbg.declare(metadata ptr %4, metadata !29, metadata !DIExpression()), !dbg !50
  call void @llvm.lifetime.start.p0(i64 4, ptr %5) #6, !dbg !51
  call void @llvm.dbg.declare(metadata ptr %5, metadata !30, metadata !DIExpression()), !dbg !52
  call void @llvm.lifetime.start.p0(i64 4, ptr %6) #6, !dbg !51
  call void @llvm.dbg.declare(metadata ptr %6, metadata !31, metadata !DIExpression()), !dbg !53
  call void @llvm.lifetime.start.p0(i64 8, ptr %7) #6, !dbg !54
  call void @llvm.dbg.declare(metadata ptr %7, metadata !32, metadata !DIExpression()), !dbg !55
  call void @llvm.lifetime.start.p0(i64 8, ptr %8) #6, !dbg !54
  call void @llvm.dbg.declare(metadata ptr %8, metadata !34, metadata !DIExpression()), !dbg !56
  call void @llvm.lifetime.start.p0(i64 8, ptr %9) #6, !dbg !57
  call void @llvm.dbg.declare(metadata ptr %9, metadata !35, metadata !DIExpression()), !dbg !58
  call void @llvm.lifetime.start.p0(i64 8, ptr %10) #6, !dbg !57
  call void @llvm.dbg.declare(metadata ptr %10, metadata !41, metadata !DIExpression()), !dbg !59
  call void @llvm.lifetime.start.p0(i64 8, ptr %11) #6, !dbg !60
  call void @llvm.dbg.declare(metadata ptr %11, metadata !42, metadata !DIExpression()), !dbg !61
  %12 = call ptr @malloc(i64 noundef 8) #7, !dbg !62
  store ptr %12, ptr %7, align 8, !dbg !63, !tbaa !64
  %13 = call ptr @malloc(i64 noundef 8) #7, !dbg !68
  store ptr %13, ptr %8, align 8, !dbg !69, !tbaa !64
  %14 = load i32, ptr @e, align 4, !dbg !70, !tbaa !71
  %15 = sext i32 %14 to i64, !dbg !70
  store i64 %15, ptr %4, align 8, !dbg !73, !tbaa !74
  store i64 %15, ptr %3, align 8, !dbg !76, !tbaa !74
  store i64 0, ptr %2, align 8, !dbg !77, !tbaa !74
  br label %16, !dbg !78

16:                                               ; preds = %73, %0
  %17 = load i64, ptr %2, align 8, !dbg !79, !tbaa !74
  %18 = load i64, ptr %3, align 8, !dbg !82, !tbaa !74
  %19 = icmp slt i64 %17, %18, !dbg !83
  br i1 %19, label %20, label %76, !dbg !84

20:                                               ; preds = %16
  %21 = load ptr, ptr @k, align 8, !dbg !85, !tbaa !64
  %22 = icmp ne ptr %21, null, !dbg !85
  br i1 %22, label %23, label %25, !dbg !88

23:                                               ; preds = %20
  %24 = call ptr @calloc(i64 noundef 1, i64 noundef 8) #8, !dbg !89
  store ptr %24, ptr %9, align 8, !dbg !90, !tbaa !64
  br label %25, !dbg !91

25:                                               ; preds = %23, %20
  %26 = load ptr, ptr @k, align 8, !dbg !92, !tbaa !64
  store ptr %26, ptr %11, align 8, !dbg !93, !tbaa !64
  %27 = load ptr, ptr @j, align 8, !dbg !94, !tbaa !64
  store ptr %27, ptr %10, align 8, !dbg !95, !tbaa !64
  br label %28, !dbg !96

28:                                               ; preds = %68, %25
  %29 = load ptr, ptr %10, align 8, !dbg !97, !tbaa !64
  %30 = icmp ne ptr %29, null, !dbg !96
  br i1 %30, label %31, label %72, !dbg !96

31:                                               ; preds = %28
  %32 = load ptr, ptr %11, align 8, !dbg !98, !tbaa !64
  %33 = getelementptr inbounds %struct.a, ptr %32, i32 0, i32 0, !dbg !101
  %34 = load i64, ptr %33, align 8, !dbg !101, !tbaa !102
  %35 = icmp ne i64 %34, 0, !dbg !98
  br i1 %35, label %36, label %68, !dbg !104

36:                                               ; preds = %31
  %37 = call i32 (...) @b() #9, !dbg !105
  %38 = load ptr, ptr %7, align 8, !dbg !107, !tbaa !64
  %39 = load i32, ptr %5, align 4, !dbg !108, !tbaa !71
  %40 = sext i32 %39 to i64, !dbg !107
  %41 = getelementptr inbounds i64, ptr %38, i64 %40, !dbg !107
  %42 = load i64, ptr %41, align 8, !dbg !109, !tbaa !74
  %43 = add nsw i64 %42, 1, !dbg !109
  store i64 %43, ptr %41, align 8, !dbg !109, !tbaa !74
  %44 = load ptr, ptr @h, align 8, !dbg !110, !tbaa !64
  %45 = load ptr, ptr %8, align 8, !dbg !111, !tbaa !64
  %46 = load i32, ptr %5, align 4, !dbg !112, !tbaa !71
  %47 = sext i32 %46 to i64, !dbg !111
  %48 = getelementptr inbounds i64, ptr %45, i64 %47, !dbg !111
  %49 = load i64, ptr %48, align 8, !dbg !113, !tbaa !74
  %50 = add nsw i64 %49, 1, !dbg !113
  store i64 %50, ptr %48, align 8, !dbg !113, !tbaa !74
  %51 = getelementptr inbounds i32, ptr %44, i64 %49, !dbg !110
  %52 = load i32, ptr %51, align 4, !dbg !110, !tbaa !71
  %53 = load ptr, ptr @k, align 8, !dbg !114, !tbaa !64
  %54 = load i32, ptr %53, align 4, !dbg !115, !tbaa !71
  store i32 %54, ptr @g, align 4, !dbg !116, !tbaa !71
  %55 = load ptr, ptr %8, align 8, !dbg !117, !tbaa !64
  %56 = load i32, ptr %5, align 4, !dbg !119, !tbaa !71
  %57 = sext i32 %56 to i64, !dbg !117
  %58 = getelementptr inbounds i64, ptr %55, i64 %57, !dbg !117
  %59 = load i64, ptr %58, align 8, !dbg !117, !tbaa !74
  %60 = load i64, ptr %4, align 8, !dbg !120, !tbaa !74
  %61 = icmp eq i64 %59, %60, !dbg !121
  br i1 %61, label %62, label %67, !dbg !122

62:                                               ; preds = %36
  %63 = load ptr, ptr %8, align 8, !dbg !123, !tbaa !64
  %64 = load i32, ptr %5, align 4, !dbg !124, !tbaa !71
  %65 = sext i32 %64 to i64, !dbg !123
  %66 = getelementptr inbounds i64, ptr %63, i64 %65, !dbg !123
  store i64 0, ptr %66, align 8, !dbg !125, !tbaa !74
  br label %67, !dbg !123

67:                                               ; preds = %62, %36
  br label %68, !dbg !126

68:                                               ; preds = %67, %31
  %69 = load ptr, ptr %10, align 8, !dbg !127, !tbaa !64
  %70 = getelementptr inbounds %struct.d, ptr %69, i32 0, i32 0, !dbg !128
  %71 = load ptr, ptr %70, align 8, !dbg !128, !tbaa !129
  store ptr %71, ptr %10, align 8, !dbg !131, !tbaa !64
  br label %28, !dbg !96, !llvm.loop !132

72:                                               ; preds = %28
  br label %73, !dbg !135

73:                                               ; preds = %72
  %74 = load i64, ptr %2, align 8, !dbg !136, !tbaa !74
  %75 = add nsw i64 %74, 1, !dbg !136
  store i64 %75, ptr %2, align 8, !dbg !136, !tbaa !74
  br label %16, !dbg !137, !llvm.loop !138

76:                                               ; preds = %16
  %77 = load ptr, ptr %9, align 8, !dbg !140, !tbaa !64
  call void @free(ptr noundef %77) #9, !dbg !141
  %78 = load ptr, ptr %7, align 8, !dbg !142, !tbaa !64
  %79 = load i32, ptr %5, align 4, !dbg !144, !tbaa !71
  %80 = sext i32 %79 to i64, !dbg !142
  %81 = getelementptr inbounds i64, ptr %78, i64 %80, !dbg !142
  %82 = load i64, ptr %81, align 8, !dbg !142, !tbaa !74
  %83 = icmp ne i64 %82, 0, !dbg !142
  br i1 %83, label %84, label %90, !dbg !145

84:                                               ; preds = %76
  br label %85, !dbg !146

85:                                               ; preds = %88, %84
  %86 = load i32, ptr %6, align 4, !dbg !147, !tbaa !71
  %87 = icmp ne i32 %86, 0, !dbg !150
  br i1 %87, label %88, label %89, !dbg !150

88:                                               ; preds = %85
  br label %85, !dbg !151, !llvm.loop !152

89:                                               ; preds = %85
  br label %90, !dbg !153

90:                                               ; preds = %89, %76
  call void @llvm.lifetime.end.p0(i64 8, ptr %11) #6, !dbg !154
  call void @llvm.lifetime.end.p0(i64 8, ptr %10) #6, !dbg !154
  call void @llvm.lifetime.end.p0(i64 8, ptr %9) #6, !dbg !154
  call void @llvm.lifetime.end.p0(i64 8, ptr %8) #6, !dbg !154
  call void @llvm.lifetime.end.p0(i64 8, ptr %7) #6, !dbg !154
  call void @llvm.lifetime.end.p0(i64 4, ptr %6) #6, !dbg !154
  call void @llvm.lifetime.end.p0(i64 4, ptr %5) #6, !dbg !154
  call void @llvm.lifetime.end.p0(i64 8, ptr %4) #6, !dbg !154
  call void @llvm.lifetime.end.p0(i64 8, ptr %3) #6, !dbg !154
  call void @llvm.lifetime.end.p0(i64 8, ptr %2) #6, !dbg !154
  %91 = load i32, ptr %1, align 4, !dbg !154
  ret i32 %91, !dbg !154
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
declare !dbg !155 i32 @b(...) #5

; Function Attrs: minsize optsize
declare void @free(ptr noundef) #5

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
!llvm.module.flags = !{!15, !16, !17, !18, !19, !20}
!llvm.ident = !{!21}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "e", scope: !2, file: !3, line: 7, type: !7, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C99, file: !3, producer: "clang version 15.0.7", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, globals: !4, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "implicit_preprocessed.c", directory: "/home/michel/ETH/AST/llvm-project/reduce", checksumkind: CSK_MD5, checksum: "78e1e5108f496697ca96f5664ec7687f")
!4 = !{!0, !5, !8, !11, !13}
!5 = !DIGlobalVariableExpression(var: !6, expr: !DIExpression())
!6 = distinct !DIGlobalVariable(name: "g", scope: !2, file: !3, line: 7, type: !7, isLocal: false, isDefinition: true)
!7 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(name: "h", scope: !2, file: !3, line: 8, type: !10, isLocal: false, isDefinition: true)
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !7, size: 64)
!11 = !DIGlobalVariableExpression(var: !12, expr: !DIExpression())
!12 = distinct !DIGlobalVariable(name: "j", scope: !2, file: !3, line: 8, type: !10, isLocal: false, isDefinition: true)
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(name: "k", scope: !2, file: !3, line: 8, type: !10, isLocal: false, isDefinition: true)
!15 = !{i32 7, !"Dwarf Version", i32 5}
!16 = !{i32 2, !"Debug Info Version", i32 3}
!17 = !{i32 1, !"wchar_size", i32 4}
!18 = !{i32 7, !"PIC Level", i32 2}
!19 = !{i32 7, !"PIE Level", i32 2}
!20 = !{i32 7, !"uwtable", i32 2}
!21 = !{!"clang version 15.0.7"}
!22 = distinct !DISubprogram(name: "price_out_impl", scope: !3, file: !3, line: 9, type: !23, scopeLine: 9, flags: DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !25)
!23 = !DISubroutineType(types: !24)
!24 = !{!7}
!25 = !{!26, !28, !29, !30, !31, !32, !34, !35, !41, !42}
!26 = !DILocalVariable(name: "i", scope: !22, file: !3, line: 10, type: !27)
!27 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!28 = !DILocalVariable(name: "l", scope: !22, file: !3, line: 10, type: !27)
!29 = !DILocalVariable(name: "p", scope: !22, file: !3, line: 10, type: !27)
!30 = !DILocalVariable(name: "m", scope: !22, file: !3, line: 11, type: !7)
!31 = !DILocalVariable(name: "ae", scope: !22, file: !3, line: 11, type: !7)
!32 = !DILocalVariable(name: "n", scope: !22, file: !3, line: 12, type: !33)
!33 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !27, size: 64)
!34 = !DILocalVariable(name: "o", scope: !22, file: !3, line: 12, type: !33)
!35 = !DILocalVariable(name: "q", scope: !22, file: !3, line: 13, type: !36)
!36 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !37, size: 64)
!37 = !DIDerivedType(tag: DW_TAG_typedef, name: "d", file: !3, line: 6, baseType: !38)
!38 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 4, size: 64, elements: !39)
!39 = !{!40}
!40 = !DIDerivedType(tag: DW_TAG_member, name: "c", scope: !38, file: !3, line: 5, baseType: !10, size: 64)
!41 = !DILocalVariable(name: "ab", scope: !22, file: !3, line: 13, type: !36)
!42 = !DILocalVariable(name: "f", scope: !22, file: !3, line: 14, type: !43)
!43 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !44, size: 64)
!44 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "a", file: !3, line: 1, size: 64, elements: !45)
!45 = !{!46}
!46 = !DIDerivedType(tag: DW_TAG_member, name: "b", scope: !44, file: !3, line: 2, baseType: !27, size: 64)
!47 = !DILocation(line: 10, column: 3, scope: !22)
!48 = !DILocation(line: 10, column: 8, scope: !22)
!49 = !DILocation(line: 10, column: 11, scope: !22)
!50 = !DILocation(line: 10, column: 14, scope: !22)
!51 = !DILocation(line: 11, column: 3, scope: !22)
!52 = !DILocation(line: 11, column: 7, scope: !22)
!53 = !DILocation(line: 11, column: 10, scope: !22)
!54 = !DILocation(line: 12, column: 3, scope: !22)
!55 = !DILocation(line: 12, column: 9, scope: !22)
!56 = !DILocation(line: 12, column: 13, scope: !22)
!57 = !DILocation(line: 13, column: 3, scope: !22)
!58 = !DILocation(line: 13, column: 6, scope: !22)
!59 = !DILocation(line: 13, column: 10, scope: !22)
!60 = !DILocation(line: 14, column: 3, scope: !22)
!61 = !DILocation(line: 14, column: 13, scope: !22)
!62 = !DILocation(line: 15, column: 7, scope: !22)
!63 = !DILocation(line: 15, column: 5, scope: !22)
!64 = !{!65, !65, i64 0}
!65 = !{!"any pointer", !66, i64 0}
!66 = !{!"omnipotent char", !67, i64 0}
!67 = !{!"Simple C/C++ TBAA"}
!68 = !DILocation(line: 16, column: 7, scope: !22)
!69 = !DILocation(line: 16, column: 5, scope: !22)
!70 = !DILocation(line: 17, column: 11, scope: !22)
!71 = !{!72, !72, i64 0}
!72 = !{!"int", !66, i64 0}
!73 = !DILocation(line: 17, column: 9, scope: !22)
!74 = !{!75, !75, i64 0}
!75 = !{!"long", !66, i64 0}
!76 = !DILocation(line: 17, column: 5, scope: !22)
!77 = !DILocation(line: 18, column: 5, scope: !22)
!78 = !DILocation(line: 19, column: 3, scope: !22)
!79 = !DILocation(line: 19, column: 10, scope: !80)
!80 = distinct !DILexicalBlock(scope: !81, file: !3, line: 19, column: 3)
!81 = distinct !DILexicalBlock(scope: !22, file: !3, line: 19, column: 3)
!82 = !DILocation(line: 19, column: 14, scope: !80)
!83 = !DILocation(line: 19, column: 12, scope: !80)
!84 = !DILocation(line: 19, column: 3, scope: !81)
!85 = !DILocation(line: 20, column: 9, scope: !86)
!86 = distinct !DILexicalBlock(scope: !87, file: !3, line: 20, column: 9)
!87 = distinct !DILexicalBlock(scope: !80, file: !3, line: 19, column: 22)
!88 = !DILocation(line: 20, column: 9, scope: !87)
!89 = !DILocation(line: 21, column: 11, scope: !86)
!90 = !DILocation(line: 21, column: 9, scope: !86)
!91 = !DILocation(line: 21, column: 7, scope: !86)
!92 = !DILocation(line: 22, column: 9, scope: !87)
!93 = !DILocation(line: 22, column: 7, scope: !87)
!94 = !DILocation(line: 23, column: 10, scope: !87)
!95 = !DILocation(line: 23, column: 8, scope: !87)
!96 = !DILocation(line: 24, column: 5, scope: !87)
!97 = !DILocation(line: 24, column: 12, scope: !87)
!98 = !DILocation(line: 25, column: 11, scope: !99)
!99 = distinct !DILexicalBlock(scope: !100, file: !3, line: 25, column: 11)
!100 = distinct !DILexicalBlock(scope: !87, file: !3, line: 24, column: 16)
!101 = !DILocation(line: 25, column: 14, scope: !99)
!102 = !{!103, !75, i64 0}
!103 = !{!"a", !75, i64 0}
!104 = !DILocation(line: 25, column: 11, scope: !100)
!105 = !DILocation(line: 26, column: 9, scope: !106)
!106 = distinct !DILexicalBlock(scope: !99, file: !3, line: 25, column: 17)
!107 = !DILocation(line: 27, column: 9, scope: !106)
!108 = !DILocation(line: 27, column: 11, scope: !106)
!109 = !DILocation(line: 27, column: 13, scope: !106)
!110 = !DILocation(line: 28, column: 9, scope: !106)
!111 = !DILocation(line: 28, column: 11, scope: !106)
!112 = !DILocation(line: 28, column: 13, scope: !106)
!113 = !DILocation(line: 28, column: 15, scope: !106)
!114 = !DILocation(line: 29, column: 14, scope: !106)
!115 = !DILocation(line: 29, column: 13, scope: !106)
!116 = !DILocation(line: 29, column: 11, scope: !106)
!117 = !DILocation(line: 30, column: 13, scope: !118)
!118 = distinct !DILexicalBlock(scope: !106, file: !3, line: 30, column: 13)
!119 = !DILocation(line: 30, column: 15, scope: !118)
!120 = !DILocation(line: 30, column: 21, scope: !118)
!121 = !DILocation(line: 30, column: 18, scope: !118)
!122 = !DILocation(line: 30, column: 13, scope: !106)
!123 = !DILocation(line: 31, column: 11, scope: !118)
!124 = !DILocation(line: 31, column: 13, scope: !118)
!125 = !DILocation(line: 31, column: 16, scope: !118)
!126 = !DILocation(line: 32, column: 7, scope: !106)
!127 = !DILocation(line: 33, column: 12, scope: !100)
!128 = !DILocation(line: 33, column: 16, scope: !100)
!129 = !{!130, !65, i64 0}
!130 = !{!"", !65, i64 0}
!131 = !DILocation(line: 33, column: 10, scope: !100)
!132 = distinct !{!132, !96, !133, !134}
!133 = !DILocation(line: 34, column: 5, scope: !87)
!134 = !{!"llvm.loop.mustprogress"}
!135 = !DILocation(line: 35, column: 3, scope: !87)
!136 = !DILocation(line: 19, column: 18, scope: !80)
!137 = !DILocation(line: 19, column: 3, scope: !80)
!138 = distinct !{!138, !84, !139, !134}
!139 = !DILocation(line: 35, column: 3, scope: !81)
!140 = !DILocation(line: 36, column: 8, scope: !22)
!141 = !DILocation(line: 36, column: 3, scope: !22)
!142 = !DILocation(line: 37, column: 7, scope: !143)
!143 = distinct !DILexicalBlock(scope: !22, file: !3, line: 37, column: 7)
!144 = !DILocation(line: 37, column: 9, scope: !143)
!145 = !DILocation(line: 37, column: 7, scope: !22)
!146 = !DILocation(line: 38, column: 5, scope: !143)
!147 = !DILocation(line: 38, column: 12, scope: !148)
!148 = distinct !DILexicalBlock(scope: !149, file: !3, line: 38, column: 5)
!149 = distinct !DILexicalBlock(scope: !143, file: !3, line: 38, column: 5)
!150 = !DILocation(line: 38, column: 5, scope: !149)
!151 = !DILocation(line: 38, column: 5, scope: !148)
!152 = distinct !{!152, !150, !153, !134}
!153 = !DILocation(line: 39, column: 7, scope: !149)
!154 = !DILocation(line: 40, column: 1, scope: !22)
!155 = !DISubprogram(name: "b", scope: !3, file: !3, line: 26, type: !23, flags: DIFlagArtificial, spFlags: DISPFlagOptimized, retainedNodes: !156)
!156 = !{}
