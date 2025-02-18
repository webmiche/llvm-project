; ModuleID = 'naive_start/657/liblzma/common/vli_decoder.bc'
source_filename = "/home/webmiche/specbuilder/src/657/liblzma/common/vli_decoder.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: minsize nofree nosync nounwind optsize memory(write, argmem: readwrite, inaccessiblemem: none) uwtable
define dso_local i32 @lzma_vli_decode(ptr noalias nocapture noundef %vli, ptr noundef %vli_pos, ptr noalias nocapture noundef readonly %in, ptr noalias nocapture noundef %in_pos, i64 noundef %in_size) local_unnamed_addr #0 {
entry:
  %vli_pos_internal = alloca i64, align 8
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %vli_pos_internal) #3
  %cmp = icmp eq ptr %vli_pos, null
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i64 0, ptr %vli, align 8, !tbaa !5
  %0 = load i64, ptr %in_pos, align 8, !tbaa !5
  %cmp1.not = icmp ult i64 %0, %in_size
  br i1 %cmp1.not, label %if.end13, label %cleanup41

if.else:                                          ; preds = %entry
  %1 = load i64, ptr %vli_pos, align 8, !tbaa !5
  %cmp3 = icmp eq i64 %1, 0
  br i1 %cmp3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.else
  store i64 0, ptr %vli, align 8, !tbaa !5
  %.pr = load i64, ptr %vli_pos, align 8, !tbaa !5
  br label %if.end5

if.end5:                                          ; preds = %if.then4, %if.else
  %2 = phi i64 [ %.pr, %if.then4 ], [ %1, %if.else ]
  %cmp6 = icmp ugt i64 %2, 8
  br i1 %cmp6, label %cleanup41, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end5
  %3 = load i64, ptr %vli, align 8, !tbaa !5
  %mul = mul nuw nsw i64 %2, 7
  %shr = lshr i64 %3, %mul
  %cmp7.not = icmp eq i64 %shr, 0
  br i1 %cmp7.not, label %if.end9, label %cleanup41

if.end9:                                          ; preds = %lor.lhs.false
  %4 = load i64, ptr %in_pos, align 8, !tbaa !5
  %cmp10.not = icmp ult i64 %4, %in_size
  br i1 %cmp10.not, label %if.end13, label %cleanup41

if.end13:                                         ; preds = %if.end9, %if.then
  %vli.promoted = phi i64 [ 0, %if.then ], [ %3, %if.end9 ]
  %vli_pos.addr.0.promoted = phi i64 [ 0, %if.then ], [ %2, %if.end9 ]
  %in_pos.promoted = phi i64 [ %0, %if.then ], [ %4, %if.end9 ]
  %vli_pos.addr.0 = phi ptr [ %vli_pos_internal, %if.then ], [ %vli_pos, %if.end9 ]
  %5 = add nuw i64 %in_pos.promoted, 1
  %umax = tail call i64 @llvm.umax.i64(i64 %in_size, i64 %5)
  br label %do.body

do.body:                                          ; preds = %do.cond, %if.end13
  %add35 = phi i64 [ %vli.promoted, %if.end13 ], [ %add, %do.cond ]
  %inc1631 = phi i64 [ %vli_pos.addr.0.promoted, %if.end13 ], [ %inc16, %do.cond ]
  %6 = phi i64 [ %in_pos.promoted, %if.end13 ], [ %inc, %do.cond ]
  %arrayidx = getelementptr inbounds i8, ptr %in, i64 %6
  %7 = load i8, ptr %arrayidx, align 1, !tbaa !9
  %inc = add nuw i64 %6, 1
  %8 = and i8 %7, 127
  %conv14 = zext i8 %8 to i64
  %mul15 = mul i64 %inc1631, 7
  %shl = shl i64 %conv14, %mul15
  %add = add i64 %shl, %add35
  %inc16 = add i64 %inc1631, 1
  %cmp19 = icmp sgt i8 %7, -1
  br i1 %cmp19, label %if.then21, label %cleanup

if.then21:                                        ; preds = %do.body
  store i64 %inc, ptr %in_pos, align 8, !tbaa !5
  store i64 %inc16, ptr %vli_pos.addr.0, align 8, !tbaa !5
  store i64 %add, ptr %vli, align 8, !tbaa !5
  %cmp23 = icmp eq i8 %7, 0
  %cmp25 = icmp ugt i64 %inc16, 1
  %or.cond = select i1 %cmp23, i1 %cmp25, i1 false
  br i1 %or.cond, label %cleanup41, label %if.end28

if.end28:                                         ; preds = %if.then21
  %cmp29 = icmp ne ptr %vli_pos.addr.0, %vli_pos_internal
  %cond = zext i1 %cmp29 to i32
  br label %cleanup41

cleanup:                                          ; preds = %do.body
  %cmp32.not = icmp eq i64 %inc16, 9
  br i1 %cmp32.not, label %cleanup41.loopexit, label %do.cond

do.cond:                                          ; preds = %cleanup
  %cmp36 = icmp ult i64 %inc, %in_size
  br i1 %cmp36, label %do.body, label %do.end, !llvm.loop !10

do.end:                                           ; preds = %do.cond
  store i64 %umax, ptr %in_pos, align 8, !tbaa !5
  store i64 %inc16, ptr %vli_pos.addr.0, align 8, !tbaa !5
  store i64 %add, ptr %vli, align 8, !tbaa !5
  %cmp38 = icmp eq ptr %vli_pos.addr.0, %vli_pos_internal
  %cond40 = select i1 %cmp38, i32 9, i32 0
  br label %cleanup41

cleanup41.loopexit:                               ; preds = %cleanup
  store i64 %inc, ptr %in_pos, align 8, !tbaa !5
  store i64 9, ptr %vli_pos.addr.0, align 8, !tbaa !5
  store i64 %add, ptr %vli, align 8, !tbaa !5
  br label %cleanup41

cleanup41:                                        ; preds = %cleanup41.loopexit, %if.then21, %if.end28, %if.end9, %if.end5, %lor.lhs.false, %if.then, %do.end
  %retval.2 = phi i32 [ %cond40, %do.end ], [ 9, %if.then ], [ 11, %lor.lhs.false ], [ 11, %if.end5 ], [ 10, %if.end9 ], [ 9, %if.then21 ], [ %cond, %if.end28 ], [ 9, %cleanup41.loopexit ]
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %vli_pos_internal) #3
  ret i32 %retval.2
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #1

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i64 @llvm.umax.i64(i64, i64) #2

attributes #0 = { minsize nofree nosync nounwind optsize memory(write, argmem: readwrite, inaccessiblemem: none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #2 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"clang version 17.0.6 (git@github.com:webmiche/llvm-project.git 05dfeb4f83cb840f44d291a65e70580461bddbf7)"}
!5 = !{!6, !6, i64 0}
!6 = !{!"long", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!7, !7, i64 0}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.mustprogress"}
