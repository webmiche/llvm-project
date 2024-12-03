; ModuleID = 'test.ll'
source_filename = "test.ll"

@0 = private unnamed_addr constant [8 x i8] c"foo.txt\00", align 1
@1 = private unnamed_addr constant [24 x i8] c"foo return value: %lld\0A\00", align 1
@2 = private unnamed_addr constant [8 x i8] c"bat.txt\00", align 1
@3 = private unnamed_addr constant [24 x i8] c"bat return value: %lld\0A\00", align 1
@4 = private unnamed_addr constant [8 x i8] c"baz.txt\00", align 1
@5 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@6 = private unnamed_addr constant [24 x i8] c"baz return value: %lld\0A\00", align 1

define noundef i1 @foo() local_unnamed_addr {
  %1 = tail call ptr @fopen(ptr nonnull @0, ptr nonnull @5)
  tail call void (ptr, ...) @fprintf(ptr %1, ptr nonnull @1, i1 false)
  ret i1 false
}

define noundef i32 @bat() local_unnamed_addr {
  %1 = tail call ptr @fopen(ptr nonnull @2, ptr nonnull @5)
  tail call void (ptr, ...) @fprintf(ptr %1, ptr nonnull @3, i32 0)
  ret i32 0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none)
define void @bar() local_unnamed_addr #0 {
  ret void
}

define noundef i32 @baz() local_unnamed_addr {
end:
  %0 = tail call ptr @fopen(ptr nonnull @0, ptr nonnull @5)
  tail call void (ptr, ...) @fprintf(ptr %0, ptr nonnull @1, i1 false)
  %1 = tail call ptr @fopen(ptr nonnull @4, ptr nonnull @5)
  tail call void (ptr, ...) @fprintf(ptr %1, ptr nonnull @6, i32 5)
  ret i32 5
}

define noundef i32 @qux() local_unnamed_addr {
end:
  %0 = tail call ptr @fopen(ptr nonnull @2, ptr nonnull @5)
  tail call void (ptr, ...) @fprintf(ptr %0, ptr nonnull @3, i32 0)
  ret i32 5
}

define noundef i32 @quuz() local_unnamed_addr {
end:
  %0 = tail call ptr @fopen(ptr nonnull @0, ptr nonnull @5)
  tail call void (ptr, ...) @fprintf(ptr %0, ptr nonnull @1, i1 false)
  %1 = tail call ptr @fopen(ptr nonnull @4, ptr nonnull @5)
  tail call void (ptr, ...) @fprintf(ptr %1, ptr nonnull @6, i32 5)
  %2 = tail call ptr @fopen(ptr nonnull @2, ptr nonnull @5)
  tail call void (ptr, ...) @fprintf(ptr %2, ptr nonnull @3, i32 0)
  ret i32 5
}

define noundef i32 @quux() local_unnamed_addr {
end:
  %0 = tail call ptr @fopen(ptr nonnull @2, ptr nonnull @5)
  tail call void (ptr, ...) @fprintf(ptr %0, ptr nonnull @3, i32 0)
  %1 = tail call ptr @fopen(ptr nonnull @2, ptr nonnull @5)
  tail call void (ptr, ...) @fprintf(ptr %1, ptr nonnull @3, i32 0)
  ret i32 5
}

; Function Attrs: nofree nounwind
declare noalias noundef ptr @fopen(ptr nocapture noundef readonly, ptr nocapture noundef readonly) local_unnamed_addr #1

declare void @fprintf(ptr, ...) local_unnamed_addr

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) }
attributes #1 = { nofree nounwind }
