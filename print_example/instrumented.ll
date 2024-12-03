; ModuleID = 'test.ll'
source_filename = "test.ll"

@0 = private unnamed_addr constant [24 x i8] c"foo return value: %lld\0A\00", align 1
@1 = private unnamed_addr constant [24 x i8] c"bat return value: %lld\0A\00", align 1
@2 = private unnamed_addr constant [19 x i8] c"function_trace.txt\00", align 1
@3 = private unnamed_addr constant [2 x i8] c"a\00", align 1
@4 = private unnamed_addr constant [24 x i8] c"baz return value: %lld\0A\00", align 1

define noundef i1 @foo() local_unnamed_addr {
open:
  %0 = tail call ptr @fopen(ptr nonnull @2, ptr nonnull @3)
  %.not = icmp eq ptr %0, null
  br i1 %.not, label %return, label %print

print:                                            ; preds = %open
  tail call void (ptr, ...) @fprintf(ptr nonnull %0, ptr nonnull @0, i1 false)
  %1 = tail call i32 @fclose(ptr nonnull %0)
  br label %return

return:                                           ; preds = %print, %open
  ret i1 false
}

define noundef i32 @bat() local_unnamed_addr {
open:
  %0 = tail call ptr @fopen(ptr nonnull @2, ptr nonnull @3)
  %.not = icmp eq ptr %0, null
  br i1 %.not, label %return, label %print

print:                                            ; preds = %open
  tail call void (ptr, ...) @fprintf(ptr nonnull %0, ptr nonnull @1, i32 0)
  %1 = tail call i32 @fclose(ptr nonnull %0)
  br label %return

return:                                           ; preds = %print, %open
  ret i32 0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define void @bar() local_unnamed_addr #0 {
  ret void
}

define noundef i32 @baz() local_unnamed_addr {
end:
  %0 = tail call ptr @fopen(ptr nonnull @2, ptr nonnull @3)
  %.not.i = icmp eq ptr %0, null
  br i1 %.not.i, label %foo.exit, label %print.i

print.i:                                          ; preds = %end
  tail call void (ptr, ...) @fprintf(ptr nonnull %0, ptr nonnull @0, i1 false)
  %1 = tail call i32 @fclose(ptr nonnull %0)
  br label %foo.exit

foo.exit:                                         ; preds = %end, %print.i
  %2 = tail call ptr @fopen(ptr nonnull @2, ptr nonnull @3)
  %.not = icmp eq ptr %2, null
  br i1 %.not, label %return, label %print

print:                                            ; preds = %foo.exit
  tail call void (ptr, ...) @fprintf(ptr nonnull %2, ptr nonnull @4, i32 5)
  %3 = tail call i32 @fclose(ptr nonnull %2)
  br label %return

return:                                           ; preds = %print, %foo.exit
  ret i32 5
}

define noundef i32 @qux() local_unnamed_addr {
end:
  %0 = tail call ptr @fopen(ptr nonnull @2, ptr nonnull @3)
  %.not.i = icmp eq ptr %0, null
  br i1 %.not.i, label %bat.exit, label %print.i

print.i:                                          ; preds = %end
  tail call void (ptr, ...) @fprintf(ptr nonnull %0, ptr nonnull @1, i32 0)
  %1 = tail call i32 @fclose(ptr nonnull %0)
  br label %bat.exit

bat.exit:                                         ; preds = %end, %print.i
  ret i32 5
}

define noundef i32 @quuz() local_unnamed_addr {
end:
  %0 = tail call ptr @fopen(ptr nonnull @2, ptr nonnull @3)
  %.not.i.i = icmp eq ptr %0, null
  br i1 %.not.i.i, label %foo.exit.i, label %print.i.i

print.i.i:                                        ; preds = %end
  tail call void (ptr, ...) @fprintf(ptr nonnull %0, ptr nonnull @0, i1 false)
  %1 = tail call i32 @fclose(ptr nonnull %0)
  br label %foo.exit.i

foo.exit.i:                                       ; preds = %print.i.i, %end
  %2 = tail call ptr @fopen(ptr nonnull @2, ptr nonnull @3)
  %.not.i = icmp eq ptr %2, null
  br i1 %.not.i, label %baz.exit, label %print.i

print.i:                                          ; preds = %foo.exit.i
  tail call void (ptr, ...) @fprintf(ptr nonnull %2, ptr nonnull @4, i32 5)
  %3 = tail call i32 @fclose(ptr nonnull %2)
  br label %baz.exit

baz.exit:                                         ; preds = %foo.exit.i, %print.i
  %4 = tail call ptr @fopen(ptr nonnull @2, ptr nonnull @3)
  %.not.i1 = icmp eq ptr %4, null
  br i1 %.not.i1, label %bat.exit, label %print.i2

print.i2:                                         ; preds = %baz.exit
  tail call void (ptr, ...) @fprintf(ptr nonnull %4, ptr nonnull @1, i32 0)
  %5 = tail call i32 @fclose(ptr nonnull %4)
  br label %bat.exit

bat.exit:                                         ; preds = %baz.exit, %print.i2
  ret i32 5
}

define noundef i32 @quux() local_unnamed_addr {
end:
  %0 = tail call ptr @fopen(ptr nonnull @2, ptr nonnull @3)
  %.not.i = icmp eq ptr %0, null
  br i1 %.not.i, label %bat.exit, label %print.i

print.i:                                          ; preds = %end
  tail call void (ptr, ...) @fprintf(ptr nonnull %0, ptr nonnull @1, i32 0)
  %1 = tail call i32 @fclose(ptr nonnull %0)
  br label %bat.exit

bat.exit:                                         ; preds = %end, %print.i
  %2 = tail call ptr @fopen(ptr nonnull @2, ptr nonnull @3)
  %.not.i1 = icmp eq ptr %2, null
  br i1 %.not.i1, label %bat.exit3, label %print.i2

print.i2:                                         ; preds = %bat.exit
  tail call void (ptr, ...) @fprintf(ptr nonnull %2, ptr nonnull @1, i32 0)
  %3 = tail call i32 @fclose(ptr nonnull %2)
  br label %bat.exit3

bat.exit3:                                        ; preds = %bat.exit, %print.i2
  ret i32 5
}

; Function Attrs: nofree nounwind
declare noalias noundef ptr @fopen(ptr nocapture noundef readonly, ptr nocapture noundef readonly) local_unnamed_addr #1

declare void @fprintf(ptr, ...) local_unnamed_addr

; Function Attrs: nofree nounwind
declare noundef i32 @fclose(ptr nocapture noundef) local_unnamed_addr #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) }
attributes #1 = { nofree nounwind }
