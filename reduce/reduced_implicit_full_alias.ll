; ModuleID = 'reduced_implicit_full_alias.bc'
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

declare ptr @malloc(i64)

define i64 @switch_arcs(ptr %num_del_arcs) {
entry:
  %0 = load i64, ptr null, align 8
  %arrayidx4 = getelementptr i64, ptr %num_del_arcs, i64 %0
  %1 = load i64, ptr %arrayidx4, align 8
  %cmp6 = icmp slt i64 0, %1
  call void @llvm.assume(i1 %cmp6)
  ret i64 0
}

; Function Attrs: minsize
define i64 @price_out_impl(ptr %net, ptr %max_residual_new_m, ptr %max_m50, ptr %call3, ptr %0, ptr %call5, i64 %1, i1 %cmp64, ptr %add.ptr210, i64 %2, i16 %local_first_replace.4, i64 %3, i1 %cmp135, i1 %cmp145, i1 %cmp150) #0 {
entry:
  %call32 = call ptr @malloc(i64 8)
  br label %for.cond

for.cond:                                         ; preds = %for.cond, %entry
  br i1 %cmp64, label %for.cond, label %for.cond82

for.cond82:                                       ; preds = %while.cond, %for.cond
  %first_replace.0 = phi i16 [ 0, %for.cond ], [ %first_replace.112, %while.cond ]
  %i.0 = phi i64 [ 0, %for.cond ], [ 1, %while.cond ]
  %cmp83 = icmp slt i64 %i.0, %2
  br i1 %cmp83, label %while.cond, label %for.end211

while.cond:                                       ; preds = %if.end205, %while.body, %for.cond82
  %iterator.010 = phi ptr [ %iterator.010, %if.end205 ], [ %max_m50, %for.cond82 ], [ %max_residual_new_m, %while.body ]
  %first_replace.112 = phi i16 [ 0, %if.end205 ], [ 0, %for.cond82 ], [ %local_first_replace.4, %while.body ]
  %tobool128.not = icmp eq ptr %iterator.010, null
  br i1 %tobool128.not, label %for.cond82, label %while.body

while.body:                                       ; preds = %while.cond
  br i1 %cmp135, label %while.cond, label %if.end140

if.end140:                                        ; preds = %while.body
  br i1 %cmp145, label %if.then147, label %if.end205

if.then147:                                       ; preds = %if.end140
  br i1 %cmp150, label %if.then163, label %if.else177

if.then163:                                       ; preds = %if.then147
  %4 = load i64, ptr %call32, align 8
  %inc175 = or i64 %4, 1
  store i64 %inc175, ptr %call32, align 8
  br label %if.end196

if.else177:                                       ; preds = %if.then147
  store ptr null, ptr %max_residual_new_m, align 8
  store i64 0, ptr %add.ptr210, align 8
  store i32 0, ptr %net, align 8
  br label %if.end196

if.end196:                                        ; preds = %if.else177, %if.then163
  %cmp199 = icmp eq i64 %1, %3
  br i1 %cmp199, label %if.then201, label %if.end205

if.then201:                                       ; preds = %if.end196
  store i64 0, ptr %net, align 8
  br label %if.end205

if.end205:                                        ; preds = %if.then201, %if.end196, %if.end140
  br label %while.cond

for.end211:                                       ; preds = %for.cond82
  %tobool215.not = icmp eq i16 %first_replace.0, 0
  br i1 %tobool215.not, label %while.body216, label %while.cond222

common.ret:                                       ; preds = %while.cond222, %while.body216
  ret i64 0

while.body216:                                    ; preds = %for.end211
  %call217 = call i64 @switch_arcs(ptr %call32)
  br label %common.ret

while.cond222:                                    ; preds = %for.end211
  store ptr null, ptr %net, align 8
  br label %common.ret
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite)
declare void @llvm.assume(i1 noundef) #1

attributes #0 = { minsize }
attributes #1 = { nocallback nofree nosync nounwind willreturn memory(inaccessiblemem: readwrite) }
