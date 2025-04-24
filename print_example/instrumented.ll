; ModuleID = 'test.ll'
source_filename = "test.ll"

@0 = private unnamed_addr constant [19 x i8] c"function_trace.txt\00", align 1
@1 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@2 = private unnamed_addr constant [8 x i8] c"0 %lld\0A\00", align 1
@3 = private unnamed_addr constant [10 x i8] c"bat %lld\0A\00", align 1
@4 = private unnamed_addr constant [12 x i8] c"12317 %lld\0A\00", align 1

define noundef i1 @foo() local_unnamed_addr {
access_check:
  %0 = tail call i32 @access(ptr nonnull @0, i32 0)
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %print, label %return

print:                                            ; preds = %access_check
  %2 = tail call ptr @fopen(ptr nonnull @0, ptr nonnull @1)
  tail call void (ptr, ...) @fprintf(ptr %2, ptr nonnull @2, i1 false)
  %3 = tail call i32 @fclose(ptr %2)
  br label %return

return:                                           ; preds = %access_check, %print
  ret i1 false
}

define noundef i32 @bat() local_unnamed_addr {
access_check:
  %0 = tail call i32 @access(ptr nonnull @0, i32 0)
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %print, label %return

print:                                            ; preds = %access_check
  %2 = tail call ptr @fopen(ptr nonnull @0, ptr nonnull @1)
  tail call void (ptr, ...) @fprintf(ptr %2, ptr nonnull @3, i32 0)
  %3 = tail call i32 @fclose(ptr %2)
  br label %return

return:                                           ; preds = %access_check, %print
  ret i32 0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define void @bar() local_unnamed_addr #0 {
  ret void
}

define noundef i32 @baz() local_unnamed_addr {
end:
  %0 = tail call i32 @access(ptr nonnull @0, i32 0)
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %print.i, label %foo.exit

print.i:                                          ; preds = %end
  %2 = tail call ptr @fopen(ptr nonnull @0, ptr nonnull @1)
  tail call void (ptr, ...) @fprintf(ptr %2, ptr nonnull @2, i1 false)
  %3 = tail call i32 @fclose(ptr %2)
  br label %foo.exit

foo.exit:                                         ; preds = %end, %print.i
  %4 = tail call i32 @access(ptr nonnull @0, i32 0)
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %print, label %return

print:                                            ; preds = %foo.exit
  %6 = tail call ptr @fopen(ptr nonnull @0, ptr nonnull @1)
  tail call void (ptr, ...) @fprintf(ptr %6, ptr nonnull @4, i32 5)
  %7 = tail call i32 @fclose(ptr %6)
  br label %return

return:                                           ; preds = %foo.exit, %print
  ret i32 5
}

define noundef i32 @qux() local_unnamed_addr {
end:
  %0 = tail call i32 @access(ptr nonnull @0, i32 0)
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %print.i, label %bat.exit

print.i:                                          ; preds = %end
  %2 = tail call ptr @fopen(ptr nonnull @0, ptr nonnull @1)
  tail call void (ptr, ...) @fprintf(ptr %2, ptr nonnull @3, i32 0)
  %3 = tail call i32 @fclose(ptr %2)
  br label %bat.exit

bat.exit:                                         ; preds = %end, %print.i
  ret i32 5
}

define noundef i32 @quuz() local_unnamed_addr {
end:
  %0 = tail call i32 @baz()
  %1 = tail call i32 @access(ptr nonnull @0, i32 0)
  %2 = icmp eq i32 %1, 0
  br i1 %2, label %print.i, label %bat.exit

print.i:                                          ; preds = %end
  %3 = tail call ptr @fopen(ptr nonnull @0, ptr nonnull @1)
  tail call void (ptr, ...) @fprintf(ptr %3, ptr nonnull @3, i32 0)
  %4 = tail call i32 @fclose(ptr %3)
  br label %bat.exit

bat.exit:                                         ; preds = %end, %print.i
  ret i32 5
}

define noundef i32 @quux() local_unnamed_addr {
end:
  %0 = tail call i32 @access(ptr nonnull @0, i32 0)
  %1 = icmp eq i32 %0, 0
  br i1 %1, label %print.i, label %bat.exit

print.i:                                          ; preds = %end
  %2 = tail call ptr @fopen(ptr nonnull @0, ptr nonnull @1)
  tail call void (ptr, ...) @fprintf(ptr %2, ptr nonnull @3, i32 0)
  %3 = tail call i32 @fclose(ptr %2)
  br label %bat.exit

bat.exit:                                         ; preds = %end, %print.i
  %4 = tail call i32 @access(ptr nonnull @0, i32 0)
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %print.i1, label %bat.exit2

print.i1:                                         ; preds = %bat.exit
  %6 = tail call ptr @fopen(ptr nonnull @0, ptr nonnull @1)
  tail call void (ptr, ...) @fprintf(ptr %6, ptr nonnull @3, i32 0)
  %7 = tail call i32 @fclose(ptr %6)
  br label %bat.exit2

bat.exit2:                                        ; preds = %bat.exit, %print.i1
  ret i32 5
}

; Function Attrs: nofree nounwind
declare noundef i32 @access(ptr nocapture noundef readonly, i32 noundef) local_unnamed_addr #1

declare void @fprintf(ptr, ...) local_unnamed_addr

; Function Attrs: nofree nounwind
declare noundef i32 @fclose(ptr nocapture noundef) local_unnamed_addr #1

; Function Attrs: nofree nounwind
declare noalias noundef ptr @fopen(ptr nocapture noundef readonly, ptr nocapture noundef readonly) local_unnamed_addr #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) }
attributes #1 = { nofree nounwind }
