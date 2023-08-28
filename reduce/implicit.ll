; ModuleID = 'implicit.bc'
source_filename = "/home/michel/ETH/AST/specbuilder/src/605/implicit.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.network = type { [200 x i8], [200 x i8], i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, double, i64, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i64, i64, i64, i64, i64 }
%struct.node = type { i64, i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, i64, i64, i32, i32 }
%struct.arc = type { i32, i64, ptr, ptr, i16, ptr, ptr, i64, i64 }
%struct.list_elem = type { ptr, ptr }

@.str = private unnamed_addr constant [31 x i8] c"network %s: not enough memory\0A\00", align 1, !dbg !0
@stdout = external global ptr, align 8

; Function Attrs: minsize nounwind optsize uwtable
define dso_local i64 @refreshArcPointers(ptr noundef %net, ptr noundef %getPos, ptr noundef %sorted_array) #0 !dbg !77 {
entry:
  %net.addr = alloca ptr, align 8
  %getPos.addr = alloca ptr, align 8
  %sorted_array.addr = alloca ptr, align 8
  %node = alloca ptr, align 8
  %i = alloca i64, align 8
  store ptr %net, ptr %net.addr, align 8, !tbaa !130
  call void @llvm.dbg.declare(metadata ptr %net.addr, metadata !125, metadata !DIExpression()), !dbg !134
  store ptr %getPos, ptr %getPos.addr, align 8, !tbaa !130
  call void @llvm.dbg.declare(metadata ptr %getPos.addr, metadata !126, metadata !DIExpression()), !dbg !135
  store ptr %sorted_array, ptr %sorted_array.addr, align 8, !tbaa !130
  call void @llvm.dbg.declare(metadata ptr %sorted_array.addr, metadata !127, metadata !DIExpression()), !dbg !136
  call void @llvm.lifetime.start.p0(i64 8, ptr %node) #9, !dbg !137
  call void @llvm.dbg.declare(metadata ptr %node, metadata !128, metadata !DIExpression()), !dbg !138
  call void @llvm.lifetime.start.p0(i64 8, ptr %i) #9, !dbg !139
  call void @llvm.dbg.declare(metadata ptr %i, metadata !129, metadata !DIExpression()), !dbg !140
  store i64 0, ptr %i, align 8, !dbg !141, !tbaa !143
  br label %for.cond, !dbg !145

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i64, ptr %i, align 8, !dbg !146, !tbaa !143
  %1 = load ptr, ptr %net.addr, align 8, !dbg !148, !tbaa !130
  %n = getelementptr inbounds %struct.network, ptr %1, i32 0, i32 2, !dbg !149
  %2 = load i64, ptr %n, align 8, !dbg !149, !tbaa !150
  %cmp = icmp sle i64 %0, %2, !dbg !153
  br i1 %cmp, label %for.body, label %for.end, !dbg !154

for.body:                                         ; preds = %for.cond
  %3 = load ptr, ptr %net.addr, align 8, !dbg !155, !tbaa !130
  %nodes = getelementptr inbounds %struct.network, ptr %3, i32 0, i32 21, !dbg !157
  %4 = load ptr, ptr %nodes, align 8, !dbg !157, !tbaa !158
  %5 = load i64, ptr %i, align 8, !dbg !159, !tbaa !143
  %add.ptr = getelementptr inbounds %struct.node, ptr %4, i64 %5, !dbg !160
  store ptr %add.ptr, ptr %node, align 8, !dbg !161, !tbaa !130
  %6 = load ptr, ptr %node, align 8, !dbg !162, !tbaa !130
  %basic_arc = getelementptr inbounds %struct.node, ptr %6, i32 0, i32 6, !dbg !164
  %7 = load ptr, ptr %basic_arc, align 8, !dbg !164, !tbaa !165
  %tobool = icmp ne ptr %7, null, !dbg !162
  br i1 %tobool, label %land.lhs.true, label %if.end, !dbg !168

land.lhs.true:                                    ; preds = %for.body
  %8 = load ptr, ptr %node, align 8, !dbg !169, !tbaa !130
  %basic_arc1 = getelementptr inbounds %struct.node, ptr %8, i32 0, i32 6, !dbg !170
  %9 = load ptr, ptr %basic_arc1, align 8, !dbg !170, !tbaa !165
  %id = getelementptr inbounds %struct.arc, ptr %9, i32 0, i32 0, !dbg !171
  %10 = load i32, ptr %id, align 8, !dbg !171, !tbaa !172
  %cmp2 = icmp sge i32 %10, 0, !dbg !175
  br i1 %cmp2, label %if.then, label %if.end, !dbg !176

if.then:                                          ; preds = %land.lhs.true
  %11 = load ptr, ptr %sorted_array.addr, align 8, !dbg !177, !tbaa !130
  %12 = load ptr, ptr %getPos.addr, align 8, !dbg !178, !tbaa !130
  %13 = load ptr, ptr %net.addr, align 8, !dbg !179, !tbaa !130
  %14 = load ptr, ptr %node, align 8, !dbg !180, !tbaa !130
  %basic_arc3 = getelementptr inbounds %struct.node, ptr %14, i32 0, i32 6, !dbg !181
  %15 = load ptr, ptr %basic_arc3, align 8, !dbg !181, !tbaa !165
  %id4 = getelementptr inbounds %struct.arc, ptr %15, i32 0, i32 0, !dbg !182
  %16 = load i32, ptr %id4, align 8, !dbg !182, !tbaa !172
  %conv = sext i32 %16 to i64, !dbg !180
  %call = call i64 %12(ptr noundef %13, i64 noundef %conv) #10, !dbg !178
  %arrayidx = getelementptr inbounds %struct.arc, ptr %11, i64 %call, !dbg !177
  %17 = load ptr, ptr %node, align 8, !dbg !183, !tbaa !130
  %basic_arc5 = getelementptr inbounds %struct.node, ptr %17, i32 0, i32 6, !dbg !184
  store ptr %arrayidx, ptr %basic_arc5, align 8, !dbg !185, !tbaa !165
  br label %if.end, !dbg !183

if.end:                                           ; preds = %if.then, %land.lhs.true, %for.body
  %18 = load ptr, ptr %node, align 8, !dbg !186, !tbaa !130
  %firstin = getelementptr inbounds %struct.node, ptr %18, i32 0, i32 8, !dbg !188
  %19 = load ptr, ptr %firstin, align 8, !dbg !188, !tbaa !189
  %tobool6 = icmp ne ptr %19, null, !dbg !186
  br i1 %tobool6, label %land.lhs.true7, label %if.end19, !dbg !190

land.lhs.true7:                                   ; preds = %if.end
  %20 = load ptr, ptr %node, align 8, !dbg !191, !tbaa !130
  %firstin8 = getelementptr inbounds %struct.node, ptr %20, i32 0, i32 8, !dbg !192
  %21 = load ptr, ptr %firstin8, align 8, !dbg !192, !tbaa !189
  %id9 = getelementptr inbounds %struct.arc, ptr %21, i32 0, i32 0, !dbg !193
  %22 = load i32, ptr %id9, align 8, !dbg !193, !tbaa !172
  %cmp10 = icmp sge i32 %22, 0, !dbg !194
  br i1 %cmp10, label %if.then12, label %if.end19, !dbg !195

if.then12:                                        ; preds = %land.lhs.true7
  %23 = load ptr, ptr %sorted_array.addr, align 8, !dbg !196, !tbaa !130
  %24 = load ptr, ptr %getPos.addr, align 8, !dbg !197, !tbaa !130
  %25 = load ptr, ptr %net.addr, align 8, !dbg !198, !tbaa !130
  %26 = load ptr, ptr %node, align 8, !dbg !199, !tbaa !130
  %firstin13 = getelementptr inbounds %struct.node, ptr %26, i32 0, i32 8, !dbg !200
  %27 = load ptr, ptr %firstin13, align 8, !dbg !200, !tbaa !189
  %id14 = getelementptr inbounds %struct.arc, ptr %27, i32 0, i32 0, !dbg !201
  %28 = load i32, ptr %id14, align 8, !dbg !201, !tbaa !172
  %conv15 = sext i32 %28 to i64, !dbg !199
  %call16 = call i64 %24(ptr noundef %25, i64 noundef %conv15) #10, !dbg !197
  %arrayidx17 = getelementptr inbounds %struct.arc, ptr %23, i64 %call16, !dbg !196
  %29 = load ptr, ptr %node, align 8, !dbg !202, !tbaa !130
  %firstin18 = getelementptr inbounds %struct.node, ptr %29, i32 0, i32 8, !dbg !203
  store ptr %arrayidx17, ptr %firstin18, align 8, !dbg !204, !tbaa !189
  br label %if.end19, !dbg !202

if.end19:                                         ; preds = %if.then12, %land.lhs.true7, %if.end
  %30 = load ptr, ptr %node, align 8, !dbg !205, !tbaa !130
  %firstout = getelementptr inbounds %struct.node, ptr %30, i32 0, i32 7, !dbg !207
  %31 = load ptr, ptr %firstout, align 8, !dbg !207, !tbaa !208
  %tobool20 = icmp ne ptr %31, null, !dbg !205
  br i1 %tobool20, label %land.lhs.true21, label %if.end33, !dbg !209

land.lhs.true21:                                  ; preds = %if.end19
  %32 = load ptr, ptr %node, align 8, !dbg !210, !tbaa !130
  %firstout22 = getelementptr inbounds %struct.node, ptr %32, i32 0, i32 7, !dbg !211
  %33 = load ptr, ptr %firstout22, align 8, !dbg !211, !tbaa !208
  %id23 = getelementptr inbounds %struct.arc, ptr %33, i32 0, i32 0, !dbg !212
  %34 = load i32, ptr %id23, align 8, !dbg !212, !tbaa !172
  %cmp24 = icmp sge i32 %34, 0, !dbg !213
  br i1 %cmp24, label %if.then26, label %if.end33, !dbg !214

if.then26:                                        ; preds = %land.lhs.true21
  %35 = load ptr, ptr %sorted_array.addr, align 8, !dbg !215, !tbaa !130
  %36 = load ptr, ptr %getPos.addr, align 8, !dbg !216, !tbaa !130
  %37 = load ptr, ptr %net.addr, align 8, !dbg !217, !tbaa !130
  %38 = load ptr, ptr %node, align 8, !dbg !218, !tbaa !130
  %firstout27 = getelementptr inbounds %struct.node, ptr %38, i32 0, i32 7, !dbg !219
  %39 = load ptr, ptr %firstout27, align 8, !dbg !219, !tbaa !208
  %id28 = getelementptr inbounds %struct.arc, ptr %39, i32 0, i32 0, !dbg !220
  %40 = load i32, ptr %id28, align 8, !dbg !220, !tbaa !172
  %conv29 = sext i32 %40 to i64, !dbg !218
  %call30 = call i64 %36(ptr noundef %37, i64 noundef %conv29) #10, !dbg !216
  %arrayidx31 = getelementptr inbounds %struct.arc, ptr %35, i64 %call30, !dbg !215
  %41 = load ptr, ptr %node, align 8, !dbg !221, !tbaa !130
  %firstout32 = getelementptr inbounds %struct.node, ptr %41, i32 0, i32 7, !dbg !222
  store ptr %arrayidx31, ptr %firstout32, align 8, !dbg !223, !tbaa !208
  br label %if.end33, !dbg !221

if.end33:                                         ; preds = %if.then26, %land.lhs.true21, %if.end19
  br label %for.inc, !dbg !224

for.inc:                                          ; preds = %if.end33
  %42 = load i64, ptr %i, align 8, !dbg !225, !tbaa !143
  %inc = add nsw i64 %42, 1, !dbg !225
  store i64 %inc, ptr %i, align 8, !dbg !225, !tbaa !143
  br label %for.cond, !dbg !226, !llvm.loop !227

for.end:                                          ; preds = %for.cond
  call void @llvm.lifetime.end.p0(i64 8, ptr %i) #9, !dbg !230
  call void @llvm.lifetime.end.p0(i64 8, ptr %node) #9, !dbg !230
  ret i64 0, !dbg !231
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #2

; Function Attrs: minsize nounwind optsize uwtable
define dso_local i64 @refreshPositions(ptr noundef %net, ptr noundef %getPos, i64 noundef %new_m) #0 !dbg !232 {
entry:
  %net.addr = alloca ptr, align 8
  %getPos.addr = alloca ptr, align 8
  %new_m.addr = alloca i64, align 8
  %arc = alloca ptr, align 8
  %sorted_array = alloca ptr, align 8
  %position = alloca i64, align 8
  %new_position = alloca i64, align 8
  store ptr %net, ptr %net.addr, align 8, !tbaa !130
  call void @llvm.dbg.declare(metadata ptr %net.addr, metadata !236, metadata !DIExpression()), !dbg !243
  store ptr %getPos, ptr %getPos.addr, align 8, !tbaa !130
  call void @llvm.dbg.declare(metadata ptr %getPos.addr, metadata !237, metadata !DIExpression()), !dbg !244
  store i64 %new_m, ptr %new_m.addr, align 8, !tbaa !143
  call void @llvm.dbg.declare(metadata ptr %new_m.addr, metadata !238, metadata !DIExpression()), !dbg !245
  call void @llvm.lifetime.start.p0(i64 8, ptr %arc) #9, !dbg !246
  call void @llvm.dbg.declare(metadata ptr %arc, metadata !239, metadata !DIExpression()), !dbg !247
  call void @llvm.lifetime.start.p0(i64 8, ptr %sorted_array) #9, !dbg !246
  call void @llvm.dbg.declare(metadata ptr %sorted_array, metadata !240, metadata !DIExpression()), !dbg !248
  call void @llvm.lifetime.start.p0(i64 8, ptr %position) #9, !dbg !249
  call void @llvm.dbg.declare(metadata ptr %position, metadata !241, metadata !DIExpression()), !dbg !250
  call void @llvm.lifetime.start.p0(i64 8, ptr %new_position) #9, !dbg !249
  call void @llvm.dbg.declare(metadata ptr %new_position, metadata !242, metadata !DIExpression()), !dbg !251
  %0 = load ptr, ptr %net.addr, align 8, !dbg !252, !tbaa !130
  %sorted_arcs = getelementptr inbounds %struct.network, ptr %0, i32 0, i32 25, !dbg !253
  %1 = load ptr, ptr %sorted_arcs, align 8, !dbg !253, !tbaa !254
  store ptr %1, ptr %sorted_array, align 8, !dbg !255, !tbaa !130
  %2 = load ptr, ptr %net.addr, align 8, !dbg !256, !tbaa !130
  %3 = load ptr, ptr %getPos.addr, align 8, !dbg !257, !tbaa !130
  %4 = load ptr, ptr %sorted_array, align 8, !dbg !258, !tbaa !130
  %call = call i64 @refreshArcPointers(ptr noundef %2, ptr noundef %3, ptr noundef %4) #10, !dbg !259
  store i64 0, ptr %position, align 8, !dbg !260, !tbaa !143
  br label %for.cond, !dbg !262

for.cond:                                         ; preds = %for.inc, %entry
  %5 = load i64, ptr %position, align 8, !dbg !263, !tbaa !143
  %6 = load i64, ptr %new_m.addr, align 8, !dbg !265, !tbaa !143
  %cmp = icmp slt i64 %5, %6, !dbg !266
  br i1 %cmp, label %for.body, label %for.end, !dbg !267

for.body:                                         ; preds = %for.cond
  %7 = load ptr, ptr %net.addr, align 8, !dbg !268, !tbaa !130
  %arcs = getelementptr inbounds %struct.network, ptr %7, i32 0, i32 23, !dbg !270
  %8 = load ptr, ptr %arcs, align 8, !dbg !270, !tbaa !271
  %9 = load i64, ptr %position, align 8, !dbg !272, !tbaa !143
  %add.ptr = getelementptr inbounds %struct.arc, ptr %8, i64 %9, !dbg !273
  store ptr %add.ptr, ptr %arc, align 8, !dbg !274, !tbaa !130
  %10 = load ptr, ptr %arc, align 8, !dbg !275, !tbaa !130
  %id = getelementptr inbounds %struct.arc, ptr %10, i32 0, i32 0, !dbg !277
  %11 = load i32, ptr %id, align 8, !dbg !277, !tbaa !172
  %cmp1 = icmp slt i32 %11, 0, !dbg !278
  br i1 %cmp1, label %if.then, label %if.end, !dbg !279

if.then:                                          ; preds = %for.body
  br label %for.inc, !dbg !280

if.end:                                           ; preds = %for.body
  %12 = load ptr, ptr %getPos.addr, align 8, !dbg !281, !tbaa !130
  %13 = load ptr, ptr %net.addr, align 8, !dbg !282, !tbaa !130
  %14 = load ptr, ptr %arc, align 8, !dbg !283, !tbaa !130
  %id2 = getelementptr inbounds %struct.arc, ptr %14, i32 0, i32 0, !dbg !284
  %15 = load i32, ptr %id2, align 8, !dbg !284, !tbaa !172
  %conv = sext i32 %15 to i64, !dbg !283
  %call3 = call i64 %12(ptr noundef %13, i64 noundef %conv) #10, !dbg !281
  store i64 %call3, ptr %new_position, align 8, !dbg !285, !tbaa !143
  %16 = load ptr, ptr %sorted_array, align 8, !dbg !286, !tbaa !130
  %17 = load i64, ptr %new_position, align 8, !dbg !287, !tbaa !143
  %arrayidx = getelementptr inbounds %struct.arc, ptr %16, i64 %17, !dbg !286
  %18 = load ptr, ptr %arc, align 8, !dbg !288, !tbaa !130
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %arrayidx, ptr align 8 %18, i64 72, i1 false), !dbg !289, !tbaa.struct !290
  br label %for.inc, !dbg !293

for.inc:                                          ; preds = %if.end, %if.then
  %19 = load i64, ptr %position, align 8, !dbg !294, !tbaa !143
  %inc = add nsw i64 %19, 1, !dbg !294
  store i64 %inc, ptr %position, align 8, !dbg !294, !tbaa !143
  br label %for.cond, !dbg !295, !llvm.loop !296

for.end:                                          ; preds = %for.cond
  %20 = load ptr, ptr %net.addr, align 8, !dbg !298, !tbaa !130
  %arcs4 = getelementptr inbounds %struct.network, ptr %20, i32 0, i32 23, !dbg !299
  %21 = load ptr, ptr %arcs4, align 8, !dbg !299, !tbaa !271
  store ptr %21, ptr %arc, align 8, !dbg !300, !tbaa !130
  %22 = load ptr, ptr %sorted_array, align 8, !dbg !301, !tbaa !130
  %23 = load ptr, ptr %net.addr, align 8, !dbg !302, !tbaa !130
  %arcs5 = getelementptr inbounds %struct.network, ptr %23, i32 0, i32 23, !dbg !303
  store ptr %22, ptr %arcs5, align 8, !dbg !304, !tbaa !271
  %24 = load ptr, ptr %arc, align 8, !dbg !305, !tbaa !130
  %25 = load ptr, ptr %net.addr, align 8, !dbg !306, !tbaa !130
  %sorted_arcs6 = getelementptr inbounds %struct.network, ptr %25, i32 0, i32 25, !dbg !307
  store ptr %24, ptr %sorted_arcs6, align 8, !dbg !308, !tbaa !254
  %26 = load ptr, ptr %sorted_array, align 8, !dbg !309, !tbaa !130
  %27 = load i64, ptr %new_m.addr, align 8, !dbg !310, !tbaa !143
  %add.ptr7 = getelementptr inbounds %struct.arc, ptr %26, i64 %27, !dbg !311
  %28 = load ptr, ptr %net.addr, align 8, !dbg !312, !tbaa !130
  %stop_arcs = getelementptr inbounds %struct.network, ptr %28, i32 0, i32 24, !dbg !313
  store ptr %add.ptr7, ptr %stop_arcs, align 8, !dbg !314, !tbaa !315
  call void @llvm.lifetime.end.p0(i64 8, ptr %new_position) #9, !dbg !316
  call void @llvm.lifetime.end.p0(i64 8, ptr %position) #9, !dbg !316
  call void @llvm.lifetime.end.p0(i64 8, ptr %sorted_array) #9, !dbg !316
  call void @llvm.lifetime.end.p0(i64 8, ptr %arc) #9, !dbg !316
  ret i64 0, !dbg !317
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: minsize nounwind optsize uwtable
define dso_local void @marc_arcs(ptr noundef %net, ptr noundef %new_arcs, ptr noundef %new_arcs_array, ptr noundef %arcs_pointer_sorted) #0 !dbg !318 {
entry:
  %net.addr = alloca ptr, align 8
  %new_arcs.addr = alloca ptr, align 8
  %new_arcs_array.addr = alloca ptr, align 8
  %arcs_pointer_sorted.addr = alloca ptr, align 8
  %max_new_arcs = alloca i64, align 8
  %positions = alloca ptr, align 8
  %values = alloca ptr, align 8
  %global_new = alloca i64, align 8
  %best_pos = alloca i64, align 8
  %start_id = alloca i64, align 8
  %i = alloca i64, align 8
  %arc = alloca ptr, align 8
  %num_threads = alloca i64, align 8
  store ptr %net, ptr %net.addr, align 8, !tbaa !130
  call void @llvm.dbg.declare(metadata ptr %net.addr, metadata !322, metadata !DIExpression()), !dbg !335
  store ptr %new_arcs, ptr %new_arcs.addr, align 8, !tbaa !130
  call void @llvm.dbg.declare(metadata ptr %new_arcs.addr, metadata !323, metadata !DIExpression()), !dbg !336
  store ptr %new_arcs_array, ptr %new_arcs_array.addr, align 8, !tbaa !130
  call void @llvm.dbg.declare(metadata ptr %new_arcs_array.addr, metadata !324, metadata !DIExpression()), !dbg !337
  store ptr %arcs_pointer_sorted, ptr %arcs_pointer_sorted.addr, align 8, !tbaa !130
  call void @llvm.dbg.declare(metadata ptr %arcs_pointer_sorted.addr, metadata !325, metadata !DIExpression()), !dbg !338
  call void @llvm.lifetime.start.p0(i64 8, ptr %max_new_arcs) #9, !dbg !339
  call void @llvm.dbg.declare(metadata ptr %max_new_arcs, metadata !326, metadata !DIExpression()), !dbg !340
  call void @llvm.lifetime.start.p0(i64 8, ptr %positions) #9, !dbg !341
  call void @llvm.dbg.declare(metadata ptr %positions, metadata !327, metadata !DIExpression()), !dbg !342
  call void @llvm.lifetime.start.p0(i64 8, ptr %values) #9, !dbg !343
  call void @llvm.dbg.declare(metadata ptr %values, metadata !328, metadata !DIExpression()), !dbg !344
  call void @llvm.lifetime.start.p0(i64 8, ptr %global_new) #9, !dbg !345
  call void @llvm.dbg.declare(metadata ptr %global_new, metadata !329, metadata !DIExpression()), !dbg !346
  store i64 0, ptr %global_new, align 8, !dbg !346, !tbaa !143
  call void @llvm.lifetime.start.p0(i64 8, ptr %best_pos) #9, !dbg !347
  call void @llvm.dbg.declare(metadata ptr %best_pos, metadata !330, metadata !DIExpression()), !dbg !348
  store i64 0, ptr %best_pos, align 8, !dbg !348, !tbaa !143
  call void @llvm.lifetime.start.p0(i64 8, ptr %start_id) #9, !dbg !349
  call void @llvm.dbg.declare(metadata ptr %start_id, metadata !331, metadata !DIExpression()), !dbg !350
  call void @llvm.lifetime.start.p0(i64 8, ptr %i) #9, !dbg !349
  call void @llvm.dbg.declare(metadata ptr %i, metadata !332, metadata !DIExpression()), !dbg !351
  call void @llvm.lifetime.start.p0(i64 8, ptr %arc) #9, !dbg !352
  call void @llvm.dbg.declare(metadata ptr %arc, metadata !333, metadata !DIExpression()), !dbg !353
  call void @llvm.lifetime.start.p0(i64 8, ptr %num_threads) #9, !dbg !354
  call void @llvm.dbg.declare(metadata ptr %num_threads, metadata !334, metadata !DIExpression()), !dbg !355
  store i64 1, ptr %num_threads, align 8, !dbg !355, !tbaa !143
  %0 = load i64, ptr %num_threads, align 8, !dbg !356, !tbaa !143
  %mul = mul i64 %0, 8, !dbg !357
  %call = call noalias ptr @malloc(i64 noundef %mul) #11, !dbg !358
  store ptr %call, ptr %positions, align 8, !dbg !359, !tbaa !130
  %1 = load i64, ptr %num_threads, align 8, !dbg !360, !tbaa !143
  %mul1 = mul i64 %1, 8, !dbg !361
  %call2 = call noalias ptr @malloc(i64 noundef %mul1) #11, !dbg !362
  store ptr %call2, ptr %values, align 8, !dbg !363, !tbaa !130
  %2 = load ptr, ptr %net.addr, align 8, !dbg !364, !tbaa !130
  %n_trips = getelementptr inbounds %struct.network, ptr %2, i32 0, i32 3, !dbg !366
  %3 = load i64, ptr %n_trips, align 8, !dbg !366, !tbaa !367
  %cmp = icmp sle i64 %3, 15000, !dbg !368
  br i1 %cmp, label %if.then, label %if.else, !dbg !369

if.then:                                          ; preds = %entry
  %4 = load ptr, ptr %net.addr, align 8, !dbg !370, !tbaa !130
  %max_residual_new_m = getelementptr inbounds %struct.network, ptr %4, i32 0, i32 8, !dbg !371
  %5 = load i64, ptr %max_residual_new_m, align 8, !dbg !371, !tbaa !372
  %sub = sub nsw i64 %5, 1000000, !dbg !373
  store i64 %sub, ptr %max_new_arcs, align 8, !dbg !374, !tbaa !143
  br label %if.end, !dbg !375

if.else:                                          ; preds = %entry
  %6 = load ptr, ptr %net.addr, align 8, !dbg !376, !tbaa !130
  %max_residual_new_m3 = getelementptr inbounds %struct.network, ptr %6, i32 0, i32 8, !dbg !377
  %7 = load i64, ptr %max_residual_new_m3, align 8, !dbg !377, !tbaa !372
  %sub4 = sub nsw i64 %7, 4000000, !dbg !378
  store i64 %sub4, ptr %max_new_arcs, align 8, !dbg !379, !tbaa !143
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %8 = load ptr, ptr %new_arcs.addr, align 8, !dbg !380, !tbaa !130
  store i64 0, ptr %8, align 8, !dbg !381, !tbaa !143
  store i64 0, ptr %i, align 8, !dbg !382, !tbaa !143
  br label %for.cond, !dbg !384

for.cond:                                         ; preds = %for.inc, %if.end
  %9 = load i64, ptr %i, align 8, !dbg !385, !tbaa !143
  %10 = load i64, ptr %num_threads, align 8, !dbg !387, !tbaa !143
  %cmp5 = icmp slt i64 %9, %10, !dbg !388
  br i1 %cmp5, label %for.body, label %for.end, !dbg !389

for.body:                                         ; preds = %for.cond
  %11 = load ptr, ptr %new_arcs_array.addr, align 8, !dbg !390, !tbaa !130
  %12 = load i64, ptr %i, align 8, !dbg !392, !tbaa !143
  %arrayidx = getelementptr inbounds i64, ptr %11, i64 %12, !dbg !390
  %13 = load i64, ptr %arrayidx, align 8, !dbg !390, !tbaa !143
  %14 = load ptr, ptr %new_arcs.addr, align 8, !dbg !393, !tbaa !130
  %15 = load i64, ptr %14, align 8, !dbg !394, !tbaa !143
  %add = add nsw i64 %15, %13, !dbg !394
  store i64 %add, ptr %14, align 8, !dbg !394, !tbaa !143
  %16 = load ptr, ptr %arcs_pointer_sorted.addr, align 8, !dbg !395, !tbaa !130
  %17 = load i64, ptr %i, align 8, !dbg !396, !tbaa !143
  %arrayidx6 = getelementptr inbounds ptr, ptr %16, i64 %17, !dbg !395
  %18 = load ptr, ptr %arrayidx6, align 8, !dbg !395, !tbaa !130
  %19 = load ptr, ptr %positions, align 8, !dbg !397, !tbaa !130
  %20 = load i64, ptr %i, align 8, !dbg !398, !tbaa !143
  %arrayidx7 = getelementptr inbounds ptr, ptr %19, i64 %20, !dbg !397
  store ptr %18, ptr %arrayidx7, align 8, !dbg !399, !tbaa !130
  %21 = load ptr, ptr %values, align 8, !dbg !400, !tbaa !130
  %22 = load i64, ptr %i, align 8, !dbg !401, !tbaa !143
  %arrayidx8 = getelementptr inbounds i64, ptr %21, i64 %22, !dbg !400
  store i64 0, ptr %arrayidx8, align 8, !dbg !402, !tbaa !143
  br label %for.inc, !dbg !403

for.inc:                                          ; preds = %for.body
  %23 = load i64, ptr %i, align 8, !dbg !404, !tbaa !143
  %inc = add nsw i64 %23, 1, !dbg !404
  store i64 %inc, ptr %i, align 8, !dbg !404, !tbaa !143
  br label %for.cond, !dbg !405, !llvm.loop !406

for.end:                                          ; preds = %for.cond
  %24 = load ptr, ptr %net.addr, align 8, !dbg !408, !tbaa !130
  %m = getelementptr inbounds %struct.network, ptr %24, i32 0, i32 5, !dbg !409
  %25 = load i64, ptr %m, align 8, !dbg !409, !tbaa !410
  store i64 %25, ptr %start_id, align 8, !dbg !411, !tbaa !143
  br label %while.cond, !dbg !412

while.cond:                                       ; preds = %for.end32, %for.end
  %26 = load i64, ptr %global_new, align 8, !dbg !413, !tbaa !143
  %27 = load ptr, ptr %new_arcs.addr, align 8, !dbg !414, !tbaa !130
  %28 = load i64, ptr %27, align 8, !dbg !415, !tbaa !143
  %cmp9 = icmp slt i64 %26, %28, !dbg !416
  br i1 %cmp9, label %land.rhs, label %land.end, !dbg !417

land.rhs:                                         ; preds = %while.cond
  %29 = load i64, ptr %global_new, align 8, !dbg !418, !tbaa !143
  %30 = load i64, ptr %max_new_arcs, align 8, !dbg !419, !tbaa !143
  %cmp10 = icmp slt i64 %29, %30, !dbg !420
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %31 = phi i1 [ false, %while.cond ], [ %cmp10, %land.rhs ], !dbg !421
  br i1 %31, label %while.body, label %while.end, !dbg !412

while.body:                                       ; preds = %land.end
  %32 = load ptr, ptr %values, align 8, !dbg !422, !tbaa !130
  %arrayidx11 = getelementptr inbounds i64, ptr %32, i64 0, !dbg !422
  %33 = load i64, ptr %arrayidx11, align 8, !dbg !422, !tbaa !143
  %34 = load ptr, ptr %new_arcs_array.addr, align 8, !dbg !425, !tbaa !130
  %arrayidx12 = getelementptr inbounds i64, ptr %34, i64 0, !dbg !425
  %35 = load i64, ptr %arrayidx12, align 8, !dbg !425, !tbaa !143
  %cmp13 = icmp slt i64 %33, %35, !dbg !426
  br i1 %cmp13, label %if.then14, label %if.else16, !dbg !427

if.then14:                                        ; preds = %while.body
  %36 = load ptr, ptr %positions, align 8, !dbg !428, !tbaa !130
  %arrayidx15 = getelementptr inbounds ptr, ptr %36, i64 0, !dbg !428
  %37 = load ptr, ptr %arrayidx15, align 8, !dbg !428, !tbaa !130
  %38 = load ptr, ptr %37, align 8, !dbg !430, !tbaa !130
  store ptr %38, ptr %arc, align 8, !dbg !431, !tbaa !130
  store i64 0, ptr %best_pos, align 8, !dbg !432, !tbaa !143
  br label %if.end17, !dbg !433

if.else16:                                        ; preds = %while.body
  store ptr null, ptr %arc, align 8, !dbg !434, !tbaa !130
  br label %if.end17

if.end17:                                         ; preds = %if.else16, %if.then14
  store i64 1, ptr %i, align 8, !dbg !436, !tbaa !143
  br label %for.cond18, !dbg !438

for.cond18:                                       ; preds = %for.inc30, %if.end17
  %39 = load i64, ptr %i, align 8, !dbg !439, !tbaa !143
  %40 = load i64, ptr %num_threads, align 8, !dbg !441, !tbaa !143
  %cmp19 = icmp slt i64 %39, %40, !dbg !442
  br i1 %cmp19, label %for.body20, label %for.end32, !dbg !443

for.body20:                                       ; preds = %for.cond18
  %41 = load ptr, ptr %values, align 8, !dbg !444, !tbaa !130
  %42 = load i64, ptr %i, align 8, !dbg !447, !tbaa !143
  %arrayidx21 = getelementptr inbounds i64, ptr %41, i64 %42, !dbg !444
  %43 = load i64, ptr %arrayidx21, align 8, !dbg !444, !tbaa !143
  %44 = load ptr, ptr %new_arcs_array.addr, align 8, !dbg !448, !tbaa !130
  %45 = load i64, ptr %i, align 8, !dbg !449, !tbaa !143
  %arrayidx22 = getelementptr inbounds i64, ptr %44, i64 %45, !dbg !448
  %46 = load i64, ptr %arrayidx22, align 8, !dbg !448, !tbaa !143
  %cmp23 = icmp slt i64 %43, %46, !dbg !450
  br i1 %cmp23, label %land.lhs.true, label %if.end29, !dbg !451

land.lhs.true:                                    ; preds = %for.body20
  %47 = load ptr, ptr %arc, align 8, !dbg !452, !tbaa !130
  %tobool = icmp ne ptr %47, null, !dbg !452
  br i1 %tobool, label %lor.lhs.false, label %if.then27, !dbg !453

lor.lhs.false:                                    ; preds = %land.lhs.true
  %48 = load ptr, ptr %positions, align 8, !dbg !454, !tbaa !130
  %49 = load i64, ptr %i, align 8, !dbg !455, !tbaa !143
  %arrayidx24 = getelementptr inbounds ptr, ptr %48, i64 %49, !dbg !454
  %50 = load ptr, ptr %arrayidx24, align 8, !dbg !454, !tbaa !130
  %call25 = call i32 @arc_compare(ptr noundef %50, ptr noundef %arc) #10, !dbg !456
  %cmp26 = icmp slt i32 %call25, 0, !dbg !457
  br i1 %cmp26, label %if.then27, label %if.end29, !dbg !458

if.then27:                                        ; preds = %lor.lhs.false, %land.lhs.true
  %51 = load ptr, ptr %positions, align 8, !dbg !459, !tbaa !130
  %52 = load i64, ptr %i, align 8, !dbg !461, !tbaa !143
  %arrayidx28 = getelementptr inbounds ptr, ptr %51, i64 %52, !dbg !459
  %53 = load ptr, ptr %arrayidx28, align 8, !dbg !459, !tbaa !130
  %54 = load ptr, ptr %53, align 8, !dbg !462, !tbaa !130
  store ptr %54, ptr %arc, align 8, !dbg !463, !tbaa !130
  %55 = load i64, ptr %i, align 8, !dbg !464, !tbaa !143
  store i64 %55, ptr %best_pos, align 8, !dbg !465, !tbaa !143
  br label %if.end29, !dbg !466

if.end29:                                         ; preds = %if.then27, %lor.lhs.false, %for.body20
  br label %for.inc30, !dbg !467

for.inc30:                                        ; preds = %if.end29
  %56 = load i64, ptr %i, align 8, !dbg !468, !tbaa !143
  %inc31 = add nsw i64 %56, 1, !dbg !468
  store i64 %inc31, ptr %i, align 8, !dbg !468, !tbaa !143
  br label %for.cond18, !dbg !469, !llvm.loop !470

for.end32:                                        ; preds = %for.cond18
  %57 = load i64, ptr %start_id, align 8, !dbg !472, !tbaa !143
  %inc33 = add nsw i64 %57, 1, !dbg !472
  store i64 %inc33, ptr %start_id, align 8, !dbg !472, !tbaa !143
  %conv = trunc i64 %57 to i32, !dbg !473
  %58 = load ptr, ptr %arc, align 8, !dbg !474, !tbaa !130
  %id = getelementptr inbounds %struct.arc, ptr %58, i32 0, i32 0, !dbg !475
  store i32 %conv, ptr %id, align 8, !dbg !476, !tbaa !172
  %59 = load ptr, ptr %arc, align 8, !dbg !477, !tbaa !130
  %flow = getelementptr inbounds %struct.arc, ptr %59, i32 0, i32 7, !dbg !478
  store i64 1, ptr %flow, align 8, !dbg !479, !tbaa !480
  %60 = load i64, ptr %global_new, align 8, !dbg !481, !tbaa !143
  %inc34 = add nsw i64 %60, 1, !dbg !481
  store i64 %inc34, ptr %global_new, align 8, !dbg !481, !tbaa !143
  %61 = load ptr, ptr %positions, align 8, !dbg !482, !tbaa !130
  %62 = load i64, ptr %best_pos, align 8, !dbg !483, !tbaa !143
  %arrayidx35 = getelementptr inbounds ptr, ptr %61, i64 %62, !dbg !482
  %63 = load ptr, ptr %arrayidx35, align 8, !dbg !484, !tbaa !130
  %incdec.ptr = getelementptr inbounds ptr, ptr %63, i32 1, !dbg !484
  store ptr %incdec.ptr, ptr %arrayidx35, align 8, !dbg !484, !tbaa !130
  %64 = load ptr, ptr %values, align 8, !dbg !485, !tbaa !130
  %65 = load i64, ptr %best_pos, align 8, !dbg !486, !tbaa !143
  %arrayidx36 = getelementptr inbounds i64, ptr %64, i64 %65, !dbg !485
  %66 = load i64, ptr %arrayidx36, align 8, !dbg !487, !tbaa !143
  %inc37 = add nsw i64 %66, 1, !dbg !487
  store i64 %inc37, ptr %arrayidx36, align 8, !dbg !487, !tbaa !143
  br label %while.cond, !dbg !412, !llvm.loop !488

while.end:                                        ; preds = %land.end
  %67 = load ptr, ptr %new_arcs.addr, align 8, !dbg !490, !tbaa !130
  store i64 0, ptr %67, align 8, !dbg !491, !tbaa !143
  store i64 0, ptr %i, align 8, !dbg !492, !tbaa !143
  br label %for.cond38, !dbg !494

for.cond38:                                       ; preds = %for.inc44, %while.end
  %68 = load i64, ptr %i, align 8, !dbg !495, !tbaa !143
  %69 = load i64, ptr %num_threads, align 8, !dbg !497, !tbaa !143
  %cmp39 = icmp slt i64 %68, %69, !dbg !498
  br i1 %cmp39, label %for.body41, label %for.end46, !dbg !499

for.body41:                                       ; preds = %for.cond38
  %70 = load ptr, ptr %values, align 8, !dbg !500, !tbaa !130
  %71 = load i64, ptr %i, align 8, !dbg !502, !tbaa !143
  %arrayidx42 = getelementptr inbounds i64, ptr %70, i64 %71, !dbg !500
  %72 = load i64, ptr %arrayidx42, align 8, !dbg !500, !tbaa !143
  %73 = load ptr, ptr %new_arcs.addr, align 8, !dbg !503, !tbaa !130
  %74 = load i64, ptr %73, align 8, !dbg !504, !tbaa !143
  %add43 = add nsw i64 %74, %72, !dbg !504
  store i64 %add43, ptr %73, align 8, !dbg !504, !tbaa !143
  br label %for.inc44, !dbg !505

for.inc44:                                        ; preds = %for.body41
  %75 = load i64, ptr %i, align 8, !dbg !506, !tbaa !143
  %inc45 = add nsw i64 %75, 1, !dbg !506
  store i64 %inc45, ptr %i, align 8, !dbg !506, !tbaa !143
  br label %for.cond38, !dbg !507, !llvm.loop !508

for.end46:                                        ; preds = %for.cond38
  %76 = load ptr, ptr %net.addr, align 8, !dbg !510, !tbaa !130
  %max_elems = getelementptr inbounds %struct.network, ptr %76, i32 0, i32 32, !dbg !511
  store i64 4000, ptr %max_elems, align 8, !dbg !512, !tbaa !513
  %77 = load ptr, ptr %new_arcs.addr, align 8, !dbg !514, !tbaa !130
  %78 = load i64, ptr %77, align 8, !dbg !515, !tbaa !143
  %79 = load ptr, ptr %net.addr, align 8, !dbg !516, !tbaa !130
  %m47 = getelementptr inbounds %struct.network, ptr %79, i32 0, i32 5, !dbg !517
  %80 = load i64, ptr %m47, align 8, !dbg !517, !tbaa !410
  %add48 = add nsw i64 %78, %80, !dbg !518
  %sub49 = sub nsw i64 %add48, 1, !dbg !519
  %div = sdiv i64 %sub49, 4000, !dbg !520
  %add50 = add nsw i64 %div, 1, !dbg !521
  %81 = load ptr, ptr %net.addr, align 8, !dbg !522, !tbaa !130
  %nr_group = getelementptr inbounds %struct.network, ptr %81, i32 0, i32 30, !dbg !523
  store i64 %add50, ptr %nr_group, align 8, !dbg !524, !tbaa !525
  %82 = load ptr, ptr %new_arcs.addr, align 8, !dbg !526, !tbaa !130
  %83 = load i64, ptr %82, align 8, !dbg !528, !tbaa !143
  %84 = load ptr, ptr %net.addr, align 8, !dbg !529, !tbaa !130
  %m51 = getelementptr inbounds %struct.network, ptr %84, i32 0, i32 5, !dbg !530
  %85 = load i64, ptr %m51, align 8, !dbg !530, !tbaa !410
  %add52 = add nsw i64 %83, %85, !dbg !531
  %rem = srem i64 %add52, 4000, !dbg !532
  %cmp53 = icmp ne i64 %rem, 0, !dbg !533
  br i1 %cmp53, label %if.then55, label %if.else62, !dbg !534

if.then55:                                        ; preds = %for.end46
  %86 = load ptr, ptr %net.addr, align 8, !dbg !535, !tbaa !130
  %nr_group56 = getelementptr inbounds %struct.network, ptr %86, i32 0, i32 30, !dbg !536
  %87 = load i64, ptr %nr_group56, align 8, !dbg !536, !tbaa !525
  %88 = load ptr, ptr %new_arcs.addr, align 8, !dbg !537, !tbaa !130
  %89 = load i64, ptr %88, align 8, !dbg !538, !tbaa !143
  %90 = load ptr, ptr %net.addr, align 8, !dbg !539, !tbaa !130
  %m57 = getelementptr inbounds %struct.network, ptr %90, i32 0, i32 5, !dbg !540
  %91 = load i64, ptr %m57, align 8, !dbg !540, !tbaa !410
  %add58 = add nsw i64 %89, %91, !dbg !541
  %rem59 = srem i64 %add58, 4000, !dbg !542
  %sub60 = sub nsw i64 4000, %rem59, !dbg !543
  %sub61 = sub nsw i64 %87, %sub60, !dbg !544
  %92 = load ptr, ptr %net.addr, align 8, !dbg !545, !tbaa !130
  %full_groups = getelementptr inbounds %struct.network, ptr %92, i32 0, i32 31, !dbg !546
  store i64 %sub61, ptr %full_groups, align 8, !dbg !547, !tbaa !548
  br label %if.end65, !dbg !545

if.else62:                                        ; preds = %for.end46
  %93 = load ptr, ptr %net.addr, align 8, !dbg !549, !tbaa !130
  %nr_group63 = getelementptr inbounds %struct.network, ptr %93, i32 0, i32 30, !dbg !550
  %94 = load i64, ptr %nr_group63, align 8, !dbg !550, !tbaa !525
  %95 = load ptr, ptr %net.addr, align 8, !dbg !551, !tbaa !130
  %full_groups64 = getelementptr inbounds %struct.network, ptr %95, i32 0, i32 31, !dbg !552
  store i64 %94, ptr %full_groups64, align 8, !dbg !553, !tbaa !548
  br label %if.end65

if.end65:                                         ; preds = %if.else62, %if.then55
  br label %while.cond66, !dbg !554

while.cond66:                                     ; preds = %while.body70, %if.end65
  %96 = load ptr, ptr %net.addr, align 8, !dbg !555, !tbaa !130
  %full_groups67 = getelementptr inbounds %struct.network, ptr %96, i32 0, i32 31, !dbg !556
  %97 = load i64, ptr %full_groups67, align 8, !dbg !556, !tbaa !548
  %cmp68 = icmp slt i64 %97, 0, !dbg !557
  br i1 %cmp68, label %while.body70, label %while.end76, !dbg !554

while.body70:                                     ; preds = %while.cond66
  %98 = load ptr, ptr %net.addr, align 8, !dbg !558, !tbaa !130
  %nr_group71 = getelementptr inbounds %struct.network, ptr %98, i32 0, i32 30, !dbg !560
  %99 = load i64, ptr %nr_group71, align 8, !dbg !560, !tbaa !525
  %100 = load ptr, ptr %net.addr, align 8, !dbg !561, !tbaa !130
  %full_groups72 = getelementptr inbounds %struct.network, ptr %100, i32 0, i32 31, !dbg !562
  %101 = load i64, ptr %full_groups72, align 8, !dbg !562, !tbaa !548
  %add73 = add nsw i64 %99, %101, !dbg !563
  %102 = load ptr, ptr %net.addr, align 8, !dbg !564, !tbaa !130
  %full_groups74 = getelementptr inbounds %struct.network, ptr %102, i32 0, i32 31, !dbg !565
  store i64 %add73, ptr %full_groups74, align 8, !dbg !566, !tbaa !548
  %103 = load ptr, ptr %net.addr, align 8, !dbg !567, !tbaa !130
  %max_elems75 = getelementptr inbounds %struct.network, ptr %103, i32 0, i32 32, !dbg !568
  %104 = load i64, ptr %max_elems75, align 8, !dbg !569, !tbaa !513
  %dec = add nsw i64 %104, -1, !dbg !569
  store i64 %dec, ptr %max_elems75, align 8, !dbg !569, !tbaa !513
  br label %while.cond66, !dbg !554, !llvm.loop !570

while.end76:                                      ; preds = %while.cond66
  %105 = load ptr, ptr %positions, align 8, !dbg !572, !tbaa !130
  call void @free(ptr noundef %105) #12, !dbg !573
  %106 = load ptr, ptr %values, align 8, !dbg !574, !tbaa !130
  call void @free(ptr noundef %106) #12, !dbg !575
  call void @llvm.lifetime.end.p0(i64 8, ptr %num_threads) #9, !dbg !576
  call void @llvm.lifetime.end.p0(i64 8, ptr %arc) #9, !dbg !576
  call void @llvm.lifetime.end.p0(i64 8, ptr %i) #9, !dbg !576
  call void @llvm.lifetime.end.p0(i64 8, ptr %start_id) #9, !dbg !576
  call void @llvm.lifetime.end.p0(i64 8, ptr %best_pos) #9, !dbg !576
  call void @llvm.lifetime.end.p0(i64 8, ptr %global_new) #9, !dbg !576
  call void @llvm.lifetime.end.p0(i64 8, ptr %values) #9, !dbg !576
  call void @llvm.lifetime.end.p0(i64 8, ptr %positions) #9, !dbg !576
  call void @llvm.lifetime.end.p0(i64 8, ptr %max_new_arcs) #9, !dbg !576
  ret void, !dbg !576
}

; Function Attrs: minsize nounwind optsize allocsize(0)
declare !dbg !577 noalias ptr @malloc(i64 noundef) #4

; Function Attrs: minsize nounwind optsize uwtable
define internal i32 @arc_compare(ptr noundef %a1, ptr noundef %a2) #0 !dbg !585 {
entry:
  %retval = alloca i32, align 4
  %a1.addr = alloca ptr, align 8
  %a2.addr = alloca ptr, align 8
  store ptr %a1, ptr %a1.addr, align 8, !tbaa !130
  call void @llvm.dbg.declare(metadata ptr %a1.addr, metadata !590, metadata !DIExpression()), !dbg !592
  store ptr %a2, ptr %a2.addr, align 8, !tbaa !130
  call void @llvm.dbg.declare(metadata ptr %a2.addr, metadata !591, metadata !DIExpression()), !dbg !593
  %0 = load ptr, ptr %a1.addr, align 8, !dbg !594, !tbaa !130
  %1 = load ptr, ptr %0, align 8, !dbg !596, !tbaa !130
  %flow = getelementptr inbounds %struct.arc, ptr %1, i32 0, i32 7, !dbg !597
  %2 = load i64, ptr %flow, align 8, !dbg !597, !tbaa !480
  %3 = load ptr, ptr %a2.addr, align 8, !dbg !598, !tbaa !130
  %4 = load ptr, ptr %3, align 8, !dbg !599, !tbaa !130
  %flow1 = getelementptr inbounds %struct.arc, ptr %4, i32 0, i32 7, !dbg !600
  %5 = load i64, ptr %flow1, align 8, !dbg !600, !tbaa !480
  %cmp = icmp sgt i64 %2, %5, !dbg !601
  br i1 %cmp, label %if.then, label %if.end, !dbg !602

if.then:                                          ; preds = %entry
  store i32 1, ptr %retval, align 4, !dbg !603
  br label %return, !dbg !603

if.end:                                           ; preds = %entry
  %6 = load ptr, ptr %a1.addr, align 8, !dbg !604, !tbaa !130
  %7 = load ptr, ptr %6, align 8, !dbg !606, !tbaa !130
  %flow2 = getelementptr inbounds %struct.arc, ptr %7, i32 0, i32 7, !dbg !607
  %8 = load i64, ptr %flow2, align 8, !dbg !607, !tbaa !480
  %9 = load ptr, ptr %a2.addr, align 8, !dbg !608, !tbaa !130
  %10 = load ptr, ptr %9, align 8, !dbg !609, !tbaa !130
  %flow3 = getelementptr inbounds %struct.arc, ptr %10, i32 0, i32 7, !dbg !610
  %11 = load i64, ptr %flow3, align 8, !dbg !610, !tbaa !480
  %cmp4 = icmp slt i64 %8, %11, !dbg !611
  br i1 %cmp4, label %if.then5, label %if.end6, !dbg !612

if.then5:                                         ; preds = %if.end
  store i32 -1, ptr %retval, align 4, !dbg !613
  br label %return, !dbg !613

if.end6:                                          ; preds = %if.end
  %12 = load ptr, ptr %a1.addr, align 8, !dbg !614, !tbaa !130
  %13 = load ptr, ptr %12, align 8, !dbg !616, !tbaa !130
  %id = getelementptr inbounds %struct.arc, ptr %13, i32 0, i32 0, !dbg !617
  %14 = load i32, ptr %id, align 8, !dbg !617, !tbaa !172
  %15 = load ptr, ptr %a2.addr, align 8, !dbg !618, !tbaa !130
  %16 = load ptr, ptr %15, align 8, !dbg !619, !tbaa !130
  %id7 = getelementptr inbounds %struct.arc, ptr %16, i32 0, i32 0, !dbg !620
  %17 = load i32, ptr %id7, align 8, !dbg !620, !tbaa !172
  %cmp8 = icmp slt i32 %14, %17, !dbg !621
  br i1 %cmp8, label %if.then9, label %if.end10, !dbg !622

if.then9:                                         ; preds = %if.end6
  store i32 -1, ptr %retval, align 4, !dbg !623
  br label %return, !dbg !623

if.end10:                                         ; preds = %if.end6
  store i32 1, ptr %retval, align 4, !dbg !624
  br label %return, !dbg !624

return:                                           ; preds = %if.end10, %if.then9, %if.then5, %if.then
  %18 = load i32, ptr %retval, align 4, !dbg !625
  ret i32 %18, !dbg !625
}

; Function Attrs: minsize nounwind optsize
declare !dbg !626 void @free(ptr noundef) #5

; Function Attrs: minsize nounwind optsize uwtable
define dso_local i64 @resize_prob(ptr noundef %net) #0 !dbg !629 {
entry:
  %retval = alloca i64, align 8
  %net.addr = alloca ptr, align 8
  %arc = alloca ptr, align 8
  %old_arcs = alloca ptr, align 8
  %node = alloca ptr, align 8
  %stop = alloca ptr, align 8
  %root = alloca ptr, align 8
  %off = alloca i64, align 8
  %cleanup.dest.slot = alloca i32, align 4
  store ptr %net, ptr %net.addr, align 8, !tbaa !130
  call void @llvm.dbg.declare(metadata ptr %net.addr, metadata !633, metadata !DIExpression()), !dbg !642
  call void @llvm.lifetime.start.p0(i64 8, ptr %arc) #9, !dbg !643
  call void @llvm.dbg.declare(metadata ptr %arc, metadata !634, metadata !DIExpression()), !dbg !644
  call void @llvm.lifetime.start.p0(i64 8, ptr %old_arcs) #9, !dbg !643
  call void @llvm.dbg.declare(metadata ptr %old_arcs, metadata !635, metadata !DIExpression()), !dbg !645
  call void @llvm.lifetime.start.p0(i64 8, ptr %node) #9, !dbg !646
  call void @llvm.dbg.declare(metadata ptr %node, metadata !636, metadata !DIExpression()), !dbg !647
  call void @llvm.lifetime.start.p0(i64 8, ptr %stop) #9, !dbg !646
  call void @llvm.dbg.declare(metadata ptr %stop, metadata !639, metadata !DIExpression()), !dbg !648
  call void @llvm.lifetime.start.p0(i64 8, ptr %root) #9, !dbg !646
  call void @llvm.dbg.declare(metadata ptr %root, metadata !640, metadata !DIExpression()), !dbg !649
  call void @llvm.lifetime.start.p0(i64 8, ptr %off) #9, !dbg !650
  call void @llvm.dbg.declare(metadata ptr %off, metadata !641, metadata !DIExpression()), !dbg !651
  %0 = load ptr, ptr %net.addr, align 8, !dbg !652, !tbaa !130
  %max_new_m = getelementptr inbounds %struct.network, ptr %0, i32 0, i32 9, !dbg !653
  %1 = load i64, ptr %max_new_m, align 8, !dbg !653, !tbaa !654
  %2 = load ptr, ptr %net.addr, align 8, !dbg !655, !tbaa !130
  %max_m = getelementptr inbounds %struct.network, ptr %2, i32 0, i32 4, !dbg !656
  %3 = load i64, ptr %max_m, align 8, !dbg !657, !tbaa !658
  %add = add nsw i64 %3, %1, !dbg !657
  store i64 %add, ptr %max_m, align 8, !dbg !657, !tbaa !658
  %4 = load ptr, ptr %net.addr, align 8, !dbg !659, !tbaa !130
  %max_new_m1 = getelementptr inbounds %struct.network, ptr %4, i32 0, i32 9, !dbg !660
  %5 = load i64, ptr %max_new_m1, align 8, !dbg !660, !tbaa !654
  %6 = load ptr, ptr %net.addr, align 8, !dbg !661, !tbaa !130
  %max_residual_new_m = getelementptr inbounds %struct.network, ptr %6, i32 0, i32 8, !dbg !662
  %7 = load i64, ptr %max_residual_new_m, align 8, !dbg !663, !tbaa !372
  %add2 = add nsw i64 %7, %5, !dbg !663
  store i64 %add2, ptr %max_residual_new_m, align 8, !dbg !663, !tbaa !372
  %8 = load ptr, ptr %net.addr, align 8, !dbg !664, !tbaa !130
  %arcs = getelementptr inbounds %struct.network, ptr %8, i32 0, i32 23, !dbg !665
  %9 = load ptr, ptr %arcs, align 8, !dbg !665, !tbaa !271
  %10 = load ptr, ptr %net.addr, align 8, !dbg !666, !tbaa !130
  %max_m3 = getelementptr inbounds %struct.network, ptr %10, i32 0, i32 4, !dbg !667
  %11 = load i64, ptr %max_m3, align 8, !dbg !667, !tbaa !658
  %mul = mul i64 %11, 72, !dbg !668
  %call = call ptr @realloc(ptr noundef %9, i64 noundef %mul) #13, !dbg !669
  store ptr %call, ptr %arc, align 8, !dbg !670, !tbaa !130
  %12 = load ptr, ptr %arc, align 8, !dbg !671, !tbaa !130
  %tobool = icmp ne ptr %12, null, !dbg !671
  br i1 %tobool, label %if.end, label %if.then, !dbg !673

if.then:                                          ; preds = %entry
  %13 = load ptr, ptr %net.addr, align 8, !dbg !674, !tbaa !130
  %inputfile = getelementptr inbounds %struct.network, ptr %13, i32 0, i32 0, !dbg !676
  %arraydecay = getelementptr inbounds [200 x i8], ptr %inputfile, i64 0, i64 0, !dbg !674
  %call4 = call i32 (ptr, ...) @printf(ptr noundef @.str, ptr noundef %arraydecay) #10, !dbg !677
  %14 = load ptr, ptr @stdout, align 8, !dbg !678, !tbaa !130
  %call5 = call i32 @fflush(ptr noundef %14) #10, !dbg !679
  store i64 -1, ptr %retval, align 8, !dbg !680
  store i32 1, ptr %cleanup.dest.slot, align 4
  br label %cleanup, !dbg !680

if.end:                                           ; preds = %entry
  %15 = load ptr, ptr %net.addr, align 8, !dbg !681, !tbaa !130
  %arcs6 = getelementptr inbounds %struct.network, ptr %15, i32 0, i32 23, !dbg !682
  %16 = load ptr, ptr %arcs6, align 8, !dbg !682, !tbaa !271
  store ptr %16, ptr %old_arcs, align 8, !dbg !683, !tbaa !130
  %17 = load ptr, ptr %arc, align 8, !dbg !684, !tbaa !130
  %18 = load ptr, ptr %net.addr, align 8, !dbg !685, !tbaa !130
  %arcs7 = getelementptr inbounds %struct.network, ptr %18, i32 0, i32 23, !dbg !686
  store ptr %17, ptr %arcs7, align 8, !dbg !687, !tbaa !271
  %19 = load ptr, ptr %arc, align 8, !dbg !688, !tbaa !130
  %20 = load ptr, ptr %net.addr, align 8, !dbg !689, !tbaa !130
  %m = getelementptr inbounds %struct.network, ptr %20, i32 0, i32 5, !dbg !690
  %21 = load i64, ptr %m, align 8, !dbg !690, !tbaa !410
  %add.ptr = getelementptr inbounds %struct.arc, ptr %19, i64 %21, !dbg !691
  %22 = load ptr, ptr %net.addr, align 8, !dbg !692, !tbaa !130
  %stop_arcs = getelementptr inbounds %struct.network, ptr %22, i32 0, i32 24, !dbg !693
  store ptr %add.ptr, ptr %stop_arcs, align 8, !dbg !694, !tbaa !315
  %23 = load ptr, ptr %net.addr, align 8, !dbg !695, !tbaa !130
  %nodes = getelementptr inbounds %struct.network, ptr %23, i32 0, i32 21, !dbg !696
  %24 = load ptr, ptr %nodes, align 8, !dbg !696, !tbaa !158
  store ptr %24, ptr %node, align 8, !dbg !697, !tbaa !130
  store ptr %24, ptr %root, align 8, !dbg !698, !tbaa !130
  %25 = load ptr, ptr %node, align 8, !dbg !699, !tbaa !130
  %incdec.ptr = getelementptr inbounds %struct.node, ptr %25, i32 1, !dbg !699
  store ptr %incdec.ptr, ptr %node, align 8, !dbg !699, !tbaa !130
  %26 = load ptr, ptr %net.addr, align 8, !dbg !701, !tbaa !130
  %stop_nodes = getelementptr inbounds %struct.network, ptr %26, i32 0, i32 22, !dbg !702
  %27 = load ptr, ptr %stop_nodes, align 8, !dbg !702, !tbaa !703
  store ptr %27, ptr %stop, align 8, !dbg !704, !tbaa !130
  br label %for.cond, !dbg !705

for.cond:                                         ; preds = %for.inc, %if.end
  %28 = load ptr, ptr %node, align 8, !dbg !706, !tbaa !130
  %29 = load ptr, ptr %stop, align 8, !dbg !708, !tbaa !130
  %cmp = icmp ult ptr %28, %29, !dbg !709
  br i1 %cmp, label %for.body, label %for.end, !dbg !710

for.body:                                         ; preds = %for.cond
  %30 = load ptr, ptr %node, align 8, !dbg !711, !tbaa !130
  %basic_arc = getelementptr inbounds %struct.node, ptr %30, i32 0, i32 6, !dbg !714
  %31 = load ptr, ptr %basic_arc, align 8, !dbg !714, !tbaa !165
  %tobool8 = icmp ne ptr %31, null, !dbg !711
  br i1 %tobool8, label %land.lhs.true, label %if.end15, !dbg !715

land.lhs.true:                                    ; preds = %for.body
  %32 = load ptr, ptr %node, align 8, !dbg !716, !tbaa !130
  %pred = getelementptr inbounds %struct.node, ptr %32, i32 0, i32 3, !dbg !717
  %33 = load ptr, ptr %pred, align 8, !dbg !717, !tbaa !718
  %34 = load ptr, ptr %root, align 8, !dbg !719, !tbaa !130
  %cmp9 = icmp ne ptr %33, %34, !dbg !720
  br i1 %cmp9, label %if.then10, label %if.end15, !dbg !721

if.then10:                                        ; preds = %land.lhs.true
  %35 = load ptr, ptr %node, align 8, !dbg !722, !tbaa !130
  %basic_arc11 = getelementptr inbounds %struct.node, ptr %35, i32 0, i32 6, !dbg !724
  %36 = load ptr, ptr %basic_arc11, align 8, !dbg !724, !tbaa !165
  %37 = load ptr, ptr %old_arcs, align 8, !dbg !725, !tbaa !130
  %sub.ptr.lhs.cast = ptrtoint ptr %36 to i64, !dbg !726
  %sub.ptr.rhs.cast = ptrtoint ptr %37 to i64, !dbg !726
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast, !dbg !726
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, 72, !dbg !726
  store i64 %sub.ptr.div, ptr %off, align 8, !dbg !727, !tbaa !143
  %38 = load ptr, ptr %net.addr, align 8, !dbg !728, !tbaa !130
  %arcs12 = getelementptr inbounds %struct.network, ptr %38, i32 0, i32 23, !dbg !729
  %39 = load ptr, ptr %arcs12, align 8, !dbg !729, !tbaa !271
  %40 = load i64, ptr %off, align 8, !dbg !730, !tbaa !143
  %add.ptr13 = getelementptr inbounds %struct.arc, ptr %39, i64 %40, !dbg !731
  %41 = load ptr, ptr %node, align 8, !dbg !732, !tbaa !130
  %basic_arc14 = getelementptr inbounds %struct.node, ptr %41, i32 0, i32 6, !dbg !733
  store ptr %add.ptr13, ptr %basic_arc14, align 8, !dbg !734, !tbaa !165
  br label %if.end15, !dbg !735

if.end15:                                         ; preds = %if.then10, %land.lhs.true, %for.body
  br label %for.inc, !dbg !736

for.inc:                                          ; preds = %if.end15
  %42 = load ptr, ptr %node, align 8, !dbg !737, !tbaa !130
  %incdec.ptr16 = getelementptr inbounds %struct.node, ptr %42, i32 1, !dbg !737
  store ptr %incdec.ptr16, ptr %node, align 8, !dbg !737, !tbaa !130
  br label %for.cond, !dbg !738, !llvm.loop !739

for.end:                                          ; preds = %for.cond
  %43 = load ptr, ptr %net.addr, align 8, !dbg !741, !tbaa !130
  %sorted_arcs = getelementptr inbounds %struct.network, ptr %43, i32 0, i32 25, !dbg !742
  %44 = load ptr, ptr %sorted_arcs, align 8, !dbg !742, !tbaa !254
  %45 = load ptr, ptr %net.addr, align 8, !dbg !743, !tbaa !130
  %max_m17 = getelementptr inbounds %struct.network, ptr %45, i32 0, i32 4, !dbg !744
  %46 = load i64, ptr %max_m17, align 8, !dbg !744, !tbaa !658
  %mul18 = mul i64 %46, 72, !dbg !745
  %call19 = call ptr @realloc(ptr noundef %44, i64 noundef %mul18) #13, !dbg !746
  store ptr %call19, ptr %arc, align 8, !dbg !747, !tbaa !130
  %47 = load ptr, ptr %arc, align 8, !dbg !748, !tbaa !130
  %48 = load ptr, ptr %net.addr, align 8, !dbg !749, !tbaa !130
  %sorted_arcs20 = getelementptr inbounds %struct.network, ptr %48, i32 0, i32 25, !dbg !750
  store ptr %47, ptr %sorted_arcs20, align 8, !dbg !751, !tbaa !254
  store i64 0, ptr %retval, align 8, !dbg !752
  store i32 1, ptr %cleanup.dest.slot, align 4
  br label %cleanup, !dbg !752

cleanup:                                          ; preds = %for.end, %if.then
  call void @llvm.lifetime.end.p0(i64 8, ptr %off) #9, !dbg !753
  call void @llvm.lifetime.end.p0(i64 8, ptr %root) #9, !dbg !753
  call void @llvm.lifetime.end.p0(i64 8, ptr %stop) #9, !dbg !753
  call void @llvm.lifetime.end.p0(i64 8, ptr %node) #9, !dbg !753
  call void @llvm.lifetime.end.p0(i64 8, ptr %old_arcs) #9, !dbg !753
  call void @llvm.lifetime.end.p0(i64 8, ptr %arc) #9, !dbg !753
  %49 = load i64, ptr %retval, align 8, !dbg !753
  ret i64 %49, !dbg !753
}

; Function Attrs: minsize nounwind optsize allocsize(1)
declare !dbg !754 ptr @realloc(ptr noundef, i64 noundef) #6

; Function Attrs: minsize optsize
declare !dbg !757 i32 @printf(ptr noundef, ...) #7

; Function Attrs: minsize optsize
declare !dbg !764 i32 @fflush(ptr noundef) #7

; Function Attrs: minsize nounwind optsize uwtable
define dso_local void @insert_new_arc(ptr noundef %newarc, i64 noundef %newpos, ptr noundef %tail, ptr noundef %head, i64 noundef %cost, i64 noundef %red_cost, i64 noundef %m, i64 noundef %number) #0 !dbg !822 {
entry:
  %newarc.addr = alloca ptr, align 8
  %newpos.addr = alloca i64, align 8
  %tail.addr = alloca ptr, align 8
  %head.addr = alloca ptr, align 8
  %cost.addr = alloca i64, align 8
  %red_cost.addr = alloca i64, align 8
  %m.addr = alloca i64, align 8
  %number.addr = alloca i64, align 8
  %pos = alloca i64, align 8
  store ptr %newarc, ptr %newarc.addr, align 8, !tbaa !130
  call void @llvm.dbg.declare(metadata ptr %newarc.addr, metadata !826, metadata !DIExpression()), !dbg !835
  store i64 %newpos, ptr %newpos.addr, align 8, !tbaa !143
  call void @llvm.dbg.declare(metadata ptr %newpos.addr, metadata !827, metadata !DIExpression()), !dbg !836
  store ptr %tail, ptr %tail.addr, align 8, !tbaa !130
  call void @llvm.dbg.declare(metadata ptr %tail.addr, metadata !828, metadata !DIExpression()), !dbg !837
  store ptr %head, ptr %head.addr, align 8, !tbaa !130
  call void @llvm.dbg.declare(metadata ptr %head.addr, metadata !829, metadata !DIExpression()), !dbg !838
  store i64 %cost, ptr %cost.addr, align 8, !tbaa !143
  call void @llvm.dbg.declare(metadata ptr %cost.addr, metadata !830, metadata !DIExpression()), !dbg !839
  store i64 %red_cost, ptr %red_cost.addr, align 8, !tbaa !143
  call void @llvm.dbg.declare(metadata ptr %red_cost.addr, metadata !831, metadata !DIExpression()), !dbg !840
  store i64 %m, ptr %m.addr, align 8, !tbaa !143
  call void @llvm.dbg.declare(metadata ptr %m.addr, metadata !832, metadata !DIExpression()), !dbg !841
  store i64 %number, ptr %number.addr, align 8, !tbaa !143
  call void @llvm.dbg.declare(metadata ptr %number.addr, metadata !833, metadata !DIExpression()), !dbg !842
  call void @llvm.lifetime.start.p0(i64 8, ptr %pos) #9, !dbg !843
  call void @llvm.dbg.declare(metadata ptr %pos, metadata !834, metadata !DIExpression()), !dbg !844
  %0 = load ptr, ptr %tail.addr, align 8, !dbg !845, !tbaa !130
  %1 = load ptr, ptr %newarc.addr, align 8, !dbg !846, !tbaa !130
  %2 = load i64, ptr %newpos.addr, align 8, !dbg !847, !tbaa !143
  %arrayidx = getelementptr inbounds %struct.arc, ptr %1, i64 %2, !dbg !846
  %tail1 = getelementptr inbounds %struct.arc, ptr %arrayidx, i32 0, i32 2, !dbg !848
  store ptr %0, ptr %tail1, align 8, !dbg !849, !tbaa !850
  %3 = load ptr, ptr %head.addr, align 8, !dbg !851, !tbaa !130
  %4 = load ptr, ptr %newarc.addr, align 8, !dbg !852, !tbaa !130
  %5 = load i64, ptr %newpos.addr, align 8, !dbg !853, !tbaa !143
  %arrayidx2 = getelementptr inbounds %struct.arc, ptr %4, i64 %5, !dbg !852
  %head3 = getelementptr inbounds %struct.arc, ptr %arrayidx2, i32 0, i32 3, !dbg !854
  store ptr %3, ptr %head3, align 8, !dbg !855, !tbaa !856
  %6 = load i64, ptr %cost.addr, align 8, !dbg !857, !tbaa !143
  %7 = load ptr, ptr %newarc.addr, align 8, !dbg !858, !tbaa !130
  %8 = load i64, ptr %newpos.addr, align 8, !dbg !859, !tbaa !143
  %arrayidx4 = getelementptr inbounds %struct.arc, ptr %7, i64 %8, !dbg !858
  %org_cost = getelementptr inbounds %struct.arc, ptr %arrayidx4, i32 0, i32 8, !dbg !860
  store i64 %6, ptr %org_cost, align 8, !dbg !861, !tbaa !862
  %9 = load i64, ptr %cost.addr, align 8, !dbg !863, !tbaa !143
  %10 = load ptr, ptr %newarc.addr, align 8, !dbg !864, !tbaa !130
  %11 = load i64, ptr %newpos.addr, align 8, !dbg !865, !tbaa !143
  %arrayidx5 = getelementptr inbounds %struct.arc, ptr %10, i64 %11, !dbg !864
  %cost6 = getelementptr inbounds %struct.arc, ptr %arrayidx5, i32 0, i32 1, !dbg !866
  store i64 %9, ptr %cost6, align 8, !dbg !867, !tbaa !868
  %12 = load i64, ptr %red_cost.addr, align 8, !dbg !869, !tbaa !143
  %13 = load ptr, ptr %newarc.addr, align 8, !dbg !870, !tbaa !130
  %14 = load i64, ptr %newpos.addr, align 8, !dbg !871, !tbaa !143
  %arrayidx7 = getelementptr inbounds %struct.arc, ptr %13, i64 %14, !dbg !870
  %flow = getelementptr inbounds %struct.arc, ptr %arrayidx7, i32 0, i32 7, !dbg !872
  store i64 %12, ptr %flow, align 8, !dbg !873, !tbaa !480
  %15 = load i64, ptr %number.addr, align 8, !dbg !874, !tbaa !143
  %conv = trunc i64 %15 to i32, !dbg !874
  %16 = load ptr, ptr %newarc.addr, align 8, !dbg !875, !tbaa !130
  %17 = load i64, ptr %newpos.addr, align 8, !dbg !876, !tbaa !143
  %arrayidx8 = getelementptr inbounds %struct.arc, ptr %16, i64 %17, !dbg !875
  %id = getelementptr inbounds %struct.arc, ptr %arrayidx8, i32 0, i32 0, !dbg !877
  store i32 %conv, ptr %id, align 8, !dbg !878, !tbaa !172
  %18 = load i64, ptr %newpos.addr, align 8, !dbg !879, !tbaa !143
  %add = add nsw i64 %18, 1, !dbg !880
  store i64 %add, ptr %pos, align 8, !dbg !881, !tbaa !143
  br label %while.cond, !dbg !882

while.cond:                                       ; preds = %while.body, %entry
  %19 = load i64, ptr %pos, align 8, !dbg !883, !tbaa !143
  %sub = sub nsw i64 %19, 1, !dbg !884
  %tobool = icmp ne i64 %sub, 0, !dbg !884
  br i1 %tobool, label %land.rhs, label %land.end, !dbg !885

land.rhs:                                         ; preds = %while.cond
  %20 = load i64, ptr %red_cost.addr, align 8, !dbg !886, !tbaa !143
  %21 = load ptr, ptr %newarc.addr, align 8, !dbg !887, !tbaa !130
  %22 = load i64, ptr %pos, align 8, !dbg !888, !tbaa !143
  %div = sdiv i64 %22, 2, !dbg !889
  %sub9 = sub nsw i64 %div, 1, !dbg !890
  %arrayidx10 = getelementptr inbounds %struct.arc, ptr %21, i64 %sub9, !dbg !887
  %flow11 = getelementptr inbounds %struct.arc, ptr %arrayidx10, i32 0, i32 7, !dbg !891
  %23 = load i64, ptr %flow11, align 8, !dbg !891, !tbaa !480
  %cmp = icmp sgt i64 %20, %23, !dbg !892
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %24 = phi i1 [ false, %while.cond ], [ %cmp, %land.rhs ], !dbg !893
  br i1 %24, label %while.body, label %while.end, !dbg !882

while.body:                                       ; preds = %land.end
  %25 = load ptr, ptr %newarc.addr, align 8, !dbg !894, !tbaa !130
  %26 = load i64, ptr %pos, align 8, !dbg !896, !tbaa !143
  %div13 = sdiv i64 %26, 2, !dbg !897
  %sub14 = sub nsw i64 %div13, 1, !dbg !898
  %arrayidx15 = getelementptr inbounds %struct.arc, ptr %25, i64 %sub14, !dbg !894
  %tail16 = getelementptr inbounds %struct.arc, ptr %arrayidx15, i32 0, i32 2, !dbg !899
  %27 = load ptr, ptr %tail16, align 8, !dbg !899, !tbaa !850
  %28 = load ptr, ptr %newarc.addr, align 8, !dbg !900, !tbaa !130
  %29 = load i64, ptr %pos, align 8, !dbg !901, !tbaa !143
  %sub17 = sub nsw i64 %29, 1, !dbg !902
  %arrayidx18 = getelementptr inbounds %struct.arc, ptr %28, i64 %sub17, !dbg !900
  %tail19 = getelementptr inbounds %struct.arc, ptr %arrayidx18, i32 0, i32 2, !dbg !903
  store ptr %27, ptr %tail19, align 8, !dbg !904, !tbaa !850
  %30 = load ptr, ptr %newarc.addr, align 8, !dbg !905, !tbaa !130
  %31 = load i64, ptr %pos, align 8, !dbg !906, !tbaa !143
  %div20 = sdiv i64 %31, 2, !dbg !907
  %sub21 = sub nsw i64 %div20, 1, !dbg !908
  %arrayidx22 = getelementptr inbounds %struct.arc, ptr %30, i64 %sub21, !dbg !905
  %head23 = getelementptr inbounds %struct.arc, ptr %arrayidx22, i32 0, i32 3, !dbg !909
  %32 = load ptr, ptr %head23, align 8, !dbg !909, !tbaa !856
  %33 = load ptr, ptr %newarc.addr, align 8, !dbg !910, !tbaa !130
  %34 = load i64, ptr %pos, align 8, !dbg !911, !tbaa !143
  %sub24 = sub nsw i64 %34, 1, !dbg !912
  %arrayidx25 = getelementptr inbounds %struct.arc, ptr %33, i64 %sub24, !dbg !910
  %head26 = getelementptr inbounds %struct.arc, ptr %arrayidx25, i32 0, i32 3, !dbg !913
  store ptr %32, ptr %head26, align 8, !dbg !914, !tbaa !856
  %35 = load ptr, ptr %newarc.addr, align 8, !dbg !915, !tbaa !130
  %36 = load i64, ptr %pos, align 8, !dbg !916, !tbaa !143
  %div27 = sdiv i64 %36, 2, !dbg !917
  %sub28 = sub nsw i64 %div27, 1, !dbg !918
  %arrayidx29 = getelementptr inbounds %struct.arc, ptr %35, i64 %sub28, !dbg !915
  %cost30 = getelementptr inbounds %struct.arc, ptr %arrayidx29, i32 0, i32 1, !dbg !919
  %37 = load i64, ptr %cost30, align 8, !dbg !919, !tbaa !868
  %38 = load ptr, ptr %newarc.addr, align 8, !dbg !920, !tbaa !130
  %39 = load i64, ptr %pos, align 8, !dbg !921, !tbaa !143
  %sub31 = sub nsw i64 %39, 1, !dbg !922
  %arrayidx32 = getelementptr inbounds %struct.arc, ptr %38, i64 %sub31, !dbg !920
  %cost33 = getelementptr inbounds %struct.arc, ptr %arrayidx32, i32 0, i32 1, !dbg !923
  store i64 %37, ptr %cost33, align 8, !dbg !924, !tbaa !868
  %40 = load ptr, ptr %newarc.addr, align 8, !dbg !925, !tbaa !130
  %41 = load i64, ptr %pos, align 8, !dbg !926, !tbaa !143
  %div34 = sdiv i64 %41, 2, !dbg !927
  %sub35 = sub nsw i64 %div34, 1, !dbg !928
  %arrayidx36 = getelementptr inbounds %struct.arc, ptr %40, i64 %sub35, !dbg !925
  %cost37 = getelementptr inbounds %struct.arc, ptr %arrayidx36, i32 0, i32 1, !dbg !929
  %42 = load i64, ptr %cost37, align 8, !dbg !929, !tbaa !868
  %43 = load ptr, ptr %newarc.addr, align 8, !dbg !930, !tbaa !130
  %44 = load i64, ptr %pos, align 8, !dbg !931, !tbaa !143
  %sub38 = sub nsw i64 %44, 1, !dbg !932
  %arrayidx39 = getelementptr inbounds %struct.arc, ptr %43, i64 %sub38, !dbg !930
  %org_cost40 = getelementptr inbounds %struct.arc, ptr %arrayidx39, i32 0, i32 8, !dbg !933
  store i64 %42, ptr %org_cost40, align 8, !dbg !934, !tbaa !862
  %45 = load ptr, ptr %newarc.addr, align 8, !dbg !935, !tbaa !130
  %46 = load i64, ptr %pos, align 8, !dbg !936, !tbaa !143
  %div41 = sdiv i64 %46, 2, !dbg !937
  %sub42 = sub nsw i64 %div41, 1, !dbg !938
  %arrayidx43 = getelementptr inbounds %struct.arc, ptr %45, i64 %sub42, !dbg !935
  %flow44 = getelementptr inbounds %struct.arc, ptr %arrayidx43, i32 0, i32 7, !dbg !939
  %47 = load i64, ptr %flow44, align 8, !dbg !939, !tbaa !480
  %48 = load ptr, ptr %newarc.addr, align 8, !dbg !940, !tbaa !130
  %49 = load i64, ptr %pos, align 8, !dbg !941, !tbaa !143
  %sub45 = sub nsw i64 %49, 1, !dbg !942
  %arrayidx46 = getelementptr inbounds %struct.arc, ptr %48, i64 %sub45, !dbg !940
  %flow47 = getelementptr inbounds %struct.arc, ptr %arrayidx46, i32 0, i32 7, !dbg !943
  store i64 %47, ptr %flow47, align 8, !dbg !944, !tbaa !480
  %50 = load ptr, ptr %newarc.addr, align 8, !dbg !945, !tbaa !130
  %51 = load i64, ptr %pos, align 8, !dbg !946, !tbaa !143
  %div48 = sdiv i64 %51, 2, !dbg !947
  %sub49 = sub nsw i64 %div48, 1, !dbg !948
  %arrayidx50 = getelementptr inbounds %struct.arc, ptr %50, i64 %sub49, !dbg !945
  %id51 = getelementptr inbounds %struct.arc, ptr %arrayidx50, i32 0, i32 0, !dbg !949
  %52 = load i32, ptr %id51, align 8, !dbg !949, !tbaa !172
  %53 = load ptr, ptr %newarc.addr, align 8, !dbg !950, !tbaa !130
  %54 = load i64, ptr %pos, align 8, !dbg !951, !tbaa !143
  %sub52 = sub nsw i64 %54, 1, !dbg !952
  %arrayidx53 = getelementptr inbounds %struct.arc, ptr %53, i64 %sub52, !dbg !950
  %id54 = getelementptr inbounds %struct.arc, ptr %arrayidx53, i32 0, i32 0, !dbg !953
  store i32 %52, ptr %id54, align 8, !dbg !954, !tbaa !172
  %55 = load i64, ptr %pos, align 8, !dbg !955, !tbaa !143
  %div55 = sdiv i64 %55, 2, !dbg !956
  store i64 %div55, ptr %pos, align 8, !dbg !957, !tbaa !143
  %56 = load ptr, ptr %tail.addr, align 8, !dbg !958, !tbaa !130
  %57 = load ptr, ptr %newarc.addr, align 8, !dbg !959, !tbaa !130
  %58 = load i64, ptr %pos, align 8, !dbg !960, !tbaa !143
  %sub56 = sub nsw i64 %58, 1, !dbg !961
  %arrayidx57 = getelementptr inbounds %struct.arc, ptr %57, i64 %sub56, !dbg !959
  %tail58 = getelementptr inbounds %struct.arc, ptr %arrayidx57, i32 0, i32 2, !dbg !962
  store ptr %56, ptr %tail58, align 8, !dbg !963, !tbaa !850
  %59 = load ptr, ptr %head.addr, align 8, !dbg !964, !tbaa !130
  %60 = load ptr, ptr %newarc.addr, align 8, !dbg !965, !tbaa !130
  %61 = load i64, ptr %pos, align 8, !dbg !966, !tbaa !143
  %sub59 = sub nsw i64 %61, 1, !dbg !967
  %arrayidx60 = getelementptr inbounds %struct.arc, ptr %60, i64 %sub59, !dbg !965
  %head61 = getelementptr inbounds %struct.arc, ptr %arrayidx60, i32 0, i32 3, !dbg !968
  store ptr %59, ptr %head61, align 8, !dbg !969, !tbaa !856
  %62 = load i64, ptr %cost.addr, align 8, !dbg !970, !tbaa !143
  %63 = load ptr, ptr %newarc.addr, align 8, !dbg !971, !tbaa !130
  %64 = load i64, ptr %pos, align 8, !dbg !972, !tbaa !143
  %sub62 = sub nsw i64 %64, 1, !dbg !973
  %arrayidx63 = getelementptr inbounds %struct.arc, ptr %63, i64 %sub62, !dbg !971
  %cost64 = getelementptr inbounds %struct.arc, ptr %arrayidx63, i32 0, i32 1, !dbg !974
  store i64 %62, ptr %cost64, align 8, !dbg !975, !tbaa !868
  %65 = load i64, ptr %cost.addr, align 8, !dbg !976, !tbaa !143
  %66 = load ptr, ptr %newarc.addr, align 8, !dbg !977, !tbaa !130
  %67 = load i64, ptr %pos, align 8, !dbg !978, !tbaa !143
  %sub65 = sub nsw i64 %67, 1, !dbg !979
  %arrayidx66 = getelementptr inbounds %struct.arc, ptr %66, i64 %sub65, !dbg !977
  %org_cost67 = getelementptr inbounds %struct.arc, ptr %arrayidx66, i32 0, i32 8, !dbg !980
  store i64 %65, ptr %org_cost67, align 8, !dbg !981, !tbaa !862
  %68 = load i64, ptr %red_cost.addr, align 8, !dbg !982, !tbaa !143
  %69 = load ptr, ptr %newarc.addr, align 8, !dbg !983, !tbaa !130
  %70 = load i64, ptr %pos, align 8, !dbg !984, !tbaa !143
  %sub68 = sub nsw i64 %70, 1, !dbg !985
  %arrayidx69 = getelementptr inbounds %struct.arc, ptr %69, i64 %sub68, !dbg !983
  %flow70 = getelementptr inbounds %struct.arc, ptr %arrayidx69, i32 0, i32 7, !dbg !986
  store i64 %68, ptr %flow70, align 8, !dbg !987, !tbaa !480
  %71 = load i64, ptr %number.addr, align 8, !dbg !988, !tbaa !143
  %conv71 = trunc i64 %71 to i32, !dbg !988
  %72 = load ptr, ptr %newarc.addr, align 8, !dbg !989, !tbaa !130
  %73 = load i64, ptr %pos, align 8, !dbg !990, !tbaa !143
  %sub72 = sub nsw i64 %73, 1, !dbg !991
  %arrayidx73 = getelementptr inbounds %struct.arc, ptr %72, i64 %sub72, !dbg !989
  %id74 = getelementptr inbounds %struct.arc, ptr %arrayidx73, i32 0, i32 0, !dbg !992
  store i32 %conv71, ptr %id74, align 8, !dbg !993, !tbaa !172
  br label %while.cond, !dbg !882, !llvm.loop !994

while.end:                                        ; preds = %land.end
  call void @llvm.lifetime.end.p0(i64 8, ptr %pos) #9, !dbg !996
  ret void, !dbg !996
}

; Function Attrs: minsize nounwind optsize uwtable
define dso_local void @replace_weaker_arc(ptr noundef %newarc, ptr noundef %tail, ptr noundef %head, i64 noundef %cost, i64 noundef %red_cost, i64 noundef %max_new_par_residual_new_arcs, i64 noundef %number) #0 !dbg !997 {
entry:
  %newarc.addr = alloca ptr, align 8
  %tail.addr = alloca ptr, align 8
  %head.addr = alloca ptr, align 8
  %cost.addr = alloca i64, align 8
  %red_cost.addr = alloca i64, align 8
  %max_new_par_residual_new_arcs.addr = alloca i64, align 8
  %number.addr = alloca i64, align 8
  %pos = alloca i64, align 8
  %cmp = alloca i64, align 8
  store ptr %newarc, ptr %newarc.addr, align 8, !tbaa !130
  call void @llvm.dbg.declare(metadata ptr %newarc.addr, metadata !1001, metadata !DIExpression()), !dbg !1010
  store ptr %tail, ptr %tail.addr, align 8, !tbaa !130
  call void @llvm.dbg.declare(metadata ptr %tail.addr, metadata !1002, metadata !DIExpression()), !dbg !1011
  store ptr %head, ptr %head.addr, align 8, !tbaa !130
  call void @llvm.dbg.declare(metadata ptr %head.addr, metadata !1003, metadata !DIExpression()), !dbg !1012
  store i64 %cost, ptr %cost.addr, align 8, !tbaa !143
  call void @llvm.dbg.declare(metadata ptr %cost.addr, metadata !1004, metadata !DIExpression()), !dbg !1013
  store i64 %red_cost, ptr %red_cost.addr, align 8, !tbaa !143
  call void @llvm.dbg.declare(metadata ptr %red_cost.addr, metadata !1005, metadata !DIExpression()), !dbg !1014
  store i64 %max_new_par_residual_new_arcs, ptr %max_new_par_residual_new_arcs.addr, align 8, !tbaa !143
  call void @llvm.dbg.declare(metadata ptr %max_new_par_residual_new_arcs.addr, metadata !1006, metadata !DIExpression()), !dbg !1015
  store i64 %number, ptr %number.addr, align 8, !tbaa !143
  call void @llvm.dbg.declare(metadata ptr %number.addr, metadata !1007, metadata !DIExpression()), !dbg !1016
  call void @llvm.lifetime.start.p0(i64 8, ptr %pos) #9, !dbg !1017
  call void @llvm.dbg.declare(metadata ptr %pos, metadata !1008, metadata !DIExpression()), !dbg !1018
  call void @llvm.lifetime.start.p0(i64 8, ptr %cmp) #9, !dbg !1019
  call void @llvm.dbg.declare(metadata ptr %cmp, metadata !1009, metadata !DIExpression()), !dbg !1020
  %0 = load ptr, ptr %tail.addr, align 8, !dbg !1021, !tbaa !130
  %1 = load ptr, ptr %newarc.addr, align 8, !dbg !1022, !tbaa !130
  %arrayidx = getelementptr inbounds %struct.arc, ptr %1, i64 0, !dbg !1022
  %tail1 = getelementptr inbounds %struct.arc, ptr %arrayidx, i32 0, i32 2, !dbg !1023
  store ptr %0, ptr %tail1, align 8, !dbg !1024, !tbaa !850
  %2 = load ptr, ptr %head.addr, align 8, !dbg !1025, !tbaa !130
  %3 = load ptr, ptr %newarc.addr, align 8, !dbg !1026, !tbaa !130
  %arrayidx2 = getelementptr inbounds %struct.arc, ptr %3, i64 0, !dbg !1026
  %head3 = getelementptr inbounds %struct.arc, ptr %arrayidx2, i32 0, i32 3, !dbg !1027
  store ptr %2, ptr %head3, align 8, !dbg !1028, !tbaa !856
  %4 = load i64, ptr %cost.addr, align 8, !dbg !1029, !tbaa !143
  %5 = load ptr, ptr %newarc.addr, align 8, !dbg !1030, !tbaa !130
  %arrayidx4 = getelementptr inbounds %struct.arc, ptr %5, i64 0, !dbg !1030
  %org_cost = getelementptr inbounds %struct.arc, ptr %arrayidx4, i32 0, i32 8, !dbg !1031
  store i64 %4, ptr %org_cost, align 8, !dbg !1032, !tbaa !862
  %6 = load i64, ptr %cost.addr, align 8, !dbg !1033, !tbaa !143
  %7 = load ptr, ptr %newarc.addr, align 8, !dbg !1034, !tbaa !130
  %arrayidx5 = getelementptr inbounds %struct.arc, ptr %7, i64 0, !dbg !1034
  %cost6 = getelementptr inbounds %struct.arc, ptr %arrayidx5, i32 0, i32 1, !dbg !1035
  store i64 %6, ptr %cost6, align 8, !dbg !1036, !tbaa !868
  %8 = load i64, ptr %red_cost.addr, align 8, !dbg !1037, !tbaa !143
  %9 = load ptr, ptr %newarc.addr, align 8, !dbg !1038, !tbaa !130
  %arrayidx7 = getelementptr inbounds %struct.arc, ptr %9, i64 0, !dbg !1038
  %flow = getelementptr inbounds %struct.arc, ptr %arrayidx7, i32 0, i32 7, !dbg !1039
  store i64 %8, ptr %flow, align 8, !dbg !1040, !tbaa !480
  %10 = load i64, ptr %number.addr, align 8, !dbg !1041, !tbaa !143
  %conv = trunc i64 %10 to i32, !dbg !1041
  %11 = load ptr, ptr %newarc.addr, align 8, !dbg !1042, !tbaa !130
  %arrayidx8 = getelementptr inbounds %struct.arc, ptr %11, i64 0, !dbg !1042
  %id = getelementptr inbounds %struct.arc, ptr %arrayidx8, i32 0, i32 0, !dbg !1043
  store i32 %conv, ptr %id, align 8, !dbg !1044, !tbaa !172
  store i64 1, ptr %pos, align 8, !dbg !1045, !tbaa !143
  %12 = load ptr, ptr %newarc.addr, align 8, !dbg !1046, !tbaa !130
  %arrayidx9 = getelementptr inbounds %struct.arc, ptr %12, i64 1, !dbg !1046
  %flow10 = getelementptr inbounds %struct.arc, ptr %arrayidx9, i32 0, i32 7, !dbg !1047
  %13 = load i64, ptr %flow10, align 8, !dbg !1047, !tbaa !480
  %14 = load ptr, ptr %newarc.addr, align 8, !dbg !1048, !tbaa !130
  %arrayidx11 = getelementptr inbounds %struct.arc, ptr %14, i64 2, !dbg !1048
  %flow12 = getelementptr inbounds %struct.arc, ptr %arrayidx11, i32 0, i32 7, !dbg !1049
  %15 = load i64, ptr %flow12, align 8, !dbg !1049, !tbaa !480
  %cmp13 = icmp sgt i64 %13, %15, !dbg !1050
  %16 = zext i1 %cmp13 to i64, !dbg !1051
  %cond = select i1 %cmp13, i32 2, i32 3, !dbg !1051
  %conv15 = sext i32 %cond to i64, !dbg !1051
  store i64 %conv15, ptr %cmp, align 8, !dbg !1052, !tbaa !143
  br label %while.cond, !dbg !1053

while.cond:                                       ; preds = %if.end87, %entry
  %17 = load i64, ptr %cmp, align 8, !dbg !1054, !tbaa !143
  %18 = load i64, ptr %max_new_par_residual_new_arcs.addr, align 8, !dbg !1055, !tbaa !143
  %cmp16 = icmp sle i64 %17, %18, !dbg !1056
  br i1 %cmp16, label %land.rhs, label %land.end, !dbg !1057

land.rhs:                                         ; preds = %while.cond
  %19 = load i64, ptr %red_cost.addr, align 8, !dbg !1058, !tbaa !143
  %20 = load ptr, ptr %newarc.addr, align 8, !dbg !1059, !tbaa !130
  %21 = load i64, ptr %cmp, align 8, !dbg !1060, !tbaa !143
  %sub = sub nsw i64 %21, 1, !dbg !1061
  %arrayidx18 = getelementptr inbounds %struct.arc, ptr %20, i64 %sub, !dbg !1059
  %flow19 = getelementptr inbounds %struct.arc, ptr %arrayidx18, i32 0, i32 7, !dbg !1062
  %22 = load i64, ptr %flow19, align 8, !dbg !1062, !tbaa !480
  %cmp20 = icmp slt i64 %19, %22, !dbg !1063
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %23 = phi i1 [ false, %while.cond ], [ %cmp20, %land.rhs ], !dbg !1064
  br i1 %23, label %while.body, label %while.end, !dbg !1053

while.body:                                       ; preds = %land.end
  %24 = load ptr, ptr %newarc.addr, align 8, !dbg !1065, !tbaa !130
  %25 = load i64, ptr %cmp, align 8, !dbg !1067, !tbaa !143
  %sub22 = sub nsw i64 %25, 1, !dbg !1068
  %arrayidx23 = getelementptr inbounds %struct.arc, ptr %24, i64 %sub22, !dbg !1065
  %tail24 = getelementptr inbounds %struct.arc, ptr %arrayidx23, i32 0, i32 2, !dbg !1069
  %26 = load ptr, ptr %tail24, align 8, !dbg !1069, !tbaa !850
  %27 = load ptr, ptr %newarc.addr, align 8, !dbg !1070, !tbaa !130
  %28 = load i64, ptr %pos, align 8, !dbg !1071, !tbaa !143
  %sub25 = sub nsw i64 %28, 1, !dbg !1072
  %arrayidx26 = getelementptr inbounds %struct.arc, ptr %27, i64 %sub25, !dbg !1070
  %tail27 = getelementptr inbounds %struct.arc, ptr %arrayidx26, i32 0, i32 2, !dbg !1073
  store ptr %26, ptr %tail27, align 8, !dbg !1074, !tbaa !850
  %29 = load ptr, ptr %newarc.addr, align 8, !dbg !1075, !tbaa !130
  %30 = load i64, ptr %cmp, align 8, !dbg !1076, !tbaa !143
  %sub28 = sub nsw i64 %30, 1, !dbg !1077
  %arrayidx29 = getelementptr inbounds %struct.arc, ptr %29, i64 %sub28, !dbg !1075
  %head30 = getelementptr inbounds %struct.arc, ptr %arrayidx29, i32 0, i32 3, !dbg !1078
  %31 = load ptr, ptr %head30, align 8, !dbg !1078, !tbaa !856
  %32 = load ptr, ptr %newarc.addr, align 8, !dbg !1079, !tbaa !130
  %33 = load i64, ptr %pos, align 8, !dbg !1080, !tbaa !143
  %sub31 = sub nsw i64 %33, 1, !dbg !1081
  %arrayidx32 = getelementptr inbounds %struct.arc, ptr %32, i64 %sub31, !dbg !1079
  %head33 = getelementptr inbounds %struct.arc, ptr %arrayidx32, i32 0, i32 3, !dbg !1082
  store ptr %31, ptr %head33, align 8, !dbg !1083, !tbaa !856
  %34 = load ptr, ptr %newarc.addr, align 8, !dbg !1084, !tbaa !130
  %35 = load i64, ptr %cmp, align 8, !dbg !1085, !tbaa !143
  %sub34 = sub nsw i64 %35, 1, !dbg !1086
  %arrayidx35 = getelementptr inbounds %struct.arc, ptr %34, i64 %sub34, !dbg !1084
  %cost36 = getelementptr inbounds %struct.arc, ptr %arrayidx35, i32 0, i32 1, !dbg !1087
  %36 = load i64, ptr %cost36, align 8, !dbg !1087, !tbaa !868
  %37 = load ptr, ptr %newarc.addr, align 8, !dbg !1088, !tbaa !130
  %38 = load i64, ptr %pos, align 8, !dbg !1089, !tbaa !143
  %sub37 = sub nsw i64 %38, 1, !dbg !1090
  %arrayidx38 = getelementptr inbounds %struct.arc, ptr %37, i64 %sub37, !dbg !1088
  %cost39 = getelementptr inbounds %struct.arc, ptr %arrayidx38, i32 0, i32 1, !dbg !1091
  store i64 %36, ptr %cost39, align 8, !dbg !1092, !tbaa !868
  %39 = load ptr, ptr %newarc.addr, align 8, !dbg !1093, !tbaa !130
  %40 = load i64, ptr %cmp, align 8, !dbg !1094, !tbaa !143
  %sub40 = sub nsw i64 %40, 1, !dbg !1095
  %arrayidx41 = getelementptr inbounds %struct.arc, ptr %39, i64 %sub40, !dbg !1093
  %cost42 = getelementptr inbounds %struct.arc, ptr %arrayidx41, i32 0, i32 1, !dbg !1096
  %41 = load i64, ptr %cost42, align 8, !dbg !1096, !tbaa !868
  %42 = load ptr, ptr %newarc.addr, align 8, !dbg !1097, !tbaa !130
  %43 = load i64, ptr %pos, align 8, !dbg !1098, !tbaa !143
  %sub43 = sub nsw i64 %43, 1, !dbg !1099
  %arrayidx44 = getelementptr inbounds %struct.arc, ptr %42, i64 %sub43, !dbg !1097
  %org_cost45 = getelementptr inbounds %struct.arc, ptr %arrayidx44, i32 0, i32 8, !dbg !1100
  store i64 %41, ptr %org_cost45, align 8, !dbg !1101, !tbaa !862
  %44 = load ptr, ptr %newarc.addr, align 8, !dbg !1102, !tbaa !130
  %45 = load i64, ptr %cmp, align 8, !dbg !1103, !tbaa !143
  %sub46 = sub nsw i64 %45, 1, !dbg !1104
  %arrayidx47 = getelementptr inbounds %struct.arc, ptr %44, i64 %sub46, !dbg !1102
  %flow48 = getelementptr inbounds %struct.arc, ptr %arrayidx47, i32 0, i32 7, !dbg !1105
  %46 = load i64, ptr %flow48, align 8, !dbg !1105, !tbaa !480
  %47 = load ptr, ptr %newarc.addr, align 8, !dbg !1106, !tbaa !130
  %48 = load i64, ptr %pos, align 8, !dbg !1107, !tbaa !143
  %sub49 = sub nsw i64 %48, 1, !dbg !1108
  %arrayidx50 = getelementptr inbounds %struct.arc, ptr %47, i64 %sub49, !dbg !1106
  %flow51 = getelementptr inbounds %struct.arc, ptr %arrayidx50, i32 0, i32 7, !dbg !1109
  store i64 %46, ptr %flow51, align 8, !dbg !1110, !tbaa !480
  %49 = load ptr, ptr %newarc.addr, align 8, !dbg !1111, !tbaa !130
  %50 = load i64, ptr %cmp, align 8, !dbg !1112, !tbaa !143
  %sub52 = sub nsw i64 %50, 1, !dbg !1113
  %arrayidx53 = getelementptr inbounds %struct.arc, ptr %49, i64 %sub52, !dbg !1111
  %id54 = getelementptr inbounds %struct.arc, ptr %arrayidx53, i32 0, i32 0, !dbg !1114
  %51 = load i32, ptr %id54, align 8, !dbg !1114, !tbaa !172
  %52 = load ptr, ptr %newarc.addr, align 8, !dbg !1115, !tbaa !130
  %53 = load i64, ptr %pos, align 8, !dbg !1116, !tbaa !143
  %sub55 = sub nsw i64 %53, 1, !dbg !1117
  %arrayidx56 = getelementptr inbounds %struct.arc, ptr %52, i64 %sub55, !dbg !1115
  %id57 = getelementptr inbounds %struct.arc, ptr %arrayidx56, i32 0, i32 0, !dbg !1118
  store i32 %51, ptr %id57, align 8, !dbg !1119, !tbaa !172
  %54 = load ptr, ptr %tail.addr, align 8, !dbg !1120, !tbaa !130
  %55 = load ptr, ptr %newarc.addr, align 8, !dbg !1121, !tbaa !130
  %56 = load i64, ptr %cmp, align 8, !dbg !1122, !tbaa !143
  %sub58 = sub nsw i64 %56, 1, !dbg !1123
  %arrayidx59 = getelementptr inbounds %struct.arc, ptr %55, i64 %sub58, !dbg !1121
  %tail60 = getelementptr inbounds %struct.arc, ptr %arrayidx59, i32 0, i32 2, !dbg !1124
  store ptr %54, ptr %tail60, align 8, !dbg !1125, !tbaa !850
  %57 = load ptr, ptr %head.addr, align 8, !dbg !1126, !tbaa !130
  %58 = load ptr, ptr %newarc.addr, align 8, !dbg !1127, !tbaa !130
  %59 = load i64, ptr %cmp, align 8, !dbg !1128, !tbaa !143
  %sub61 = sub nsw i64 %59, 1, !dbg !1129
  %arrayidx62 = getelementptr inbounds %struct.arc, ptr %58, i64 %sub61, !dbg !1127
  %head63 = getelementptr inbounds %struct.arc, ptr %arrayidx62, i32 0, i32 3, !dbg !1130
  store ptr %57, ptr %head63, align 8, !dbg !1131, !tbaa !856
  %60 = load i64, ptr %cost.addr, align 8, !dbg !1132, !tbaa !143
  %61 = load ptr, ptr %newarc.addr, align 8, !dbg !1133, !tbaa !130
  %62 = load i64, ptr %cmp, align 8, !dbg !1134, !tbaa !143
  %sub64 = sub nsw i64 %62, 1, !dbg !1135
  %arrayidx65 = getelementptr inbounds %struct.arc, ptr %61, i64 %sub64, !dbg !1133
  %cost66 = getelementptr inbounds %struct.arc, ptr %arrayidx65, i32 0, i32 1, !dbg !1136
  store i64 %60, ptr %cost66, align 8, !dbg !1137, !tbaa !868
  %63 = load i64, ptr %cost.addr, align 8, !dbg !1138, !tbaa !143
  %64 = load ptr, ptr %newarc.addr, align 8, !dbg !1139, !tbaa !130
  %65 = load i64, ptr %cmp, align 8, !dbg !1140, !tbaa !143
  %sub67 = sub nsw i64 %65, 1, !dbg !1141
  %arrayidx68 = getelementptr inbounds %struct.arc, ptr %64, i64 %sub67, !dbg !1139
  %org_cost69 = getelementptr inbounds %struct.arc, ptr %arrayidx68, i32 0, i32 8, !dbg !1142
  store i64 %63, ptr %org_cost69, align 8, !dbg !1143, !tbaa !862
  %66 = load i64, ptr %red_cost.addr, align 8, !dbg !1144, !tbaa !143
  %67 = load ptr, ptr %newarc.addr, align 8, !dbg !1145, !tbaa !130
  %68 = load i64, ptr %cmp, align 8, !dbg !1146, !tbaa !143
  %sub70 = sub nsw i64 %68, 1, !dbg !1147
  %arrayidx71 = getelementptr inbounds %struct.arc, ptr %67, i64 %sub70, !dbg !1145
  %flow72 = getelementptr inbounds %struct.arc, ptr %arrayidx71, i32 0, i32 7, !dbg !1148
  store i64 %66, ptr %flow72, align 8, !dbg !1149, !tbaa !480
  %69 = load i64, ptr %number.addr, align 8, !dbg !1150, !tbaa !143
  %conv73 = trunc i64 %69 to i32, !dbg !1150
  %70 = load ptr, ptr %newarc.addr, align 8, !dbg !1151, !tbaa !130
  %71 = load i64, ptr %cmp, align 8, !dbg !1152, !tbaa !143
  %sub74 = sub nsw i64 %71, 1, !dbg !1153
  %arrayidx75 = getelementptr inbounds %struct.arc, ptr %70, i64 %sub74, !dbg !1151
  %id76 = getelementptr inbounds %struct.arc, ptr %arrayidx75, i32 0, i32 0, !dbg !1154
  store i32 %conv73, ptr %id76, align 8, !dbg !1155, !tbaa !172
  %72 = load i64, ptr %cmp, align 8, !dbg !1156, !tbaa !143
  store i64 %72, ptr %pos, align 8, !dbg !1157, !tbaa !143
  %73 = load i64, ptr %cmp, align 8, !dbg !1158, !tbaa !143
  %mul = mul nsw i64 %73, 2, !dbg !1158
  store i64 %mul, ptr %cmp, align 8, !dbg !1158, !tbaa !143
  %74 = load i64, ptr %cmp, align 8, !dbg !1159, !tbaa !143
  %add = add nsw i64 %74, 1, !dbg !1161
  %75 = load i64, ptr %max_new_par_residual_new_arcs.addr, align 8, !dbg !1162, !tbaa !143
  %cmp77 = icmp sle i64 %add, %75, !dbg !1163
  br i1 %cmp77, label %if.then, label %if.end87, !dbg !1164

if.then:                                          ; preds = %while.body
  %76 = load ptr, ptr %newarc.addr, align 8, !dbg !1165, !tbaa !130
  %77 = load i64, ptr %cmp, align 8, !dbg !1167, !tbaa !143
  %sub79 = sub nsw i64 %77, 1, !dbg !1168
  %arrayidx80 = getelementptr inbounds %struct.arc, ptr %76, i64 %sub79, !dbg !1165
  %flow81 = getelementptr inbounds %struct.arc, ptr %arrayidx80, i32 0, i32 7, !dbg !1169
  %78 = load i64, ptr %flow81, align 8, !dbg !1169, !tbaa !480
  %79 = load ptr, ptr %newarc.addr, align 8, !dbg !1170, !tbaa !130
  %80 = load i64, ptr %cmp, align 8, !dbg !1171, !tbaa !143
  %arrayidx82 = getelementptr inbounds %struct.arc, ptr %79, i64 %80, !dbg !1170
  %flow83 = getelementptr inbounds %struct.arc, ptr %arrayidx82, i32 0, i32 7, !dbg !1172
  %81 = load i64, ptr %flow83, align 8, !dbg !1172, !tbaa !480
  %cmp84 = icmp slt i64 %78, %81, !dbg !1173
  br i1 %cmp84, label %if.then86, label %if.end, !dbg !1174

if.then86:                                        ; preds = %if.then
  %82 = load i64, ptr %cmp, align 8, !dbg !1175, !tbaa !143
  %inc = add nsw i64 %82, 1, !dbg !1175
  store i64 %inc, ptr %cmp, align 8, !dbg !1175, !tbaa !143
  br label %if.end, !dbg !1176

if.end:                                           ; preds = %if.then86, %if.then
  br label %if.end87, !dbg !1172

if.end87:                                         ; preds = %if.end, %while.body
  br label %while.cond, !dbg !1053, !llvm.loop !1177

while.end:                                        ; preds = %land.end
  call void @llvm.lifetime.end.p0(i64 8, ptr %cmp) #9, !dbg !1179
  call void @llvm.lifetime.end.p0(i64 8, ptr %pos) #9, !dbg !1179
  ret void, !dbg !1179
}

; Function Attrs: minsize nounwind optsize uwtable
define dso_local void @calculate_max_redcost(ptr noundef %net, ptr noundef %max_redcost, ptr noundef %arcs_pointer_sorted, i64 noundef %num_threads) #0 !dbg !1180 {
entry:
  %net.addr = alloca ptr, align 8
  %max_redcost.addr = alloca ptr, align 8
  %arcs_pointer_sorted.addr = alloca ptr, align 8
  %num_threads.addr = alloca i64, align 8
  %i = alloca i64, align 8
  store ptr %net, ptr %net.addr, align 8, !tbaa !130
  call void @llvm.dbg.declare(metadata ptr %net.addr, metadata !1185, metadata !DIExpression()), !dbg !1190
  store ptr %max_redcost, ptr %max_redcost.addr, align 8, !tbaa !130
  call void @llvm.dbg.declare(metadata ptr %max_redcost.addr, metadata !1186, metadata !DIExpression()), !dbg !1191
  store ptr %arcs_pointer_sorted, ptr %arcs_pointer_sorted.addr, align 8, !tbaa !130
  call void @llvm.dbg.declare(metadata ptr %arcs_pointer_sorted.addr, metadata !1187, metadata !DIExpression()), !dbg !1192
  store i64 %num_threads, ptr %num_threads.addr, align 8, !tbaa !143
  call void @llvm.dbg.declare(metadata ptr %num_threads.addr, metadata !1188, metadata !DIExpression()), !dbg !1193
  call void @llvm.lifetime.start.p0(i64 8, ptr %i) #9, !dbg !1194
  call void @llvm.dbg.declare(metadata ptr %i, metadata !1189, metadata !DIExpression()), !dbg !1195
  %0 = load ptr, ptr %max_redcost.addr, align 8, !dbg !1196, !tbaa !130
  store i64 0, ptr %0, align 8, !dbg !1197, !tbaa !143
  store i64 0, ptr %i, align 8, !dbg !1198, !tbaa !143
  br label %for.cond, !dbg !1200

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i64, ptr %i, align 8, !dbg !1201, !tbaa !143
  %2 = load i64, ptr %num_threads.addr, align 8, !dbg !1203, !tbaa !143
  %cmp = icmp slt i64 %1, %2, !dbg !1204
  br i1 %cmp, label %for.body, label %for.end, !dbg !1205

for.body:                                         ; preds = %for.cond
  %3 = load ptr, ptr %arcs_pointer_sorted.addr, align 8, !dbg !1206, !tbaa !130
  %4 = load i64, ptr %i, align 8, !dbg !1209, !tbaa !143
  %arrayidx = getelementptr inbounds ptr, ptr %3, i64 %4, !dbg !1206
  %5 = load ptr, ptr %arrayidx, align 8, !dbg !1206, !tbaa !130
  %arrayidx1 = getelementptr inbounds ptr, ptr %5, i64 0, !dbg !1206
  %6 = load ptr, ptr %arrayidx1, align 8, !dbg !1206, !tbaa !130
  %flow = getelementptr inbounds %struct.arc, ptr %6, i32 0, i32 7, !dbg !1210
  %7 = load i64, ptr %flow, align 8, !dbg !1210, !tbaa !480
  %8 = load ptr, ptr %max_redcost.addr, align 8, !dbg !1211, !tbaa !130
  %9 = load i64, ptr %8, align 8, !dbg !1212, !tbaa !143
  %cmp2 = icmp sgt i64 %7, %9, !dbg !1213
  br i1 %cmp2, label %if.then, label %if.end, !dbg !1214

if.then:                                          ; preds = %for.body
  %10 = load ptr, ptr %arcs_pointer_sorted.addr, align 8, !dbg !1215, !tbaa !130
  %11 = load i64, ptr %i, align 8, !dbg !1216, !tbaa !143
  %arrayidx3 = getelementptr inbounds ptr, ptr %10, i64 %11, !dbg !1215
  %12 = load ptr, ptr %arrayidx3, align 8, !dbg !1215, !tbaa !130
  %arrayidx4 = getelementptr inbounds ptr, ptr %12, i64 0, !dbg !1215
  %13 = load ptr, ptr %arrayidx4, align 8, !dbg !1215, !tbaa !130
  %flow5 = getelementptr inbounds %struct.arc, ptr %13, i32 0, i32 7, !dbg !1217
  %14 = load i64, ptr %flow5, align 8, !dbg !1217, !tbaa !480
  %15 = load ptr, ptr %max_redcost.addr, align 8, !dbg !1218, !tbaa !130
  store i64 %14, ptr %15, align 8, !dbg !1219, !tbaa !143
  br label %if.end, !dbg !1220

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc, !dbg !1221

for.inc:                                          ; preds = %if.end
  %16 = load i64, ptr %i, align 8, !dbg !1222, !tbaa !143
  %inc = add nsw i64 %16, 1, !dbg !1222
  store i64 %inc, ptr %i, align 8, !dbg !1222, !tbaa !143
  br label %for.cond, !dbg !1223, !llvm.loop !1224

for.end:                                          ; preds = %for.cond
  call void @llvm.lifetime.end.p0(i64 8, ptr %i) #9, !dbg !1226
  ret void, !dbg !1226
}

; Function Attrs: minsize nounwind optsize uwtable
define dso_local i64 @switch_arcs(ptr noundef %net, ptr noundef %num_del_arcs, ptr noundef %deleted_arcs, ptr noundef %arcnew, i32 noundef %thread, i64 noundef %max_new_par_residual_new_arcs, i64 noundef %size_del, i64 noundef %num_threads) #0 !dbg !1227 {
entry:
  %net.addr = alloca ptr, align 8
  %num_del_arcs.addr = alloca ptr, align 8
  %deleted_arcs.addr = alloca ptr, align 8
  %arcnew.addr = alloca ptr, align 8
  %thread.addr = alloca i32, align 4
  %max_new_par_residual_new_arcs.addr = alloca i64, align 8
  %size_del.addr = alloca i64, align 8
  %num_threads.addr = alloca i64, align 8
  %i = alloca i64, align 8
  %j = alloca i64, align 8
  %h = alloca i64, align 8
  %number_of_arcs = alloca i64, align 8
  %count = alloca i64, align 8
  %test_arc = alloca ptr, align 8
  %copy = alloca %struct.arc, align 8
  store ptr %net, ptr %net.addr, align 8, !tbaa !130
  call void @llvm.dbg.declare(metadata ptr %net.addr, metadata !1231, metadata !DIExpression()), !dbg !1246
  store ptr %num_del_arcs, ptr %num_del_arcs.addr, align 8, !tbaa !130
  call void @llvm.dbg.declare(metadata ptr %num_del_arcs.addr, metadata !1232, metadata !DIExpression()), !dbg !1247
  store ptr %deleted_arcs, ptr %deleted_arcs.addr, align 8, !tbaa !130
  call void @llvm.dbg.declare(metadata ptr %deleted_arcs.addr, metadata !1233, metadata !DIExpression()), !dbg !1248
  store ptr %arcnew, ptr %arcnew.addr, align 8, !tbaa !130
  call void @llvm.dbg.declare(metadata ptr %arcnew.addr, metadata !1234, metadata !DIExpression()), !dbg !1249
  store i32 %thread, ptr %thread.addr, align 4, !tbaa !291
  call void @llvm.dbg.declare(metadata ptr %thread.addr, metadata !1235, metadata !DIExpression()), !dbg !1250
  store i64 %max_new_par_residual_new_arcs, ptr %max_new_par_residual_new_arcs.addr, align 8, !tbaa !143
  call void @llvm.dbg.declare(metadata ptr %max_new_par_residual_new_arcs.addr, metadata !1236, metadata !DIExpression()), !dbg !1251
  store i64 %size_del, ptr %size_del.addr, align 8, !tbaa !143
  call void @llvm.dbg.declare(metadata ptr %size_del.addr, metadata !1237, metadata !DIExpression()), !dbg !1252
  store i64 %num_threads, ptr %num_threads.addr, align 8, !tbaa !143
  call void @llvm.dbg.declare(metadata ptr %num_threads.addr, metadata !1238, metadata !DIExpression()), !dbg !1253
  call void @llvm.lifetime.start.p0(i64 8, ptr %i) #9, !dbg !1254
  call void @llvm.dbg.declare(metadata ptr %i, metadata !1239, metadata !DIExpression()), !dbg !1255
  call void @llvm.lifetime.start.p0(i64 8, ptr %j) #9, !dbg !1254
  call void @llvm.dbg.declare(metadata ptr %j, metadata !1240, metadata !DIExpression()), !dbg !1256
  call void @llvm.lifetime.start.p0(i64 8, ptr %h) #9, !dbg !1254
  call void @llvm.dbg.declare(metadata ptr %h, metadata !1241, metadata !DIExpression()), !dbg !1257
  call void @llvm.lifetime.start.p0(i64 8, ptr %number_of_arcs) #9, !dbg !1254
  call void @llvm.dbg.declare(metadata ptr %number_of_arcs, metadata !1242, metadata !DIExpression()), !dbg !1258
  call void @llvm.lifetime.start.p0(i64 8, ptr %count) #9, !dbg !1254
  call void @llvm.dbg.declare(metadata ptr %count, metadata !1243, metadata !DIExpression()), !dbg !1259
  store i64 0, ptr %count, align 8, !dbg !1259, !tbaa !143
  call void @llvm.lifetime.start.p0(i64 8, ptr %test_arc) #9, !dbg !1260
  call void @llvm.dbg.declare(metadata ptr %test_arc, metadata !1244, metadata !DIExpression()), !dbg !1261
  call void @llvm.lifetime.start.p0(i64 72, ptr %copy) #9, !dbg !1260
  call void @llvm.dbg.declare(metadata ptr %copy, metadata !1245, metadata !DIExpression()), !dbg !1262
  store i64 0, ptr %i, align 8, !dbg !1263, !tbaa !143
  %0 = load i32, ptr %thread.addr, align 4, !dbg !1265, !tbaa !291
  %conv = sext i32 %0 to i64, !dbg !1265
  store i64 %conv, ptr %j, align 8, !dbg !1266, !tbaa !143
  br label %for.cond, !dbg !1267

for.cond:                                         ; preds = %for.inc30, %entry
  %1 = load i64, ptr %i, align 8, !dbg !1268, !tbaa !143
  %2 = load i64, ptr %num_threads.addr, align 8, !dbg !1270, !tbaa !143
  %cmp = icmp slt i64 %1, %2, !dbg !1271
  br i1 %cmp, label %for.body, label %for.end32, !dbg !1272

for.body:                                         ; preds = %for.cond
  %3 = load ptr, ptr %num_del_arcs.addr, align 8, !dbg !1273, !tbaa !130
  %4 = load i64, ptr %j, align 8, !dbg !1275, !tbaa !143
  %arrayidx = getelementptr inbounds i64, ptr %3, i64 %4, !dbg !1273
  %5 = load i64, ptr %arrayidx, align 8, !dbg !1273, !tbaa !143
  %6 = load i64, ptr %size_del.addr, align 8, !dbg !1276, !tbaa !143
  %cmp2 = icmp slt i64 %5, %6, !dbg !1277
  br i1 %cmp2, label %cond.true, label %cond.false, !dbg !1278

cond.true:                                        ; preds = %for.body
  %7 = load ptr, ptr %num_del_arcs.addr, align 8, !dbg !1279, !tbaa !130
  %8 = load i64, ptr %j, align 8, !dbg !1280, !tbaa !143
  %arrayidx4 = getelementptr inbounds i64, ptr %7, i64 %8, !dbg !1279
  %9 = load i64, ptr %arrayidx4, align 8, !dbg !1279, !tbaa !143
  br label %cond.end, !dbg !1278

cond.false:                                       ; preds = %for.body
  %10 = load i64, ptr %size_del.addr, align 8, !dbg !1281, !tbaa !143
  br label %cond.end, !dbg !1278

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %9, %cond.true ], [ %10, %cond.false ], !dbg !1278
  store i64 %cond, ptr %number_of_arcs, align 8, !dbg !1282, !tbaa !143
  store i64 0, ptr %h, align 8, !dbg !1283, !tbaa !143
  br label %for.cond5, !dbg !1285

for.cond5:                                        ; preds = %for.inc, %cond.end
  %11 = load i64, ptr %h, align 8, !dbg !1286, !tbaa !143
  %12 = load i64, ptr %number_of_arcs, align 8, !dbg !1288, !tbaa !143
  %cmp6 = icmp slt i64 %11, %12, !dbg !1289
  br i1 %cmp6, label %for.body8, label %for.end, !dbg !1290

for.body8:                                        ; preds = %for.cond5
  %13 = load ptr, ptr %deleted_arcs.addr, align 8, !dbg !1291, !tbaa !130
  %14 = load i64, ptr %j, align 8, !dbg !1293, !tbaa !143
  %arrayidx9 = getelementptr inbounds ptr, ptr %13, i64 %14, !dbg !1291
  %15 = load ptr, ptr %arrayidx9, align 8, !dbg !1291, !tbaa !130
  %16 = load i64, ptr %h, align 8, !dbg !1294, !tbaa !143
  %arrayidx10 = getelementptr inbounds %struct.arc, ptr %15, i64 %16, !dbg !1291
  store ptr %arrayidx10, ptr %test_arc, align 8, !dbg !1295, !tbaa !130
  %17 = load ptr, ptr %test_arc, align 8, !dbg !1296, !tbaa !130
  %ident = getelementptr inbounds %struct.arc, ptr %17, i32 0, i32 4, !dbg !1298
  %18 = load i16, ptr %ident, align 8, !dbg !1298, !tbaa !1299
  %tobool = icmp ne i16 %18, 0, !dbg !1296
  br i1 %tobool, label %if.end, label %land.lhs.true, !dbg !1300

land.lhs.true:                                    ; preds = %for.body8
  %19 = load ptr, ptr %test_arc, align 8, !dbg !1301, !tbaa !130
  %flow = getelementptr inbounds %struct.arc, ptr %19, i32 0, i32 7, !dbg !1302
  %20 = load i64, ptr %flow, align 8, !dbg !1302, !tbaa !480
  %21 = load ptr, ptr %arcnew.addr, align 8, !dbg !1303, !tbaa !130
  %arrayidx11 = getelementptr inbounds %struct.arc, ptr %21, i64 0, !dbg !1303
  %flow12 = getelementptr inbounds %struct.arc, ptr %arrayidx11, i32 0, i32 7, !dbg !1304
  %22 = load i64, ptr %flow12, align 8, !dbg !1304, !tbaa !480
  %cmp13 = icmp slt i64 %20, %22, !dbg !1305
  br i1 %cmp13, label %if.then, label %lor.lhs.false, !dbg !1306

lor.lhs.false:                                    ; preds = %land.lhs.true
  %23 = load ptr, ptr %test_arc, align 8, !dbg !1307, !tbaa !130
  %flow15 = getelementptr inbounds %struct.arc, ptr %23, i32 0, i32 7, !dbg !1308
  %24 = load i64, ptr %flow15, align 8, !dbg !1308, !tbaa !480
  %25 = load ptr, ptr %arcnew.addr, align 8, !dbg !1309, !tbaa !130
  %arrayidx16 = getelementptr inbounds %struct.arc, ptr %25, i64 0, !dbg !1309
  %flow17 = getelementptr inbounds %struct.arc, ptr %arrayidx16, i32 0, i32 7, !dbg !1310
  %26 = load i64, ptr %flow17, align 8, !dbg !1310, !tbaa !480
  %cmp18 = icmp eq i64 %24, %26, !dbg !1311
  br i1 %cmp18, label %land.lhs.true20, label %if.end, !dbg !1312

land.lhs.true20:                                  ; preds = %lor.lhs.false
  %27 = load ptr, ptr %test_arc, align 8, !dbg !1313, !tbaa !130
  %id = getelementptr inbounds %struct.arc, ptr %27, i32 0, i32 0, !dbg !1314
  %28 = load i32, ptr %id, align 8, !dbg !1314, !tbaa !172
  %29 = load ptr, ptr %arcnew.addr, align 8, !dbg !1315, !tbaa !130
  %arrayidx21 = getelementptr inbounds %struct.arc, ptr %29, i64 0, !dbg !1315
  %id22 = getelementptr inbounds %struct.arc, ptr %arrayidx21, i32 0, i32 0, !dbg !1316
  %30 = load i32, ptr %id22, align 8, !dbg !1316, !tbaa !172
  %cmp23 = icmp slt i32 %28, %30, !dbg !1317
  br i1 %cmp23, label %if.then, label %if.end, !dbg !1318

if.then:                                          ; preds = %land.lhs.true20, %land.lhs.true
  %31 = load ptr, ptr %test_arc, align 8, !dbg !1319, !tbaa !130
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %copy, ptr align 8 %31, i64 72, i1 false), !dbg !1321, !tbaa.struct !290
  %32 = load i64, ptr %count, align 8, !dbg !1322, !tbaa !143
  %inc = add nsw i64 %32, 1, !dbg !1322
  store i64 %inc, ptr %count, align 8, !dbg !1322, !tbaa !143
  %33 = load ptr, ptr %test_arc, align 8, !dbg !1323, !tbaa !130
  %34 = load ptr, ptr %arcnew.addr, align 8, !dbg !1324, !tbaa !130
  %arrayidx25 = getelementptr inbounds %struct.arc, ptr %34, i64 0, !dbg !1324
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %33, ptr align 8 %arrayidx25, i64 72, i1 false), !dbg !1324, !tbaa.struct !290
  %35 = load ptr, ptr %arcnew.addr, align 8, !dbg !1325, !tbaa !130
  %tail = getelementptr inbounds %struct.arc, ptr %copy, i32 0, i32 2, !dbg !1326
  %36 = load ptr, ptr %tail, align 8, !dbg !1326, !tbaa !850
  %head = getelementptr inbounds %struct.arc, ptr %copy, i32 0, i32 3, !dbg !1327
  %37 = load ptr, ptr %head, align 8, !dbg !1327, !tbaa !856
  %cost = getelementptr inbounds %struct.arc, ptr %copy, i32 0, i32 1, !dbg !1328
  %38 = load i64, ptr %cost, align 8, !dbg !1328, !tbaa !868
  %flow26 = getelementptr inbounds %struct.arc, ptr %copy, i32 0, i32 7, !dbg !1329
  %39 = load i64, ptr %flow26, align 8, !dbg !1329, !tbaa !480
  %40 = load i64, ptr %max_new_par_residual_new_arcs.addr, align 8, !dbg !1330, !tbaa !143
  %id27 = getelementptr inbounds %struct.arc, ptr %copy, i32 0, i32 0, !dbg !1331
  %41 = load i32, ptr %id27, align 8, !dbg !1331, !tbaa !172
  %conv28 = sext i32 %41 to i64, !dbg !1332
  call void @replace_weaker_arc(ptr noundef %35, ptr noundef %36, ptr noundef %37, i64 noundef %38, i64 noundef %39, i64 noundef %40, i64 noundef %conv28) #10, !dbg !1333
  br label %if.end, !dbg !1334

if.end:                                           ; preds = %if.then, %land.lhs.true20, %lor.lhs.false, %for.body8
  br label %for.inc, !dbg !1335

for.inc:                                          ; preds = %if.end
  %42 = load i64, ptr %h, align 8, !dbg !1336, !tbaa !143
  %inc29 = add nsw i64 %42, 1, !dbg !1336
  store i64 %inc29, ptr %h, align 8, !dbg !1336, !tbaa !143
  br label %for.cond5, !dbg !1337, !llvm.loop !1338

for.end:                                          ; preds = %for.cond5
  br label %for.inc30, !dbg !1340

for.inc30:                                        ; preds = %for.end
  %43 = load i64, ptr %i, align 8, !dbg !1341, !tbaa !143
  %inc31 = add nsw i64 %43, 1, !dbg !1341
  store i64 %inc31, ptr %i, align 8, !dbg !1341, !tbaa !143
  %44 = load i64, ptr %j, align 8, !dbg !1342, !tbaa !143
  %add = add nsw i64 %44, 1, !dbg !1343
  %45 = load i64, ptr %num_threads.addr, align 8, !dbg !1344, !tbaa !143
  %rem = srem i64 %add, %45, !dbg !1345
  store i64 %rem, ptr %j, align 8, !dbg !1346, !tbaa !143
  br label %for.cond, !dbg !1347, !llvm.loop !1348

for.end32:                                        ; preds = %for.cond
  %46 = load i64, ptr %count, align 8, !dbg !1350, !tbaa !143
  call void @llvm.lifetime.end.p0(i64 72, ptr %copy) #9, !dbg !1351
  call void @llvm.lifetime.end.p0(i64 8, ptr %test_arc) #9, !dbg !1351
  call void @llvm.lifetime.end.p0(i64 8, ptr %count) #9, !dbg !1351
  call void @llvm.lifetime.end.p0(i64 8, ptr %number_of_arcs) #9, !dbg !1351
  call void @llvm.lifetime.end.p0(i64 8, ptr %h) #9, !dbg !1351
  call void @llvm.lifetime.end.p0(i64 8, ptr %j) #9, !dbg !1351
  call void @llvm.lifetime.end.p0(i64 8, ptr %i) #9, !dbg !1351
  ret i64 %46, !dbg !1352
}

; Function Attrs: minsize nounwind optsize uwtable
define dso_local i64 @price_out_impl(ptr noundef %net) #0 !dbg !1353 {
entry:
  %retval = alloca i64, align 8
  %net.addr = alloca ptr, align 8
  %i = alloca i64, align 8
  %trips = alloca i64, align 8
  %new_arcs = alloca i64, align 8
  %resized = alloca i64, align 8
  %latest = alloca i64, align 8
  %min_impl_duration = alloca i64, align 8
  %max_new_par_residual_new_arcs = alloca i64, align 8
  %thread = alloca i32, align 4
  %new_arcs_array = alloca ptr, align 8
  %id = alloca i64, align 8
  %list_size = alloca i64, align 8
  %num_del_arcs = alloca ptr, align 8
  %arcs_pointer_sorted = alloca ptr, align 8
  %deleted_arcs = alloca ptr, align 8
  %max_redcost = alloca i64, align 8
  %first_replace = alloca i16, align 2
  %local_first_replace = alloca i16, align 2
  %count = alloca i64, align 8
  %num_switch_iterations = alloca i64, align 8
  %size_del = alloca i64, align 8
  %first_list_elem = alloca ptr, align 8
  %new_list_elem = alloca ptr, align 8
  %iterator = alloca ptr, align 8
  %bigM = alloca i64, align 8
  %head_potential = alloca i64, align 8
  %arc_cost = alloca i64, align 8
  %red_cost = alloca i64, align 8
  %bigM_minus_min_impl_duration = alloca i64, align 8
  %arcout = alloca ptr, align 8
  %arcin = alloca ptr, align 8
  %arcnew = alloca ptr, align 8
  %stop = alloca ptr, align 8
  %sorted_array = alloca ptr, align 8
  %arc = alloca ptr, align 8
  %tail = alloca ptr, align 8
  %head = alloca ptr, align 8
  %num_threads = alloca i64, align 8
  %cleanup.dest.slot = alloca i32, align 4
  store ptr %net, ptr %net.addr, align 8, !tbaa !130
  call void @llvm.dbg.declare(metadata ptr %net.addr, metadata !1355, metadata !DIExpression()), !dbg !1393
  call void @llvm.lifetime.start.p0(i64 8, ptr %i) #9, !dbg !1394
  call void @llvm.dbg.declare(metadata ptr %i, metadata !1356, metadata !DIExpression()), !dbg !1395
  call void @llvm.lifetime.start.p0(i64 8, ptr %trips) #9, !dbg !1396
  call void @llvm.dbg.declare(metadata ptr %trips, metadata !1357, metadata !DIExpression()), !dbg !1397
  call void @llvm.lifetime.start.p0(i64 8, ptr %new_arcs) #9, !dbg !1398
  call void @llvm.dbg.declare(metadata ptr %new_arcs, metadata !1358, metadata !DIExpression()), !dbg !1399
  store i64 0, ptr %new_arcs, align 8, !dbg !1399, !tbaa !143
  call void @llvm.lifetime.start.p0(i64 8, ptr %resized) #9, !dbg !1400
  call void @llvm.dbg.declare(metadata ptr %resized, metadata !1359, metadata !DIExpression()), !dbg !1401
  store i64 0, ptr %resized, align 8, !dbg !1401, !tbaa !143
  call void @llvm.lifetime.start.p0(i64 8, ptr %latest) #9, !dbg !1402
  call void @llvm.dbg.declare(metadata ptr %latest, metadata !1360, metadata !DIExpression()), !dbg !1403
  call void @llvm.lifetime.start.p0(i64 8, ptr %min_impl_duration) #9, !dbg !1404
  call void @llvm.dbg.declare(metadata ptr %min_impl_duration, metadata !1361, metadata !DIExpression()), !dbg !1405
  store i64 15, ptr %min_impl_duration, align 8, !dbg !1405, !tbaa !143
  call void @llvm.lifetime.start.p0(i64 8, ptr %max_new_par_residual_new_arcs) #9, !dbg !1406
  call void @llvm.dbg.declare(metadata ptr %max_new_par_residual_new_arcs, metadata !1362, metadata !DIExpression()), !dbg !1407
  call void @llvm.lifetime.start.p0(i64 4, ptr %thread) #9, !dbg !1408
  call void @llvm.dbg.declare(metadata ptr %thread, metadata !1363, metadata !DIExpression()), !dbg !1409
  call void @llvm.lifetime.start.p0(i64 8, ptr %new_arcs_array) #9, !dbg !1410
  call void @llvm.dbg.declare(metadata ptr %new_arcs_array, metadata !1364, metadata !DIExpression()), !dbg !1411
  call void @llvm.lifetime.start.p0(i64 8, ptr %id) #9, !dbg !1412
  call void @llvm.dbg.declare(metadata ptr %id, metadata !1365, metadata !DIExpression()), !dbg !1413
  call void @llvm.lifetime.start.p0(i64 8, ptr %list_size) #9, !dbg !1412
  call void @llvm.dbg.declare(metadata ptr %list_size, metadata !1366, metadata !DIExpression()), !dbg !1414
  call void @llvm.lifetime.start.p0(i64 8, ptr %num_del_arcs) #9, !dbg !1412
  call void @llvm.dbg.declare(metadata ptr %num_del_arcs, metadata !1367, metadata !DIExpression()), !dbg !1415
  call void @llvm.lifetime.start.p0(i64 8, ptr %arcs_pointer_sorted) #9, !dbg !1416
  call void @llvm.dbg.declare(metadata ptr %arcs_pointer_sorted, metadata !1368, metadata !DIExpression()), !dbg !1417
  call void @llvm.lifetime.start.p0(i64 8, ptr %deleted_arcs) #9, !dbg !1416
  call void @llvm.dbg.declare(metadata ptr %deleted_arcs, metadata !1369, metadata !DIExpression()), !dbg !1418
  call void @llvm.lifetime.start.p0(i64 8, ptr %max_redcost) #9, !dbg !1419
  call void @llvm.dbg.declare(metadata ptr %max_redcost, metadata !1370, metadata !DIExpression()), !dbg !1420
  call void @llvm.lifetime.start.p0(i64 2, ptr %first_replace) #9, !dbg !1421
  call void @llvm.dbg.declare(metadata ptr %first_replace, metadata !1371, metadata !DIExpression()), !dbg !1422
  store i16 1, ptr %first_replace, align 2, !dbg !1422, !tbaa !292
  call void @llvm.lifetime.start.p0(i64 2, ptr %local_first_replace) #9, !dbg !1421
  call void @llvm.dbg.declare(metadata ptr %local_first_replace, metadata !1372, metadata !DIExpression()), !dbg !1423
  call void @llvm.lifetime.start.p0(i64 8, ptr %count) #9, !dbg !1424
  call void @llvm.dbg.declare(metadata ptr %count, metadata !1373, metadata !DIExpression()), !dbg !1425
  store i64 0, ptr %count, align 8, !dbg !1425, !tbaa !143
  call void @llvm.lifetime.start.p0(i64 8, ptr %num_switch_iterations) #9, !dbg !1426
  call void @llvm.dbg.declare(metadata ptr %num_switch_iterations, metadata !1374, metadata !DIExpression()), !dbg !1427
  call void @llvm.lifetime.start.p0(i64 8, ptr %size_del) #9, !dbg !1428
  call void @llvm.dbg.declare(metadata ptr %size_del, metadata !1375, metadata !DIExpression()), !dbg !1429
  call void @llvm.lifetime.start.p0(i64 8, ptr %first_list_elem) #9, !dbg !1430
  call void @llvm.dbg.declare(metadata ptr %first_list_elem, metadata !1376, metadata !DIExpression()), !dbg !1431
  call void @llvm.lifetime.start.p0(i64 8, ptr %new_list_elem) #9, !dbg !1432
  call void @llvm.dbg.declare(metadata ptr %new_list_elem, metadata !1377, metadata !DIExpression()), !dbg !1433
  call void @llvm.lifetime.start.p0(i64 8, ptr %iterator) #9, !dbg !1434
  call void @llvm.dbg.declare(metadata ptr %iterator, metadata !1378, metadata !DIExpression()), !dbg !1435
  call void @llvm.lifetime.start.p0(i64 8, ptr %bigM) #9, !dbg !1436
  call void @llvm.dbg.declare(metadata ptr %bigM, metadata !1379, metadata !DIExpression()), !dbg !1437
  %0 = load ptr, ptr %net.addr, align 8, !dbg !1438, !tbaa !130
  %bigM1 = getelementptr inbounds %struct.network, ptr %0, i32 0, i32 18, !dbg !1439
  %1 = load i64, ptr %bigM1, align 8, !dbg !1439, !tbaa !1440
  store i64 %1, ptr %bigM, align 8, !dbg !1437, !tbaa !143
  call void @llvm.lifetime.start.p0(i64 8, ptr %head_potential) #9, !dbg !1441
  call void @llvm.dbg.declare(metadata ptr %head_potential, metadata !1380, metadata !DIExpression()), !dbg !1442
  call void @llvm.lifetime.start.p0(i64 8, ptr %arc_cost) #9, !dbg !1443
  call void @llvm.dbg.declare(metadata ptr %arc_cost, metadata !1381, metadata !DIExpression()), !dbg !1444
  store i64 30, ptr %arc_cost, align 8, !dbg !1444, !tbaa !143
  call void @llvm.lifetime.start.p0(i64 8, ptr %red_cost) #9, !dbg !1445
  call void @llvm.dbg.declare(metadata ptr %red_cost, metadata !1382, metadata !DIExpression()), !dbg !1446
  call void @llvm.lifetime.start.p0(i64 8, ptr %bigM_minus_min_impl_duration) #9, !dbg !1447
  call void @llvm.dbg.declare(metadata ptr %bigM_minus_min_impl_duration, metadata !1383, metadata !DIExpression()), !dbg !1448
  call void @llvm.lifetime.start.p0(i64 8, ptr %arcout) #9, !dbg !1449
  call void @llvm.dbg.declare(metadata ptr %arcout, metadata !1384, metadata !DIExpression()), !dbg !1450
  call void @llvm.lifetime.start.p0(i64 8, ptr %arcin) #9, !dbg !1449
  call void @llvm.dbg.declare(metadata ptr %arcin, metadata !1385, metadata !DIExpression()), !dbg !1451
  call void @llvm.lifetime.start.p0(i64 8, ptr %arcnew) #9, !dbg !1449
  call void @llvm.dbg.declare(metadata ptr %arcnew, metadata !1386, metadata !DIExpression()), !dbg !1452
  call void @llvm.lifetime.start.p0(i64 8, ptr %stop) #9, !dbg !1449
  call void @llvm.dbg.declare(metadata ptr %stop, metadata !1387, metadata !DIExpression()), !dbg !1453
  call void @llvm.lifetime.start.p0(i64 8, ptr %sorted_array) #9, !dbg !1449
  call void @llvm.dbg.declare(metadata ptr %sorted_array, metadata !1388, metadata !DIExpression()), !dbg !1454
  call void @llvm.lifetime.start.p0(i64 8, ptr %arc) #9, !dbg !1449
  call void @llvm.dbg.declare(metadata ptr %arc, metadata !1389, metadata !DIExpression()), !dbg !1455
  call void @llvm.lifetime.start.p0(i64 8, ptr %tail) #9, !dbg !1456
  call void @llvm.dbg.declare(metadata ptr %tail, metadata !1390, metadata !DIExpression()), !dbg !1457
  call void @llvm.lifetime.start.p0(i64 8, ptr %head) #9, !dbg !1456
  call void @llvm.dbg.declare(metadata ptr %head, metadata !1391, metadata !DIExpression()), !dbg !1458
  call void @llvm.lifetime.start.p0(i64 8, ptr %num_threads) #9, !dbg !1459
  call void @llvm.dbg.declare(metadata ptr %num_threads, metadata !1392, metadata !DIExpression()), !dbg !1460
  store i64 1, ptr %num_threads, align 8, !dbg !1460, !tbaa !143
  %2 = load i64, ptr %num_threads, align 8, !dbg !1461, !tbaa !143
  %mul = mul i64 %2, 8, !dbg !1462
  %call = call noalias ptr @malloc(i64 noundef %mul) #11, !dbg !1463
  store ptr %call, ptr %new_arcs_array, align 8, !dbg !1464, !tbaa !130
  %3 = load i64, ptr %num_threads, align 8, !dbg !1465, !tbaa !143
  %mul2 = mul i64 %3, 8, !dbg !1466
  %call3 = call noalias ptr @malloc(i64 noundef %mul2) #11, !dbg !1467
  store ptr %call3, ptr %num_del_arcs, align 8, !dbg !1468, !tbaa !130
  %4 = load i64, ptr %num_threads, align 8, !dbg !1469, !tbaa !143
  %mul4 = mul i64 %4, 8, !dbg !1470
  %call5 = call noalias ptr @malloc(i64 noundef %mul4) #11, !dbg !1471
  store ptr %call5, ptr %arcs_pointer_sorted, align 8, !dbg !1472, !tbaa !130
  %5 = load i64, ptr %num_threads, align 8, !dbg !1473, !tbaa !143
  %mul6 = mul i64 %5, 8, !dbg !1474
  %call7 = call noalias ptr @malloc(i64 noundef %mul6) #11, !dbg !1475
  store ptr %call7, ptr %deleted_arcs, align 8, !dbg !1476, !tbaa !130
  %6 = load i64, ptr %bigM, align 8, !dbg !1477, !tbaa !143
  %7 = load i64, ptr %min_impl_duration, align 8, !dbg !1478, !tbaa !143
  %sub = sub nsw i64 %6, %7, !dbg !1479
  store i64 %sub, ptr %bigM_minus_min_impl_duration, align 8, !dbg !1480, !tbaa !143
  %8 = load ptr, ptr %net.addr, align 8, !dbg !1481, !tbaa !130
  %n_trips = getelementptr inbounds %struct.network, ptr %8, i32 0, i32 3, !dbg !1483
  %9 = load i64, ptr %n_trips, align 8, !dbg !1483, !tbaa !367
  %cmp = icmp sle i64 %9, 15000, !dbg !1484
  br i1 %cmp, label %if.then, label %if.else, !dbg !1485

if.then:                                          ; preds = %entry
  %10 = load ptr, ptr %net.addr, align 8, !dbg !1486, !tbaa !130
  %m = getelementptr inbounds %struct.network, ptr %10, i32 0, i32 5, !dbg !1489
  %11 = load i64, ptr %m, align 8, !dbg !1489, !tbaa !410
  %12 = load ptr, ptr %net.addr, align 8, !dbg !1490, !tbaa !130
  %max_new_m = getelementptr inbounds %struct.network, ptr %12, i32 0, i32 9, !dbg !1491
  %13 = load i64, ptr %max_new_m, align 8, !dbg !1491, !tbaa !654
  %add = add nsw i64 %11, %13, !dbg !1492
  %14 = load ptr, ptr %net.addr, align 8, !dbg !1493, !tbaa !130
  %max_m = getelementptr inbounds %struct.network, ptr %14, i32 0, i32 4, !dbg !1494
  %15 = load i64, ptr %max_m, align 8, !dbg !1494, !tbaa !658
  %cmp8 = icmp sgt i64 %add, %15, !dbg !1495
  br i1 %cmp8, label %land.lhs.true, label %if.end19, !dbg !1496

land.lhs.true:                                    ; preds = %if.then
  %16 = load ptr, ptr %net.addr, align 8, !dbg !1497, !tbaa !130
  %n_trips9 = getelementptr inbounds %struct.network, ptr %16, i32 0, i32 3, !dbg !1498
  %17 = load i64, ptr %n_trips9, align 8, !dbg !1498, !tbaa !367
  %18 = load ptr, ptr %net.addr, align 8, !dbg !1499, !tbaa !130
  %n_trips10 = getelementptr inbounds %struct.network, ptr %18, i32 0, i32 3, !dbg !1500
  %19 = load i64, ptr %n_trips10, align 8, !dbg !1500, !tbaa !367
  %mul11 = mul nsw i64 %17, %19, !dbg !1501
  %div = sdiv i64 %mul11, 2, !dbg !1502
  %20 = load ptr, ptr %net.addr, align 8, !dbg !1503, !tbaa !130
  %m12 = getelementptr inbounds %struct.network, ptr %20, i32 0, i32 5, !dbg !1504
  %21 = load i64, ptr %m12, align 8, !dbg !1504, !tbaa !410
  %add13 = add nsw i64 %div, %21, !dbg !1505
  %22 = load ptr, ptr %net.addr, align 8, !dbg !1506, !tbaa !130
  %max_m14 = getelementptr inbounds %struct.network, ptr %22, i32 0, i32 4, !dbg !1507
  %23 = load i64, ptr %max_m14, align 8, !dbg !1507, !tbaa !658
  %cmp15 = icmp sgt i64 %add13, %23, !dbg !1508
  br i1 %cmp15, label %if.then16, label %if.end19, !dbg !1509

if.then16:                                        ; preds = %land.lhs.true
  store i64 1, ptr %resized, align 8, !dbg !1510, !tbaa !143
  %24 = load ptr, ptr %net.addr, align 8, !dbg !1512, !tbaa !130
  %call17 = call i64 @resize_prob(ptr noundef %24) #10, !dbg !1514
  %tobool = icmp ne i64 %call17, 0, !dbg !1514
  br i1 %tobool, label %if.then18, label %if.end, !dbg !1515

if.then18:                                        ; preds = %if.then16
  store i64 -1, ptr %retval, align 8, !dbg !1516
  store i32 1, ptr %cleanup.dest.slot, align 4
  br label %cleanup, !dbg !1516

if.end:                                           ; preds = %if.then16
  %25 = load ptr, ptr %net.addr, align 8, !dbg !1517, !tbaa !130
  call void @refresh_neighbour_lists(ptr noundef %25, ptr noundef @getOriginalArcPosition) #10, !dbg !1518
  br label %if.end19, !dbg !1519

if.end19:                                         ; preds = %if.end, %land.lhs.true, %if.then
  br label %if.end40, !dbg !1520

if.else:                                          ; preds = %entry
  %26 = load ptr, ptr %net.addr, align 8, !dbg !1521, !tbaa !130
  %m20 = getelementptr inbounds %struct.network, ptr %26, i32 0, i32 5, !dbg !1524
  %27 = load i64, ptr %m20, align 8, !dbg !1524, !tbaa !410
  %28 = load ptr, ptr %net.addr, align 8, !dbg !1525, !tbaa !130
  %max_new_m21 = getelementptr inbounds %struct.network, ptr %28, i32 0, i32 9, !dbg !1526
  %29 = load i64, ptr %max_new_m21, align 8, !dbg !1526, !tbaa !654
  %add22 = add nsw i64 %27, %29, !dbg !1527
  %30 = load ptr, ptr %net.addr, align 8, !dbg !1528, !tbaa !130
  %max_m23 = getelementptr inbounds %struct.network, ptr %30, i32 0, i32 4, !dbg !1529
  %31 = load i64, ptr %max_m23, align 8, !dbg !1529, !tbaa !658
  %cmp24 = icmp sgt i64 %add22, %31, !dbg !1530
  br i1 %cmp24, label %land.lhs.true25, label %if.end39, !dbg !1531

land.lhs.true25:                                  ; preds = %if.else
  %32 = load ptr, ptr %net.addr, align 8, !dbg !1532, !tbaa !130
  %n_trips26 = getelementptr inbounds %struct.network, ptr %32, i32 0, i32 3, !dbg !1533
  %33 = load i64, ptr %n_trips26, align 8, !dbg !1533, !tbaa !367
  %34 = load ptr, ptr %net.addr, align 8, !dbg !1534, !tbaa !130
  %n_trips27 = getelementptr inbounds %struct.network, ptr %34, i32 0, i32 3, !dbg !1535
  %35 = load i64, ptr %n_trips27, align 8, !dbg !1535, !tbaa !367
  %mul28 = mul nsw i64 %33, %35, !dbg !1536
  %div29 = sdiv i64 %mul28, 2, !dbg !1537
  %36 = load ptr, ptr %net.addr, align 8, !dbg !1538, !tbaa !130
  %m30 = getelementptr inbounds %struct.network, ptr %36, i32 0, i32 5, !dbg !1539
  %37 = load i64, ptr %m30, align 8, !dbg !1539, !tbaa !410
  %add31 = add nsw i64 %div29, %37, !dbg !1540
  %38 = load ptr, ptr %net.addr, align 8, !dbg !1541, !tbaa !130
  %max_m32 = getelementptr inbounds %struct.network, ptr %38, i32 0, i32 4, !dbg !1542
  %39 = load i64, ptr %max_m32, align 8, !dbg !1542, !tbaa !658
  %cmp33 = icmp sgt i64 %add31, %39, !dbg !1543
  br i1 %cmp33, label %if.then34, label %if.end39, !dbg !1544

if.then34:                                        ; preds = %land.lhs.true25
  store i64 1, ptr %resized, align 8, !dbg !1545, !tbaa !143
  %40 = load ptr, ptr %net.addr, align 8, !dbg !1547, !tbaa !130
  %call35 = call i64 @resize_prob(ptr noundef %40) #10, !dbg !1549
  %tobool36 = icmp ne i64 %call35, 0, !dbg !1549
  br i1 %tobool36, label %if.then37, label %if.end38, !dbg !1550

if.then37:                                        ; preds = %if.then34
  store i64 -1, ptr %retval, align 8, !dbg !1551
  store i32 1, ptr %cleanup.dest.slot, align 4
  br label %cleanup, !dbg !1551

if.end38:                                         ; preds = %if.then34
  %41 = load ptr, ptr %net.addr, align 8, !dbg !1552, !tbaa !130
  call void @refresh_neighbour_lists(ptr noundef %41, ptr noundef @getOriginalArcPosition) #10, !dbg !1553
  br label %if.end39, !dbg !1554

if.end39:                                         ; preds = %if.end38, %land.lhs.true25, %if.else
  br label %if.end40

if.end40:                                         ; preds = %if.end39, %if.end19
  %42 = load ptr, ptr %net.addr, align 8, !dbg !1555, !tbaa !130
  %n_trips41 = getelementptr inbounds %struct.network, ptr %42, i32 0, i32 3, !dbg !1557
  %43 = load i64, ptr %n_trips41, align 8, !dbg !1557, !tbaa !367
  %cmp42 = icmp sle i64 %43, 15000, !dbg !1558
  br i1 %cmp42, label %if.then43, label %if.else44, !dbg !1559

if.then43:                                        ; preds = %if.end40
  store i64 1000, ptr %num_switch_iterations, align 8, !dbg !1560, !tbaa !143
  br label %if.end45, !dbg !1561

if.else44:                                        ; preds = %if.end40
  store i64 2000, ptr %num_switch_iterations, align 8, !dbg !1562, !tbaa !143
  br label %if.end45

if.end45:                                         ; preds = %if.else44, %if.then43
  %44 = load ptr, ptr %net.addr, align 8, !dbg !1563, !tbaa !130
  %sorted_arcs = getelementptr inbounds %struct.network, ptr %44, i32 0, i32 25, !dbg !1564
  %45 = load ptr, ptr %sorted_arcs, align 8, !dbg !1564, !tbaa !254
  store ptr %45, ptr %sorted_array, align 8, !dbg !1565, !tbaa !130
  %46 = load ptr, ptr %sorted_array, align 8, !dbg !1566, !tbaa !130
  %tobool46 = icmp ne ptr %46, null, !dbg !1566
  br i1 %tobool46, label %if.end48, label %if.then47, !dbg !1568

if.then47:                                        ; preds = %if.end45
  store i64 -1, ptr %retval, align 8, !dbg !1569
  store i32 1, ptr %cleanup.dest.slot, align 4
  br label %cleanup, !dbg !1569

if.end48:                                         ; preds = %if.end45
  %47 = load ptr, ptr %net.addr, align 8, !dbg !1570, !tbaa !130
  %max_residual_new_m = getelementptr inbounds %struct.network, ptr %47, i32 0, i32 8, !dbg !1571
  %48 = load i64, ptr %max_residual_new_m, align 8, !dbg !1571, !tbaa !372
  %49 = load i64, ptr %num_threads, align 8, !dbg !1572, !tbaa !143
  %div49 = sdiv i64 %48, %49, !dbg !1573
  store i64 %div49, ptr %max_new_par_residual_new_arcs, align 8, !dbg !1574, !tbaa !143
  store i16 1, ptr %first_replace, align 2, !dbg !1575, !tbaa !292
  %50 = load ptr, ptr %net.addr, align 8, !dbg !1576, !tbaa !130
  %max_m50 = getelementptr inbounds %struct.network, ptr %50, i32 0, i32 4, !dbg !1577
  %51 = load i64, ptr %max_m50, align 8, !dbg !1577, !tbaa !658
  %52 = load i64, ptr %num_threads, align 8, !dbg !1578, !tbaa !143
  %div51 = sdiv i64 %51, %52, !dbg !1579
  store i64 %div51, ptr %size_del, align 8, !dbg !1580, !tbaa !143
  store i16 1, ptr %local_first_replace, align 2, !dbg !1581, !tbaa !292
  store i64 0, ptr %max_redcost, align 8, !dbg !1583, !tbaa !143
  store i64 0, ptr %count, align 8, !dbg !1584, !tbaa !143
  store i32 0, ptr %thread, align 4, !dbg !1585, !tbaa !291
  %53 = load ptr, ptr %sorted_array, align 8, !dbg !1586, !tbaa !130
  %54 = load i64, ptr %size_del, align 8, !dbg !1587, !tbaa !143
  %55 = load i32, ptr %thread, align 4, !dbg !1588, !tbaa !291
  %conv = sext i32 %55 to i64, !dbg !1588
  %mul52 = mul nsw i64 %54, %conv, !dbg !1589
  %arrayidx = getelementptr inbounds %struct.arc, ptr %53, i64 %mul52, !dbg !1586
  %56 = load ptr, ptr %deleted_arcs, align 8, !dbg !1590, !tbaa !130
  %57 = load i32, ptr %thread, align 4, !dbg !1591, !tbaa !291
  %idxprom = sext i32 %57 to i64, !dbg !1590
  %arrayidx53 = getelementptr inbounds ptr, ptr %56, i64 %idxprom, !dbg !1590
  store ptr %arrayidx, ptr %arrayidx53, align 8, !dbg !1592, !tbaa !130
  %58 = load ptr, ptr %num_del_arcs, align 8, !dbg !1593, !tbaa !130
  %59 = load i32, ptr %thread, align 4, !dbg !1594, !tbaa !291
  %idxprom54 = sext i32 %59 to i64, !dbg !1593
  %arrayidx55 = getelementptr inbounds i64, ptr %58, i64 %idxprom54, !dbg !1593
  store i64 0, ptr %arrayidx55, align 8, !dbg !1595, !tbaa !143
  %60 = load ptr, ptr %new_arcs_array, align 8, !dbg !1596, !tbaa !130
  %61 = load i32, ptr %thread, align 4, !dbg !1597, !tbaa !291
  %idxprom56 = sext i32 %61 to i64, !dbg !1596
  %arrayidx57 = getelementptr inbounds i64, ptr %60, i64 %idxprom56, !dbg !1596
  store i64 0, ptr %arrayidx57, align 8, !dbg !1598, !tbaa !143
  %62 = load ptr, ptr %net.addr, align 8, !dbg !1599, !tbaa !130
  %stop_arcs = getelementptr inbounds %struct.network, ptr %62, i32 0, i32 24, !dbg !1600
  %63 = load ptr, ptr %stop_arcs, align 8, !dbg !1600, !tbaa !315
  %64 = load i32, ptr %thread, align 4, !dbg !1601, !tbaa !291
  %conv58 = sext i32 %64 to i64, !dbg !1601
  %65 = load i64, ptr %max_new_par_residual_new_arcs, align 8, !dbg !1602, !tbaa !143
  %mul59 = mul nsw i64 %conv58, %65, !dbg !1603
  %add.ptr = getelementptr inbounds %struct.arc, ptr %63, i64 %mul59, !dbg !1604
  store ptr %add.ptr, ptr %arcnew, align 8, !dbg !1605, !tbaa !130
  %66 = load ptr, ptr %net.addr, align 8, !dbg !1606, !tbaa !130
  %n_trips60 = getelementptr inbounds %struct.network, ptr %66, i32 0, i32 3, !dbg !1607
  %67 = load i64, ptr %n_trips60, align 8, !dbg !1607, !tbaa !367
  store i64 %67, ptr %trips, align 8, !dbg !1608, !tbaa !143
  store i64 0, ptr %id, align 8, !dbg !1609, !tbaa !143
  store i64 -1, ptr %list_size, align 8, !dbg !1610, !tbaa !143
  %68 = load i64, ptr %max_new_par_residual_new_arcs, align 8, !dbg !1611, !tbaa !143
  %call61 = call noalias ptr @calloc(i64 noundef %68, i64 noundef 8) #14, !dbg !1612
  %69 = load ptr, ptr %arcs_pointer_sorted, align 8, !dbg !1613, !tbaa !130
  %70 = load i32, ptr %thread, align 4, !dbg !1614, !tbaa !291
  %idxprom62 = sext i32 %70 to i64, !dbg !1613
  %arrayidx63 = getelementptr inbounds ptr, ptr %69, i64 %idxprom62, !dbg !1613
  store ptr %call61, ptr %arrayidx63, align 8, !dbg !1615, !tbaa !130
  store i64 0, ptr %i, align 8, !dbg !1616, !tbaa !143
  br label %for.cond, !dbg !1618

for.cond:                                         ; preds = %for.inc, %if.end48
  %71 = load i64, ptr %i, align 8, !dbg !1619, !tbaa !143
  %72 = load i64, ptr %max_new_par_residual_new_arcs, align 8, !dbg !1621, !tbaa !143
  %cmp64 = icmp slt i64 %71, %72, !dbg !1622
  br i1 %cmp64, label %for.body, label %for.end, !dbg !1623

for.body:                                         ; preds = %for.cond
  %73 = load ptr, ptr %arcnew, align 8, !dbg !1624, !tbaa !130
  %74 = load i64, ptr %i, align 8, !dbg !1626, !tbaa !143
  %arrayidx66 = getelementptr inbounds %struct.arc, ptr %73, i64 %74, !dbg !1624
  %75 = load ptr, ptr %arcs_pointer_sorted, align 8, !dbg !1627, !tbaa !130
  %76 = load i32, ptr %thread, align 4, !dbg !1628, !tbaa !291
  %idxprom67 = sext i32 %76 to i64, !dbg !1627
  %arrayidx68 = getelementptr inbounds ptr, ptr %75, i64 %idxprom67, !dbg !1627
  %77 = load ptr, ptr %arrayidx68, align 8, !dbg !1627, !tbaa !130
  %78 = load i64, ptr %i, align 8, !dbg !1629, !tbaa !143
  %arrayidx69 = getelementptr inbounds ptr, ptr %77, i64 %78, !dbg !1627
  store ptr %arrayidx66, ptr %arrayidx69, align 8, !dbg !1630, !tbaa !130
  br label %for.inc, !dbg !1631

for.inc:                                          ; preds = %for.body
  %79 = load i64, ptr %i, align 8, !dbg !1632, !tbaa !143
  %inc = add nsw i64 %79, 1, !dbg !1632
  store i64 %inc, ptr %i, align 8, !dbg !1632, !tbaa !143
  br label %for.cond, !dbg !1633, !llvm.loop !1634

for.end:                                          ; preds = %for.cond
  %80 = load ptr, ptr %net.addr, align 8, !dbg !1636, !tbaa !130
  %arcs = getelementptr inbounds %struct.network, ptr %80, i32 0, i32 23, !dbg !1637
  %81 = load ptr, ptr %arcs, align 8, !dbg !1637, !tbaa !271
  store ptr %81, ptr %arcout, align 8, !dbg !1638, !tbaa !130
  store i64 0, ptr %i, align 8, !dbg !1639, !tbaa !143
  br label %for.cond70, !dbg !1641

for.cond70:                                       ; preds = %for.inc78, %for.end
  %82 = load i64, ptr %i, align 8, !dbg !1642, !tbaa !143
  %83 = load i64, ptr %trips, align 8, !dbg !1644, !tbaa !143
  %cmp71 = icmp slt i64 %82, %83, !dbg !1645
  br i1 %cmp71, label %land.rhs, label %land.end, !dbg !1646

land.rhs:                                         ; preds = %for.cond70
  %84 = load ptr, ptr %arcout, align 8, !dbg !1647, !tbaa !130
  %arrayidx73 = getelementptr inbounds %struct.arc, ptr %84, i64 1, !dbg !1647
  %ident = getelementptr inbounds %struct.arc, ptr %arrayidx73, i32 0, i32 4, !dbg !1648
  %85 = load i16, ptr %ident, align 8, !dbg !1648, !tbaa !1299
  %conv74 = sext i16 %85 to i32, !dbg !1647
  %cmp75 = icmp eq i32 %conv74, -1, !dbg !1649
  br label %land.end

land.end:                                         ; preds = %land.rhs, %for.cond70
  %86 = phi i1 [ false, %for.cond70 ], [ %cmp75, %land.rhs ], !dbg !1650
  br i1 %86, label %for.body77, label %for.end81, !dbg !1651

for.body77:                                       ; preds = %land.end
  br label %for.inc78, !dbg !1651

for.inc78:                                        ; preds = %for.body77
  %87 = load i64, ptr %i, align 8, !dbg !1652, !tbaa !143
  %inc79 = add nsw i64 %87, 1, !dbg !1652
  store i64 %inc79, ptr %i, align 8, !dbg !1652, !tbaa !143
  %88 = load ptr, ptr %arcout, align 8, !dbg !1653, !tbaa !130
  %add.ptr80 = getelementptr inbounds %struct.arc, ptr %88, i64 3, !dbg !1653
  store ptr %add.ptr80, ptr %arcout, align 8, !dbg !1653, !tbaa !130
  br label %for.cond70, !dbg !1654, !llvm.loop !1655

for.end81:                                        ; preds = %land.end
  store ptr null, ptr %first_list_elem, align 8, !dbg !1657, !tbaa !130
  br label %for.cond82, !dbg !1658

for.cond82:                                       ; preds = %for.inc208, %for.end81
  %89 = load i64, ptr %i, align 8, !dbg !1659, !tbaa !143
  %90 = load i64, ptr %trips, align 8, !dbg !1662, !tbaa !143
  %cmp83 = icmp slt i64 %89, %90, !dbg !1663
  br i1 %cmp83, label %for.body85, label %for.end211, !dbg !1664

for.body85:                                       ; preds = %for.cond82
  %91 = load i16, ptr %first_replace, align 2, !dbg !1665, !tbaa !292
  %tobool86 = icmp ne i16 %91, 0, !dbg !1665
  br i1 %tobool86, label %if.end88, label %if.then87, !dbg !1668

if.then87:                                        ; preds = %for.body85
  %92 = load ptr, ptr %net.addr, align 8, !dbg !1669, !tbaa !130
  %93 = load ptr, ptr %arcs_pointer_sorted, align 8, !dbg !1671, !tbaa !130
  %94 = load i64, ptr %num_threads, align 8, !dbg !1672, !tbaa !143
  call void @calculate_max_redcost(ptr noundef %92, ptr noundef %max_redcost, ptr noundef %93, i64 noundef %94) #10, !dbg !1673
  br label %if.end88, !dbg !1674

if.end88:                                         ; preds = %if.then87, %for.body85
  %95 = load i64, ptr %i, align 8, !dbg !1675, !tbaa !143
  %96 = load i64, ptr %num_switch_iterations, align 8, !dbg !1677, !tbaa !143
  %rem = srem i64 %95, %96, !dbg !1678
  %cmp89 = icmp eq i64 %rem, 0, !dbg !1679
  br i1 %cmp89, label %if.then91, label %if.end100, !dbg !1680

if.then91:                                        ; preds = %if.end88
  %97 = load ptr, ptr %net.addr, align 8, !dbg !1681, !tbaa !130
  %98 = load ptr, ptr %arcs_pointer_sorted, align 8, !dbg !1683, !tbaa !130
  %99 = load i64, ptr %num_threads, align 8, !dbg !1684, !tbaa !143
  call void @calculate_max_redcost(ptr noundef %97, ptr noundef %max_redcost, ptr noundef %98, i64 noundef %99) #10, !dbg !1685
  %100 = load i16, ptr %first_replace, align 2, !dbg !1686, !tbaa !292
  %tobool92 = icmp ne i16 %100, 0, !dbg !1686
  br i1 %tobool92, label %if.end99, label %if.then93, !dbg !1688

if.then93:                                        ; preds = %if.then91
  %101 = load i64, ptr %count, align 8, !dbg !1689, !tbaa !143
  %102 = load ptr, ptr %num_del_arcs, align 8, !dbg !1691, !tbaa !130
  %103 = load i32, ptr %thread, align 4, !dbg !1692, !tbaa !291
  %idxprom94 = sext i32 %103 to i64, !dbg !1691
  %arrayidx95 = getelementptr inbounds i64, ptr %102, i64 %idxprom94, !dbg !1691
  store i64 %101, ptr %arrayidx95, align 8, !dbg !1693, !tbaa !143
  %104 = load ptr, ptr %net.addr, align 8, !dbg !1694, !tbaa !130
  %105 = load ptr, ptr %num_del_arcs, align 8, !dbg !1695, !tbaa !130
  %106 = load ptr, ptr %deleted_arcs, align 8, !dbg !1696, !tbaa !130
  %107 = load ptr, ptr %arcnew, align 8, !dbg !1697, !tbaa !130
  %108 = load i32, ptr %thread, align 4, !dbg !1698, !tbaa !291
  %109 = load i64, ptr %max_new_par_residual_new_arcs, align 8, !dbg !1699, !tbaa !143
  %110 = load i64, ptr %size_del, align 8, !dbg !1700, !tbaa !143
  %111 = load i64, ptr %num_threads, align 8, !dbg !1701, !tbaa !143
  %call96 = call i64 @switch_arcs(ptr noundef %104, ptr noundef %105, ptr noundef %106, ptr noundef %107, i32 noundef %108, i64 noundef %109, i64 noundef %110, i64 noundef %111) #10, !dbg !1702
  store i64 0, ptr %count, align 8, !dbg !1703, !tbaa !143
  %112 = load ptr, ptr %num_del_arcs, align 8, !dbg !1704, !tbaa !130
  %113 = load i32, ptr %thread, align 4, !dbg !1705, !tbaa !291
  %idxprom97 = sext i32 %113 to i64, !dbg !1704
  %arrayidx98 = getelementptr inbounds i64, ptr %112, i64 %idxprom97, !dbg !1704
  store i64 0, ptr %arrayidx98, align 8, !dbg !1706, !tbaa !143
  br label %if.end99, !dbg !1707

if.end99:                                         ; preds = %if.then93, %if.then91
  br label %if.end100, !dbg !1708

if.end100:                                        ; preds = %if.end99, %if.end88
  %114 = load ptr, ptr %arcout, align 8, !dbg !1709, !tbaa !130
  %arrayidx101 = getelementptr inbounds %struct.arc, ptr %114, i64 1, !dbg !1709
  %ident102 = getelementptr inbounds %struct.arc, ptr %arrayidx101, i32 0, i32 4, !dbg !1711
  %115 = load i16, ptr %ident102, align 8, !dbg !1711, !tbaa !1299
  %conv103 = sext i16 %115 to i32, !dbg !1709
  %cmp104 = icmp ne i32 %conv103, -1, !dbg !1712
  br i1 %cmp104, label %if.then106, label %if.end111, !dbg !1713

if.then106:                                       ; preds = %if.end100
  %call107 = call noalias ptr @calloc(i64 noundef 1, i64 noundef 16) #14, !dbg !1714
  store ptr %call107, ptr %new_list_elem, align 8, !dbg !1716, !tbaa !130
  %116 = load ptr, ptr %first_list_elem, align 8, !dbg !1717, !tbaa !130
  %117 = load ptr, ptr %new_list_elem, align 8, !dbg !1718, !tbaa !130
  %next = getelementptr inbounds %struct.list_elem, ptr %117, i32 0, i32 1, !dbg !1719
  store ptr %116, ptr %next, align 8, !dbg !1720, !tbaa !1721
  %118 = load ptr, ptr %arcout, align 8, !dbg !1723, !tbaa !130
  %add.ptr108 = getelementptr inbounds %struct.arc, ptr %118, i64 1, !dbg !1724
  %119 = load ptr, ptr %new_list_elem, align 8, !dbg !1725, !tbaa !130
  %arc109 = getelementptr inbounds %struct.list_elem, ptr %119, i32 0, i32 0, !dbg !1726
  store ptr %add.ptr108, ptr %arc109, align 8, !dbg !1727, !tbaa !1728
  %120 = load ptr, ptr %new_list_elem, align 8, !dbg !1729, !tbaa !130
  store ptr %120, ptr %first_list_elem, align 8, !dbg !1730, !tbaa !130
  %121 = load i64, ptr %list_size, align 8, !dbg !1731, !tbaa !143
  %inc110 = add nsw i64 %121, 1, !dbg !1731
  store i64 %inc110, ptr %list_size, align 8, !dbg !1731, !tbaa !143
  br label %if.end111, !dbg !1732

if.end111:                                        ; preds = %if.then106, %if.end100
  %122 = load ptr, ptr %arcout, align 8, !dbg !1733, !tbaa !130
  %ident112 = getelementptr inbounds %struct.arc, ptr %122, i32 0, i32 4, !dbg !1735
  %123 = load i16, ptr %ident112, align 8, !dbg !1735, !tbaa !1299
  %conv113 = sext i16 %123 to i32, !dbg !1733
  %cmp114 = icmp eq i32 %conv113, -1, !dbg !1736
  br i1 %cmp114, label %if.then120, label %lor.lhs.false, !dbg !1737

lor.lhs.false:                                    ; preds = %if.end111
  %124 = load i64, ptr %i, align 8, !dbg !1738, !tbaa !143
  %125 = load i64, ptr %num_threads, align 8, !dbg !1739, !tbaa !143
  %rem116 = srem i64 %124, %125, !dbg !1740
  %126 = load i32, ptr %thread, align 4, !dbg !1741, !tbaa !291
  %conv117 = sext i32 %126 to i64, !dbg !1741
  %cmp118 = icmp ne i64 %rem116, %conv117, !dbg !1742
  br i1 %cmp118, label %if.then120, label %if.end122, !dbg !1743

if.then120:                                       ; preds = %lor.lhs.false, %if.end111
  %127 = load i64, ptr %list_size, align 8, !dbg !1744, !tbaa !143
  %128 = load i64, ptr %id, align 8, !dbg !1746, !tbaa !143
  %add121 = add nsw i64 %128, %127, !dbg !1746
  store i64 %add121, ptr %id, align 8, !dbg !1746, !tbaa !143
  br label %for.inc208, !dbg !1747

if.end122:                                        ; preds = %lor.lhs.false
  %129 = load ptr, ptr %arcout, align 8, !dbg !1748, !tbaa !130
  %head123 = getelementptr inbounds %struct.arc, ptr %129, i32 0, i32 3, !dbg !1749
  %130 = load ptr, ptr %head123, align 8, !dbg !1749, !tbaa !856
  store ptr %130, ptr %head, align 8, !dbg !1750, !tbaa !130
  %131 = load ptr, ptr %head, align 8, !dbg !1751, !tbaa !130
  %time = getelementptr inbounds %struct.node, ptr %131, i32 0, i32 13, !dbg !1752
  %132 = load i32, ptr %time, align 4, !dbg !1752, !tbaa !1753
  %conv124 = sext i32 %132 to i64, !dbg !1751
  %133 = load ptr, ptr %arcout, align 8, !dbg !1754, !tbaa !130
  %org_cost = getelementptr inbounds %struct.arc, ptr %133, i32 0, i32 8, !dbg !1755
  %134 = load i64, ptr %org_cost, align 8, !dbg !1755, !tbaa !862
  %sub125 = sub nsw i64 %conv124, %134, !dbg !1756
  %135 = load i64, ptr %bigM_minus_min_impl_duration, align 8, !dbg !1757, !tbaa !143
  %add126 = add nsw i64 %sub125, %135, !dbg !1758
  store i64 %add126, ptr %latest, align 8, !dbg !1759, !tbaa !143
  %136 = load ptr, ptr %head, align 8, !dbg !1760, !tbaa !130
  %potential = getelementptr inbounds %struct.node, ptr %136, i32 0, i32 0, !dbg !1761
  %137 = load i64, ptr %potential, align 8, !dbg !1761, !tbaa !1762
  store i64 %137, ptr %head_potential, align 8, !dbg !1763, !tbaa !143
  %138 = load ptr, ptr %first_list_elem, align 8, !dbg !1764, !tbaa !130
  %next127 = getelementptr inbounds %struct.list_elem, ptr %138, i32 0, i32 1, !dbg !1765
  %139 = load ptr, ptr %next127, align 8, !dbg !1765, !tbaa !1721
  store ptr %139, ptr %iterator, align 8, !dbg !1766, !tbaa !130
  br label %while.cond, !dbg !1767

while.cond:                                       ; preds = %if.end205, %if.then137, %if.end122
  %140 = load ptr, ptr %iterator, align 8, !dbg !1768, !tbaa !130
  %tobool128 = icmp ne ptr %140, null, !dbg !1767
  br i1 %tobool128, label %while.body, label %while.end, !dbg !1767

while.body:                                       ; preds = %while.cond
  %141 = load ptr, ptr %iterator, align 8, !dbg !1769, !tbaa !130
  %arc129 = getelementptr inbounds %struct.list_elem, ptr %141, i32 0, i32 0, !dbg !1771
  %142 = load ptr, ptr %arc129, align 8, !dbg !1771, !tbaa !1728
  store ptr %142, ptr %arcin, align 8, !dbg !1772, !tbaa !130
  %143 = load ptr, ptr %arcin, align 8, !dbg !1773, !tbaa !130
  %tail130 = getelementptr inbounds %struct.arc, ptr %143, i32 0, i32 2, !dbg !1774
  %144 = load ptr, ptr %tail130, align 8, !dbg !1774, !tbaa !850
  store ptr %144, ptr %tail, align 8, !dbg !1775, !tbaa !130
  %145 = load ptr, ptr %tail, align 8, !dbg !1776, !tbaa !130
  %time131 = getelementptr inbounds %struct.node, ptr %145, i32 0, i32 13, !dbg !1778
  %146 = load i32, ptr %time131, align 4, !dbg !1778, !tbaa !1753
  %conv132 = sext i32 %146 to i64, !dbg !1776
  %147 = load ptr, ptr %arcin, align 8, !dbg !1779, !tbaa !130
  %org_cost133 = getelementptr inbounds %struct.arc, ptr %147, i32 0, i32 8, !dbg !1780
  %148 = load i64, ptr %org_cost133, align 8, !dbg !1780, !tbaa !862
  %add134 = add nsw i64 %conv132, %148, !dbg !1781
  %149 = load i64, ptr %latest, align 8, !dbg !1782, !tbaa !143
  %cmp135 = icmp sgt i64 %add134, %149, !dbg !1783
  br i1 %cmp135, label %if.then137, label %if.end140, !dbg !1784

if.then137:                                       ; preds = %while.body
  %150 = load ptr, ptr %iterator, align 8, !dbg !1785, !tbaa !130
  %next138 = getelementptr inbounds %struct.list_elem, ptr %150, i32 0, i32 1, !dbg !1787
  %151 = load ptr, ptr %next138, align 8, !dbg !1787, !tbaa !1721
  store ptr %151, ptr %iterator, align 8, !dbg !1788, !tbaa !130
  %152 = load i64, ptr %id, align 8, !dbg !1789, !tbaa !143
  %inc139 = add nsw i64 %152, 1, !dbg !1789
  store i64 %inc139, ptr %id, align 8, !dbg !1789, !tbaa !143
  br label %while.cond, !dbg !1790, !llvm.loop !1791

if.end140:                                        ; preds = %while.body
  %153 = load i64, ptr %arc_cost, align 8, !dbg !1793, !tbaa !143
  %154 = load ptr, ptr %tail, align 8, !dbg !1794, !tbaa !130
  %potential141 = getelementptr inbounds %struct.node, ptr %154, i32 0, i32 0, !dbg !1795
  %155 = load i64, ptr %potential141, align 8, !dbg !1795, !tbaa !1762
  %sub142 = sub nsw i64 %153, %155, !dbg !1796
  %156 = load ptr, ptr %head, align 8, !dbg !1797, !tbaa !130
  %potential143 = getelementptr inbounds %struct.node, ptr %156, i32 0, i32 0, !dbg !1798
  %157 = load i64, ptr %potential143, align 8, !dbg !1798, !tbaa !1762
  %add144 = add nsw i64 %sub142, %157, !dbg !1799
  store i64 %add144, ptr %red_cost, align 8, !dbg !1800, !tbaa !143
  %158 = load i64, ptr %red_cost, align 8, !dbg !1801, !tbaa !143
  %cmp145 = icmp slt i64 %158, 0, !dbg !1803
  br i1 %cmp145, label %if.then147, label %if.end205, !dbg !1804

if.then147:                                       ; preds = %if.end140
  %159 = load ptr, ptr %new_arcs_array, align 8, !dbg !1805, !tbaa !130
  %160 = load i32, ptr %thread, align 4, !dbg !1808, !tbaa !291
  %idxprom148 = sext i32 %160 to i64, !dbg !1805
  %arrayidx149 = getelementptr inbounds i64, ptr %159, i64 %idxprom148, !dbg !1805
  %161 = load i64, ptr %arrayidx149, align 8, !dbg !1805, !tbaa !143
  %162 = load i64, ptr %max_new_par_residual_new_arcs, align 8, !dbg !1809, !tbaa !143
  %cmp150 = icmp slt i64 %161, %162, !dbg !1810
  br i1 %cmp150, label %if.then152, label %if.else159, !dbg !1811

if.then152:                                       ; preds = %if.then147
  %163 = load ptr, ptr %arcnew, align 8, !dbg !1812, !tbaa !130
  %164 = load ptr, ptr %new_arcs_array, align 8, !dbg !1814, !tbaa !130
  %165 = load i32, ptr %thread, align 4, !dbg !1815, !tbaa !291
  %idxprom153 = sext i32 %165 to i64, !dbg !1814
  %arrayidx154 = getelementptr inbounds i64, ptr %164, i64 %idxprom153, !dbg !1814
  %166 = load i64, ptr %arrayidx154, align 8, !dbg !1814, !tbaa !143
  %167 = load ptr, ptr %tail, align 8, !dbg !1816, !tbaa !130
  %168 = load ptr, ptr %head, align 8, !dbg !1817, !tbaa !130
  %169 = load i64, ptr %arc_cost, align 8, !dbg !1818, !tbaa !143
  %170 = load i64, ptr %red_cost, align 8, !dbg !1819, !tbaa !143
  %171 = load ptr, ptr %net.addr, align 8, !dbg !1820, !tbaa !130
  %m155 = getelementptr inbounds %struct.network, ptr %171, i32 0, i32 5, !dbg !1821
  %172 = load i64, ptr %m155, align 8, !dbg !1821, !tbaa !410
  %173 = load i64, ptr %id, align 8, !dbg !1822, !tbaa !143
  call void @insert_new_arc(ptr noundef %163, i64 noundef %166, ptr noundef %167, ptr noundef %168, i64 noundef %169, i64 noundef %170, i64 noundef %172, i64 noundef %173) #10, !dbg !1823
  %174 = load ptr, ptr %new_arcs_array, align 8, !dbg !1824, !tbaa !130
  %175 = load i32, ptr %thread, align 4, !dbg !1825, !tbaa !291
  %idxprom156 = sext i32 %175 to i64, !dbg !1824
  %arrayidx157 = getelementptr inbounds i64, ptr %174, i64 %idxprom156, !dbg !1824
  %176 = load i64, ptr %arrayidx157, align 8, !dbg !1826, !tbaa !143
  %inc158 = add nsw i64 %176, 1, !dbg !1826
  store i64 %inc158, ptr %arrayidx157, align 8, !dbg !1826, !tbaa !143
  br label %if.end196, !dbg !1827

if.else159:                                       ; preds = %if.then147
  %177 = load ptr, ptr %arcnew, align 8, !dbg !1828, !tbaa !130
  %arrayidx160 = getelementptr inbounds %struct.arc, ptr %177, i64 0, !dbg !1828
  %flow = getelementptr inbounds %struct.arc, ptr %arrayidx160, i32 0, i32 7, !dbg !1830
  %178 = load i64, ptr %flow, align 8, !dbg !1830, !tbaa !480
  %179 = load i64, ptr %red_cost, align 8, !dbg !1831, !tbaa !143
  %cmp161 = icmp sgt i64 %178, %179, !dbg !1832
  br i1 %cmp161, label %if.then163, label %if.else177, !dbg !1833

if.then163:                                       ; preds = %if.else159
  %180 = load i16, ptr %local_first_replace, align 2, !dbg !1834, !tbaa !292
  %tobool164 = icmp ne i16 %180, 0, !dbg !1834
  br i1 %tobool164, label %if.then165, label %if.end166, !dbg !1837

if.then165:                                       ; preds = %if.then163
  store i16 0, ptr %first_replace, align 2, !dbg !1838, !tbaa !292
  store i16 0, ptr %local_first_replace, align 2, !dbg !1840, !tbaa !292
  br label %if.end166, !dbg !1841

if.end166:                                        ; preds = %if.then165, %if.then163
  %181 = load ptr, ptr %deleted_arcs, align 8, !dbg !1842, !tbaa !130
  %182 = load i32, ptr %thread, align 4, !dbg !1843, !tbaa !291
  %idxprom167 = sext i32 %182 to i64, !dbg !1842
  %arrayidx168 = getelementptr inbounds ptr, ptr %181, i64 %idxprom167, !dbg !1842
  %183 = load ptr, ptr %arrayidx168, align 8, !dbg !1842, !tbaa !130
  %184 = load ptr, ptr %num_del_arcs, align 8, !dbg !1844, !tbaa !130
  %185 = load i32, ptr %thread, align 4, !dbg !1845, !tbaa !291
  %idxprom169 = sext i32 %185 to i64, !dbg !1844
  %arrayidx170 = getelementptr inbounds i64, ptr %184, i64 %idxprom169, !dbg !1844
  %186 = load i64, ptr %arrayidx170, align 8, !dbg !1844, !tbaa !143
  %arrayidx171 = getelementptr inbounds %struct.arc, ptr %183, i64 %186, !dbg !1842
  %187 = load ptr, ptr %arcnew, align 8, !dbg !1846, !tbaa !130
  %arrayidx172 = getelementptr inbounds %struct.arc, ptr %187, i64 0, !dbg !1846
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %arrayidx171, ptr align 8 %arrayidx172, i64 72, i1 false), !dbg !1846, !tbaa.struct !290
  %188 = load ptr, ptr %num_del_arcs, align 8, !dbg !1847, !tbaa !130
  %189 = load i32, ptr %thread, align 4, !dbg !1848, !tbaa !291
  %idxprom173 = sext i32 %189 to i64, !dbg !1847
  %arrayidx174 = getelementptr inbounds i64, ptr %188, i64 %idxprom173, !dbg !1847
  %190 = load i64, ptr %arrayidx174, align 8, !dbg !1849, !tbaa !143
  %inc175 = add nsw i64 %190, 1, !dbg !1849
  store i64 %inc175, ptr %arrayidx174, align 8, !dbg !1849, !tbaa !143
  %191 = load i64, ptr %count, align 8, !dbg !1850, !tbaa !143
  %inc176 = add nsw i64 %191, 1, !dbg !1850
  store i64 %inc176, ptr %count, align 8, !dbg !1850, !tbaa !143
  %192 = load ptr, ptr %arcnew, align 8, !dbg !1851, !tbaa !130
  %193 = load ptr, ptr %tail, align 8, !dbg !1852, !tbaa !130
  %194 = load ptr, ptr %head, align 8, !dbg !1853, !tbaa !130
  %195 = load i64, ptr %arc_cost, align 8, !dbg !1854, !tbaa !143
  %196 = load i64, ptr %red_cost, align 8, !dbg !1855, !tbaa !143
  %197 = load i64, ptr %max_new_par_residual_new_arcs, align 8, !dbg !1856, !tbaa !143
  %198 = load i64, ptr %id, align 8, !dbg !1857, !tbaa !143
  call void @replace_weaker_arc(ptr noundef %192, ptr noundef %193, ptr noundef %194, i64 noundef %195, i64 noundef %196, i64 noundef %197, i64 noundef %198) #10, !dbg !1858
  br label %if.end195, !dbg !1859

if.else177:                                       ; preds = %if.else159
  %199 = load i64, ptr %red_cost, align 8, !dbg !1860, !tbaa !143
  %200 = load i64, ptr %max_redcost, align 8, !dbg !1862, !tbaa !143
  %cmp178 = icmp slt i64 %199, %200, !dbg !1863
  br i1 %cmp178, label %if.then180, label %if.end194, !dbg !1864

if.then180:                                       ; preds = %if.else177
  %201 = load ptr, ptr %deleted_arcs, align 8, !dbg !1865, !tbaa !130
  %202 = load i32, ptr %thread, align 4, !dbg !1867, !tbaa !291
  %idxprom181 = sext i32 %202 to i64, !dbg !1865
  %arrayidx182 = getelementptr inbounds ptr, ptr %201, i64 %idxprom181, !dbg !1865
  %203 = load ptr, ptr %arrayidx182, align 8, !dbg !1865, !tbaa !130
  %204 = load ptr, ptr %num_del_arcs, align 8, !dbg !1868, !tbaa !130
  %205 = load i32, ptr %thread, align 4, !dbg !1869, !tbaa !291
  %idxprom183 = sext i32 %205 to i64, !dbg !1868
  %arrayidx184 = getelementptr inbounds i64, ptr %204, i64 %idxprom183, !dbg !1868
  %206 = load i64, ptr %arrayidx184, align 8, !dbg !1870, !tbaa !143
  %inc185 = add nsw i64 %206, 1, !dbg !1870
  store i64 %inc185, ptr %arrayidx184, align 8, !dbg !1870, !tbaa !143
  %arrayidx186 = getelementptr inbounds %struct.arc, ptr %203, i64 %206, !dbg !1865
  store ptr %arrayidx186, ptr %arc, align 8, !dbg !1871, !tbaa !130
  %207 = load ptr, ptr %tail, align 8, !dbg !1872, !tbaa !130
  %208 = load ptr, ptr %arc, align 8, !dbg !1873, !tbaa !130
  %tail187 = getelementptr inbounds %struct.arc, ptr %208, i32 0, i32 2, !dbg !1874
  store ptr %207, ptr %tail187, align 8, !dbg !1875, !tbaa !850
  %209 = load ptr, ptr %head, align 8, !dbg !1876, !tbaa !130
  %210 = load ptr, ptr %arc, align 8, !dbg !1877, !tbaa !130
  %head188 = getelementptr inbounds %struct.arc, ptr %210, i32 0, i32 3, !dbg !1878
  store ptr %209, ptr %head188, align 8, !dbg !1879, !tbaa !856
  %211 = load i64, ptr %arc_cost, align 8, !dbg !1880, !tbaa !143
  %212 = load ptr, ptr %arc, align 8, !dbg !1881, !tbaa !130
  %org_cost189 = getelementptr inbounds %struct.arc, ptr %212, i32 0, i32 8, !dbg !1882
  store i64 %211, ptr %org_cost189, align 8, !dbg !1883, !tbaa !862
  %213 = load i64, ptr %arc_cost, align 8, !dbg !1884, !tbaa !143
  %214 = load ptr, ptr %arc, align 8, !dbg !1885, !tbaa !130
  %cost = getelementptr inbounds %struct.arc, ptr %214, i32 0, i32 1, !dbg !1886
  store i64 %213, ptr %cost, align 8, !dbg !1887, !tbaa !868
  %215 = load i64, ptr %red_cost, align 8, !dbg !1888, !tbaa !143
  %216 = load ptr, ptr %arc, align 8, !dbg !1889, !tbaa !130
  %flow190 = getelementptr inbounds %struct.arc, ptr %216, i32 0, i32 7, !dbg !1890
  store i64 %215, ptr %flow190, align 8, !dbg !1891, !tbaa !480
  %217 = load i64, ptr %id, align 8, !dbg !1892, !tbaa !143
  %conv191 = trunc i64 %217 to i32, !dbg !1892
  %218 = load ptr, ptr %arc, align 8, !dbg !1893, !tbaa !130
  %id192 = getelementptr inbounds %struct.arc, ptr %218, i32 0, i32 0, !dbg !1894
  store i32 %conv191, ptr %id192, align 8, !dbg !1895, !tbaa !172
  %219 = load i64, ptr %count, align 8, !dbg !1896, !tbaa !143
  %inc193 = add nsw i64 %219, 1, !dbg !1896
  store i64 %inc193, ptr %count, align 8, !dbg !1896, !tbaa !143
  br label %if.end194, !dbg !1897

if.end194:                                        ; preds = %if.then180, %if.else177
  br label %if.end195

if.end195:                                        ; preds = %if.end194, %if.end166
  br label %if.end196

if.end196:                                        ; preds = %if.end195, %if.then152
  %220 = load ptr, ptr %num_del_arcs, align 8, !dbg !1898, !tbaa !130
  %221 = load i32, ptr %thread, align 4, !dbg !1900, !tbaa !291
  %idxprom197 = sext i32 %221 to i64, !dbg !1898
  %arrayidx198 = getelementptr inbounds i64, ptr %220, i64 %idxprom197, !dbg !1898
  %222 = load i64, ptr %arrayidx198, align 8, !dbg !1898, !tbaa !143
  %223 = load i64, ptr %size_del, align 8, !dbg !1901, !tbaa !143
  %cmp199 = icmp eq i64 %222, %223, !dbg !1902
  br i1 %cmp199, label %if.then201, label %if.end204, !dbg !1903

if.then201:                                       ; preds = %if.end196
  %224 = load ptr, ptr %num_del_arcs, align 8, !dbg !1904, !tbaa !130
  %225 = load i32, ptr %thread, align 4, !dbg !1906, !tbaa !291
  %idxprom202 = sext i32 %225 to i64, !dbg !1904
  %arrayidx203 = getelementptr inbounds i64, ptr %224, i64 %idxprom202, !dbg !1904
  store i64 0, ptr %arrayidx203, align 8, !dbg !1907, !tbaa !143
  br label %if.end204, !dbg !1908

if.end204:                                        ; preds = %if.then201, %if.end196
  br label %if.end205, !dbg !1909

if.end205:                                        ; preds = %if.end204, %if.end140
  %226 = load ptr, ptr %iterator, align 8, !dbg !1910, !tbaa !130
  %next206 = getelementptr inbounds %struct.list_elem, ptr %226, i32 0, i32 1, !dbg !1911
  %227 = load ptr, ptr %next206, align 8, !dbg !1911, !tbaa !1721
  store ptr %227, ptr %iterator, align 8, !dbg !1912, !tbaa !130
  %228 = load i64, ptr %id, align 8, !dbg !1913, !tbaa !143
  %inc207 = add nsw i64 %228, 1, !dbg !1913
  store i64 %inc207, ptr %id, align 8, !dbg !1913, !tbaa !143
  br label %while.cond, !dbg !1767, !llvm.loop !1791

while.end:                                        ; preds = %while.cond
  br label %for.inc208, !dbg !1914

for.inc208:                                       ; preds = %while.end, %if.then120
  %229 = load i64, ptr %i, align 8, !dbg !1915, !tbaa !143
  %inc209 = add nsw i64 %229, 1, !dbg !1915
  store i64 %inc209, ptr %i, align 8, !dbg !1915, !tbaa !143
  %230 = load ptr, ptr %arcout, align 8, !dbg !1916, !tbaa !130
  %add.ptr210 = getelementptr inbounds %struct.arc, ptr %230, i64 3, !dbg !1916
  store ptr %add.ptr210, ptr %arcout, align 8, !dbg !1916, !tbaa !130
  br label %for.cond82, !dbg !1917, !llvm.loop !1918

for.end211:                                       ; preds = %for.cond82
  %231 = load i64, ptr %count, align 8, !dbg !1920, !tbaa !143
  %232 = load ptr, ptr %num_del_arcs, align 8, !dbg !1921, !tbaa !130
  %233 = load i32, ptr %thread, align 4, !dbg !1922, !tbaa !291
  %idxprom212 = sext i32 %233 to i64, !dbg !1921
  %arrayidx213 = getelementptr inbounds i64, ptr %232, i64 %idxprom212, !dbg !1921
  store i64 %231, ptr %arrayidx213, align 8, !dbg !1923, !tbaa !143
  br label %while.cond214, !dbg !1924

while.cond214:                                    ; preds = %if.end220, %for.end211
  %234 = load i16, ptr %first_replace, align 2, !dbg !1925, !tbaa !292
  %tobool215 = icmp ne i16 %234, 0, !dbg !1926
  %lnot = xor i1 %tobool215, true, !dbg !1926
  br i1 %lnot, label %while.body216, label %while.end221, !dbg !1924

while.body216:                                    ; preds = %while.cond214
  store i16 1, ptr %first_replace, align 2, !dbg !1927, !tbaa !292
  %235 = load ptr, ptr %net.addr, align 8, !dbg !1929, !tbaa !130
  %236 = load ptr, ptr %num_del_arcs, align 8, !dbg !1930, !tbaa !130
  %237 = load ptr, ptr %deleted_arcs, align 8, !dbg !1931, !tbaa !130
  %238 = load ptr, ptr %arcnew, align 8, !dbg !1932, !tbaa !130
  %239 = load i32, ptr %thread, align 4, !dbg !1933, !tbaa !291
  %240 = load i64, ptr %max_new_par_residual_new_arcs, align 8, !dbg !1934, !tbaa !143
  %241 = load i64, ptr %size_del, align 8, !dbg !1935, !tbaa !143
  %242 = load i64, ptr %num_threads, align 8, !dbg !1936, !tbaa !143
  %call217 = call i64 @switch_arcs(ptr noundef %235, ptr noundef %236, ptr noundef %237, ptr noundef %238, i32 noundef %239, i64 noundef %240, i64 noundef %241, i64 noundef %242) #10, !dbg !1937
  store i64 %call217, ptr %count, align 8, !dbg !1938, !tbaa !143
  %243 = load i64, ptr %count, align 8, !dbg !1939, !tbaa !143
  %tobool218 = icmp ne i64 %243, 0, !dbg !1939
  br i1 %tobool218, label %if.then219, label %if.end220, !dbg !1941

if.then219:                                       ; preds = %while.body216
  store i16 0, ptr %first_replace, align 2, !dbg !1942, !tbaa !292
  br label %if.end220, !dbg !1943

if.end220:                                        ; preds = %if.then219, %while.body216
  br label %while.cond214, !dbg !1924, !llvm.loop !1944

while.end221:                                     ; preds = %while.cond214
  br label %while.cond222, !dbg !1946

while.cond222:                                    ; preds = %while.body225, %while.end221
  %244 = load ptr, ptr %first_list_elem, align 8, !dbg !1947, !tbaa !130
  %next223 = getelementptr inbounds %struct.list_elem, ptr %244, i32 0, i32 1, !dbg !1948
  %245 = load ptr, ptr %next223, align 8, !dbg !1948, !tbaa !1721
  %tobool224 = icmp ne ptr %245, null, !dbg !1946
  br i1 %tobool224, label %while.body225, label %while.end227, !dbg !1946

while.body225:                                    ; preds = %while.cond222
  %246 = load ptr, ptr %first_list_elem, align 8, !dbg !1949, !tbaa !130
  store ptr %246, ptr %new_list_elem, align 8, !dbg !1951, !tbaa !130
  %247 = load ptr, ptr %first_list_elem, align 8, !dbg !1952, !tbaa !130
  %next226 = getelementptr inbounds %struct.list_elem, ptr %247, i32 0, i32 1, !dbg !1953
  %248 = load ptr, ptr %next226, align 8, !dbg !1953, !tbaa !1721
  store ptr %248, ptr %first_list_elem, align 8, !dbg !1954, !tbaa !130
  %249 = load ptr, ptr %new_list_elem, align 8, !dbg !1955, !tbaa !130
  call void @free(ptr noundef %249) #12, !dbg !1956
  br label %while.cond222, !dbg !1946, !llvm.loop !1957

while.end227:                                     ; preds = %while.cond222
  %250 = load ptr, ptr %first_list_elem, align 8, !dbg !1959, !tbaa !130
  call void @free(ptr noundef %250) #12, !dbg !1960
  %251 = load ptr, ptr %arcs_pointer_sorted, align 8, !dbg !1961, !tbaa !130
  %252 = load i32, ptr %thread, align 4, !dbg !1962, !tbaa !291
  %idxprom228 = sext i32 %252 to i64, !dbg !1961
  %arrayidx229 = getelementptr inbounds ptr, ptr %251, i64 %idxprom228, !dbg !1961
  %253 = load ptr, ptr %arrayidx229, align 8, !dbg !1961, !tbaa !130
  %254 = load ptr, ptr %new_arcs_array, align 8, !dbg !1963, !tbaa !130
  %255 = load i32, ptr %thread, align 4, !dbg !1964, !tbaa !291
  %idxprom230 = sext i32 %255 to i64, !dbg !1963
  %arrayidx231 = getelementptr inbounds i64, ptr %254, i64 %idxprom230, !dbg !1963
  %256 = load i64, ptr %arrayidx231, align 8, !dbg !1963, !tbaa !143
  call void @spec_qsort(ptr noundef %253, i64 noundef %256, i64 noundef 8, ptr noundef @arc_compare) #10, !dbg !1965
  %257 = load ptr, ptr %net.addr, align 8, !dbg !1966, !tbaa !130
  %258 = load ptr, ptr %new_arcs_array, align 8, !dbg !1968, !tbaa !130
  %259 = load ptr, ptr %arcs_pointer_sorted, align 8, !dbg !1969, !tbaa !130
  call void @marc_arcs(ptr noundef %257, ptr noundef %new_arcs, ptr noundef %258, ptr noundef %259) #10, !dbg !1970
  %260 = load ptr, ptr %arcs_pointer_sorted, align 8, !dbg !1971, !tbaa !130
  %261 = load i32, ptr %thread, align 4, !dbg !1972, !tbaa !291
  %idxprom232 = sext i32 %261 to i64, !dbg !1971
  %arrayidx233 = getelementptr inbounds ptr, ptr %260, i64 %idxprom232, !dbg !1971
  %262 = load ptr, ptr %arrayidx233, align 8, !dbg !1971, !tbaa !130
  call void @free(ptr noundef %262) #12, !dbg !1973
  %263 = load ptr, ptr %new_arcs_array, align 8, !dbg !1974, !tbaa !130
  %264 = load i32, ptr %thread, align 4, !dbg !1976, !tbaa !291
  %idxprom234 = sext i32 %264 to i64, !dbg !1974
  %arrayidx235 = getelementptr inbounds i64, ptr %263, i64 %idxprom234, !dbg !1974
  %265 = load i64, ptr %arrayidx235, align 8, !dbg !1974, !tbaa !143
  %tobool236 = icmp ne i64 %265, 0, !dbg !1974
  br i1 %tobool236, label %if.then237, label %if.end290, !dbg !1977

if.then237:                                       ; preds = %while.end227
  %266 = load ptr, ptr %net.addr, align 8, !dbg !1978, !tbaa !130
  %stop_arcs238 = getelementptr inbounds %struct.network, ptr %266, i32 0, i32 24, !dbg !1980
  %267 = load ptr, ptr %stop_arcs238, align 8, !dbg !1980, !tbaa !315
  %268 = load i32, ptr %thread, align 4, !dbg !1981, !tbaa !291
  %conv239 = sext i32 %268 to i64, !dbg !1981
  %269 = load i64, ptr %max_new_par_residual_new_arcs, align 8, !dbg !1982, !tbaa !143
  %mul240 = mul nsw i64 %conv239, %269, !dbg !1983
  %add.ptr241 = getelementptr inbounds %struct.arc, ptr %267, i64 %mul240, !dbg !1984
  store ptr %add.ptr241, ptr %arcnew, align 8, !dbg !1985, !tbaa !130
  %270 = load ptr, ptr %arcnew, align 8, !dbg !1986, !tbaa !130
  %271 = load ptr, ptr %new_arcs_array, align 8, !dbg !1987, !tbaa !130
  %272 = load i32, ptr %thread, align 4, !dbg !1988, !tbaa !291
  %idxprom242 = sext i32 %272 to i64, !dbg !1987
  %arrayidx243 = getelementptr inbounds i64, ptr %271, i64 %idxprom242, !dbg !1987
  %273 = load i64, ptr %arrayidx243, align 8, !dbg !1987, !tbaa !143
  %add.ptr244 = getelementptr inbounds %struct.arc, ptr %270, i64 %273, !dbg !1989
  store ptr %add.ptr244, ptr %stop, align 8, !dbg !1990, !tbaa !130
  %274 = load i64, ptr %resized, align 8, !dbg !1991, !tbaa !143
  %tobool245 = icmp ne i64 %274, 0, !dbg !1991
  br i1 %tobool245, label %if.then246, label %if.else264, !dbg !1993

if.then246:                                       ; preds = %if.then237
  br label %for.cond247, !dbg !1994

for.cond247:                                      ; preds = %for.inc262, %if.then246
  %275 = load ptr, ptr %arcnew, align 8, !dbg !1996, !tbaa !130
  %276 = load ptr, ptr %stop, align 8, !dbg !1999, !tbaa !130
  %cmp248 = icmp ne ptr %275, %276, !dbg !2000
  br i1 %cmp248, label %for.body250, label %for.end263, !dbg !2001

for.body250:                                      ; preds = %for.cond247
  %277 = load ptr, ptr %arcnew, align 8, !dbg !2002, !tbaa !130
  %flow251 = getelementptr inbounds %struct.arc, ptr %277, i32 0, i32 7, !dbg !2005
  %278 = load i64, ptr %flow251, align 8, !dbg !2005, !tbaa !480
  %cmp252 = icmp eq i64 %278, 1, !dbg !2006
  br i1 %cmp252, label %if.then254, label %if.end261, !dbg !2007

if.then254:                                       ; preds = %for.body250
  %279 = load ptr, ptr %arcnew, align 8, !dbg !2008, !tbaa !130
  %flow255 = getelementptr inbounds %struct.arc, ptr %279, i32 0, i32 7, !dbg !2010
  store i64 0, ptr %flow255, align 8, !dbg !2011, !tbaa !480
  %280 = load ptr, ptr %arcnew, align 8, !dbg !2012, !tbaa !130
  %ident256 = getelementptr inbounds %struct.arc, ptr %280, i32 0, i32 4, !dbg !2013
  store i16 1, ptr %ident256, align 8, !dbg !2014, !tbaa !1299
  %281 = load ptr, ptr %sorted_array, align 8, !dbg !2015, !tbaa !130
  %282 = load ptr, ptr %net.addr, align 8, !dbg !2016, !tbaa !130
  %283 = load ptr, ptr %arcnew, align 8, !dbg !2017, !tbaa !130
  %id257 = getelementptr inbounds %struct.arc, ptr %283, i32 0, i32 0, !dbg !2018
  %284 = load i32, ptr %id257, align 8, !dbg !2018, !tbaa !172
  %conv258 = sext i32 %284 to i64, !dbg !2017
  %call259 = call i64 @getArcPosition(ptr noundef %282, i64 noundef %conv258) #10, !dbg !2019
  %arrayidx260 = getelementptr inbounds %struct.arc, ptr %281, i64 %call259, !dbg !2015
  %285 = load ptr, ptr %arcnew, align 8, !dbg !2020, !tbaa !130
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %arrayidx260, ptr align 8 %285, i64 72, i1 false), !dbg !2021, !tbaa.struct !290
  br label %if.end261, !dbg !2022

if.end261:                                        ; preds = %if.then254, %for.body250
  br label %for.inc262, !dbg !2023

for.inc262:                                       ; preds = %if.end261
  %286 = load ptr, ptr %arcnew, align 8, !dbg !2024, !tbaa !130
  %incdec.ptr = getelementptr inbounds %struct.arc, ptr %286, i32 1, !dbg !2024
  store ptr %incdec.ptr, ptr %arcnew, align 8, !dbg !2024, !tbaa !130
  br label %for.cond247, !dbg !2025, !llvm.loop !2026

for.end263:                                       ; preds = %for.cond247
  br label %if.end289, !dbg !2028

if.else264:                                       ; preds = %if.then237
  br label %for.cond265, !dbg !2029

for.cond265:                                      ; preds = %for.inc286, %if.else264
  %287 = load ptr, ptr %arcnew, align 8, !dbg !2031, !tbaa !130
  %288 = load ptr, ptr %stop, align 8, !dbg !2034, !tbaa !130
  %cmp266 = icmp ne ptr %287, %288, !dbg !2035
  br i1 %cmp266, label %for.body268, label %for.end288, !dbg !2036

for.body268:                                      ; preds = %for.cond265
  %289 = load ptr, ptr %arcnew, align 8, !dbg !2037, !tbaa !130
  %flow269 = getelementptr inbounds %struct.arc, ptr %289, i32 0, i32 7, !dbg !2040
  %290 = load i64, ptr %flow269, align 8, !dbg !2040, !tbaa !480
  %cmp270 = icmp eq i64 %290, 1, !dbg !2041
  br i1 %cmp270, label %if.then272, label %if.end285, !dbg !2042

if.then272:                                       ; preds = %for.body268
  %291 = load ptr, ptr %arcnew, align 8, !dbg !2043, !tbaa !130
  %flow273 = getelementptr inbounds %struct.arc, ptr %291, i32 0, i32 7, !dbg !2045
  store i64 0, ptr %flow273, align 8, !dbg !2046, !tbaa !480
  %292 = load ptr, ptr %arcnew, align 8, !dbg !2047, !tbaa !130
  %ident274 = getelementptr inbounds %struct.arc, ptr %292, i32 0, i32 4, !dbg !2048
  store i16 1, ptr %ident274, align 8, !dbg !2049, !tbaa !1299
  %293 = load ptr, ptr %arcnew, align 8, !dbg !2050, !tbaa !130
  %tail275 = getelementptr inbounds %struct.arc, ptr %293, i32 0, i32 2, !dbg !2051
  %294 = load ptr, ptr %tail275, align 8, !dbg !2051, !tbaa !850
  %firstout = getelementptr inbounds %struct.node, ptr %294, i32 0, i32 7, !dbg !2052
  %295 = load ptr, ptr %firstout, align 8, !dbg !2052, !tbaa !208
  %296 = load ptr, ptr %arcnew, align 8, !dbg !2053, !tbaa !130
  %nextout = getelementptr inbounds %struct.arc, ptr %296, i32 0, i32 5, !dbg !2054
  store ptr %295, ptr %nextout, align 8, !dbg !2055, !tbaa !2056
  %297 = load ptr, ptr %arcnew, align 8, !dbg !2057, !tbaa !130
  %298 = load ptr, ptr %arcnew, align 8, !dbg !2058, !tbaa !130
  %tail276 = getelementptr inbounds %struct.arc, ptr %298, i32 0, i32 2, !dbg !2059
  %299 = load ptr, ptr %tail276, align 8, !dbg !2059, !tbaa !850
  %firstout277 = getelementptr inbounds %struct.node, ptr %299, i32 0, i32 7, !dbg !2060
  store ptr %297, ptr %firstout277, align 8, !dbg !2061, !tbaa !208
  %300 = load ptr, ptr %arcnew, align 8, !dbg !2062, !tbaa !130
  %head278 = getelementptr inbounds %struct.arc, ptr %300, i32 0, i32 3, !dbg !2063
  %301 = load ptr, ptr %head278, align 8, !dbg !2063, !tbaa !856
  %firstin = getelementptr inbounds %struct.node, ptr %301, i32 0, i32 8, !dbg !2064
  %302 = load ptr, ptr %firstin, align 8, !dbg !2064, !tbaa !189
  %303 = load ptr, ptr %arcnew, align 8, !dbg !2065, !tbaa !130
  %nextin = getelementptr inbounds %struct.arc, ptr %303, i32 0, i32 6, !dbg !2066
  store ptr %302, ptr %nextin, align 8, !dbg !2067, !tbaa !2068
  %304 = load ptr, ptr %arcnew, align 8, !dbg !2069, !tbaa !130
  %305 = load ptr, ptr %arcnew, align 8, !dbg !2070, !tbaa !130
  %head279 = getelementptr inbounds %struct.arc, ptr %305, i32 0, i32 3, !dbg !2071
  %306 = load ptr, ptr %head279, align 8, !dbg !2071, !tbaa !856
  %firstin280 = getelementptr inbounds %struct.node, ptr %306, i32 0, i32 8, !dbg !2072
  store ptr %304, ptr %firstin280, align 8, !dbg !2073, !tbaa !189
  %307 = load ptr, ptr %sorted_array, align 8, !dbg !2074, !tbaa !130
  %308 = load ptr, ptr %net.addr, align 8, !dbg !2075, !tbaa !130
  %309 = load ptr, ptr %arcnew, align 8, !dbg !2076, !tbaa !130
  %id281 = getelementptr inbounds %struct.arc, ptr %309, i32 0, i32 0, !dbg !2077
  %310 = load i32, ptr %id281, align 8, !dbg !2077, !tbaa !172
  %conv282 = sext i32 %310 to i64, !dbg !2076
  %call283 = call i64 @getArcPosition(ptr noundef %308, i64 noundef %conv282) #10, !dbg !2078
  %arrayidx284 = getelementptr inbounds %struct.arc, ptr %307, i64 %call283, !dbg !2074
  %311 = load ptr, ptr %arcnew, align 8, !dbg !2079, !tbaa !130
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %arrayidx284, ptr align 8 %311, i64 72, i1 false), !dbg !2080, !tbaa.struct !290
  br label %if.end285, !dbg !2081

if.end285:                                        ; preds = %if.then272, %for.body268
  br label %for.inc286, !dbg !2082

for.inc286:                                       ; preds = %if.end285
  %312 = load ptr, ptr %arcnew, align 8, !dbg !2083, !tbaa !130
  %incdec.ptr287 = getelementptr inbounds %struct.arc, ptr %312, i32 1, !dbg !2083
  store ptr %incdec.ptr287, ptr %arcnew, align 8, !dbg !2083, !tbaa !130
  br label %for.cond265, !dbg !2084, !llvm.loop !2085

for.end288:                                       ; preds = %for.cond265
  br label %if.end289

if.end289:                                        ; preds = %for.end288, %for.end263
  br label %if.end290, !dbg !2087

if.end290:                                        ; preds = %if.end289, %while.end227
  %313 = load i64, ptr %new_arcs, align 8, !dbg !2088, !tbaa !143
  %314 = load ptr, ptr %net.addr, align 8, !dbg !2089, !tbaa !130
  %m_impl = getelementptr inbounds %struct.network, ptr %314, i32 0, i32 7, !dbg !2090
  %315 = load i64, ptr %m_impl, align 8, !dbg !2091, !tbaa !2092
  %add291 = add nsw i64 %315, %313, !dbg !2091
  store i64 %add291, ptr %m_impl, align 8, !dbg !2091, !tbaa !2092
  %316 = load i64, ptr %new_arcs, align 8, !dbg !2093, !tbaa !143
  %317 = load ptr, ptr %net.addr, align 8, !dbg !2094, !tbaa !130
  %max_residual_new_m292 = getelementptr inbounds %struct.network, ptr %317, i32 0, i32 8, !dbg !2095
  %318 = load i64, ptr %max_residual_new_m292, align 8, !dbg !2096, !tbaa !372
  %sub293 = sub nsw i64 %318, %316, !dbg !2096
  store i64 %sub293, ptr %max_residual_new_m292, align 8, !dbg !2096, !tbaa !372
  %319 = load ptr, ptr %net.addr, align 8, !dbg !2097, !tbaa !130
  %320 = load ptr, ptr %net.addr, align 8, !dbg !2098, !tbaa !130
  %m294 = getelementptr inbounds %struct.network, ptr %320, i32 0, i32 5, !dbg !2099
  %321 = load i64, ptr %m294, align 8, !dbg !2099, !tbaa !410
  %call295 = call i64 @refreshPositions(ptr noundef %319, ptr noundef @getArcPosition, i64 noundef %321) #10, !dbg !2100
  %322 = load ptr, ptr %net.addr, align 8, !dbg !2101, !tbaa !130
  %m296 = getelementptr inbounds %struct.network, ptr %322, i32 0, i32 5, !dbg !2102
  %323 = load i64, ptr %m296, align 8, !dbg !2102, !tbaa !410
  %324 = load i64, ptr %new_arcs, align 8, !dbg !2103, !tbaa !143
  %add297 = add nsw i64 %323, %324, !dbg !2104
  %325 = load ptr, ptr %net.addr, align 8, !dbg !2105, !tbaa !130
  %m298 = getelementptr inbounds %struct.network, ptr %325, i32 0, i32 5, !dbg !2106
  store i64 %add297, ptr %m298, align 8, !dbg !2107, !tbaa !410
  %326 = load ptr, ptr %net.addr, align 8, !dbg !2108, !tbaa !130
  %arcs299 = getelementptr inbounds %struct.network, ptr %326, i32 0, i32 23, !dbg !2109
  %327 = load ptr, ptr %arcs299, align 8, !dbg !2109, !tbaa !271
  %328 = load ptr, ptr %net.addr, align 8, !dbg !2110, !tbaa !130
  %m300 = getelementptr inbounds %struct.network, ptr %328, i32 0, i32 5, !dbg !2111
  %329 = load i64, ptr %m300, align 8, !dbg !2111, !tbaa !410
  %add.ptr301 = getelementptr inbounds %struct.arc, ptr %327, i64 %329, !dbg !2112
  %330 = load ptr, ptr %net.addr, align 8, !dbg !2113, !tbaa !130
  %stop_arcs302 = getelementptr inbounds %struct.network, ptr %330, i32 0, i32 24, !dbg !2114
  store ptr %add.ptr301, ptr %stop_arcs302, align 8, !dbg !2115, !tbaa !315
  %331 = load ptr, ptr %new_arcs_array, align 8, !dbg !2116, !tbaa !130
  call void @free(ptr noundef %331) #12, !dbg !2117
  %332 = load ptr, ptr %num_del_arcs, align 8, !dbg !2118, !tbaa !130
  call void @free(ptr noundef %332) #12, !dbg !2119
  %333 = load ptr, ptr %arcs_pointer_sorted, align 8, !dbg !2120, !tbaa !130
  call void @free(ptr noundef %333) #12, !dbg !2121
  %334 = load ptr, ptr %deleted_arcs, align 8, !dbg !2122, !tbaa !130
  call void @free(ptr noundef %334) #12, !dbg !2123
  %335 = load i64, ptr %new_arcs, align 8, !dbg !2124, !tbaa !143
  store i64 %335, ptr %retval, align 8, !dbg !2125
  store i32 1, ptr %cleanup.dest.slot, align 4
  br label %cleanup, !dbg !2125

cleanup:                                          ; preds = %if.end290, %if.then47, %if.then37, %if.then18
  call void @llvm.lifetime.end.p0(i64 8, ptr %num_threads) #9, !dbg !2126
  call void @llvm.lifetime.end.p0(i64 8, ptr %head) #9, !dbg !2126
  call void @llvm.lifetime.end.p0(i64 8, ptr %tail) #9, !dbg !2126
  call void @llvm.lifetime.end.p0(i64 8, ptr %arc) #9, !dbg !2126
  call void @llvm.lifetime.end.p0(i64 8, ptr %sorted_array) #9, !dbg !2126
  call void @llvm.lifetime.end.p0(i64 8, ptr %stop) #9, !dbg !2126
  call void @llvm.lifetime.end.p0(i64 8, ptr %arcnew) #9, !dbg !2126
  call void @llvm.lifetime.end.p0(i64 8, ptr %arcin) #9, !dbg !2126
  call void @llvm.lifetime.end.p0(i64 8, ptr %arcout) #9, !dbg !2126
  call void @llvm.lifetime.end.p0(i64 8, ptr %bigM_minus_min_impl_duration) #9, !dbg !2126
  call void @llvm.lifetime.end.p0(i64 8, ptr %red_cost) #9, !dbg !2126
  call void @llvm.lifetime.end.p0(i64 8, ptr %arc_cost) #9, !dbg !2126
  call void @llvm.lifetime.end.p0(i64 8, ptr %head_potential) #9, !dbg !2126
  call void @llvm.lifetime.end.p0(i64 8, ptr %bigM) #9, !dbg !2126
  call void @llvm.lifetime.end.p0(i64 8, ptr %iterator) #9, !dbg !2126
  call void @llvm.lifetime.end.p0(i64 8, ptr %new_list_elem) #9, !dbg !2126
  call void @llvm.lifetime.end.p0(i64 8, ptr %first_list_elem) #9, !dbg !2126
  call void @llvm.lifetime.end.p0(i64 8, ptr %size_del) #9, !dbg !2126
  call void @llvm.lifetime.end.p0(i64 8, ptr %num_switch_iterations) #9, !dbg !2126
  call void @llvm.lifetime.end.p0(i64 8, ptr %count) #9, !dbg !2126
  call void @llvm.lifetime.end.p0(i64 2, ptr %local_first_replace) #9, !dbg !2126
  call void @llvm.lifetime.end.p0(i64 2, ptr %first_replace) #9, !dbg !2126
  call void @llvm.lifetime.end.p0(i64 8, ptr %max_redcost) #9, !dbg !2126
  call void @llvm.lifetime.end.p0(i64 8, ptr %deleted_arcs) #9, !dbg !2126
  call void @llvm.lifetime.end.p0(i64 8, ptr %arcs_pointer_sorted) #9, !dbg !2126
  call void @llvm.lifetime.end.p0(i64 8, ptr %num_del_arcs) #9, !dbg !2126
  call void @llvm.lifetime.end.p0(i64 8, ptr %list_size) #9, !dbg !2126
  call void @llvm.lifetime.end.p0(i64 8, ptr %id) #9, !dbg !2126
  call void @llvm.lifetime.end.p0(i64 8, ptr %new_arcs_array) #9, !dbg !2126
  call void @llvm.lifetime.end.p0(i64 4, ptr %thread) #9, !dbg !2126
  call void @llvm.lifetime.end.p0(i64 8, ptr %max_new_par_residual_new_arcs) #9, !dbg !2126
  call void @llvm.lifetime.end.p0(i64 8, ptr %min_impl_duration) #9, !dbg !2126
  call void @llvm.lifetime.end.p0(i64 8, ptr %latest) #9, !dbg !2126
  call void @llvm.lifetime.end.p0(i64 8, ptr %resized) #9, !dbg !2126
  call void @llvm.lifetime.end.p0(i64 8, ptr %new_arcs) #9, !dbg !2126
  call void @llvm.lifetime.end.p0(i64 8, ptr %trips) #9, !dbg !2126
  call void @llvm.lifetime.end.p0(i64 8, ptr %i) #9, !dbg !2126
  %336 = load i64, ptr %retval, align 8, !dbg !2126
  ret i64 %336, !dbg !2126
}

; Function Attrs: minsize optsize
declare !dbg !2127 void @refresh_neighbour_lists(ptr noundef, ptr noundef) #7

; Function Attrs: minsize optsize
declare i64 @getOriginalArcPosition(ptr noundef, i64 noundef) #7

; Function Attrs: minsize nounwind optsize allocsize(0,1)
declare !dbg !2131 noalias ptr @calloc(i64 noundef, i64 noundef) #8

; Function Attrs: minsize optsize
declare !dbg !2134 void @spec_qsort(ptr noundef, i64 noundef, i64 noundef, ptr noundef) #7

; Function Attrs: minsize optsize
declare !dbg !2138 i64 @getArcPosition(ptr noundef, i64 noundef) #7

; Function Attrs: minsize nounwind optsize uwtable
define dso_local i64 @suspend_impl(ptr noundef %net, i64 noundef %threshold, i64 noundef %all) #0 !dbg !2139 {
entry:
  %net.addr = alloca ptr, align 8
  %threshold.addr = alloca i64, align 8
  %all.addr = alloca i64, align 8
  %susp = alloca i64, align 8
  %red_cost = alloca i64, align 8
  %arc = alloca ptr, align 8
  %stop = alloca i64, align 8
  %startid = alloca i64, align 8
  store ptr %net, ptr %net.addr, align 8, !tbaa !130
  call void @llvm.dbg.declare(metadata ptr %net.addr, metadata !2143, metadata !DIExpression()), !dbg !2151
  store i64 %threshold, ptr %threshold.addr, align 8, !tbaa !143
  call void @llvm.dbg.declare(metadata ptr %threshold.addr, metadata !2144, metadata !DIExpression()), !dbg !2152
  store i64 %all, ptr %all.addr, align 8, !tbaa !143
  call void @llvm.dbg.declare(metadata ptr %all.addr, metadata !2145, metadata !DIExpression()), !dbg !2153
  call void @llvm.lifetime.start.p0(i64 8, ptr %susp) #9, !dbg !2154
  call void @llvm.dbg.declare(metadata ptr %susp, metadata !2146, metadata !DIExpression()), !dbg !2155
  call void @llvm.lifetime.start.p0(i64 8, ptr %red_cost) #9, !dbg !2156
  call void @llvm.dbg.declare(metadata ptr %red_cost, metadata !2147, metadata !DIExpression()), !dbg !2157
  call void @llvm.lifetime.start.p0(i64 8, ptr %arc) #9, !dbg !2158
  call void @llvm.dbg.declare(metadata ptr %arc, metadata !2148, metadata !DIExpression()), !dbg !2159
  call void @llvm.lifetime.start.p0(i64 8, ptr %stop) #9, !dbg !2160
  call void @llvm.dbg.declare(metadata ptr %stop, metadata !2149, metadata !DIExpression()), !dbg !2161
  call void @llvm.lifetime.start.p0(i64 8, ptr %startid) #9, !dbg !2160
  call void @llvm.dbg.declare(metadata ptr %startid, metadata !2150, metadata !DIExpression()), !dbg !2162
  %0 = load ptr, ptr %net.addr, align 8, !dbg !2163, !tbaa !130
  %max_elems = getelementptr inbounds %struct.network, ptr %0, i32 0, i32 32, !dbg !2164
  store i64 4000, ptr %max_elems, align 8, !dbg !2165, !tbaa !513
  %1 = load ptr, ptr %net.addr, align 8, !dbg !2166, !tbaa !130
  %m = getelementptr inbounds %struct.network, ptr %1, i32 0, i32 5, !dbg !2167
  %2 = load i64, ptr %m, align 8, !dbg !2167, !tbaa !410
  %sub = sub nsw i64 %2, 1, !dbg !2168
  %div = sdiv i64 %sub, 4000, !dbg !2169
  %add = add nsw i64 %div, 1, !dbg !2170
  %3 = load ptr, ptr %net.addr, align 8, !dbg !2171, !tbaa !130
  %nr_group = getelementptr inbounds %struct.network, ptr %3, i32 0, i32 30, !dbg !2172
  store i64 %add, ptr %nr_group, align 8, !dbg !2173, !tbaa !525
  %4 = load ptr, ptr %net.addr, align 8, !dbg !2174, !tbaa !130
  %nr_group1 = getelementptr inbounds %struct.network, ptr %4, i32 0, i32 30, !dbg !2175
  %5 = load i64, ptr %nr_group1, align 8, !dbg !2175, !tbaa !525
  %6 = load ptr, ptr %net.addr, align 8, !dbg !2176, !tbaa !130
  %m2 = getelementptr inbounds %struct.network, ptr %6, i32 0, i32 5, !dbg !2177
  %7 = load i64, ptr %m2, align 8, !dbg !2177, !tbaa !410
  %rem = srem i64 %7, 4000, !dbg !2178
  %sub3 = sub nsw i64 4000, %rem, !dbg !2179
  %sub4 = sub nsw i64 %5, %sub3, !dbg !2180
  %8 = load ptr, ptr %net.addr, align 8, !dbg !2181, !tbaa !130
  %full_groups = getelementptr inbounds %struct.network, ptr %8, i32 0, i32 31, !dbg !2182
  store i64 %sub4, ptr %full_groups, align 8, !dbg !2183, !tbaa !548
  br label %while.cond, !dbg !2184

while.cond:                                       ; preds = %while.body, %entry
  %9 = load ptr, ptr %net.addr, align 8, !dbg !2185, !tbaa !130
  %full_groups5 = getelementptr inbounds %struct.network, ptr %9, i32 0, i32 31, !dbg !2186
  %10 = load i64, ptr %full_groups5, align 8, !dbg !2186, !tbaa !548
  %cmp = icmp slt i64 %10, 0, !dbg !2187
  br i1 %cmp, label %while.body, label %while.end, !dbg !2184

while.body:                                       ; preds = %while.cond
  %11 = load ptr, ptr %net.addr, align 8, !dbg !2188, !tbaa !130
  %nr_group6 = getelementptr inbounds %struct.network, ptr %11, i32 0, i32 30, !dbg !2190
  %12 = load i64, ptr %nr_group6, align 8, !dbg !2190, !tbaa !525
  %13 = load ptr, ptr %net.addr, align 8, !dbg !2191, !tbaa !130
  %full_groups7 = getelementptr inbounds %struct.network, ptr %13, i32 0, i32 31, !dbg !2192
  %14 = load i64, ptr %full_groups7, align 8, !dbg !2192, !tbaa !548
  %add8 = add nsw i64 %12, %14, !dbg !2193
  %15 = load ptr, ptr %net.addr, align 8, !dbg !2194, !tbaa !130
  %full_groups9 = getelementptr inbounds %struct.network, ptr %15, i32 0, i32 31, !dbg !2195
  store i64 %add8, ptr %full_groups9, align 8, !dbg !2196, !tbaa !548
  %16 = load ptr, ptr %net.addr, align 8, !dbg !2197, !tbaa !130
  %max_elems10 = getelementptr inbounds %struct.network, ptr %16, i32 0, i32 32, !dbg !2198
  %17 = load i64, ptr %max_elems10, align 8, !dbg !2199, !tbaa !513
  %dec = add nsw i64 %17, -1, !dbg !2199
  store i64 %dec, ptr %max_elems10, align 8, !dbg !2199, !tbaa !513
  br label %while.cond, !dbg !2184, !llvm.loop !2200

while.end:                                        ; preds = %while.cond
  %18 = load i64, ptr %all.addr, align 8, !dbg !2202, !tbaa !143
  %tobool = icmp ne i64 %18, 0, !dbg !2202
  br i1 %tobool, label %if.then, label %if.else, !dbg !2204

if.then:                                          ; preds = %while.end
  %19 = load ptr, ptr %net.addr, align 8, !dbg !2205, !tbaa !130
  %m_impl = getelementptr inbounds %struct.network, ptr %19, i32 0, i32 7, !dbg !2207
  %20 = load i64, ptr %m_impl, align 8, !dbg !2207, !tbaa !2092
  store i64 %20, ptr %susp, align 8, !dbg !2208, !tbaa !143
  br label %if.end48, !dbg !2209

if.else:                                          ; preds = %while.end
  %21 = load ptr, ptr %net.addr, align 8, !dbg !2210, !tbaa !130
  %m11 = getelementptr inbounds %struct.network, ptr %21, i32 0, i32 5, !dbg !2212
  %22 = load i64, ptr %m11, align 8, !dbg !2212, !tbaa !410
  %23 = load ptr, ptr %net.addr, align 8, !dbg !2213, !tbaa !130
  %m_impl12 = getelementptr inbounds %struct.network, ptr %23, i32 0, i32 7, !dbg !2214
  %24 = load i64, ptr %m_impl12, align 8, !dbg !2214, !tbaa !2092
  %sub13 = sub nsw i64 %22, %24, !dbg !2215
  store i64 %sub13, ptr %startid, align 8, !dbg !2216, !tbaa !143
  %25 = load ptr, ptr %net.addr, align 8, !dbg !2217, !tbaa !130
  %m14 = getelementptr inbounds %struct.network, ptr %25, i32 0, i32 5, !dbg !2219
  %26 = load i64, ptr %m14, align 8, !dbg !2219, !tbaa !410
  %27 = load ptr, ptr %net.addr, align 8, !dbg !2220, !tbaa !130
  %m_impl15 = getelementptr inbounds %struct.network, ptr %27, i32 0, i32 7, !dbg !2221
  %28 = load i64, ptr %m_impl15, align 8, !dbg !2221, !tbaa !2092
  %sub16 = sub nsw i64 %26, %28, !dbg !2222
  store i64 %sub16, ptr %stop, align 8, !dbg !2223, !tbaa !143
  store i64 0, ptr %susp, align 8, !dbg !2224, !tbaa !143
  br label %for.cond, !dbg !2225

for.cond:                                         ; preds = %for.inc, %if.else
  %29 = load i64, ptr %stop, align 8, !dbg !2226, !tbaa !143
  %30 = load ptr, ptr %net.addr, align 8, !dbg !2228, !tbaa !130
  %m17 = getelementptr inbounds %struct.network, ptr %30, i32 0, i32 5, !dbg !2229
  %31 = load i64, ptr %m17, align 8, !dbg !2229, !tbaa !410
  %cmp18 = icmp slt i64 %29, %31, !dbg !2230
  br i1 %cmp18, label %for.body, label %for.end, !dbg !2231

for.body:                                         ; preds = %for.cond
  %32 = load ptr, ptr %net.addr, align 8, !dbg !2232, !tbaa !130
  %arcs = getelementptr inbounds %struct.network, ptr %32, i32 0, i32 23, !dbg !2234
  %33 = load ptr, ptr %arcs, align 8, !dbg !2234, !tbaa !271
  %34 = load ptr, ptr %net.addr, align 8, !dbg !2235, !tbaa !130
  %35 = load i64, ptr %stop, align 8, !dbg !2236, !tbaa !143
  %call = call i64 @getArcPosition(ptr noundef %34, i64 noundef %35) #10, !dbg !2237
  %add.ptr = getelementptr inbounds %struct.arc, ptr %33, i64 %call, !dbg !2238
  store ptr %add.ptr, ptr %arc, align 8, !dbg !2239, !tbaa !130
  %36 = load ptr, ptr %arc, align 8, !dbg !2240, !tbaa !130
  %ident = getelementptr inbounds %struct.arc, ptr %36, i32 0, i32 4, !dbg !2242
  %37 = load i16, ptr %ident, align 8, !dbg !2242, !tbaa !1299
  %conv = sext i16 %37 to i32, !dbg !2240
  %cmp19 = icmp eq i32 %conv, 1, !dbg !2243
  br i1 %cmp19, label %if.then21, label %if.else25, !dbg !2244

if.then21:                                        ; preds = %for.body
  %38 = load ptr, ptr %arc, align 8, !dbg !2245, !tbaa !130
  %cost = getelementptr inbounds %struct.arc, ptr %38, i32 0, i32 1, !dbg !2246
  %39 = load i64, ptr %cost, align 8, !dbg !2246, !tbaa !868
  %40 = load ptr, ptr %arc, align 8, !dbg !2247, !tbaa !130
  %tail = getelementptr inbounds %struct.arc, ptr %40, i32 0, i32 2, !dbg !2248
  %41 = load ptr, ptr %tail, align 8, !dbg !2248, !tbaa !850
  %potential = getelementptr inbounds %struct.node, ptr %41, i32 0, i32 0, !dbg !2249
  %42 = load i64, ptr %potential, align 8, !dbg !2249, !tbaa !1762
  %sub22 = sub nsw i64 %39, %42, !dbg !2250
  %43 = load ptr, ptr %arc, align 8, !dbg !2251, !tbaa !130
  %head = getelementptr inbounds %struct.arc, ptr %43, i32 0, i32 3, !dbg !2252
  %44 = load ptr, ptr %head, align 8, !dbg !2252, !tbaa !856
  %potential23 = getelementptr inbounds %struct.node, ptr %44, i32 0, i32 0, !dbg !2253
  %45 = load i64, ptr %potential23, align 8, !dbg !2253, !tbaa !1762
  %add24 = add nsw i64 %sub22, %45, !dbg !2254
  store i64 %add24, ptr %red_cost, align 8, !dbg !2255, !tbaa !143
  br label %if.end38, !dbg !2256

if.else25:                                        ; preds = %for.body
  store i64 -2, ptr %red_cost, align 8, !dbg !2257, !tbaa !143
  %46 = load ptr, ptr %arc, align 8, !dbg !2259, !tbaa !130
  %ident26 = getelementptr inbounds %struct.arc, ptr %46, i32 0, i32 4, !dbg !2261
  %47 = load i16, ptr %ident26, align 8, !dbg !2261, !tbaa !1299
  %conv27 = sext i16 %47 to i32, !dbg !2259
  %cmp28 = icmp eq i32 %conv27, 0, !dbg !2262
  br i1 %cmp28, label %if.then30, label %if.end37, !dbg !2263

if.then30:                                        ; preds = %if.else25
  %48 = load ptr, ptr %arc, align 8, !dbg !2264, !tbaa !130
  %tail31 = getelementptr inbounds %struct.arc, ptr %48, i32 0, i32 2, !dbg !2267
  %49 = load ptr, ptr %tail31, align 8, !dbg !2267, !tbaa !850
  %basic_arc = getelementptr inbounds %struct.node, ptr %49, i32 0, i32 6, !dbg !2268
  %50 = load ptr, ptr %basic_arc, align 8, !dbg !2268, !tbaa !165
  %51 = load ptr, ptr %arc, align 8, !dbg !2269, !tbaa !130
  %cmp32 = icmp eq ptr %50, %51, !dbg !2270
  br i1 %cmp32, label %if.end, label %if.then34, !dbg !2271

if.then34:                                        ; preds = %if.then30
  %52 = load ptr, ptr %arc, align 8, !dbg !2272, !tbaa !130
  %53 = load ptr, ptr %arc, align 8, !dbg !2273, !tbaa !130
  %head35 = getelementptr inbounds %struct.arc, ptr %53, i32 0, i32 3, !dbg !2274
  %54 = load ptr, ptr %head35, align 8, !dbg !2274, !tbaa !856
  %basic_arc36 = getelementptr inbounds %struct.node, ptr %54, i32 0, i32 6, !dbg !2275
  store ptr %52, ptr %basic_arc36, align 8, !dbg !2276, !tbaa !165
  br label %if.end, !dbg !2273

if.end:                                           ; preds = %if.then34, %if.then30
  br label %if.end37, !dbg !2277

if.end37:                                         ; preds = %if.end, %if.else25
  br label %if.end38

if.end38:                                         ; preds = %if.end37, %if.then21
  %55 = load i64, ptr %red_cost, align 8, !dbg !2278, !tbaa !143
  %56 = load i64, ptr %threshold.addr, align 8, !dbg !2280, !tbaa !143
  %cmp39 = icmp sgt i64 %55, %56, !dbg !2281
  br i1 %cmp39, label %if.then41, label %if.else42, !dbg !2282

if.then41:                                        ; preds = %if.end38
  %57 = load i64, ptr %susp, align 8, !dbg !2283, !tbaa !143
  %inc = add nsw i64 %57, 1, !dbg !2283
  store i64 %inc, ptr %susp, align 8, !dbg !2283, !tbaa !143
  %58 = load ptr, ptr %arc, align 8, !dbg !2285, !tbaa !130
  %id = getelementptr inbounds %struct.arc, ptr %58, i32 0, i32 0, !dbg !2286
  store i32 -1, ptr %id, align 8, !dbg !2287, !tbaa !172
  br label %if.end46, !dbg !2288

if.else42:                                        ; preds = %if.end38
  %59 = load i64, ptr %startid, align 8, !dbg !2289, !tbaa !143
  %conv43 = trunc i64 %59 to i32, !dbg !2289
  %60 = load ptr, ptr %arc, align 8, !dbg !2291, !tbaa !130
  %id44 = getelementptr inbounds %struct.arc, ptr %60, i32 0, i32 0, !dbg !2292
  store i32 %conv43, ptr %id44, align 8, !dbg !2293, !tbaa !172
  %61 = load i64, ptr %startid, align 8, !dbg !2294, !tbaa !143
  %inc45 = add nsw i64 %61, 1, !dbg !2294
  store i64 %inc45, ptr %startid, align 8, !dbg !2294, !tbaa !143
  br label %if.end46

if.end46:                                         ; preds = %if.else42, %if.then41
  br label %for.inc, !dbg !2295

for.inc:                                          ; preds = %if.end46
  %62 = load i64, ptr %stop, align 8, !dbg !2296, !tbaa !143
  %inc47 = add nsw i64 %62, 1, !dbg !2296
  store i64 %inc47, ptr %stop, align 8, !dbg !2296, !tbaa !143
  br label %for.cond, !dbg !2297, !llvm.loop !2298

for.end:                                          ; preds = %for.cond
  br label %if.end48

if.end48:                                         ; preds = %for.end, %if.then
  %63 = load i64, ptr %susp, align 8, !dbg !2300, !tbaa !143
  %tobool49 = icmp ne i64 %63, 0, !dbg !2300
  br i1 %tobool49, label %if.then50, label %if.end95, !dbg !2302

if.then50:                                        ; preds = %if.end48
  %64 = load i64, ptr %susp, align 8, !dbg !2303, !tbaa !143
  %65 = load ptr, ptr %net.addr, align 8, !dbg !2305, !tbaa !130
  %m_impl51 = getelementptr inbounds %struct.network, ptr %65, i32 0, i32 7, !dbg !2306
  %66 = load i64, ptr %m_impl51, align 8, !dbg !2307, !tbaa !2092
  %sub52 = sub nsw i64 %66, %64, !dbg !2307
  store i64 %sub52, ptr %m_impl51, align 8, !dbg !2307, !tbaa !2092
  %67 = load i64, ptr %susp, align 8, !dbg !2308, !tbaa !143
  %68 = load ptr, ptr %net.addr, align 8, !dbg !2309, !tbaa !130
  %max_residual_new_m = getelementptr inbounds %struct.network, ptr %68, i32 0, i32 8, !dbg !2310
  %69 = load i64, ptr %max_residual_new_m, align 8, !dbg !2311, !tbaa !372
  %add53 = add nsw i64 %69, %67, !dbg !2311
  store i64 %add53, ptr %max_residual_new_m, align 8, !dbg !2311, !tbaa !372
  %70 = load ptr, ptr %net.addr, align 8, !dbg !2312, !tbaa !130
  %max_elems54 = getelementptr inbounds %struct.network, ptr %70, i32 0, i32 32, !dbg !2313
  store i64 4000, ptr %max_elems54, align 8, !dbg !2314, !tbaa !513
  %71 = load ptr, ptr %net.addr, align 8, !dbg !2315, !tbaa !130
  %m55 = getelementptr inbounds %struct.network, ptr %71, i32 0, i32 5, !dbg !2316
  %72 = load i64, ptr %m55, align 8, !dbg !2316, !tbaa !410
  %73 = load i64, ptr %susp, align 8, !dbg !2317, !tbaa !143
  %sub56 = sub nsw i64 %72, %73, !dbg !2318
  %sub57 = sub nsw i64 %sub56, 1, !dbg !2319
  %div58 = sdiv i64 %sub57, 4000, !dbg !2320
  %add59 = add nsw i64 %div58, 1, !dbg !2321
  %74 = load ptr, ptr %net.addr, align 8, !dbg !2322, !tbaa !130
  %nr_group60 = getelementptr inbounds %struct.network, ptr %74, i32 0, i32 30, !dbg !2323
  store i64 %add59, ptr %nr_group60, align 8, !dbg !2324, !tbaa !525
  %75 = load ptr, ptr %net.addr, align 8, !dbg !2325, !tbaa !130
  %m61 = getelementptr inbounds %struct.network, ptr %75, i32 0, i32 5, !dbg !2327
  %76 = load i64, ptr %m61, align 8, !dbg !2327, !tbaa !410
  %77 = load i64, ptr %susp, align 8, !dbg !2328, !tbaa !143
  %sub62 = sub nsw i64 %76, %77, !dbg !2329
  %rem63 = srem i64 %sub62, 4000, !dbg !2330
  %cmp64 = icmp ne i64 %rem63, 0, !dbg !2331
  br i1 %cmp64, label %if.then66, label %if.else74, !dbg !2332

if.then66:                                        ; preds = %if.then50
  %78 = load ptr, ptr %net.addr, align 8, !dbg !2333, !tbaa !130
  %nr_group67 = getelementptr inbounds %struct.network, ptr %78, i32 0, i32 30, !dbg !2334
  %79 = load i64, ptr %nr_group67, align 8, !dbg !2334, !tbaa !525
  %80 = load ptr, ptr %net.addr, align 8, !dbg !2335, !tbaa !130
  %m68 = getelementptr inbounds %struct.network, ptr %80, i32 0, i32 5, !dbg !2336
  %81 = load i64, ptr %m68, align 8, !dbg !2336, !tbaa !410
  %82 = load i64, ptr %susp, align 8, !dbg !2337, !tbaa !143
  %sub69 = sub nsw i64 %81, %82, !dbg !2338
  %rem70 = srem i64 %sub69, 4000, !dbg !2339
  %sub71 = sub nsw i64 4000, %rem70, !dbg !2340
  %sub72 = sub nsw i64 %79, %sub71, !dbg !2341
  %83 = load ptr, ptr %net.addr, align 8, !dbg !2342, !tbaa !130
  %full_groups73 = getelementptr inbounds %struct.network, ptr %83, i32 0, i32 31, !dbg !2343
  store i64 %sub72, ptr %full_groups73, align 8, !dbg !2344, !tbaa !548
  br label %if.end77, !dbg !2342

if.else74:                                        ; preds = %if.then50
  %84 = load ptr, ptr %net.addr, align 8, !dbg !2345, !tbaa !130
  %nr_group75 = getelementptr inbounds %struct.network, ptr %84, i32 0, i32 30, !dbg !2346
  %85 = load i64, ptr %nr_group75, align 8, !dbg !2346, !tbaa !525
  %86 = load ptr, ptr %net.addr, align 8, !dbg !2347, !tbaa !130
  %full_groups76 = getelementptr inbounds %struct.network, ptr %86, i32 0, i32 31, !dbg !2348
  store i64 %85, ptr %full_groups76, align 8, !dbg !2349, !tbaa !548
  br label %if.end77

if.end77:                                         ; preds = %if.else74, %if.then66
  br label %while.cond78, !dbg !2350

while.cond78:                                     ; preds = %while.body82, %if.end77
  %87 = load ptr, ptr %net.addr, align 8, !dbg !2351, !tbaa !130
  %full_groups79 = getelementptr inbounds %struct.network, ptr %87, i32 0, i32 31, !dbg !2352
  %88 = load i64, ptr %full_groups79, align 8, !dbg !2352, !tbaa !548
  %cmp80 = icmp slt i64 %88, 0, !dbg !2353
  br i1 %cmp80, label %while.body82, label %while.end89, !dbg !2350

while.body82:                                     ; preds = %while.cond78
  %89 = load ptr, ptr %net.addr, align 8, !dbg !2354, !tbaa !130
  %nr_group83 = getelementptr inbounds %struct.network, ptr %89, i32 0, i32 30, !dbg !2356
  %90 = load i64, ptr %nr_group83, align 8, !dbg !2356, !tbaa !525
  %91 = load ptr, ptr %net.addr, align 8, !dbg !2357, !tbaa !130
  %full_groups84 = getelementptr inbounds %struct.network, ptr %91, i32 0, i32 31, !dbg !2358
  %92 = load i64, ptr %full_groups84, align 8, !dbg !2358, !tbaa !548
  %add85 = add nsw i64 %90, %92, !dbg !2359
  %93 = load ptr, ptr %net.addr, align 8, !dbg !2360, !tbaa !130
  %full_groups86 = getelementptr inbounds %struct.network, ptr %93, i32 0, i32 31, !dbg !2361
  store i64 %add85, ptr %full_groups86, align 8, !dbg !2362, !tbaa !548
  %94 = load ptr, ptr %net.addr, align 8, !dbg !2363, !tbaa !130
  %max_elems87 = getelementptr inbounds %struct.network, ptr %94, i32 0, i32 32, !dbg !2364
  %95 = load i64, ptr %max_elems87, align 8, !dbg !2365, !tbaa !513
  %dec88 = add nsw i64 %95, -1, !dbg !2365
  store i64 %dec88, ptr %max_elems87, align 8, !dbg !2365, !tbaa !513
  br label %while.cond78, !dbg !2350, !llvm.loop !2366

while.end89:                                      ; preds = %while.cond78
  %96 = load ptr, ptr %net.addr, align 8, !dbg !2368, !tbaa !130
  %97 = load ptr, ptr %net.addr, align 8, !dbg !2369, !tbaa !130
  %m90 = getelementptr inbounds %struct.network, ptr %97, i32 0, i32 5, !dbg !2370
  %98 = load i64, ptr %m90, align 8, !dbg !2370, !tbaa !410
  %call91 = call i64 @refreshPositions(ptr noundef %96, ptr noundef @getOriginalArcPosition, i64 noundef %98) #10, !dbg !2371
  %99 = load i64, ptr %susp, align 8, !dbg !2372, !tbaa !143
  %100 = load ptr, ptr %net.addr, align 8, !dbg !2373, !tbaa !130
  %m92 = getelementptr inbounds %struct.network, ptr %100, i32 0, i32 5, !dbg !2374
  %101 = load i64, ptr %m92, align 8, !dbg !2375, !tbaa !410
  %sub93 = sub nsw i64 %101, %99, !dbg !2375
  store i64 %sub93, ptr %m92, align 8, !dbg !2375, !tbaa !410
  %102 = load i64, ptr %susp, align 8, !dbg !2376, !tbaa !143
  %103 = load ptr, ptr %net.addr, align 8, !dbg !2377, !tbaa !130
  %stop_arcs = getelementptr inbounds %struct.network, ptr %103, i32 0, i32 24, !dbg !2378
  %104 = load ptr, ptr %stop_arcs, align 8, !dbg !2379, !tbaa !315
  %idx.neg = sub i64 0, %102, !dbg !2379
  %add.ptr94 = getelementptr inbounds %struct.arc, ptr %104, i64 %idx.neg, !dbg !2379
  store ptr %add.ptr94, ptr %stop_arcs, align 8, !dbg !2379, !tbaa !315
  %105 = load ptr, ptr %net.addr, align 8, !dbg !2380, !tbaa !130
  call void @refresh_neighbour_lists(ptr noundef %105, ptr noundef @getOriginalArcPosition) #10, !dbg !2381
  br label %if.end95, !dbg !2382

if.end95:                                         ; preds = %while.end89, %if.end48
  %106 = load i64, ptr %susp, align 8, !dbg !2383, !tbaa !143
  call void @llvm.lifetime.end.p0(i64 8, ptr %startid) #9, !dbg !2384
  call void @llvm.lifetime.end.p0(i64 8, ptr %stop) #9, !dbg !2384
  call void @llvm.lifetime.end.p0(i64 8, ptr %arc) #9, !dbg !2384
  call void @llvm.lifetime.end.p0(i64 8, ptr %red_cost) #9, !dbg !2384
  call void @llvm.lifetime.end.p0(i64 8, ptr %susp) #9, !dbg !2384
  ret i64 %106, !dbg !2385
}

attributes #0 = { minsize nounwind optsize uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { minsize nounwind optsize allocsize(0) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { minsize nounwind optsize "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { minsize nounwind optsize allocsize(1) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { minsize optsize "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { minsize nounwind optsize allocsize(0,1) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { nounwind }
attributes #10 = { minsize optsize }
attributes #11 = { minsize nounwind optsize allocsize(0) }
attributes #12 = { minsize nounwind optsize }
attributes #13 = { minsize nounwind optsize allocsize(1) }
attributes #14 = { minsize nounwind optsize allocsize(0,1) }

!llvm.dbg.cu = !{!7}
!llvm.module.flags = !{!70, !71, !72, !73, !74, !75}
!llvm.ident = !{!76}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 232, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "implicit.c", directory: "/home/michel/ETH/AST/specbuilder/src/605", checksumkind: CSK_MD5, checksum: "3902bd7f28dace49902caa7f240f02ea")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 248, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 31)
!7 = distinct !DICompileUnit(language: DW_LANG_C11, file: !8, producer: "clang version 17.0.0 (git@github.com:webmiche/llvm-project.git 8ae5341dd666ebd9607a787b37484c371785e975)", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !9, globals: !69, splitDebugInlining: false, nameTableKind: None)
!8 = !DIFile(filename: "/home/michel/ETH/AST/specbuilder/src/605/implicit.c", directory: "/home/michel/ETH/AST/specbuilder/src/605", checksumkind: CSK_MD5, checksum: "3902bd7f28dace49902caa7f240f02ea")
!9 = !{!10, !53, !54, !42, !20, !11, !56, !63, !21, !64}
!10 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !11, size: 64)
!11 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !12, size: 64)
!12 = !DIDerivedType(tag: DW_TAG_typedef, name: "arc_p", file: !13, line: 138, baseType: !14)
!13 = !DIFile(filename: "defines.h", directory: "/home/michel/ETH/AST/specbuilder/src/605", checksumkind: CSK_MD5, checksum: "05eeb7bba098b08025cbe048b289d372")
!14 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !15, size: 64)
!15 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "arc", file: !13, line: 168, size: 576, elements: !16)
!16 = !{!17, !19, !26, !46, !47, !49, !50, !51, !52}
!17 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !15, file: !13, line: 170, baseType: !18, size: 32)
!18 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!19 = !DIDerivedType(tag: DW_TAG_member, name: "cost", scope: !15, file: !13, line: 171, baseType: !20, size: 64, offset: 64)
!20 = !DIDerivedType(tag: DW_TAG_typedef, name: "cost_t", file: !13, line: 98, baseType: !21)
!21 = !DIDerivedType(tag: DW_TAG_typedef, name: "int64_t", file: !22, line: 27, baseType: !23)
!22 = !DIFile(filename: "/usr/include/bits/stdint-intn.h", directory: "", checksumkind: CSK_MD5, checksum: "85f68316edee664d7bd685b977adf677")
!23 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !24, line: 44, baseType: !25)
!24 = !DIFile(filename: "/usr/include/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "4a64d909bcfa62a0a7682c3ac78c6965")
!25 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!26 = !DIDerivedType(tag: DW_TAG_member, name: "tail", scope: !15, file: !13, line: 172, baseType: !27, size: 64, offset: 128)
!27 = !DIDerivedType(tag: DW_TAG_typedef, name: "node_p", file: !13, line: 135, baseType: !28)
!28 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !29, size: 64)
!29 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "node", file: !13, line: 149, size: 832, elements: !30)
!30 = !{!31, !32, !33, !34, !35, !36, !37, !38, !39, !40, !41, !43, !44, !45}
!31 = !DIDerivedType(tag: DW_TAG_member, name: "potential", scope: !29, file: !13, line: 151, baseType: !20, size: 64)
!32 = !DIDerivedType(tag: DW_TAG_member, name: "orientation", scope: !29, file: !13, line: 152, baseType: !18, size: 32, offset: 64)
!33 = !DIDerivedType(tag: DW_TAG_member, name: "child", scope: !29, file: !13, line: 153, baseType: !27, size: 64, offset: 128)
!34 = !DIDerivedType(tag: DW_TAG_member, name: "pred", scope: !29, file: !13, line: 154, baseType: !27, size: 64, offset: 192)
!35 = !DIDerivedType(tag: DW_TAG_member, name: "sibling", scope: !29, file: !13, line: 155, baseType: !27, size: 64, offset: 256)
!36 = !DIDerivedType(tag: DW_TAG_member, name: "sibling_prev", scope: !29, file: !13, line: 156, baseType: !27, size: 64, offset: 320)
!37 = !DIDerivedType(tag: DW_TAG_member, name: "basic_arc", scope: !29, file: !13, line: 157, baseType: !12, size: 64, offset: 384)
!38 = !DIDerivedType(tag: DW_TAG_member, name: "firstout", scope: !29, file: !13, line: 158, baseType: !12, size: 64, offset: 448)
!39 = !DIDerivedType(tag: DW_TAG_member, name: "firstin", scope: !29, file: !13, line: 158, baseType: !12, size: 64, offset: 512)
!40 = !DIDerivedType(tag: DW_TAG_member, name: "arc_tmp", scope: !29, file: !13, line: 159, baseType: !12, size: 64, offset: 576)
!41 = !DIDerivedType(tag: DW_TAG_member, name: "flow", scope: !29, file: !13, line: 160, baseType: !42, size: 64, offset: 640)
!42 = !DIDerivedType(tag: DW_TAG_typedef, name: "flow_t", file: !13, line: 97, baseType: !21)
!43 = !DIDerivedType(tag: DW_TAG_member, name: "depth", scope: !29, file: !13, line: 161, baseType: !21, size: 64, offset: 704)
!44 = !DIDerivedType(tag: DW_TAG_member, name: "number", scope: !29, file: !13, line: 162, baseType: !18, size: 32, offset: 768)
!45 = !DIDerivedType(tag: DW_TAG_member, name: "time", scope: !29, file: !13, line: 163, baseType: !18, size: 32, offset: 800)
!46 = !DIDerivedType(tag: DW_TAG_member, name: "head", scope: !15, file: !13, line: 172, baseType: !27, size: 64, offset: 192)
!47 = !DIDerivedType(tag: DW_TAG_member, name: "ident", scope: !15, file: !13, line: 173, baseType: !48, size: 16, offset: 256)
!48 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!49 = !DIDerivedType(tag: DW_TAG_member, name: "nextout", scope: !15, file: !13, line: 174, baseType: !12, size: 64, offset: 320)
!50 = !DIDerivedType(tag: DW_TAG_member, name: "nextin", scope: !15, file: !13, line: 174, baseType: !12, size: 64, offset: 384)
!51 = !DIDerivedType(tag: DW_TAG_member, name: "flow", scope: !15, file: !13, line: 175, baseType: !42, size: 64, offset: 448)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "org_cost", scope: !15, file: !13, line: 176, baseType: !20, size: 64, offset: 512)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !21, size: 64)
!54 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !55, size: 64)
!55 = !DIDerivedType(tag: DW_TAG_typedef, name: "arc_t", file: !13, line: 137, baseType: !15)
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !57, size: 64)
!57 = !DIDerivedType(tag: DW_TAG_typedef, name: "list_elem", file: !13, line: 212, baseType: !58)
!58 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "list_elem", file: !13, line: 208, size: 128, elements: !59)
!59 = !{!60, !61}
!60 = !DIDerivedType(tag: DW_TAG_member, name: "arc", scope: !58, file: !13, line: 210, baseType: !54, size: 64)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "next", scope: !58, file: !13, line: 211, baseType: !62, size: 64, offset: 64)
!62 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !58, size: 64)
!63 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !65, size: 64)
!65 = !DISubroutineType(types: !66)
!66 = !{!18, !67, !67}
!67 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !68, size: 64)
!68 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!69 = !{!0}
!70 = !{i32 7, !"Dwarf Version", i32 5}
!71 = !{i32 2, !"Debug Info Version", i32 3}
!72 = !{i32 1, !"wchar_size", i32 4}
!73 = !{i32 8, !"PIC Level", i32 2}
!74 = !{i32 7, !"PIE Level", i32 2}
!75 = !{i32 7, !"uwtable", i32 2}
!76 = !{!"clang version 17.0.0 (git@github.com:webmiche/llvm-project.git 8ae5341dd666ebd9607a787b37484c371785e975)"}
!77 = distinct !DISubprogram(name: "refreshArcPointers", scope: !2, file: !2, line: 48, type: !78, scopeLine: 55, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, retainedNodes: !124)
!78 = !DISubroutineType(types: !79)
!79 = !{!21, !80, !121, !54}
!80 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !81, size: 64)
!81 = !DIDerivedType(tag: DW_TAG_typedef, name: "network_t", file: !13, line: 206, baseType: !82)
!82 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "network", file: !13, line: 181, size: 5184, elements: !83)
!83 = !{!84, !88, !89, !90, !91, !92, !93, !94, !95, !96, !97, !98, !99, !100, !101, !102, !103, !104, !105, !106, !108, !109, !110, !111, !112, !113, !114, !115, !116, !117, !118, !119, !120}
!84 = !DIDerivedType(tag: DW_TAG_member, name: "inputfile", scope: !82, file: !13, line: 183, baseType: !85, size: 1600)
!85 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 1600, elements: !86)
!86 = !{!87}
!87 = !DISubrange(count: 200)
!88 = !DIDerivedType(tag: DW_TAG_member, name: "clustfile", scope: !82, file: !13, line: 184, baseType: !85, size: 1600, offset: 1600)
!89 = !DIDerivedType(tag: DW_TAG_member, name: "n", scope: !82, file: !13, line: 185, baseType: !21, size: 64, offset: 3200)
!90 = !DIDerivedType(tag: DW_TAG_member, name: "n_trips", scope: !82, file: !13, line: 185, baseType: !21, size: 64, offset: 3264)
!91 = !DIDerivedType(tag: DW_TAG_member, name: "max_m", scope: !82, file: !13, line: 186, baseType: !21, size: 64, offset: 3328)
!92 = !DIDerivedType(tag: DW_TAG_member, name: "m", scope: !82, file: !13, line: 186, baseType: !21, size: 64, offset: 3392)
!93 = !DIDerivedType(tag: DW_TAG_member, name: "m_org", scope: !82, file: !13, line: 186, baseType: !21, size: 64, offset: 3456)
!94 = !DIDerivedType(tag: DW_TAG_member, name: "m_impl", scope: !82, file: !13, line: 186, baseType: !21, size: 64, offset: 3520)
!95 = !DIDerivedType(tag: DW_TAG_member, name: "max_residual_new_m", scope: !82, file: !13, line: 187, baseType: !21, size: 64, offset: 3584)
!96 = !DIDerivedType(tag: DW_TAG_member, name: "max_new_m", scope: !82, file: !13, line: 187, baseType: !21, size: 64, offset: 3648)
!97 = !DIDerivedType(tag: DW_TAG_member, name: "primal_unbounded", scope: !82, file: !13, line: 189, baseType: !21, size: 64, offset: 3712)
!98 = !DIDerivedType(tag: DW_TAG_member, name: "dual_unbounded", scope: !82, file: !13, line: 190, baseType: !21, size: 64, offset: 3776)
!99 = !DIDerivedType(tag: DW_TAG_member, name: "perturbed", scope: !82, file: !13, line: 191, baseType: !21, size: 64, offset: 3840)
!100 = !DIDerivedType(tag: DW_TAG_member, name: "feasible", scope: !82, file: !13, line: 192, baseType: !21, size: 64, offset: 3904)
!101 = !DIDerivedType(tag: DW_TAG_member, name: "eps", scope: !82, file: !13, line: 193, baseType: !21, size: 64, offset: 3968)
!102 = !DIDerivedType(tag: DW_TAG_member, name: "opt_tol", scope: !82, file: !13, line: 194, baseType: !21, size: 64, offset: 4032)
!103 = !DIDerivedType(tag: DW_TAG_member, name: "feas_tol", scope: !82, file: !13, line: 195, baseType: !21, size: 64, offset: 4096)
!104 = !DIDerivedType(tag: DW_TAG_member, name: "pert_val", scope: !82, file: !13, line: 196, baseType: !21, size: 64, offset: 4160)
!105 = !DIDerivedType(tag: DW_TAG_member, name: "bigM", scope: !82, file: !13, line: 197, baseType: !21, size: 64, offset: 4224)
!106 = !DIDerivedType(tag: DW_TAG_member, name: "optcost", scope: !82, file: !13, line: 198, baseType: !107, size: 64, offset: 4288)
!107 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!108 = !DIDerivedType(tag: DW_TAG_member, name: "ignore_impl", scope: !82, file: !13, line: 199, baseType: !20, size: 64, offset: 4352)
!109 = !DIDerivedType(tag: DW_TAG_member, name: "nodes", scope: !82, file: !13, line: 200, baseType: !27, size: 64, offset: 4416)
!110 = !DIDerivedType(tag: DW_TAG_member, name: "stop_nodes", scope: !82, file: !13, line: 200, baseType: !27, size: 64, offset: 4480)
!111 = !DIDerivedType(tag: DW_TAG_member, name: "arcs", scope: !82, file: !13, line: 201, baseType: !12, size: 64, offset: 4544)
!112 = !DIDerivedType(tag: DW_TAG_member, name: "stop_arcs", scope: !82, file: !13, line: 201, baseType: !12, size: 64, offset: 4608)
!113 = !DIDerivedType(tag: DW_TAG_member, name: "sorted_arcs", scope: !82, file: !13, line: 201, baseType: !12, size: 64, offset: 4672)
!114 = !DIDerivedType(tag: DW_TAG_member, name: "dummy_arcs", scope: !82, file: !13, line: 202, baseType: !12, size: 64, offset: 4736)
!115 = !DIDerivedType(tag: DW_TAG_member, name: "stop_dummy", scope: !82, file: !13, line: 202, baseType: !12, size: 64, offset: 4800)
!116 = !DIDerivedType(tag: DW_TAG_member, name: "iterations", scope: !82, file: !13, line: 203, baseType: !21, size: 64, offset: 4864)
!117 = !DIDerivedType(tag: DW_TAG_member, name: "bound_exchanges", scope: !82, file: !13, line: 204, baseType: !21, size: 64, offset: 4928)
!118 = !DIDerivedType(tag: DW_TAG_member, name: "nr_group", scope: !82, file: !13, line: 205, baseType: !21, size: 64, offset: 4992)
!119 = !DIDerivedType(tag: DW_TAG_member, name: "full_groups", scope: !82, file: !13, line: 205, baseType: !21, size: 64, offset: 5056)
!120 = !DIDerivedType(tag: DW_TAG_member, name: "max_elems", scope: !82, file: !13, line: 205, baseType: !21, size: 64, offset: 5120)
!121 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !122, size: 64)
!122 = !DISubroutineType(types: !123)
!123 = !{!21, !80, !21}
!124 = !{!125, !126, !127, !128, !129}
!125 = !DILocalVariable(name: "net", arg: 1, scope: !77, file: !2, line: 48, type: !80)
!126 = !DILocalVariable(name: "getPos", arg: 2, scope: !77, file: !2, line: 48, type: !121)
!127 = !DILocalVariable(name: "sorted_array", arg: 3, scope: !77, file: !2, line: 48, type: !54)
!128 = !DILocalVariable(name: "node", scope: !77, file: !2, line: 56, type: !27)
!129 = !DILocalVariable(name: "i", scope: !77, file: !2, line: 57, type: !21)
!130 = !{!131, !131, i64 0}
!131 = !{!"any pointer", !132, i64 0}
!132 = !{!"omnipotent char", !133, i64 0}
!133 = !{!"Simple C/C++ TBAA"}
!134 = !DILocation(line: 48, column: 36, scope: !77)
!135 = !DILocation(line: 48, column: 48, scope: !77)
!136 = !DILocation(line: 48, column: 83, scope: !77)
!137 = !DILocation(line: 56, column: 3, scope: !77)
!138 = !DILocation(line: 56, column: 10, scope: !77)
!139 = !DILocation(line: 57, column: 3, scope: !77)
!140 = !DILocation(line: 57, column: 8, scope: !77)
!141 = !DILocation(line: 62, column: 12, scope: !142)
!142 = distinct !DILexicalBlock(scope: !77, file: !2, line: 62, column: 5)
!143 = !{!144, !144, i64 0}
!144 = !{!"long", !132, i64 0}
!145 = !DILocation(line: 62, column: 10, scope: !142)
!146 = !DILocation(line: 62, column: 17, scope: !147)
!147 = distinct !DILexicalBlock(scope: !142, file: !2, line: 62, column: 5)
!148 = !DILocation(line: 62, column: 22, scope: !147)
!149 = !DILocation(line: 62, column: 27, scope: !147)
!150 = !{!151, !144, i64 400}
!151 = !{!"network", !132, i64 0, !132, i64 200, !144, i64 400, !144, i64 408, !144, i64 416, !144, i64 424, !144, i64 432, !144, i64 440, !144, i64 448, !144, i64 456, !144, i64 464, !144, i64 472, !144, i64 480, !144, i64 488, !144, i64 496, !144, i64 504, !144, i64 512, !144, i64 520, !144, i64 528, !152, i64 536, !144, i64 544, !131, i64 552, !131, i64 560, !131, i64 568, !131, i64 576, !131, i64 584, !131, i64 592, !131, i64 600, !144, i64 608, !144, i64 616, !144, i64 624, !144, i64 632, !144, i64 640}
!152 = !{!"double", !132, i64 0}
!153 = !DILocation(line: 62, column: 19, scope: !147)
!154 = !DILocation(line: 62, column: 5, scope: !142)
!155 = !DILocation(line: 63, column: 14, scope: !156)
!156 = distinct !DILexicalBlock(scope: !147, file: !2, line: 62, column: 35)
!157 = !DILocation(line: 63, column: 19, scope: !156)
!158 = !{!151, !131, i64 552}
!159 = !DILocation(line: 63, column: 27, scope: !156)
!160 = !DILocation(line: 63, column: 25, scope: !156)
!161 = !DILocation(line: 63, column: 12, scope: !156)
!162 = !DILocation(line: 64, column: 11, scope: !163)
!163 = distinct !DILexicalBlock(scope: !156, file: !2, line: 64, column: 11)
!164 = !DILocation(line: 64, column: 17, scope: !163)
!165 = !{!166, !131, i64 48}
!166 = !{!"node", !144, i64 0, !167, i64 8, !131, i64 16, !131, i64 24, !131, i64 32, !131, i64 40, !131, i64 48, !131, i64 56, !131, i64 64, !131, i64 72, !144, i64 80, !144, i64 88, !167, i64 96, !167, i64 100}
!167 = !{!"int", !132, i64 0}
!168 = !DILocation(line: 64, column: 27, scope: !163)
!169 = !DILocation(line: 64, column: 30, scope: !163)
!170 = !DILocation(line: 64, column: 36, scope: !163)
!171 = !DILocation(line: 64, column: 47, scope: !163)
!172 = !{!173, !167, i64 0}
!173 = !{!"arc", !167, i64 0, !144, i64 8, !131, i64 16, !131, i64 24, !174, i64 32, !131, i64 40, !131, i64 48, !144, i64 56, !144, i64 64}
!174 = !{!"short", !132, i64 0}
!175 = !DILocation(line: 64, column: 50, scope: !163)
!176 = !DILocation(line: 64, column: 11, scope: !156)
!177 = !DILocation(line: 65, column: 30, scope: !163)
!178 = !DILocation(line: 65, column: 43, scope: !163)
!179 = !DILocation(line: 65, column: 50, scope: !163)
!180 = !DILocation(line: 65, column: 55, scope: !163)
!181 = !DILocation(line: 65, column: 61, scope: !163)
!182 = !DILocation(line: 65, column: 72, scope: !163)
!183 = !DILocation(line: 65, column: 11, scope: !163)
!184 = !DILocation(line: 65, column: 17, scope: !163)
!185 = !DILocation(line: 65, column: 27, scope: !163)
!186 = !DILocation(line: 66, column: 11, scope: !187)
!187 = distinct !DILexicalBlock(scope: !156, file: !2, line: 66, column: 11)
!188 = !DILocation(line: 66, column: 17, scope: !187)
!189 = !{!166, !131, i64 64}
!190 = !DILocation(line: 66, column: 25, scope: !187)
!191 = !DILocation(line: 66, column: 28, scope: !187)
!192 = !DILocation(line: 66, column: 34, scope: !187)
!193 = !DILocation(line: 66, column: 43, scope: !187)
!194 = !DILocation(line: 66, column: 46, scope: !187)
!195 = !DILocation(line: 66, column: 11, scope: !156)
!196 = !DILocation(line: 67, column: 28, scope: !187)
!197 = !DILocation(line: 67, column: 41, scope: !187)
!198 = !DILocation(line: 67, column: 48, scope: !187)
!199 = !DILocation(line: 67, column: 53, scope: !187)
!200 = !DILocation(line: 67, column: 59, scope: !187)
!201 = !DILocation(line: 67, column: 68, scope: !187)
!202 = !DILocation(line: 67, column: 11, scope: !187)
!203 = !DILocation(line: 67, column: 17, scope: !187)
!204 = !DILocation(line: 67, column: 25, scope: !187)
!205 = !DILocation(line: 68, column: 11, scope: !206)
!206 = distinct !DILexicalBlock(scope: !156, file: !2, line: 68, column: 11)
!207 = !DILocation(line: 68, column: 17, scope: !206)
!208 = !{!166, !131, i64 56}
!209 = !DILocation(line: 68, column: 26, scope: !206)
!210 = !DILocation(line: 68, column: 29, scope: !206)
!211 = !DILocation(line: 68, column: 35, scope: !206)
!212 = !DILocation(line: 68, column: 45, scope: !206)
!213 = !DILocation(line: 68, column: 48, scope: !206)
!214 = !DILocation(line: 68, column: 11, scope: !156)
!215 = !DILocation(line: 69, column: 29, scope: !206)
!216 = !DILocation(line: 69, column: 42, scope: !206)
!217 = !DILocation(line: 69, column: 49, scope: !206)
!218 = !DILocation(line: 69, column: 54, scope: !206)
!219 = !DILocation(line: 69, column: 60, scope: !206)
!220 = !DILocation(line: 69, column: 70, scope: !206)
!221 = !DILocation(line: 69, column: 11, scope: !206)
!222 = !DILocation(line: 69, column: 17, scope: !206)
!223 = !DILocation(line: 69, column: 26, scope: !206)
!224 = !DILocation(line: 70, column: 5, scope: !156)
!225 = !DILocation(line: 62, column: 31, scope: !147)
!226 = !DILocation(line: 62, column: 5, scope: !147)
!227 = distinct !{!227, !154, !228, !229}
!228 = !DILocation(line: 70, column: 5, scope: !142)
!229 = !{!"llvm.loop.mustprogress"}
!230 = !DILocation(line: 73, column: 1, scope: !77)
!231 = !DILocation(line: 72, column: 5, scope: !77)
!232 = distinct !DISubprogram(name: "refreshPositions", scope: !2, file: !2, line: 77, type: !233, scopeLine: 84, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, retainedNodes: !235)
!233 = !DISubroutineType(types: !234)
!234 = !{!21, !80, !121, !21}
!235 = !{!236, !237, !238, !239, !240, !241, !242}
!236 = !DILocalVariable(name: "net", arg: 1, scope: !232, file: !2, line: 77, type: !80)
!237 = !DILocalVariable(name: "getPos", arg: 2, scope: !232, file: !2, line: 77, type: !121)
!238 = !DILocalVariable(name: "new_m", arg: 3, scope: !232, file: !2, line: 77, type: !21)
!239 = !DILocalVariable(name: "arc", scope: !232, file: !2, line: 85, type: !54)
!240 = !DILocalVariable(name: "sorted_array", scope: !232, file: !2, line: 85, type: !54)
!241 = !DILocalVariable(name: "position", scope: !232, file: !2, line: 86, type: !21)
!242 = !DILocalVariable(name: "new_position", scope: !232, file: !2, line: 86, type: !21)
!243 = !DILocation(line: 77, column: 35, scope: !232)
!244 = !DILocation(line: 77, column: 47, scope: !232)
!245 = !DILocation(line: 77, column: 79, scope: !232)
!246 = !DILocation(line: 85, column: 3, scope: !232)
!247 = !DILocation(line: 85, column: 10, scope: !232)
!248 = !DILocation(line: 85, column: 16, scope: !232)
!249 = !DILocation(line: 86, column: 5, scope: !232)
!250 = !DILocation(line: 86, column: 10, scope: !232)
!251 = !DILocation(line: 86, column: 20, scope: !232)
!252 = !DILocation(line: 88, column: 20, scope: !232)
!253 = !DILocation(line: 88, column: 25, scope: !232)
!254 = !{!151, !131, i64 584}
!255 = !DILocation(line: 88, column: 18, scope: !232)
!256 = !DILocation(line: 89, column: 24, scope: !232)
!257 = !DILocation(line: 89, column: 29, scope: !232)
!258 = !DILocation(line: 89, column: 37, scope: !232)
!259 = !DILocation(line: 89, column: 5, scope: !232)
!260 = !DILocation(line: 94, column: 17, scope: !261)
!261 = distinct !DILexicalBlock(scope: !232, file: !2, line: 94, column: 3)
!262 = !DILocation(line: 94, column: 8, scope: !261)
!263 = !DILocation(line: 94, column: 22, scope: !264)
!264 = distinct !DILexicalBlock(scope: !261, file: !2, line: 94, column: 3)
!265 = !DILocation(line: 94, column: 33, scope: !264)
!266 = !DILocation(line: 94, column: 31, scope: !264)
!267 = !DILocation(line: 94, column: 3, scope: !261)
!268 = !DILocation(line: 95, column: 11, scope: !269)
!269 = distinct !DILexicalBlock(scope: !264, file: !2, line: 94, column: 52)
!270 = !DILocation(line: 95, column: 16, scope: !269)
!271 = !{!151, !131, i64 568}
!272 = !DILocation(line: 95, column: 23, scope: !269)
!273 = !DILocation(line: 95, column: 21, scope: !269)
!274 = !DILocation(line: 95, column: 9, scope: !269)
!275 = !DILocation(line: 96, column: 8, scope: !276)
!276 = distinct !DILexicalBlock(scope: !269, file: !2, line: 96, column: 8)
!277 = !DILocation(line: 96, column: 13, scope: !276)
!278 = !DILocation(line: 96, column: 16, scope: !276)
!279 = !DILocation(line: 96, column: 8, scope: !269)
!280 = !DILocation(line: 97, column: 7, scope: !276)
!281 = !DILocation(line: 98, column: 20, scope: !269)
!282 = !DILocation(line: 98, column: 27, scope: !269)
!283 = !DILocation(line: 98, column: 32, scope: !269)
!284 = !DILocation(line: 98, column: 37, scope: !269)
!285 = !DILocation(line: 98, column: 18, scope: !269)
!286 = !DILocation(line: 99, column: 5, scope: !269)
!287 = !DILocation(line: 99, column: 18, scope: !269)
!288 = !DILocation(line: 99, column: 35, scope: !269)
!289 = !DILocation(line: 99, column: 34, scope: !269)
!290 = !{i64 0, i64 4, !291, i64 8, i64 8, !143, i64 16, i64 8, !130, i64 24, i64 8, !130, i64 32, i64 2, !292, i64 40, i64 8, !130, i64 48, i64 8, !130, i64 56, i64 8, !143, i64 64, i64 8, !143}
!291 = !{!167, !167, i64 0}
!292 = !{!174, !174, i64 0}
!293 = !DILocation(line: 100, column: 3, scope: !269)
!294 = !DILocation(line: 94, column: 48, scope: !264)
!295 = !DILocation(line: 94, column: 3, scope: !264)
!296 = distinct !{!296, !267, !297, !229}
!297 = !DILocation(line: 100, column: 3, scope: !261)
!298 = !DILocation(line: 102, column: 9, scope: !232)
!299 = !DILocation(line: 102, column: 14, scope: !232)
!300 = !DILocation(line: 102, column: 7, scope: !232)
!301 = !DILocation(line: 103, column: 15, scope: !232)
!302 = !DILocation(line: 103, column: 3, scope: !232)
!303 = !DILocation(line: 103, column: 8, scope: !232)
!304 = !DILocation(line: 103, column: 13, scope: !232)
!305 = !DILocation(line: 104, column: 22, scope: !232)
!306 = !DILocation(line: 104, column: 3, scope: !232)
!307 = !DILocation(line: 104, column: 8, scope: !232)
!308 = !DILocation(line: 104, column: 20, scope: !232)
!309 = !DILocation(line: 105, column: 20, scope: !232)
!310 = !DILocation(line: 105, column: 35, scope: !232)
!311 = !DILocation(line: 105, column: 33, scope: !232)
!312 = !DILocation(line: 105, column: 3, scope: !232)
!313 = !DILocation(line: 105, column: 8, scope: !232)
!314 = !DILocation(line: 105, column: 18, scope: !232)
!315 = !{!151, !131, i64 576}
!316 = !DILocation(line: 108, column: 1, scope: !232)
!317 = !DILocation(line: 107, column: 3, scope: !232)
!318 = distinct !DISubprogram(name: "marc_arcs", scope: !2, file: !2, line: 111, type: !319, scopeLine: 119, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, retainedNodes: !321)
!319 = !DISubroutineType(types: !320)
!320 = !{null, !80, !53, !53, !10}
!321 = !{!322, !323, !324, !325, !326, !327, !328, !329, !330, !331, !332, !333, !334}
!322 = !DILocalVariable(name: "net", arg: 1, scope: !318, file: !2, line: 111, type: !80)
!323 = !DILocalVariable(name: "new_arcs", arg: 2, scope: !318, file: !2, line: 111, type: !53)
!324 = !DILocalVariable(name: "new_arcs_array", arg: 3, scope: !318, file: !2, line: 111, type: !53)
!325 = !DILocalVariable(name: "arcs_pointer_sorted", arg: 4, scope: !318, file: !2, line: 111, type: !10)
!326 = !DILocalVariable(name: "max_new_arcs", scope: !318, file: !2, line: 121, type: !21)
!327 = !DILocalVariable(name: "positions", scope: !318, file: !2, line: 122, type: !10)
!328 = !DILocalVariable(name: "values", scope: !318, file: !2, line: 123, type: !53)
!329 = !DILocalVariable(name: "global_new", scope: !318, file: !2, line: 124, type: !21)
!330 = !DILocalVariable(name: "best_pos", scope: !318, file: !2, line: 125, type: !21)
!331 = !DILocalVariable(name: "start_id", scope: !318, file: !2, line: 126, type: !21)
!332 = !DILocalVariable(name: "i", scope: !318, file: !2, line: 126, type: !21)
!333 = !DILocalVariable(name: "arc", scope: !318, file: !2, line: 127, type: !54)
!334 = !DILocalVariable(name: "num_threads", scope: !318, file: !2, line: 132, type: !21)
!335 = !DILocation(line: 111, column: 27, scope: !318)
!336 = !DILocation(line: 111, column: 38, scope: !318)
!337 = !DILocation(line: 111, column: 54, scope: !318)
!338 = !DILocation(line: 111, column: 78, scope: !318)
!339 = !DILocation(line: 121, column: 3, scope: !318)
!340 = !DILocation(line: 121, column: 8, scope: !318)
!341 = !DILocation(line: 122, column: 3, scope: !318)
!342 = !DILocation(line: 122, column: 11, scope: !318)
!343 = !DILocation(line: 123, column: 3, scope: !318)
!344 = !DILocation(line: 123, column: 9, scope: !318)
!345 = !DILocation(line: 124, column: 3, scope: !318)
!346 = !DILocation(line: 124, column: 8, scope: !318)
!347 = !DILocation(line: 125, column: 3, scope: !318)
!348 = !DILocation(line: 125, column: 8, scope: !318)
!349 = !DILocation(line: 126, column: 3, scope: !318)
!350 = !DILocation(line: 126, column: 8, scope: !318)
!351 = !DILocation(line: 126, column: 18, scope: !318)
!352 = !DILocation(line: 127, column: 3, scope: !318)
!353 = !DILocation(line: 127, column: 10, scope: !318)
!354 = !DILocation(line: 132, column: 3, scope: !318)
!355 = !DILocation(line: 132, column: 8, scope: !318)
!356 = !DILocation(line: 135, column: 32, scope: !318)
!357 = !DILocation(line: 135, column: 44, scope: !318)
!358 = !DILocation(line: 135, column: 25, scope: !318)
!359 = !DILocation(line: 135, column: 13, scope: !318)
!360 = !DILocation(line: 136, column: 27, scope: !318)
!361 = !DILocation(line: 136, column: 39, scope: !318)
!362 = !DILocation(line: 136, column: 20, scope: !318)
!363 = !DILocation(line: 136, column: 10, scope: !318)
!364 = !DILocation(line: 138, column: 7, scope: !365)
!365 = distinct !DILexicalBlock(scope: !318, file: !2, line: 138, column: 7)
!366 = !DILocation(line: 138, column: 12, scope: !365)
!367 = !{!151, !144, i64 408}
!368 = !DILocation(line: 138, column: 20, scope: !365)
!369 = !DILocation(line: 138, column: 7, scope: !318)
!370 = !DILocation(line: 139, column: 20, scope: !365)
!371 = !DILocation(line: 139, column: 25, scope: !365)
!372 = !{!151, !144, i64 448}
!373 = !DILocation(line: 139, column: 44, scope: !365)
!374 = !DILocation(line: 139, column: 18, scope: !365)
!375 = !DILocation(line: 139, column: 5, scope: !365)
!376 = !DILocation(line: 141, column: 20, scope: !365)
!377 = !DILocation(line: 141, column: 25, scope: !365)
!378 = !DILocation(line: 141, column: 44, scope: !365)
!379 = !DILocation(line: 141, column: 18, scope: !365)
!380 = !DILocation(line: 143, column: 4, scope: !318)
!381 = !DILocation(line: 143, column: 13, scope: !318)
!382 = !DILocation(line: 146, column: 9, scope: !383)
!383 = distinct !DILexicalBlock(scope: !318, file: !2, line: 146, column: 3)
!384 = !DILocation(line: 146, column: 7, scope: !383)
!385 = !DILocation(line: 146, column: 14, scope: !386)
!386 = distinct !DILexicalBlock(scope: !383, file: !2, line: 146, column: 3)
!387 = !DILocation(line: 146, column: 17, scope: !386)
!388 = !DILocation(line: 146, column: 15, scope: !386)
!389 = !DILocation(line: 146, column: 3, scope: !383)
!390 = !DILocation(line: 147, column: 18, scope: !391)
!391 = distinct !DILexicalBlock(scope: !386, file: !2, line: 146, column: 35)
!392 = !DILocation(line: 147, column: 33, scope: !391)
!393 = !DILocation(line: 147, column: 6, scope: !391)
!394 = !DILocation(line: 147, column: 15, scope: !391)
!395 = !DILocation(line: 148, column: 20, scope: !391)
!396 = !DILocation(line: 148, column: 40, scope: !391)
!397 = !DILocation(line: 148, column: 5, scope: !391)
!398 = !DILocation(line: 148, column: 15, scope: !391)
!399 = !DILocation(line: 148, column: 18, scope: !391)
!400 = !DILocation(line: 149, column: 5, scope: !391)
!401 = !DILocation(line: 149, column: 12, scope: !391)
!402 = !DILocation(line: 149, column: 15, scope: !391)
!403 = !DILocation(line: 150, column: 3, scope: !391)
!404 = !DILocation(line: 146, column: 31, scope: !386)
!405 = !DILocation(line: 146, column: 3, scope: !386)
!406 = distinct !{!406, !389, !407, !229}
!407 = !DILocation(line: 150, column: 3, scope: !383)
!408 = !DILocation(line: 153, column: 14, scope: !318)
!409 = !DILocation(line: 153, column: 19, scope: !318)
!410 = !{!151, !144, i64 424}
!411 = !DILocation(line: 153, column: 12, scope: !318)
!412 = !DILocation(line: 154, column: 3, scope: !318)
!413 = !DILocation(line: 154, column: 9, scope: !318)
!414 = !DILocation(line: 154, column: 23, scope: !318)
!415 = !DILocation(line: 154, column: 22, scope: !318)
!416 = !DILocation(line: 154, column: 20, scope: !318)
!417 = !DILocation(line: 154, column: 32, scope: !318)
!418 = !DILocation(line: 154, column: 35, scope: !318)
!419 = !DILocation(line: 154, column: 48, scope: !318)
!420 = !DILocation(line: 154, column: 46, scope: !318)
!421 = !DILocation(line: 0, scope: !318)
!422 = !DILocation(line: 155, column: 9, scope: !423)
!423 = distinct !DILexicalBlock(scope: !424, file: !2, line: 155, column: 9)
!424 = distinct !DILexicalBlock(scope: !318, file: !2, line: 154, column: 62)
!425 = !DILocation(line: 155, column: 21, scope: !423)
!426 = !DILocation(line: 155, column: 19, scope: !423)
!427 = !DILocation(line: 155, column: 9, scope: !424)
!428 = !DILocation(line: 156, column: 20, scope: !429)
!429 = distinct !DILexicalBlock(scope: !423, file: !2, line: 155, column: 40)
!430 = !DILocation(line: 156, column: 19, scope: !429)
!431 = !DILocation(line: 156, column: 17, scope: !429)
!432 = !DILocation(line: 157, column: 22, scope: !429)
!433 = !DILocation(line: 158, column: 5, scope: !429)
!434 = !DILocation(line: 160, column: 11, scope: !435)
!435 = distinct !DILexicalBlock(scope: !423, file: !2, line: 159, column: 10)
!436 = !DILocation(line: 162, column: 16, scope: !437)
!437 = distinct !DILexicalBlock(scope: !424, file: !2, line: 162, column: 9)
!438 = !DILocation(line: 162, column: 14, scope: !437)
!439 = !DILocation(line: 162, column: 21, scope: !440)
!440 = distinct !DILexicalBlock(scope: !437, file: !2, line: 162, column: 9)
!441 = !DILocation(line: 162, column: 25, scope: !440)
!442 = !DILocation(line: 162, column: 23, scope: !440)
!443 = !DILocation(line: 162, column: 9, scope: !437)
!444 = !DILocation(line: 163, column: 18, scope: !445)
!445 = distinct !DILexicalBlock(scope: !446, file: !2, line: 163, column: 17)
!446 = distinct !DILexicalBlock(scope: !440, file: !2, line: 162, column: 43)
!447 = !DILocation(line: 163, column: 25, scope: !445)
!448 = !DILocation(line: 163, column: 30, scope: !445)
!449 = !DILocation(line: 163, column: 45, scope: !445)
!450 = !DILocation(line: 163, column: 28, scope: !445)
!451 = !DILocation(line: 163, column: 49, scope: !445)
!452 = !DILocation(line: 163, column: 55, scope: !445)
!453 = !DILocation(line: 163, column: 60, scope: !445)
!454 = !DILocation(line: 163, column: 75, scope: !445)
!455 = !DILocation(line: 163, column: 85, scope: !445)
!456 = !DILocation(line: 163, column: 63, scope: !445)
!457 = !DILocation(line: 163, column: 95, scope: !445)
!458 = !DILocation(line: 163, column: 17, scope: !446)
!459 = !DILocation(line: 164, column: 24, scope: !460)
!460 = distinct !DILexicalBlock(scope: !445, file: !2, line: 163, column: 101)
!461 = !DILocation(line: 164, column: 34, scope: !460)
!462 = !DILocation(line: 164, column: 23, scope: !460)
!463 = !DILocation(line: 164, column: 21, scope: !460)
!464 = !DILocation(line: 165, column: 28, scope: !460)
!465 = !DILocation(line: 165, column: 26, scope: !460)
!466 = !DILocation(line: 166, column: 13, scope: !460)
!467 = !DILocation(line: 167, column: 9, scope: !446)
!468 = !DILocation(line: 162, column: 39, scope: !440)
!469 = !DILocation(line: 162, column: 9, scope: !440)
!470 = distinct !{!470, !443, !471, !229}
!471 = !DILocation(line: 167, column: 9, scope: !437)
!472 = !DILocation(line: 170, column: 27, scope: !424)
!473 = !DILocation(line: 170, column: 19, scope: !424)
!474 = !DILocation(line: 170, column: 9, scope: !424)
!475 = !DILocation(line: 170, column: 14, scope: !424)
!476 = !DILocation(line: 170, column: 17, scope: !424)
!477 = !DILocation(line: 171, column: 9, scope: !424)
!478 = !DILocation(line: 171, column: 14, scope: !424)
!479 = !DILocation(line: 171, column: 19, scope: !424)
!480 = !{!173, !144, i64 56}
!481 = !DILocation(line: 172, column: 19, scope: !424)
!482 = !DILocation(line: 173, column: 9, scope: !424)
!483 = !DILocation(line: 173, column: 19, scope: !424)
!484 = !DILocation(line: 173, column: 28, scope: !424)
!485 = !DILocation(line: 174, column: 9, scope: !424)
!486 = !DILocation(line: 174, column: 16, scope: !424)
!487 = !DILocation(line: 174, column: 25, scope: !424)
!488 = distinct !{!488, !412, !489, !229}
!489 = !DILocation(line: 177, column: 3, scope: !318)
!490 = !DILocation(line: 183, column: 4, scope: !318)
!491 = !DILocation(line: 183, column: 13, scope: !318)
!492 = !DILocation(line: 184, column: 10, scope: !493)
!493 = distinct !DILexicalBlock(scope: !318, file: !2, line: 184, column: 3)
!494 = !DILocation(line: 184, column: 8, scope: !493)
!495 = !DILocation(line: 184, column: 15, scope: !496)
!496 = distinct !DILexicalBlock(scope: !493, file: !2, line: 184, column: 3)
!497 = !DILocation(line: 184, column: 18, scope: !496)
!498 = !DILocation(line: 184, column: 16, scope: !496)
!499 = !DILocation(line: 184, column: 3, scope: !493)
!500 = !DILocation(line: 185, column: 18, scope: !501)
!501 = distinct !DILexicalBlock(scope: !496, file: !2, line: 184, column: 36)
!502 = !DILocation(line: 185, column: 25, scope: !501)
!503 = !DILocation(line: 185, column: 6, scope: !501)
!504 = !DILocation(line: 185, column: 15, scope: !501)
!505 = !DILocation(line: 186, column: 3, scope: !501)
!506 = !DILocation(line: 184, column: 32, scope: !496)
!507 = !DILocation(line: 184, column: 3, scope: !496)
!508 = distinct !{!508, !499, !509, !229}
!509 = !DILocation(line: 186, column: 3, scope: !493)
!510 = !DILocation(line: 187, column: 3, scope: !318)
!511 = !DILocation(line: 187, column: 8, scope: !318)
!512 = !DILocation(line: 187, column: 18, scope: !318)
!513 = !{!151, !144, i64 640}
!514 = !DILocation(line: 188, column: 23, scope: !318)
!515 = !DILocation(line: 188, column: 22, scope: !318)
!516 = !DILocation(line: 188, column: 34, scope: !318)
!517 = !DILocation(line: 188, column: 39, scope: !318)
!518 = !DILocation(line: 188, column: 32, scope: !318)
!519 = !DILocation(line: 188, column: 41, scope: !318)
!520 = !DILocation(line: 188, column: 45, scope: !318)
!521 = !DILocation(line: 188, column: 51, scope: !318)
!522 = !DILocation(line: 188, column: 3, scope: !318)
!523 = !DILocation(line: 188, column: 8, scope: !318)
!524 = !DILocation(line: 188, column: 17, scope: !318)
!525 = !{!151, !144, i64 624}
!526 = !DILocation(line: 189, column: 9, scope: !527)
!527 = distinct !DILexicalBlock(scope: !318, file: !2, line: 189, column: 7)
!528 = !DILocation(line: 189, column: 8, scope: !527)
!529 = !DILocation(line: 189, column: 20, scope: !527)
!530 = !DILocation(line: 189, column: 25, scope: !527)
!531 = !DILocation(line: 189, column: 18, scope: !527)
!532 = !DILocation(line: 189, column: 28, scope: !527)
!533 = !DILocation(line: 189, column: 32, scope: !527)
!534 = !DILocation(line: 189, column: 7, scope: !318)
!535 = !DILocation(line: 190, column: 26, scope: !527)
!536 = !DILocation(line: 190, column: 31, scope: !527)
!537 = !DILocation(line: 190, column: 50, scope: !527)
!538 = !DILocation(line: 190, column: 49, scope: !527)
!539 = !DILocation(line: 190, column: 61, scope: !527)
!540 = !DILocation(line: 190, column: 66, scope: !527)
!541 = !DILocation(line: 190, column: 59, scope: !527)
!542 = !DILocation(line: 190, column: 69, scope: !527)
!543 = !DILocation(line: 190, column: 45, scope: !527)
!544 = !DILocation(line: 190, column: 40, scope: !527)
!545 = !DILocation(line: 190, column: 7, scope: !527)
!546 = !DILocation(line: 190, column: 12, scope: !527)
!547 = !DILocation(line: 190, column: 24, scope: !527)
!548 = !{!151, !144, i64 632}
!549 = !DILocation(line: 192, column: 26, scope: !527)
!550 = !DILocation(line: 192, column: 31, scope: !527)
!551 = !DILocation(line: 192, column: 7, scope: !527)
!552 = !DILocation(line: 192, column: 12, scope: !527)
!553 = !DILocation(line: 192, column: 24, scope: !527)
!554 = !DILocation(line: 193, column: 3, scope: !318)
!555 = !DILocation(line: 193, column: 10, scope: !318)
!556 = !DILocation(line: 193, column: 15, scope: !318)
!557 = !DILocation(line: 193, column: 27, scope: !318)
!558 = !DILocation(line: 194, column: 24, scope: !559)
!559 = distinct !DILexicalBlock(scope: !318, file: !2, line: 193, column: 32)
!560 = !DILocation(line: 194, column: 29, scope: !559)
!561 = !DILocation(line: 194, column: 40, scope: !559)
!562 = !DILocation(line: 194, column: 45, scope: !559)
!563 = !DILocation(line: 194, column: 38, scope: !559)
!564 = !DILocation(line: 194, column: 5, scope: !559)
!565 = !DILocation(line: 194, column: 10, scope: !559)
!566 = !DILocation(line: 194, column: 22, scope: !559)
!567 = !DILocation(line: 195, column: 5, scope: !559)
!568 = !DILocation(line: 195, column: 10, scope: !559)
!569 = !DILocation(line: 195, column: 19, scope: !559)
!570 = distinct !{!570, !554, !571, !229}
!571 = !DILocation(line: 196, column: 3, scope: !318)
!572 = !DILocation(line: 198, column: 10, scope: !318)
!573 = !DILocation(line: 198, column: 5, scope: !318)
!574 = !DILocation(line: 199, column: 10, scope: !318)
!575 = !DILocation(line: 199, column: 5, scope: !318)
!576 = !DILocation(line: 201, column: 1, scope: !318)
!577 = !DISubprogram(name: "malloc", scope: !578, file: !578, line: 553, type: !579, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !584)
!578 = !DIFile(filename: "/usr/include/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "63eb5d13c95e983b032100a82fad75fa")
!579 = !DISubroutineType(types: !580)
!580 = !{!63, !581}
!581 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !582, line: 46, baseType: !583)
!582 = !DIFile(filename: "llvm-project/build_instr/lib/clang/17/include/stddef.h", directory: "/home/michel/ETH/AST", checksumkind: CSK_MD5, checksum: "d1776268f398bd1ca997c840ad581432")
!583 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!584 = !{}
!585 = distinct !DISubprogram(name: "arc_compare", scope: !2, file: !2, line: 30, type: !586, scopeLine: 36, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !7, retainedNodes: !589)
!586 = !DISubroutineType(types: !587)
!587 = !{!18, !588, !588}
!588 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!589 = !{!590, !591}
!590 = !DILocalVariable(name: "a1", arg: 1, scope: !585, file: !2, line: 30, type: !588)
!591 = !DILocalVariable(name: "a2", arg: 2, scope: !585, file: !2, line: 30, type: !588)
!592 = !DILocation(line: 30, column: 33, scope: !585)
!593 = !DILocation(line: 30, column: 45, scope: !585)
!594 = !DILocation(line: 37, column: 9, scope: !595)
!595 = distinct !DILexicalBlock(scope: !585, file: !2, line: 37, column: 7)
!596 = !DILocation(line: 37, column: 8, scope: !595)
!597 = !DILocation(line: 37, column: 14, scope: !595)
!598 = !DILocation(line: 37, column: 23, scope: !595)
!599 = !DILocation(line: 37, column: 22, scope: !595)
!600 = !DILocation(line: 37, column: 28, scope: !595)
!601 = !DILocation(line: 37, column: 19, scope: !595)
!602 = !DILocation(line: 37, column: 7, scope: !585)
!603 = !DILocation(line: 38, column: 5, scope: !595)
!604 = !DILocation(line: 39, column: 9, scope: !605)
!605 = distinct !DILexicalBlock(scope: !585, file: !2, line: 39, column: 7)
!606 = !DILocation(line: 39, column: 8, scope: !605)
!607 = !DILocation(line: 39, column: 14, scope: !605)
!608 = !DILocation(line: 39, column: 23, scope: !605)
!609 = !DILocation(line: 39, column: 22, scope: !605)
!610 = !DILocation(line: 39, column: 28, scope: !605)
!611 = !DILocation(line: 39, column: 19, scope: !605)
!612 = !DILocation(line: 39, column: 7, scope: !585)
!613 = !DILocation(line: 40, column: 5, scope: !605)
!614 = !DILocation(line: 41, column: 9, scope: !615)
!615 = distinct !DILexicalBlock(scope: !585, file: !2, line: 41, column: 7)
!616 = !DILocation(line: 41, column: 8, scope: !615)
!617 = !DILocation(line: 41, column: 14, scope: !615)
!618 = !DILocation(line: 41, column: 21, scope: !615)
!619 = !DILocation(line: 41, column: 20, scope: !615)
!620 = !DILocation(line: 41, column: 26, scope: !615)
!621 = !DILocation(line: 41, column: 17, scope: !615)
!622 = !DILocation(line: 41, column: 7, scope: !585)
!623 = !DILocation(line: 42, column: 5, scope: !615)
!624 = !DILocation(line: 44, column: 5, scope: !585)
!625 = !DILocation(line: 45, column: 1, scope: !585)
!626 = !DISubprogram(name: "free", scope: !578, file: !578, line: 568, type: !627, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !584)
!627 = !DISubroutineType(types: !628)
!628 = !{null, !63}
!629 = distinct !DISubprogram(name: "resize_prob", scope: !2, file: !2, line: 203, type: !630, scopeLine: 208, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, retainedNodes: !632)
!630 = !DISubroutineType(types: !631)
!631 = !{!21, !80}
!632 = !{!633, !634, !635, !636, !639, !640, !641}
!633 = !DILocalVariable(name: "net", arg: 1, scope: !629, file: !2, line: 203, type: !80)
!634 = !DILocalVariable(name: "arc", scope: !629, file: !2, line: 209, type: !54)
!635 = !DILocalVariable(name: "old_arcs", scope: !629, file: !2, line: 209, type: !54)
!636 = !DILocalVariable(name: "node", scope: !629, file: !2, line: 210, type: !637)
!637 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !638, size: 64)
!638 = !DIDerivedType(tag: DW_TAG_typedef, name: "node_t", file: !13, line: 134, baseType: !29)
!639 = !DILocalVariable(name: "stop", scope: !629, file: !2, line: 210, type: !637)
!640 = !DILocalVariable(name: "root", scope: !629, file: !2, line: 210, type: !637)
!641 = !DILocalVariable(name: "off", scope: !629, file: !2, line: 211, type: !581)
!642 = !DILocation(line: 203, column: 30, scope: !629)
!643 = !DILocation(line: 209, column: 5, scope: !629)
!644 = !DILocation(line: 209, column: 12, scope: !629)
!645 = !DILocation(line: 209, column: 18, scope: !629)
!646 = !DILocation(line: 210, column: 5, scope: !629)
!647 = !DILocation(line: 210, column: 13, scope: !629)
!648 = !DILocation(line: 210, column: 20, scope: !629)
!649 = !DILocation(line: 210, column: 27, scope: !629)
!650 = !DILocation(line: 211, column: 5, scope: !629)
!651 = !DILocation(line: 211, column: 12, scope: !629)
!652 = !DILocation(line: 217, column: 19, scope: !629)
!653 = !DILocation(line: 217, column: 24, scope: !629)
!654 = !{!151, !144, i64 456}
!655 = !DILocation(line: 217, column: 5, scope: !629)
!656 = !DILocation(line: 217, column: 10, scope: !629)
!657 = !DILocation(line: 217, column: 16, scope: !629)
!658 = !{!151, !144, i64 416}
!659 = !DILocation(line: 218, column: 32, scope: !629)
!660 = !DILocation(line: 218, column: 37, scope: !629)
!661 = !DILocation(line: 218, column: 5, scope: !629)
!662 = !DILocation(line: 218, column: 10, scope: !629)
!663 = !DILocation(line: 218, column: 29, scope: !629)
!664 = !DILocation(line: 229, column: 30, scope: !629)
!665 = !DILocation(line: 229, column: 35, scope: !629)
!666 = !DILocation(line: 229, column: 41, scope: !629)
!667 = !DILocation(line: 229, column: 46, scope: !629)
!668 = !DILocation(line: 229, column: 52, scope: !629)
!669 = !DILocation(line: 229, column: 21, scope: !629)
!670 = !DILocation(line: 229, column: 9, scope: !629)
!671 = !DILocation(line: 230, column: 10, scope: !672)
!672 = distinct !DILexicalBlock(scope: !629, file: !2, line: 230, column: 9)
!673 = !DILocation(line: 230, column: 9, scope: !629)
!674 = !DILocation(line: 232, column: 52, scope: !675)
!675 = distinct !DILexicalBlock(scope: !672, file: !2, line: 231, column: 5)
!676 = !DILocation(line: 232, column: 57, scope: !675)
!677 = !DILocation(line: 232, column: 9, scope: !675)
!678 = !DILocation(line: 233, column: 17, scope: !675)
!679 = !DILocation(line: 233, column: 9, scope: !675)
!680 = !DILocation(line: 234, column: 9, scope: !675)
!681 = !DILocation(line: 237, column: 16, scope: !629)
!682 = !DILocation(line: 237, column: 21, scope: !629)
!683 = !DILocation(line: 237, column: 14, scope: !629)
!684 = !DILocation(line: 239, column: 17, scope: !629)
!685 = !DILocation(line: 239, column: 5, scope: !629)
!686 = !DILocation(line: 239, column: 10, scope: !629)
!687 = !DILocation(line: 239, column: 15, scope: !629)
!688 = !DILocation(line: 240, column: 22, scope: !629)
!689 = !DILocation(line: 240, column: 28, scope: !629)
!690 = !DILocation(line: 240, column: 33, scope: !629)
!691 = !DILocation(line: 240, column: 26, scope: !629)
!692 = !DILocation(line: 240, column: 5, scope: !629)
!693 = !DILocation(line: 240, column: 10, scope: !629)
!694 = !DILocation(line: 240, column: 20, scope: !629)
!695 = !DILocation(line: 242, column: 19, scope: !629)
!696 = !DILocation(line: 242, column: 24, scope: !629)
!697 = !DILocation(line: 242, column: 17, scope: !629)
!698 = !DILocation(line: 242, column: 10, scope: !629)
!699 = !DILocation(line: 243, column: 13, scope: !700)
!700 = distinct !DILexicalBlock(scope: !629, file: !2, line: 243, column: 5)
!701 = !DILocation(line: 243, column: 24, scope: !700)
!702 = !DILocation(line: 243, column: 29, scope: !700)
!703 = !{!151, !131, i64 560}
!704 = !DILocation(line: 243, column: 22, scope: !700)
!705 = !DILocation(line: 243, column: 9, scope: !700)
!706 = !DILocation(line: 243, column: 41, scope: !707)
!707 = distinct !DILexicalBlock(scope: !700, file: !2, line: 243, column: 5)
!708 = !DILocation(line: 243, column: 48, scope: !707)
!709 = !DILocation(line: 243, column: 46, scope: !707)
!710 = !DILocation(line: 243, column: 5, scope: !700)
!711 = !DILocation(line: 244, column: 12, scope: !712)
!712 = distinct !DILexicalBlock(scope: !713, file: !2, line: 244, column: 12)
!713 = distinct !DILexicalBlock(scope: !707, file: !2, line: 243, column: 63)
!714 = !DILocation(line: 244, column: 18, scope: !712)
!715 = !DILocation(line: 244, column: 28, scope: !712)
!716 = !DILocation(line: 244, column: 31, scope: !712)
!717 = !DILocation(line: 244, column: 37, scope: !712)
!718 = !{!166, !131, i64 24}
!719 = !DILocation(line: 244, column: 45, scope: !712)
!720 = !DILocation(line: 244, column: 42, scope: !712)
!721 = !DILocation(line: 244, column: 12, scope: !713)
!722 = !DILocation(line: 245, column: 17, scope: !723)
!723 = distinct !DILexicalBlock(scope: !712, file: !2, line: 244, column: 51)
!724 = !DILocation(line: 245, column: 23, scope: !723)
!725 = !DILocation(line: 245, column: 35, scope: !723)
!726 = !DILocation(line: 245, column: 33, scope: !723)
!727 = !DILocation(line: 245, column: 15, scope: !723)
!728 = !DILocation(line: 246, column: 41, scope: !723)
!729 = !DILocation(line: 246, column: 46, scope: !723)
!730 = !DILocation(line: 246, column: 53, scope: !723)
!731 = !DILocation(line: 246, column: 51, scope: !723)
!732 = !DILocation(line: 246, column: 13, scope: !723)
!733 = !DILocation(line: 246, column: 19, scope: !723)
!734 = !DILocation(line: 246, column: 29, scope: !723)
!735 = !DILocation(line: 247, column: 9, scope: !723)
!736 = !DILocation(line: 248, column: 5, scope: !713)
!737 = !DILocation(line: 243, column: 58, scope: !707)
!738 = !DILocation(line: 243, column: 5, scope: !707)
!739 = distinct !{!739, !710, !740, !229}
!740 = !DILocation(line: 248, column: 5, scope: !700)
!741 = !DILocation(line: 250, column: 30, scope: !629)
!742 = !DILocation(line: 250, column: 35, scope: !629)
!743 = !DILocation(line: 250, column: 48, scope: !629)
!744 = !DILocation(line: 250, column: 53, scope: !629)
!745 = !DILocation(line: 250, column: 59, scope: !629)
!746 = !DILocation(line: 250, column: 21, scope: !629)
!747 = !DILocation(line: 250, column: 9, scope: !629)
!748 = !DILocation(line: 251, column: 24, scope: !629)
!749 = !DILocation(line: 251, column: 5, scope: !629)
!750 = !DILocation(line: 251, column: 10, scope: !629)
!751 = !DILocation(line: 251, column: 22, scope: !629)
!752 = !DILocation(line: 253, column: 5, scope: !629)
!753 = !DILocation(line: 254, column: 1, scope: !629)
!754 = !DISubprogram(name: "realloc", scope: !578, file: !578, line: 564, type: !755, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !584)
!755 = !DISubroutineType(types: !756)
!756 = !{!63, !63, !581}
!757 = !DISubprogram(name: "printf", scope: !758, file: !758, line: 356, type: !759, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !584)
!758 = !DIFile(filename: "/usr/include/stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "7d7db73c9e84df2166acd5df3e106f04")
!759 = !DISubroutineType(types: !760)
!760 = !{!18, !761, null}
!761 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !762)
!762 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !763, size: 64)
!763 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4)
!764 = !DISubprogram(name: "fflush", scope: !758, file: !758, line: 230, type: !765, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !584)
!765 = !DISubroutineType(types: !766)
!766 = !{!18, !767}
!767 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !768, size: 64)
!768 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !769, line: 7, baseType: !770)
!769 = !DIFile(filename: "/usr/include/bits/types/FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "571f9fb6223c42439075fdde11a0de5d")
!770 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !771, line: 49, size: 1728, elements: !772)
!771 = !DIFile(filename: "/usr/include/bits/types/struct_FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "2724c33532a91348c643429afa072d1a")
!772 = !{!773, !774, !776, !777, !778, !779, !780, !781, !782, !783, !784, !785, !786, !789, !791, !792, !793, !795, !797, !799, !803, !806, !808, !811, !814, !815, !816, !817, !818}
!773 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !770, file: !771, line: 51, baseType: !18, size: 32)
!774 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_ptr", scope: !770, file: !771, line: 54, baseType: !775, size: 64, offset: 64)
!775 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!776 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_end", scope: !770, file: !771, line: 55, baseType: !775, size: 64, offset: 128)
!777 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_base", scope: !770, file: !771, line: 56, baseType: !775, size: 64, offset: 192)
!778 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_base", scope: !770, file: !771, line: 57, baseType: !775, size: 64, offset: 256)
!779 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_ptr", scope: !770, file: !771, line: 58, baseType: !775, size: 64, offset: 320)
!780 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_end", scope: !770, file: !771, line: 59, baseType: !775, size: 64, offset: 384)
!781 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_base", scope: !770, file: !771, line: 60, baseType: !775, size: 64, offset: 448)
!782 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_end", scope: !770, file: !771, line: 61, baseType: !775, size: 64, offset: 512)
!783 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_base", scope: !770, file: !771, line: 64, baseType: !775, size: 64, offset: 576)
!784 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_backup_base", scope: !770, file: !771, line: 65, baseType: !775, size: 64, offset: 640)
!785 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_end", scope: !770, file: !771, line: 66, baseType: !775, size: 64, offset: 704)
!786 = !DIDerivedType(tag: DW_TAG_member, name: "_markers", scope: !770, file: !771, line: 68, baseType: !787, size: 64, offset: 768)
!787 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !788, size: 64)
!788 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_marker", file: !771, line: 36, flags: DIFlagFwdDecl)
!789 = !DIDerivedType(tag: DW_TAG_member, name: "_chain", scope: !770, file: !771, line: 70, baseType: !790, size: 64, offset: 832)
!790 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !770, size: 64)
!791 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !770, file: !771, line: 72, baseType: !18, size: 32, offset: 896)
!792 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !770, file: !771, line: 73, baseType: !18, size: 32, offset: 928)
!793 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !770, file: !771, line: 74, baseType: !794, size: 64, offset: 960)
!794 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !24, line: 152, baseType: !25)
!795 = !DIDerivedType(tag: DW_TAG_member, name: "_cur_column", scope: !770, file: !771, line: 77, baseType: !796, size: 16, offset: 1024)
!796 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!797 = !DIDerivedType(tag: DW_TAG_member, name: "_vtable_offset", scope: !770, file: !771, line: 78, baseType: !798, size: 8, offset: 1040)
!798 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!799 = !DIDerivedType(tag: DW_TAG_member, name: "_shortbuf", scope: !770, file: !771, line: 79, baseType: !800, size: 8, offset: 1048)
!800 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 8, elements: !801)
!801 = !{!802}
!802 = !DISubrange(count: 1)
!803 = !DIDerivedType(tag: DW_TAG_member, name: "_lock", scope: !770, file: !771, line: 81, baseType: !804, size: 64, offset: 1088)
!804 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !805, size: 64)
!805 = !DIDerivedType(tag: DW_TAG_typedef, name: "_IO_lock_t", file: !771, line: 43, baseType: null)
!806 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !770, file: !771, line: 89, baseType: !807, size: 64, offset: 1152)
!807 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !24, line: 153, baseType: !25)
!808 = !DIDerivedType(tag: DW_TAG_member, name: "_codecvt", scope: !770, file: !771, line: 91, baseType: !809, size: 64, offset: 1216)
!809 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !810, size: 64)
!810 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_codecvt", file: !771, line: 37, flags: DIFlagFwdDecl)
!811 = !DIDerivedType(tag: DW_TAG_member, name: "_wide_data", scope: !770, file: !771, line: 92, baseType: !812, size: 64, offset: 1280)
!812 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !813, size: 64)
!813 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_wide_data", file: !771, line: 38, flags: DIFlagFwdDecl)
!814 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_list", scope: !770, file: !771, line: 93, baseType: !790, size: 64, offset: 1344)
!815 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_buf", scope: !770, file: !771, line: 94, baseType: !63, size: 64, offset: 1408)
!816 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !770, file: !771, line: 95, baseType: !581, size: 64, offset: 1472)
!817 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !770, file: !771, line: 96, baseType: !18, size: 32, offset: 1536)
!818 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !770, file: !771, line: 98, baseType: !819, size: 160, offset: 1568)
!819 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 160, elements: !820)
!820 = !{!821}
!821 = !DISubrange(count: 20)
!822 = distinct !DISubprogram(name: "insert_new_arc", scope: !2, file: !2, line: 263, type: !823, scopeLine: 276, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, retainedNodes: !825)
!823 = !DISubroutineType(types: !824)
!824 = !{null, !54, !21, !637, !637, !20, !20, !21, !21}
!825 = !{!826, !827, !828, !829, !830, !831, !832, !833, !834}
!826 = !DILocalVariable(name: "newarc", arg: 1, scope: !822, file: !2, line: 263, type: !54)
!827 = !DILocalVariable(name: "newpos", arg: 2, scope: !822, file: !2, line: 263, type: !21)
!828 = !DILocalVariable(name: "tail", arg: 3, scope: !822, file: !2, line: 263, type: !637)
!829 = !DILocalVariable(name: "head", arg: 4, scope: !822, file: !2, line: 263, type: !637)
!830 = !DILocalVariable(name: "cost", arg: 5, scope: !822, file: !2, line: 264, type: !20)
!831 = !DILocalVariable(name: "red_cost", arg: 6, scope: !822, file: !2, line: 264, type: !20)
!832 = !DILocalVariable(name: "m", arg: 7, scope: !822, file: !2, line: 264, type: !21)
!833 = !DILocalVariable(name: "number", arg: 8, scope: !822, file: !2, line: 264, type: !21)
!834 = !DILocalVariable(name: "pos", scope: !822, file: !2, line: 277, type: !21)
!835 = !DILocation(line: 263, column: 28, scope: !822)
!836 = !DILocation(line: 263, column: 41, scope: !822)
!837 = !DILocation(line: 263, column: 57, scope: !822)
!838 = !DILocation(line: 263, column: 71, scope: !822)
!839 = !DILocation(line: 264, column: 12, scope: !822)
!840 = !DILocation(line: 264, column: 25, scope: !822)
!841 = !DILocation(line: 264, column: 40, scope: !822)
!842 = !DILocation(line: 264, column: 48, scope: !822)
!843 = !DILocation(line: 277, column: 5, scope: !822)
!844 = !DILocation(line: 277, column: 10, scope: !822)
!845 = !DILocation(line: 279, column: 32, scope: !822)
!846 = !DILocation(line: 279, column: 5, scope: !822)
!847 = !DILocation(line: 279, column: 12, scope: !822)
!848 = !DILocation(line: 279, column: 20, scope: !822)
!849 = !DILocation(line: 279, column: 30, scope: !822)
!850 = !{!173, !131, i64 16}
!851 = !DILocation(line: 280, column: 32, scope: !822)
!852 = !DILocation(line: 280, column: 5, scope: !822)
!853 = !DILocation(line: 280, column: 12, scope: !822)
!854 = !DILocation(line: 280, column: 20, scope: !822)
!855 = !DILocation(line: 280, column: 30, scope: !822)
!856 = !{!173, !131, i64 24}
!857 = !DILocation(line: 281, column: 32, scope: !822)
!858 = !DILocation(line: 281, column: 5, scope: !822)
!859 = !DILocation(line: 281, column: 12, scope: !822)
!860 = !DILocation(line: 281, column: 20, scope: !822)
!861 = !DILocation(line: 281, column: 30, scope: !822)
!862 = !{!173, !144, i64 64}
!863 = !DILocation(line: 282, column: 32, scope: !822)
!864 = !DILocation(line: 282, column: 5, scope: !822)
!865 = !DILocation(line: 282, column: 12, scope: !822)
!866 = !DILocation(line: 282, column: 20, scope: !822)
!867 = !DILocation(line: 282, column: 30, scope: !822)
!868 = !{!173, !144, i64 8}
!869 = !DILocation(line: 283, column: 40, scope: !822)
!870 = !DILocation(line: 283, column: 5, scope: !822)
!871 = !DILocation(line: 283, column: 12, scope: !822)
!872 = !DILocation(line: 283, column: 20, scope: !822)
!873 = !DILocation(line: 283, column: 30, scope: !822)
!874 = !DILocation(line: 284, column: 32, scope: !822)
!875 = !DILocation(line: 284, column: 5, scope: !822)
!876 = !DILocation(line: 284, column: 12, scope: !822)
!877 = !DILocation(line: 284, column: 20, scope: !822)
!878 = !DILocation(line: 284, column: 30, scope: !822)
!879 = !DILocation(line: 286, column: 11, scope: !822)
!880 = !DILocation(line: 286, column: 17, scope: !822)
!881 = !DILocation(line: 286, column: 9, scope: !822)
!882 = !DILocation(line: 287, column: 5, scope: !822)
!883 = !DILocation(line: 287, column: 12, scope: !822)
!884 = !DILocation(line: 287, column: 15, scope: !822)
!885 = !DILocation(line: 287, column: 18, scope: !822)
!886 = !DILocation(line: 287, column: 21, scope: !822)
!887 = !DILocation(line: 287, column: 40, scope: !822)
!888 = !DILocation(line: 287, column: 47, scope: !822)
!889 = !DILocation(line: 287, column: 50, scope: !822)
!890 = !DILocation(line: 287, column: 52, scope: !822)
!891 = !DILocation(line: 287, column: 56, scope: !822)
!892 = !DILocation(line: 287, column: 30, scope: !822)
!893 = !DILocation(line: 0, scope: !822)
!894 = !DILocation(line: 289, column: 34, scope: !895)
!895 = distinct !DILexicalBlock(scope: !822, file: !2, line: 288, column: 5)
!896 = !DILocation(line: 289, column: 41, scope: !895)
!897 = !DILocation(line: 289, column: 44, scope: !895)
!898 = !DILocation(line: 289, column: 46, scope: !895)
!899 = !DILocation(line: 289, column: 50, scope: !895)
!900 = !DILocation(line: 289, column: 9, scope: !895)
!901 = !DILocation(line: 289, column: 16, scope: !895)
!902 = !DILocation(line: 289, column: 19, scope: !895)
!903 = !DILocation(line: 289, column: 23, scope: !895)
!904 = !DILocation(line: 289, column: 32, scope: !895)
!905 = !DILocation(line: 290, column: 34, scope: !895)
!906 = !DILocation(line: 290, column: 41, scope: !895)
!907 = !DILocation(line: 290, column: 44, scope: !895)
!908 = !DILocation(line: 290, column: 46, scope: !895)
!909 = !DILocation(line: 290, column: 50, scope: !895)
!910 = !DILocation(line: 290, column: 9, scope: !895)
!911 = !DILocation(line: 290, column: 16, scope: !895)
!912 = !DILocation(line: 290, column: 19, scope: !895)
!913 = !DILocation(line: 290, column: 23, scope: !895)
!914 = !DILocation(line: 290, column: 32, scope: !895)
!915 = !DILocation(line: 291, column: 34, scope: !895)
!916 = !DILocation(line: 291, column: 41, scope: !895)
!917 = !DILocation(line: 291, column: 44, scope: !895)
!918 = !DILocation(line: 291, column: 46, scope: !895)
!919 = !DILocation(line: 291, column: 50, scope: !895)
!920 = !DILocation(line: 291, column: 9, scope: !895)
!921 = !DILocation(line: 291, column: 16, scope: !895)
!922 = !DILocation(line: 291, column: 19, scope: !895)
!923 = !DILocation(line: 291, column: 23, scope: !895)
!924 = !DILocation(line: 291, column: 32, scope: !895)
!925 = !DILocation(line: 292, column: 34, scope: !895)
!926 = !DILocation(line: 292, column: 41, scope: !895)
!927 = !DILocation(line: 292, column: 44, scope: !895)
!928 = !DILocation(line: 292, column: 46, scope: !895)
!929 = !DILocation(line: 292, column: 50, scope: !895)
!930 = !DILocation(line: 292, column: 9, scope: !895)
!931 = !DILocation(line: 292, column: 16, scope: !895)
!932 = !DILocation(line: 292, column: 19, scope: !895)
!933 = !DILocation(line: 292, column: 23, scope: !895)
!934 = !DILocation(line: 292, column: 32, scope: !895)
!935 = !DILocation(line: 293, column: 34, scope: !895)
!936 = !DILocation(line: 293, column: 41, scope: !895)
!937 = !DILocation(line: 293, column: 44, scope: !895)
!938 = !DILocation(line: 293, column: 46, scope: !895)
!939 = !DILocation(line: 293, column: 50, scope: !895)
!940 = !DILocation(line: 293, column: 9, scope: !895)
!941 = !DILocation(line: 293, column: 16, scope: !895)
!942 = !DILocation(line: 293, column: 19, scope: !895)
!943 = !DILocation(line: 293, column: 23, scope: !895)
!944 = !DILocation(line: 293, column: 32, scope: !895)
!945 = !DILocation(line: 294, column: 34, scope: !895)
!946 = !DILocation(line: 294, column: 41, scope: !895)
!947 = !DILocation(line: 294, column: 44, scope: !895)
!948 = !DILocation(line: 294, column: 46, scope: !895)
!949 = !DILocation(line: 294, column: 50, scope: !895)
!950 = !DILocation(line: 294, column: 9, scope: !895)
!951 = !DILocation(line: 294, column: 16, scope: !895)
!952 = !DILocation(line: 294, column: 19, scope: !895)
!953 = !DILocation(line: 294, column: 23, scope: !895)
!954 = !DILocation(line: 294, column: 32, scope: !895)
!955 = !DILocation(line: 296, column: 15, scope: !895)
!956 = !DILocation(line: 296, column: 18, scope: !895)
!957 = !DILocation(line: 296, column: 13, scope: !895)
!958 = !DILocation(line: 297, column: 34, scope: !895)
!959 = !DILocation(line: 297, column: 9, scope: !895)
!960 = !DILocation(line: 297, column: 16, scope: !895)
!961 = !DILocation(line: 297, column: 19, scope: !895)
!962 = !DILocation(line: 297, column: 23, scope: !895)
!963 = !DILocation(line: 297, column: 32, scope: !895)
!964 = !DILocation(line: 298, column: 34, scope: !895)
!965 = !DILocation(line: 298, column: 9, scope: !895)
!966 = !DILocation(line: 298, column: 16, scope: !895)
!967 = !DILocation(line: 298, column: 19, scope: !895)
!968 = !DILocation(line: 298, column: 23, scope: !895)
!969 = !DILocation(line: 298, column: 32, scope: !895)
!970 = !DILocation(line: 299, column: 34, scope: !895)
!971 = !DILocation(line: 299, column: 9, scope: !895)
!972 = !DILocation(line: 299, column: 16, scope: !895)
!973 = !DILocation(line: 299, column: 19, scope: !895)
!974 = !DILocation(line: 299, column: 23, scope: !895)
!975 = !DILocation(line: 299, column: 32, scope: !895)
!976 = !DILocation(line: 300, column: 34, scope: !895)
!977 = !DILocation(line: 300, column: 9, scope: !895)
!978 = !DILocation(line: 300, column: 16, scope: !895)
!979 = !DILocation(line: 300, column: 19, scope: !895)
!980 = !DILocation(line: 300, column: 23, scope: !895)
!981 = !DILocation(line: 300, column: 32, scope: !895)
!982 = !DILocation(line: 301, column: 42, scope: !895)
!983 = !DILocation(line: 301, column: 9, scope: !895)
!984 = !DILocation(line: 301, column: 16, scope: !895)
!985 = !DILocation(line: 301, column: 19, scope: !895)
!986 = !DILocation(line: 301, column: 23, scope: !895)
!987 = !DILocation(line: 301, column: 32, scope: !895)
!988 = !DILocation(line: 302, column: 34, scope: !895)
!989 = !DILocation(line: 302, column: 9, scope: !895)
!990 = !DILocation(line: 302, column: 16, scope: !895)
!991 = !DILocation(line: 302, column: 19, scope: !895)
!992 = !DILocation(line: 302, column: 23, scope: !895)
!993 = !DILocation(line: 302, column: 32, scope: !895)
!994 = distinct !{!994, !882, !995, !229}
!995 = !DILocation(line: 303, column: 5, scope: !822)
!996 = !DILocation(line: 306, column: 1, scope: !822)
!997 = distinct !DISubprogram(name: "replace_weaker_arc", scope: !2, file: !2, line: 314, type: !998, scopeLine: 327, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, retainedNodes: !1000)
!998 = !DISubroutineType(types: !999)
!999 = !{null, !54, !637, !637, !20, !20, !21, !21}
!1000 = !{!1001, !1002, !1003, !1004, !1005, !1006, !1007, !1008, !1009}
!1001 = !DILocalVariable(name: "newarc", arg: 1, scope: !997, file: !2, line: 314, type: !54)
!1002 = !DILocalVariable(name: "tail", arg: 2, scope: !997, file: !2, line: 314, type: !637)
!1003 = !DILocalVariable(name: "head", arg: 3, scope: !997, file: !2, line: 314, type: !637)
!1004 = !DILocalVariable(name: "cost", arg: 4, scope: !997, file: !2, line: 315, type: !20)
!1005 = !DILocalVariable(name: "red_cost", arg: 5, scope: !997, file: !2, line: 315, type: !20)
!1006 = !DILocalVariable(name: "max_new_par_residual_new_arcs", arg: 6, scope: !997, file: !2, line: 315, type: !21)
!1007 = !DILocalVariable(name: "number", arg: 7, scope: !997, file: !2, line: 315, type: !21)
!1008 = !DILocalVariable(name: "pos", scope: !997, file: !2, line: 328, type: !21)
!1009 = !DILocalVariable(name: "cmp", scope: !997, file: !2, line: 329, type: !21)
!1010 = !DILocation(line: 314, column: 33, scope: !997)
!1011 = !DILocation(line: 314, column: 49, scope: !997)
!1012 = !DILocation(line: 314, column: 63, scope: !997)
!1013 = !DILocation(line: 315, column: 33, scope: !997)
!1014 = !DILocation(line: 315, column: 46, scope: !997)
!1015 = !DILocation(line: 315, column: 60, scope: !997)
!1016 = !DILocation(line: 315, column: 96, scope: !997)
!1017 = !DILocation(line: 328, column: 5, scope: !997)
!1018 = !DILocation(line: 328, column: 10, scope: !997)
!1019 = !DILocation(line: 329, column: 5, scope: !997)
!1020 = !DILocation(line: 329, column: 10, scope: !997)
!1021 = !DILocation(line: 331, column: 26, scope: !997)
!1022 = !DILocation(line: 331, column: 5, scope: !997)
!1023 = !DILocation(line: 331, column: 15, scope: !997)
!1024 = !DILocation(line: 331, column: 24, scope: !997)
!1025 = !DILocation(line: 332, column: 26, scope: !997)
!1026 = !DILocation(line: 332, column: 5, scope: !997)
!1027 = !DILocation(line: 332, column: 15, scope: !997)
!1028 = !DILocation(line: 332, column: 24, scope: !997)
!1029 = !DILocation(line: 333, column: 26, scope: !997)
!1030 = !DILocation(line: 333, column: 5, scope: !997)
!1031 = !DILocation(line: 333, column: 15, scope: !997)
!1032 = !DILocation(line: 333, column: 24, scope: !997)
!1033 = !DILocation(line: 334, column: 26, scope: !997)
!1034 = !DILocation(line: 334, column: 5, scope: !997)
!1035 = !DILocation(line: 334, column: 15, scope: !997)
!1036 = !DILocation(line: 334, column: 24, scope: !997)
!1037 = !DILocation(line: 335, column: 34, scope: !997)
!1038 = !DILocation(line: 335, column: 5, scope: !997)
!1039 = !DILocation(line: 335, column: 15, scope: !997)
!1040 = !DILocation(line: 335, column: 24, scope: !997)
!1041 = !DILocation(line: 336, column: 26, scope: !997)
!1042 = !DILocation(line: 336, column: 5, scope: !997)
!1043 = !DILocation(line: 336, column: 15, scope: !997)
!1044 = !DILocation(line: 336, column: 24, scope: !997)
!1045 = !DILocation(line: 338, column: 9, scope: !997)
!1046 = !DILocation(line: 339, column: 12, scope: !997)
!1047 = !DILocation(line: 339, column: 22, scope: !997)
!1048 = !DILocation(line: 339, column: 29, scope: !997)
!1049 = !DILocation(line: 339, column: 39, scope: !997)
!1050 = !DILocation(line: 339, column: 27, scope: !997)
!1051 = !DILocation(line: 339, column: 11, scope: !997)
!1052 = !DILocation(line: 339, column: 9, scope: !997)
!1053 = !DILocation(line: 340, column: 5, scope: !997)
!1054 = !DILocation(line: 340, column: 12, scope: !997)
!1055 = !DILocation(line: 340, column: 19, scope: !997)
!1056 = !DILocation(line: 340, column: 16, scope: !997)
!1057 = !DILocation(line: 340, column: 49, scope: !997)
!1058 = !DILocation(line: 340, column: 52, scope: !997)
!1059 = !DILocation(line: 340, column: 63, scope: !997)
!1060 = !DILocation(line: 340, column: 70, scope: !997)
!1061 = !DILocation(line: 340, column: 73, scope: !997)
!1062 = !DILocation(line: 340, column: 77, scope: !997)
!1063 = !DILocation(line: 340, column: 61, scope: !997)
!1064 = !DILocation(line: 0, scope: !997)
!1065 = !DILocation(line: 342, column: 30, scope: !1066)
!1066 = distinct !DILexicalBlock(scope: !997, file: !2, line: 341, column: 5)
!1067 = !DILocation(line: 342, column: 37, scope: !1066)
!1068 = !DILocation(line: 342, column: 40, scope: !1066)
!1069 = !DILocation(line: 342, column: 44, scope: !1066)
!1070 = !DILocation(line: 342, column: 9, scope: !1066)
!1071 = !DILocation(line: 342, column: 16, scope: !1066)
!1072 = !DILocation(line: 342, column: 19, scope: !1066)
!1073 = !DILocation(line: 342, column: 23, scope: !1066)
!1074 = !DILocation(line: 342, column: 28, scope: !1066)
!1075 = !DILocation(line: 343, column: 30, scope: !1066)
!1076 = !DILocation(line: 343, column: 37, scope: !1066)
!1077 = !DILocation(line: 343, column: 40, scope: !1066)
!1078 = !DILocation(line: 343, column: 44, scope: !1066)
!1079 = !DILocation(line: 343, column: 9, scope: !1066)
!1080 = !DILocation(line: 343, column: 16, scope: !1066)
!1081 = !DILocation(line: 343, column: 19, scope: !1066)
!1082 = !DILocation(line: 343, column: 23, scope: !1066)
!1083 = !DILocation(line: 343, column: 28, scope: !1066)
!1084 = !DILocation(line: 344, column: 30, scope: !1066)
!1085 = !DILocation(line: 344, column: 37, scope: !1066)
!1086 = !DILocation(line: 344, column: 40, scope: !1066)
!1087 = !DILocation(line: 344, column: 44, scope: !1066)
!1088 = !DILocation(line: 344, column: 9, scope: !1066)
!1089 = !DILocation(line: 344, column: 16, scope: !1066)
!1090 = !DILocation(line: 344, column: 19, scope: !1066)
!1091 = !DILocation(line: 344, column: 23, scope: !1066)
!1092 = !DILocation(line: 344, column: 28, scope: !1066)
!1093 = !DILocation(line: 345, column: 34, scope: !1066)
!1094 = !DILocation(line: 345, column: 41, scope: !1066)
!1095 = !DILocation(line: 345, column: 44, scope: !1066)
!1096 = !DILocation(line: 345, column: 48, scope: !1066)
!1097 = !DILocation(line: 345, column: 9, scope: !1066)
!1098 = !DILocation(line: 345, column: 16, scope: !1066)
!1099 = !DILocation(line: 345, column: 19, scope: !1066)
!1100 = !DILocation(line: 345, column: 23, scope: !1066)
!1101 = !DILocation(line: 345, column: 32, scope: !1066)
!1102 = !DILocation(line: 346, column: 30, scope: !1066)
!1103 = !DILocation(line: 346, column: 37, scope: !1066)
!1104 = !DILocation(line: 346, column: 40, scope: !1066)
!1105 = !DILocation(line: 346, column: 44, scope: !1066)
!1106 = !DILocation(line: 346, column: 9, scope: !1066)
!1107 = !DILocation(line: 346, column: 16, scope: !1066)
!1108 = !DILocation(line: 346, column: 19, scope: !1066)
!1109 = !DILocation(line: 346, column: 23, scope: !1066)
!1110 = !DILocation(line: 346, column: 28, scope: !1066)
!1111 = !DILocation(line: 347, column: 30, scope: !1066)
!1112 = !DILocation(line: 347, column: 37, scope: !1066)
!1113 = !DILocation(line: 347, column: 40, scope: !1066)
!1114 = !DILocation(line: 347, column: 44, scope: !1066)
!1115 = !DILocation(line: 347, column: 9, scope: !1066)
!1116 = !DILocation(line: 347, column: 16, scope: !1066)
!1117 = !DILocation(line: 347, column: 19, scope: !1066)
!1118 = !DILocation(line: 347, column: 23, scope: !1066)
!1119 = !DILocation(line: 347, column: 28, scope: !1066)
!1120 = !DILocation(line: 349, column: 30, scope: !1066)
!1121 = !DILocation(line: 349, column: 9, scope: !1066)
!1122 = !DILocation(line: 349, column: 16, scope: !1066)
!1123 = !DILocation(line: 349, column: 19, scope: !1066)
!1124 = !DILocation(line: 349, column: 23, scope: !1066)
!1125 = !DILocation(line: 349, column: 28, scope: !1066)
!1126 = !DILocation(line: 350, column: 30, scope: !1066)
!1127 = !DILocation(line: 350, column: 9, scope: !1066)
!1128 = !DILocation(line: 350, column: 16, scope: !1066)
!1129 = !DILocation(line: 350, column: 19, scope: !1066)
!1130 = !DILocation(line: 350, column: 23, scope: !1066)
!1131 = !DILocation(line: 350, column: 28, scope: !1066)
!1132 = !DILocation(line: 351, column: 30, scope: !1066)
!1133 = !DILocation(line: 351, column: 9, scope: !1066)
!1134 = !DILocation(line: 351, column: 16, scope: !1066)
!1135 = !DILocation(line: 351, column: 19, scope: !1066)
!1136 = !DILocation(line: 351, column: 23, scope: !1066)
!1137 = !DILocation(line: 351, column: 28, scope: !1066)
!1138 = !DILocation(line: 352, column: 34, scope: !1066)
!1139 = !DILocation(line: 352, column: 9, scope: !1066)
!1140 = !DILocation(line: 352, column: 16, scope: !1066)
!1141 = !DILocation(line: 352, column: 19, scope: !1066)
!1142 = !DILocation(line: 352, column: 23, scope: !1066)
!1143 = !DILocation(line: 352, column: 32, scope: !1066)
!1144 = !DILocation(line: 353, column: 38, scope: !1066)
!1145 = !DILocation(line: 353, column: 9, scope: !1066)
!1146 = !DILocation(line: 353, column: 16, scope: !1066)
!1147 = !DILocation(line: 353, column: 19, scope: !1066)
!1148 = !DILocation(line: 353, column: 23, scope: !1066)
!1149 = !DILocation(line: 353, column: 28, scope: !1066)
!1150 = !DILocation(line: 354, column: 30, scope: !1066)
!1151 = !DILocation(line: 354, column: 9, scope: !1066)
!1152 = !DILocation(line: 354, column: 16, scope: !1066)
!1153 = !DILocation(line: 354, column: 19, scope: !1066)
!1154 = !DILocation(line: 354, column: 23, scope: !1066)
!1155 = !DILocation(line: 354, column: 28, scope: !1066)
!1156 = !DILocation(line: 355, column: 15, scope: !1066)
!1157 = !DILocation(line: 355, column: 13, scope: !1066)
!1158 = !DILocation(line: 356, column: 13, scope: !1066)
!1159 = !DILocation(line: 357, column: 13, scope: !1160)
!1160 = distinct !DILexicalBlock(scope: !1066, file: !2, line: 357, column: 13)
!1161 = !DILocation(line: 357, column: 17, scope: !1160)
!1162 = !DILocation(line: 357, column: 24, scope: !1160)
!1163 = !DILocation(line: 357, column: 21, scope: !1160)
!1164 = !DILocation(line: 357, column: 13, scope: !1066)
!1165 = !DILocation(line: 358, column: 17, scope: !1166)
!1166 = distinct !DILexicalBlock(scope: !1160, file: !2, line: 358, column: 17)
!1167 = !DILocation(line: 358, column: 24, scope: !1166)
!1168 = !DILocation(line: 358, column: 27, scope: !1166)
!1169 = !DILocation(line: 358, column: 31, scope: !1166)
!1170 = !DILocation(line: 358, column: 38, scope: !1166)
!1171 = !DILocation(line: 358, column: 45, scope: !1166)
!1172 = !DILocation(line: 358, column: 50, scope: !1166)
!1173 = !DILocation(line: 358, column: 36, scope: !1166)
!1174 = !DILocation(line: 358, column: 17, scope: !1160)
!1175 = !DILocation(line: 359, column: 20, scope: !1166)
!1176 = !DILocation(line: 359, column: 17, scope: !1166)
!1177 = distinct !{!1177, !1053, !1178, !229}
!1178 = !DILocation(line: 360, column: 5, scope: !997)
!1179 = !DILocation(line: 363, column: 1, scope: !997)
!1180 = distinct !DISubprogram(name: "calculate_max_redcost", scope: !2, file: !2, line: 383, type: !1181, scopeLine: 390, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, retainedNodes: !1184)
!1181 = !DISubroutineType(types: !1182)
!1182 = !{null, !80, !53, !1183, !21}
!1183 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !588, size: 64)
!1184 = !{!1185, !1186, !1187, !1188, !1189}
!1185 = !DILocalVariable(name: "net", arg: 1, scope: !1180, file: !2, line: 383, type: !80)
!1186 = !DILocalVariable(name: "max_redcost", arg: 2, scope: !1180, file: !2, line: 383, type: !53)
!1187 = !DILocalVariable(name: "arcs_pointer_sorted", arg: 3, scope: !1180, file: !2, line: 383, type: !1183)
!1188 = !DILocalVariable(name: "num_threads", arg: 4, scope: !1180, file: !2, line: 383, type: !21)
!1189 = !DILocalVariable(name: "i", scope: !1180, file: !2, line: 391, type: !21)
!1190 = !DILocation(line: 383, column: 39, scope: !1180)
!1191 = !DILocation(line: 383, column: 50, scope: !1180)
!1192 = !DILocation(line: 383, column: 72, scope: !1180)
!1193 = !DILocation(line: 383, column: 98, scope: !1180)
!1194 = !DILocation(line: 391, column: 3, scope: !1180)
!1195 = !DILocation(line: 391, column: 8, scope: !1180)
!1196 = !DILocation(line: 392, column: 4, scope: !1180)
!1197 = !DILocation(line: 392, column: 16, scope: !1180)
!1198 = !DILocation(line: 393, column: 10, scope: !1199)
!1199 = distinct !DILexicalBlock(scope: !1180, file: !2, line: 393, column: 3)
!1200 = !DILocation(line: 393, column: 8, scope: !1199)
!1201 = !DILocation(line: 393, column: 15, scope: !1202)
!1202 = distinct !DILexicalBlock(scope: !1199, file: !2, line: 393, column: 3)
!1203 = !DILocation(line: 393, column: 19, scope: !1202)
!1204 = !DILocation(line: 393, column: 17, scope: !1202)
!1205 = !DILocation(line: 393, column: 3, scope: !1199)
!1206 = !DILocation(line: 395, column: 9, scope: !1207)
!1207 = distinct !DILexicalBlock(scope: !1208, file: !2, line: 395, column: 9)
!1208 = distinct !DILexicalBlock(scope: !1202, file: !2, line: 394, column: 3)
!1209 = !DILocation(line: 395, column: 29, scope: !1207)
!1210 = !DILocation(line: 395, column: 36, scope: !1207)
!1211 = !DILocation(line: 395, column: 44, scope: !1207)
!1212 = !DILocation(line: 395, column: 43, scope: !1207)
!1213 = !DILocation(line: 395, column: 41, scope: !1207)
!1214 = !DILocation(line: 395, column: 9, scope: !1208)
!1215 = !DILocation(line: 396, column: 22, scope: !1207)
!1216 = !DILocation(line: 396, column: 42, scope: !1207)
!1217 = !DILocation(line: 396, column: 49, scope: !1207)
!1218 = !DILocation(line: 396, column: 8, scope: !1207)
!1219 = !DILocation(line: 396, column: 20, scope: !1207)
!1220 = !DILocation(line: 396, column: 7, scope: !1207)
!1221 = !DILocation(line: 397, column: 3, scope: !1208)
!1222 = !DILocation(line: 393, column: 33, scope: !1202)
!1223 = !DILocation(line: 393, column: 3, scope: !1202)
!1224 = distinct !{!1224, !1205, !1225, !229}
!1225 = !DILocation(line: 397, column: 3, scope: !1199)
!1226 = !DILocation(line: 398, column: 1, scope: !1180)
!1227 = distinct !DISubprogram(name: "switch_arcs", scope: !2, file: !2, line: 401, type: !1228, scopeLine: 413, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, retainedNodes: !1230)
!1228 = !DISubroutineType(types: !1229)
!1229 = !{!21, !80, !53, !588, !54, !18, !21, !21, !21}
!1230 = !{!1231, !1232, !1233, !1234, !1235, !1236, !1237, !1238, !1239, !1240, !1241, !1242, !1243, !1244, !1245}
!1231 = !DILocalVariable(name: "net", arg: 1, scope: !1227, file: !2, line: 401, type: !80)
!1232 = !DILocalVariable(name: "num_del_arcs", arg: 2, scope: !1227, file: !2, line: 401, type: !53)
!1233 = !DILocalVariable(name: "deleted_arcs", arg: 3, scope: !1227, file: !2, line: 401, type: !588)
!1234 = !DILocalVariable(name: "arcnew", arg: 4, scope: !1227, file: !2, line: 401, type: !54)
!1235 = !DILocalVariable(name: "thread", arg: 5, scope: !1227, file: !2, line: 401, type: !18)
!1236 = !DILocalVariable(name: "max_new_par_residual_new_arcs", arg: 6, scope: !1227, file: !2, line: 401, type: !21)
!1237 = !DILocalVariable(name: "size_del", arg: 7, scope: !1227, file: !2, line: 401, type: !21)
!1238 = !DILocalVariable(name: "num_threads", arg: 8, scope: !1227, file: !2, line: 401, type: !21)
!1239 = !DILocalVariable(name: "i", scope: !1227, file: !2, line: 414, type: !21)
!1240 = !DILocalVariable(name: "j", scope: !1227, file: !2, line: 414, type: !21)
!1241 = !DILocalVariable(name: "h", scope: !1227, file: !2, line: 414, type: !21)
!1242 = !DILocalVariable(name: "number_of_arcs", scope: !1227, file: !2, line: 414, type: !21)
!1243 = !DILocalVariable(name: "count", scope: !1227, file: !2, line: 414, type: !21)
!1244 = !DILocalVariable(name: "test_arc", scope: !1227, file: !2, line: 415, type: !54)
!1245 = !DILocalVariable(name: "copy", scope: !1227, file: !2, line: 415, type: !55)
!1246 = !DILocation(line: 401, column: 29, scope: !1227)
!1247 = !DILocation(line: 401, column: 40, scope: !1227)
!1248 = !DILocation(line: 401, column: 62, scope: !1227)
!1249 = !DILocation(line: 401, column: 83, scope: !1227)
!1250 = !DILocation(line: 401, column: 95, scope: !1227)
!1251 = !DILocation(line: 401, column: 108, scope: !1227)
!1252 = !DILocation(line: 401, column: 144, scope: !1227)
!1253 = !DILocation(line: 401, column: 159, scope: !1227)
!1254 = !DILocation(line: 414, column: 5, scope: !1227)
!1255 = !DILocation(line: 414, column: 10, scope: !1227)
!1256 = !DILocation(line: 414, column: 13, scope: !1227)
!1257 = !DILocation(line: 414, column: 16, scope: !1227)
!1258 = !DILocation(line: 414, column: 19, scope: !1227)
!1259 = !DILocation(line: 414, column: 35, scope: !1227)
!1260 = !DILocation(line: 415, column: 5, scope: !1227)
!1261 = !DILocation(line: 415, column: 12, scope: !1227)
!1262 = !DILocation(line: 415, column: 22, scope: !1227)
!1263 = !DILocation(line: 417, column: 11, scope: !1264)
!1264 = distinct !DILexicalBlock(scope: !1227, file: !2, line: 417, column: 4)
!1265 = !DILocation(line: 417, column: 20, scope: !1264)
!1266 = !DILocation(line: 417, column: 18, scope: !1264)
!1267 = !DILocation(line: 417, column: 9, scope: !1264)
!1268 = !DILocation(line: 417, column: 28, scope: !1269)
!1269 = distinct !DILexicalBlock(scope: !1264, file: !2, line: 417, column: 4)
!1270 = !DILocation(line: 417, column: 32, scope: !1269)
!1271 = !DILocation(line: 417, column: 30, scope: !1269)
!1272 = !DILocation(line: 417, column: 4, scope: !1264)
!1273 = !DILocation(line: 422, column: 24, scope: !1274)
!1274 = distinct !DILexicalBlock(scope: !1269, file: !2, line: 418, column: 4)
!1275 = !DILocation(line: 422, column: 37, scope: !1274)
!1276 = !DILocation(line: 422, column: 42, scope: !1274)
!1277 = !DILocation(line: 422, column: 40, scope: !1274)
!1278 = !DILocation(line: 422, column: 23, scope: !1274)
!1279 = !DILocation(line: 422, column: 54, scope: !1274)
!1280 = !DILocation(line: 422, column: 67, scope: !1274)
!1281 = !DILocation(line: 422, column: 72, scope: !1274)
!1282 = !DILocation(line: 422, column: 21, scope: !1274)
!1283 = !DILocation(line: 423, column: 13, scope: !1284)
!1284 = distinct !DILexicalBlock(scope: !1274, file: !2, line: 423, column: 6)
!1285 = !DILocation(line: 423, column: 11, scope: !1284)
!1286 = !DILocation(line: 423, column: 18, scope: !1287)
!1287 = distinct !DILexicalBlock(scope: !1284, file: !2, line: 423, column: 6)
!1288 = !DILocation(line: 423, column: 22, scope: !1287)
!1289 = !DILocation(line: 423, column: 20, scope: !1287)
!1290 = !DILocation(line: 423, column: 6, scope: !1284)
!1291 = !DILocation(line: 425, column: 20, scope: !1292)
!1292 = distinct !DILexicalBlock(scope: !1287, file: !2, line: 424, column: 6)
!1293 = !DILocation(line: 425, column: 33, scope: !1292)
!1294 = !DILocation(line: 425, column: 36, scope: !1292)
!1295 = !DILocation(line: 425, column: 17, scope: !1292)
!1296 = !DILocation(line: 428, column: 13, scope: !1297)
!1297 = distinct !DILexicalBlock(scope: !1292, file: !2, line: 428, column: 12)
!1298 = !DILocation(line: 428, column: 23, scope: !1297)
!1299 = !{!173, !174, i64 32}
!1300 = !DILocation(line: 428, column: 29, scope: !1297)
!1301 = !DILocation(line: 428, column: 34, scope: !1297)
!1302 = !DILocation(line: 428, column: 44, scope: !1297)
!1303 = !DILocation(line: 428, column: 51, scope: !1297)
!1304 = !DILocation(line: 428, column: 61, scope: !1297)
!1305 = !DILocation(line: 428, column: 49, scope: !1297)
!1306 = !DILocation(line: 428, column: 67, scope: !1297)
!1307 = !DILocation(line: 428, column: 71, scope: !1297)
!1308 = !DILocation(line: 428, column: 81, scope: !1297)
!1309 = !DILocation(line: 428, column: 89, scope: !1297)
!1310 = !DILocation(line: 428, column: 99, scope: !1297)
!1311 = !DILocation(line: 428, column: 86, scope: !1297)
!1312 = !DILocation(line: 428, column: 104, scope: !1297)
!1313 = !DILocation(line: 429, column: 12, scope: !1297)
!1314 = !DILocation(line: 429, column: 22, scope: !1297)
!1315 = !DILocation(line: 429, column: 27, scope: !1297)
!1316 = !DILocation(line: 429, column: 37, scope: !1297)
!1317 = !DILocation(line: 429, column: 25, scope: !1297)
!1318 = !DILocation(line: 428, column: 12, scope: !1292)
!1319 = !DILocation(line: 431, column: 18, scope: !1320)
!1320 = distinct !DILexicalBlock(scope: !1297, file: !2, line: 430, column: 8)
!1321 = !DILocation(line: 431, column: 17, scope: !1320)
!1322 = !DILocation(line: 432, column: 15, scope: !1320)
!1323 = !DILocation(line: 433, column: 11, scope: !1320)
!1324 = !DILocation(line: 433, column: 22, scope: !1320)
!1325 = !DILocation(line: 434, column: 30, scope: !1320)
!1326 = !DILocation(line: 434, column: 43, scope: !1320)
!1327 = !DILocation(line: 434, column: 54, scope: !1320)
!1328 = !DILocation(line: 434, column: 65, scope: !1320)
!1329 = !DILocation(line: 434, column: 76, scope: !1320)
!1330 = !DILocation(line: 434, column: 82, scope: !1320)
!1331 = !DILocation(line: 434, column: 118, scope: !1320)
!1332 = !DILocation(line: 434, column: 113, scope: !1320)
!1333 = !DILocation(line: 434, column: 10, scope: !1320)
!1334 = !DILocation(line: 435, column: 8, scope: !1320)
!1335 = !DILocation(line: 436, column: 6, scope: !1292)
!1336 = !DILocation(line: 423, column: 39, scope: !1287)
!1337 = !DILocation(line: 423, column: 6, scope: !1287)
!1338 = distinct !{!1338, !1290, !1339, !229}
!1339 = !DILocation(line: 436, column: 6, scope: !1284)
!1340 = !DILocation(line: 438, column: 4, scope: !1274)
!1341 = !DILocation(line: 417, column: 46, scope: !1269)
!1342 = !DILocation(line: 417, column: 55, scope: !1269)
!1343 = !DILocation(line: 417, column: 57, scope: !1269)
!1344 = !DILocation(line: 417, column: 64, scope: !1269)
!1345 = !DILocation(line: 417, column: 62, scope: !1269)
!1346 = !DILocation(line: 417, column: 52, scope: !1269)
!1347 = !DILocation(line: 417, column: 4, scope: !1269)
!1348 = distinct !{!1348, !1272, !1349, !229}
!1349 = !DILocation(line: 438, column: 4, scope: !1264)
!1350 = !DILocation(line: 440, column: 11, scope: !1227)
!1351 = !DILocation(line: 441, column: 1, scope: !1227)
!1352 = !DILocation(line: 440, column: 4, scope: !1227)
!1353 = distinct !DISubprogram(name: "price_out_impl", scope: !2, file: !2, line: 444, type: !630, scopeLine: 449, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, retainedNodes: !1354)
!1354 = !{!1355, !1356, !1357, !1358, !1359, !1360, !1361, !1362, !1363, !1364, !1365, !1366, !1367, !1368, !1369, !1370, !1371, !1372, !1373, !1374, !1375, !1376, !1377, !1378, !1379, !1380, !1381, !1382, !1383, !1384, !1385, !1386, !1387, !1388, !1389, !1390, !1391, !1392}
!1355 = !DILocalVariable(name: "net", arg: 1, scope: !1353, file: !2, line: 444, type: !80)
!1356 = !DILocalVariable(name: "i", scope: !1353, file: !2, line: 450, type: !21)
!1357 = !DILocalVariable(name: "trips", scope: !1353, file: !2, line: 451, type: !21)
!1358 = !DILocalVariable(name: "new_arcs", scope: !1353, file: !2, line: 452, type: !21)
!1359 = !DILocalVariable(name: "resized", scope: !1353, file: !2, line: 453, type: !21)
!1360 = !DILocalVariable(name: "latest", scope: !1353, file: !2, line: 454, type: !21)
!1361 = !DILocalVariable(name: "min_impl_duration", scope: !1353, file: !2, line: 455, type: !21)
!1362 = !DILocalVariable(name: "max_new_par_residual_new_arcs", scope: !1353, file: !2, line: 456, type: !21)
!1363 = !DILocalVariable(name: "thread", scope: !1353, file: !2, line: 457, type: !18)
!1364 = !DILocalVariable(name: "new_arcs_array", scope: !1353, file: !2, line: 458, type: !53)
!1365 = !DILocalVariable(name: "id", scope: !1353, file: !2, line: 459, type: !21)
!1366 = !DILocalVariable(name: "list_size", scope: !1353, file: !2, line: 459, type: !21)
!1367 = !DILocalVariable(name: "num_del_arcs", scope: !1353, file: !2, line: 459, type: !53)
!1368 = !DILocalVariable(name: "arcs_pointer_sorted", scope: !1353, file: !2, line: 460, type: !10)
!1369 = !DILocalVariable(name: "deleted_arcs", scope: !1353, file: !2, line: 460, type: !11)
!1370 = !DILocalVariable(name: "max_redcost", scope: !1353, file: !2, line: 461, type: !21)
!1371 = !DILocalVariable(name: "first_replace", scope: !1353, file: !2, line: 462, type: !48)
!1372 = !DILocalVariable(name: "local_first_replace", scope: !1353, file: !2, line: 462, type: !48)
!1373 = !DILocalVariable(name: "count", scope: !1353, file: !2, line: 463, type: !21)
!1374 = !DILocalVariable(name: "num_switch_iterations", scope: !1353, file: !2, line: 464, type: !21)
!1375 = !DILocalVariable(name: "size_del", scope: !1353, file: !2, line: 465, type: !21)
!1376 = !DILocalVariable(name: "first_list_elem", scope: !1353, file: !2, line: 467, type: !56)
!1377 = !DILocalVariable(name: "new_list_elem", scope: !1353, file: !2, line: 468, type: !56)
!1378 = !DILocalVariable(name: "iterator", scope: !1353, file: !2, line: 469, type: !56)
!1379 = !DILocalVariable(name: "bigM", scope: !1353, file: !2, line: 471, type: !20)
!1380 = !DILocalVariable(name: "head_potential", scope: !1353, file: !2, line: 472, type: !20)
!1381 = !DILocalVariable(name: "arc_cost", scope: !1353, file: !2, line: 473, type: !20)
!1382 = !DILocalVariable(name: "red_cost", scope: !1353, file: !2, line: 474, type: !20)
!1383 = !DILocalVariable(name: "bigM_minus_min_impl_duration", scope: !1353, file: !2, line: 475, type: !20)
!1384 = !DILocalVariable(name: "arcout", scope: !1353, file: !2, line: 477, type: !54)
!1385 = !DILocalVariable(name: "arcin", scope: !1353, file: !2, line: 477, type: !54)
!1386 = !DILocalVariable(name: "arcnew", scope: !1353, file: !2, line: 477, type: !54)
!1387 = !DILocalVariable(name: "stop", scope: !1353, file: !2, line: 477, type: !54)
!1388 = !DILocalVariable(name: "sorted_array", scope: !1353, file: !2, line: 477, type: !54)
!1389 = !DILocalVariable(name: "arc", scope: !1353, file: !2, line: 477, type: !54)
!1390 = !DILocalVariable(name: "tail", scope: !1353, file: !2, line: 478, type: !637)
!1391 = !DILocalVariable(name: "head", scope: !1353, file: !2, line: 478, type: !637)
!1392 = !DILocalVariable(name: "num_threads", scope: !1353, file: !2, line: 483, type: !21)
!1393 = !DILocation(line: 444, column: 33, scope: !1353)
!1394 = !DILocation(line: 450, column: 5, scope: !1353)
!1395 = !DILocation(line: 450, column: 10, scope: !1353)
!1396 = !DILocation(line: 451, column: 5, scope: !1353)
!1397 = !DILocation(line: 451, column: 10, scope: !1353)
!1398 = !DILocation(line: 452, column: 5, scope: !1353)
!1399 = !DILocation(line: 452, column: 10, scope: !1353)
!1400 = !DILocation(line: 453, column: 5, scope: !1353)
!1401 = !DILocation(line: 453, column: 10, scope: !1353)
!1402 = !DILocation(line: 454, column: 5, scope: !1353)
!1403 = !DILocation(line: 454, column: 10, scope: !1353)
!1404 = !DILocation(line: 455, column: 5, scope: !1353)
!1405 = !DILocation(line: 455, column: 10, scope: !1353)
!1406 = !DILocation(line: 456, column: 5, scope: !1353)
!1407 = !DILocation(line: 456, column: 10, scope: !1353)
!1408 = !DILocation(line: 457, column: 5, scope: !1353)
!1409 = !DILocation(line: 457, column: 9, scope: !1353)
!1410 = !DILocation(line: 458, column: 5, scope: !1353)
!1411 = !DILocation(line: 458, column: 11, scope: !1353)
!1412 = !DILocation(line: 459, column: 5, scope: !1353)
!1413 = !DILocation(line: 459, column: 10, scope: !1353)
!1414 = !DILocation(line: 459, column: 14, scope: !1353)
!1415 = !DILocation(line: 459, column: 26, scope: !1353)
!1416 = !DILocation(line: 460, column: 5, scope: !1353)
!1417 = !DILocation(line: 460, column: 13, scope: !1353)
!1418 = !DILocation(line: 460, column: 35, scope: !1353)
!1419 = !DILocation(line: 461, column: 5, scope: !1353)
!1420 = !DILocation(line: 461, column: 10, scope: !1353)
!1421 = !DILocation(line: 462, column: 5, scope: !1353)
!1422 = !DILocation(line: 462, column: 11, scope: !1353)
!1423 = !DILocation(line: 462, column: 30, scope: !1353)
!1424 = !DILocation(line: 463, column: 5, scope: !1353)
!1425 = !DILocation(line: 463, column: 10, scope: !1353)
!1426 = !DILocation(line: 464, column: 5, scope: !1353)
!1427 = !DILocation(line: 464, column: 10, scope: !1353)
!1428 = !DILocation(line: 465, column: 3, scope: !1353)
!1429 = !DILocation(line: 465, column: 8, scope: !1353)
!1430 = !DILocation(line: 467, column: 5, scope: !1353)
!1431 = !DILocation(line: 467, column: 25, scope: !1353)
!1432 = !DILocation(line: 468, column: 5, scope: !1353)
!1433 = !DILocation(line: 468, column: 25, scope: !1353)
!1434 = !DILocation(line: 469, column: 5, scope: !1353)
!1435 = !DILocation(line: 469, column: 25, scope: !1353)
!1436 = !DILocation(line: 471, column: 5, scope: !1353)
!1437 = !DILocation(line: 471, column: 21, scope: !1353)
!1438 = !DILocation(line: 471, column: 28, scope: !1353)
!1439 = !DILocation(line: 471, column: 33, scope: !1353)
!1440 = !{!151, !144, i64 528}
!1441 = !DILocation(line: 472, column: 5, scope: !1353)
!1442 = !DILocation(line: 472, column: 21, scope: !1353)
!1443 = !DILocation(line: 473, column: 5, scope: !1353)
!1444 = !DILocation(line: 473, column: 21, scope: !1353)
!1445 = !DILocation(line: 474, column: 5, scope: !1353)
!1446 = !DILocation(line: 474, column: 21, scope: !1353)
!1447 = !DILocation(line: 475, column: 5, scope: !1353)
!1448 = !DILocation(line: 475, column: 21, scope: !1353)
!1449 = !DILocation(line: 477, column: 5, scope: !1353)
!1450 = !DILocation(line: 477, column: 21, scope: !1353)
!1451 = !DILocation(line: 477, column: 30, scope: !1353)
!1452 = !DILocation(line: 477, column: 38, scope: !1353)
!1453 = !DILocation(line: 477, column: 47, scope: !1353)
!1454 = !DILocation(line: 477, column: 54, scope: !1353)
!1455 = !DILocation(line: 477, column: 69, scope: !1353)
!1456 = !DILocation(line: 478, column: 5, scope: !1353)
!1457 = !DILocation(line: 478, column: 22, scope: !1353)
!1458 = !DILocation(line: 478, column: 29, scope: !1353)
!1459 = !DILocation(line: 483, column: 5, scope: !1353)
!1460 = !DILocation(line: 483, column: 10, scope: !1353)
!1461 = !DILocation(line: 487, column: 37, scope: !1353)
!1462 = !DILocation(line: 487, column: 49, scope: !1353)
!1463 = !DILocation(line: 487, column: 30, scope: !1353)
!1464 = !DILocation(line: 487, column: 20, scope: !1353)
!1465 = !DILocation(line: 488, column: 35, scope: !1353)
!1466 = !DILocation(line: 488, column: 47, scope: !1353)
!1467 = !DILocation(line: 488, column: 28, scope: !1353)
!1468 = !DILocation(line: 488, column: 18, scope: !1353)
!1469 = !DILocation(line: 489, column: 44, scope: !1353)
!1470 = !DILocation(line: 489, column: 56, scope: !1353)
!1471 = !DILocation(line: 489, column: 37, scope: !1353)
!1472 = !DILocation(line: 489, column: 25, scope: !1353)
!1473 = !DILocation(line: 490, column: 36, scope: !1353)
!1474 = !DILocation(line: 490, column: 48, scope: !1353)
!1475 = !DILocation(line: 490, column: 29, scope: !1353)
!1476 = !DILocation(line: 490, column: 18, scope: !1353)
!1477 = !DILocation(line: 497, column: 44, scope: !1353)
!1478 = !DILocation(line: 497, column: 51, scope: !1353)
!1479 = !DILocation(line: 497, column: 49, scope: !1353)
!1480 = !DILocation(line: 497, column: 34, scope: !1353)
!1481 = !DILocation(line: 501, column: 9, scope: !1482)
!1482 = distinct !DILexicalBlock(scope: !1353, file: !2, line: 501, column: 9)
!1483 = !DILocation(line: 501, column: 14, scope: !1482)
!1484 = !DILocation(line: 501, column: 22, scope: !1482)
!1485 = !DILocation(line: 501, column: 9, scope: !1353)
!1486 = !DILocation(line: 503, column: 11, scope: !1487)
!1487 = distinct !DILexicalBlock(scope: !1488, file: !2, line: 503, column: 11)
!1488 = distinct !DILexicalBlock(scope: !1482, file: !2, line: 502, column: 5)
!1489 = !DILocation(line: 503, column: 16, scope: !1487)
!1490 = !DILocation(line: 503, column: 20, scope: !1487)
!1491 = !DILocation(line: 503, column: 25, scope: !1487)
!1492 = !DILocation(line: 503, column: 18, scope: !1487)
!1493 = !DILocation(line: 503, column: 37, scope: !1487)
!1494 = !DILocation(line: 503, column: 42, scope: !1487)
!1495 = !DILocation(line: 503, column: 35, scope: !1487)
!1496 = !DILocation(line: 504, column: 11, scope: !1487)
!1497 = !DILocation(line: 505, column: 12, scope: !1487)
!1498 = !DILocation(line: 505, column: 17, scope: !1487)
!1499 = !DILocation(line: 505, column: 25, scope: !1487)
!1500 = !DILocation(line: 505, column: 30, scope: !1487)
!1501 = !DILocation(line: 505, column: 24, scope: !1487)
!1502 = !DILocation(line: 505, column: 38, scope: !1487)
!1503 = !DILocation(line: 505, column: 43, scope: !1487)
!1504 = !DILocation(line: 505, column: 48, scope: !1487)
!1505 = !DILocation(line: 505, column: 41, scope: !1487)
!1506 = !DILocation(line: 505, column: 52, scope: !1487)
!1507 = !DILocation(line: 505, column: 57, scope: !1487)
!1508 = !DILocation(line: 505, column: 50, scope: !1487)
!1509 = !DILocation(line: 503, column: 11, scope: !1488)
!1510 = !DILocation(line: 508, column: 17, scope: !1511)
!1511 = distinct !DILexicalBlock(scope: !1487, file: !2, line: 507, column: 7)
!1512 = !DILocation(line: 509, column: 26, scope: !1513)
!1513 = distinct !DILexicalBlock(scope: !1511, file: !2, line: 509, column: 13)
!1514 = !DILocation(line: 509, column: 13, scope: !1513)
!1515 = !DILocation(line: 509, column: 13, scope: !1511)
!1516 = !DILocation(line: 510, column: 11, scope: !1513)
!1517 = !DILocation(line: 512, column: 34, scope: !1511)
!1518 = !DILocation(line: 512, column: 9, scope: !1511)
!1519 = !DILocation(line: 513, column: 7, scope: !1511)
!1520 = !DILocation(line: 514, column: 5, scope: !1488)
!1521 = !DILocation(line: 517, column: 11, scope: !1522)
!1522 = distinct !DILexicalBlock(scope: !1523, file: !2, line: 517, column: 11)
!1523 = distinct !DILexicalBlock(scope: !1482, file: !2, line: 516, column: 5)
!1524 = !DILocation(line: 517, column: 16, scope: !1522)
!1525 = !DILocation(line: 517, column: 20, scope: !1522)
!1526 = !DILocation(line: 517, column: 25, scope: !1522)
!1527 = !DILocation(line: 517, column: 18, scope: !1522)
!1528 = !DILocation(line: 517, column: 37, scope: !1522)
!1529 = !DILocation(line: 517, column: 42, scope: !1522)
!1530 = !DILocation(line: 517, column: 35, scope: !1522)
!1531 = !DILocation(line: 518, column: 11, scope: !1522)
!1532 = !DILocation(line: 519, column: 12, scope: !1522)
!1533 = !DILocation(line: 519, column: 17, scope: !1522)
!1534 = !DILocation(line: 519, column: 25, scope: !1522)
!1535 = !DILocation(line: 519, column: 30, scope: !1522)
!1536 = !DILocation(line: 519, column: 24, scope: !1522)
!1537 = !DILocation(line: 519, column: 38, scope: !1522)
!1538 = !DILocation(line: 519, column: 43, scope: !1522)
!1539 = !DILocation(line: 519, column: 48, scope: !1522)
!1540 = !DILocation(line: 519, column: 41, scope: !1522)
!1541 = !DILocation(line: 519, column: 52, scope: !1522)
!1542 = !DILocation(line: 519, column: 57, scope: !1522)
!1543 = !DILocation(line: 519, column: 50, scope: !1522)
!1544 = !DILocation(line: 517, column: 11, scope: !1523)
!1545 = !DILocation(line: 522, column: 17, scope: !1546)
!1546 = distinct !DILexicalBlock(scope: !1522, file: !2, line: 521, column: 7)
!1547 = !DILocation(line: 523, column: 26, scope: !1548)
!1548 = distinct !DILexicalBlock(scope: !1546, file: !2, line: 523, column: 13)
!1549 = !DILocation(line: 523, column: 13, scope: !1548)
!1550 = !DILocation(line: 523, column: 13, scope: !1546)
!1551 = !DILocation(line: 524, column: 11, scope: !1548)
!1552 = !DILocation(line: 526, column: 34, scope: !1546)
!1553 = !DILocation(line: 526, column: 9, scope: !1546)
!1554 = !DILocation(line: 527, column: 7, scope: !1546)
!1555 = !DILocation(line: 530, column: 9, scope: !1556)
!1556 = distinct !DILexicalBlock(scope: !1353, file: !2, line: 530, column: 9)
!1557 = !DILocation(line: 530, column: 14, scope: !1556)
!1558 = !DILocation(line: 530, column: 22, scope: !1556)
!1559 = !DILocation(line: 530, column: 9, scope: !1353)
!1560 = !DILocation(line: 531, column: 31, scope: !1556)
!1561 = !DILocation(line: 531, column: 9, scope: !1556)
!1562 = !DILocation(line: 533, column: 31, scope: !1556)
!1563 = !DILocation(line: 535, column: 20, scope: !1353)
!1564 = !DILocation(line: 535, column: 25, scope: !1353)
!1565 = !DILocation(line: 535, column: 18, scope: !1353)
!1566 = !DILocation(line: 536, column: 10, scope: !1567)
!1567 = distinct !DILexicalBlock(scope: !1353, file: !2, line: 536, column: 9)
!1568 = !DILocation(line: 536, column: 9, scope: !1353)
!1569 = !DILocation(line: 537, column: 7, scope: !1567)
!1570 = !DILocation(line: 538, column: 37, scope: !1353)
!1571 = !DILocation(line: 538, column: 42, scope: !1353)
!1572 = !DILocation(line: 538, column: 63, scope: !1353)
!1573 = !DILocation(line: 538, column: 61, scope: !1353)
!1574 = !DILocation(line: 538, column: 35, scope: !1353)
!1575 = !DILocation(line: 539, column: 17, scope: !1353)
!1576 = !DILocation(line: 540, column: 16, scope: !1353)
!1577 = !DILocation(line: 540, column: 21, scope: !1353)
!1578 = !DILocation(line: 540, column: 27, scope: !1353)
!1579 = !DILocation(line: 540, column: 26, scope: !1353)
!1580 = !DILocation(line: 540, column: 14, scope: !1353)
!1581 = !DILocation(line: 546, column: 27, scope: !1582)
!1582 = distinct !DILexicalBlock(scope: !1353, file: !2, line: 544, column: 5)
!1583 = !DILocation(line: 547, column: 19, scope: !1582)
!1584 = !DILocation(line: 548, column: 13, scope: !1582)
!1585 = !DILocation(line: 553, column: 10, scope: !1582)
!1586 = !DILocation(line: 556, column: 31, scope: !1582)
!1587 = !DILocation(line: 556, column: 44, scope: !1582)
!1588 = !DILocation(line: 556, column: 55, scope: !1582)
!1589 = !DILocation(line: 556, column: 53, scope: !1582)
!1590 = !DILocation(line: 556, column: 7, scope: !1582)
!1591 = !DILocation(line: 556, column: 20, scope: !1582)
!1592 = !DILocation(line: 556, column: 28, scope: !1582)
!1593 = !DILocation(line: 557, column: 7, scope: !1582)
!1594 = !DILocation(line: 557, column: 20, scope: !1582)
!1595 = !DILocation(line: 557, column: 28, scope: !1582)
!1596 = !DILocation(line: 558, column: 9, scope: !1582)
!1597 = !DILocation(line: 558, column: 24, scope: !1582)
!1598 = !DILocation(line: 558, column: 32, scope: !1582)
!1599 = !DILocation(line: 559, column: 16, scope: !1582)
!1600 = !DILocation(line: 559, column: 21, scope: !1582)
!1601 = !DILocation(line: 559, column: 33, scope: !1582)
!1602 = !DILocation(line: 559, column: 42, scope: !1582)
!1603 = !DILocation(line: 559, column: 40, scope: !1582)
!1604 = !DILocation(line: 559, column: 31, scope: !1582)
!1605 = !DILocation(line: 559, column: 14, scope: !1582)
!1606 = !DILocation(line: 560, column: 15, scope: !1582)
!1607 = !DILocation(line: 560, column: 20, scope: !1582)
!1608 = !DILocation(line: 560, column: 13, scope: !1582)
!1609 = !DILocation(line: 561, column: 10, scope: !1582)
!1610 = !DILocation(line: 562, column: 17, scope: !1582)
!1611 = !DILocation(line: 563, column: 54, scope: !1582)
!1612 = !DILocation(line: 563, column: 46, scope: !1582)
!1613 = !DILocation(line: 563, column: 7, scope: !1582)
!1614 = !DILocation(line: 563, column: 27, scope: !1582)
!1615 = !DILocation(line: 563, column: 35, scope: !1582)
!1616 = !DILocation(line: 566, column: 14, scope: !1617)
!1617 = distinct !DILexicalBlock(scope: !1582, file: !2, line: 566, column: 7)
!1618 = !DILocation(line: 566, column: 12, scope: !1617)
!1619 = !DILocation(line: 566, column: 19, scope: !1620)
!1620 = distinct !DILexicalBlock(scope: !1617, file: !2, line: 566, column: 7)
!1621 = !DILocation(line: 566, column: 23, scope: !1620)
!1622 = !DILocation(line: 566, column: 21, scope: !1620)
!1623 = !DILocation(line: 566, column: 7, scope: !1617)
!1624 = !DILocation(line: 567, column: 43, scope: !1625)
!1625 = distinct !DILexicalBlock(scope: !1620, file: !2, line: 566, column: 59)
!1626 = !DILocation(line: 567, column: 50, scope: !1625)
!1627 = !DILocation(line: 567, column: 9, scope: !1625)
!1628 = !DILocation(line: 567, column: 29, scope: !1625)
!1629 = !DILocation(line: 567, column: 37, scope: !1625)
!1630 = !DILocation(line: 567, column: 40, scope: !1625)
!1631 = !DILocation(line: 568, column: 7, scope: !1625)
!1632 = !DILocation(line: 566, column: 55, scope: !1620)
!1633 = !DILocation(line: 566, column: 7, scope: !1620)
!1634 = distinct !{!1634, !1623, !1635, !229}
!1635 = !DILocation(line: 568, column: 7, scope: !1617)
!1636 = !DILocation(line: 570, column: 16, scope: !1582)
!1637 = !DILocation(line: 570, column: 21, scope: !1582)
!1638 = !DILocation(line: 570, column: 14, scope: !1582)
!1639 = !DILocation(line: 571, column: 14, scope: !1640)
!1640 = distinct !DILexicalBlock(scope: !1582, file: !2, line: 571, column: 7)
!1641 = !DILocation(line: 571, column: 12, scope: !1640)
!1642 = !DILocation(line: 571, column: 19, scope: !1643)
!1643 = distinct !DILexicalBlock(scope: !1640, file: !2, line: 571, column: 7)
!1644 = !DILocation(line: 571, column: 23, scope: !1643)
!1645 = !DILocation(line: 571, column: 21, scope: !1643)
!1646 = !DILocation(line: 571, column: 29, scope: !1643)
!1647 = !DILocation(line: 571, column: 32, scope: !1643)
!1648 = !DILocation(line: 571, column: 42, scope: !1643)
!1649 = !DILocation(line: 571, column: 48, scope: !1643)
!1650 = !DILocation(line: 0, scope: !1643)
!1651 = !DILocation(line: 571, column: 7, scope: !1640)
!1652 = !DILocation(line: 571, column: 59, scope: !1643)
!1653 = !DILocation(line: 571, column: 70, scope: !1643)
!1654 = !DILocation(line: 571, column: 7, scope: !1643)
!1655 = distinct !{!1655, !1651, !1656, !229}
!1656 = !DILocation(line: 571, column: 75, scope: !1640)
!1657 = !DILocation(line: 573, column: 23, scope: !1582)
!1658 = !DILocation(line: 574, column: 7, scope: !1582)
!1659 = !DILocation(line: 574, column: 14, scope: !1660)
!1660 = distinct !DILexicalBlock(scope: !1661, file: !2, line: 574, column: 7)
!1661 = distinct !DILexicalBlock(scope: !1582, file: !2, line: 574, column: 7)
!1662 = !DILocation(line: 574, column: 18, scope: !1660)
!1663 = !DILocation(line: 574, column: 16, scope: !1660)
!1664 = !DILocation(line: 574, column: 7, scope: !1661)
!1665 = !DILocation(line: 576, column: 14, scope: !1666)
!1666 = distinct !DILexicalBlock(scope: !1667, file: !2, line: 576, column: 13)
!1667 = distinct !DILexicalBlock(scope: !1660, file: !2, line: 575, column: 7)
!1668 = !DILocation(line: 576, column: 13, scope: !1667)
!1669 = !DILocation(line: 577, column: 35, scope: !1670)
!1670 = distinct !DILexicalBlock(scope: !1666, file: !2, line: 576, column: 29)
!1671 = !DILocation(line: 577, column: 54, scope: !1670)
!1672 = !DILocation(line: 577, column: 75, scope: !1670)
!1673 = !DILocation(line: 577, column: 13, scope: !1670)
!1674 = !DILocation(line: 578, column: 9, scope: !1670)
!1675 = !DILocation(line: 580, column: 14, scope: !1676)
!1676 = distinct !DILexicalBlock(scope: !1667, file: !2, line: 580, column: 14)
!1677 = !DILocation(line: 580, column: 18, scope: !1676)
!1678 = !DILocation(line: 580, column: 16, scope: !1676)
!1679 = !DILocation(line: 580, column: 40, scope: !1676)
!1680 = !DILocation(line: 580, column: 14, scope: !1667)
!1681 = !DILocation(line: 584, column: 35, scope: !1682)
!1682 = distinct !DILexicalBlock(scope: !1676, file: !2, line: 580, column: 46)
!1683 = !DILocation(line: 584, column: 54, scope: !1682)
!1684 = !DILocation(line: 584, column: 75, scope: !1682)
!1685 = !DILocation(line: 584, column: 13, scope: !1682)
!1686 = !DILocation(line: 585, column: 18, scope: !1687)
!1687 = distinct !DILexicalBlock(scope: !1682, file: !2, line: 585, column: 17)
!1688 = !DILocation(line: 585, column: 17, scope: !1682)
!1689 = !DILocation(line: 587, column: 38, scope: !1690)
!1690 = distinct !DILexicalBlock(scope: !1687, file: !2, line: 585, column: 33)
!1691 = !DILocation(line: 587, column: 15, scope: !1690)
!1692 = !DILocation(line: 587, column: 28, scope: !1690)
!1693 = !DILocation(line: 587, column: 36, scope: !1690)
!1694 = !DILocation(line: 588, column: 27, scope: !1690)
!1695 = !DILocation(line: 588, column: 32, scope: !1690)
!1696 = !DILocation(line: 588, column: 46, scope: !1690)
!1697 = !DILocation(line: 588, column: 60, scope: !1690)
!1698 = !DILocation(line: 588, column: 68, scope: !1690)
!1699 = !DILocation(line: 588, column: 76, scope: !1690)
!1700 = !DILocation(line: 588, column: 107, scope: !1690)
!1701 = !DILocation(line: 588, column: 117, scope: !1690)
!1702 = !DILocation(line: 588, column: 15, scope: !1690)
!1703 = !DILocation(line: 589, column: 21, scope: !1690)
!1704 = !DILocation(line: 590, column: 15, scope: !1690)
!1705 = !DILocation(line: 590, column: 28, scope: !1690)
!1706 = !DILocation(line: 590, column: 36, scope: !1690)
!1707 = !DILocation(line: 591, column: 11, scope: !1690)
!1708 = !DILocation(line: 592, column: 9, scope: !1682)
!1709 = !DILocation(line: 594, column: 13, scope: !1710)
!1710 = distinct !DILexicalBlock(scope: !1667, file: !2, line: 594, column: 13)
!1711 = !DILocation(line: 594, column: 23, scope: !1710)
!1712 = !DILocation(line: 594, column: 29, scope: !1710)
!1713 = !DILocation(line: 594, column: 13, scope: !1667)
!1714 = !DILocation(line: 596, column: 40, scope: !1715)
!1715 = distinct !DILexicalBlock(scope: !1710, file: !2, line: 595, column: 9)
!1716 = !DILocation(line: 596, column: 25, scope: !1715)
!1717 = !DILocation(line: 597, column: 33, scope: !1715)
!1718 = !DILocation(line: 597, column: 11, scope: !1715)
!1719 = !DILocation(line: 597, column: 26, scope: !1715)
!1720 = !DILocation(line: 597, column: 31, scope: !1715)
!1721 = !{!1722, !131, i64 8}
!1722 = !{!"list_elem", !131, i64 0, !131, i64 8}
!1723 = !DILocation(line: 598, column: 32, scope: !1715)
!1724 = !DILocation(line: 598, column: 39, scope: !1715)
!1725 = !DILocation(line: 598, column: 11, scope: !1715)
!1726 = !DILocation(line: 598, column: 26, scope: !1715)
!1727 = !DILocation(line: 598, column: 30, scope: !1715)
!1728 = !{!1722, !131, i64 0}
!1729 = !DILocation(line: 599, column: 29, scope: !1715)
!1730 = !DILocation(line: 599, column: 27, scope: !1715)
!1731 = !DILocation(line: 600, column: 20, scope: !1715)
!1732 = !DILocation(line: 601, column: 9, scope: !1715)
!1733 = !DILocation(line: 603, column: 13, scope: !1734)
!1734 = distinct !DILexicalBlock(scope: !1667, file: !2, line: 603, column: 13)
!1735 = !DILocation(line: 603, column: 21, scope: !1734)
!1736 = !DILocation(line: 603, column: 27, scope: !1734)
!1737 = !DILocation(line: 603, column: 36, scope: !1734)
!1738 = !DILocation(line: 603, column: 39, scope: !1734)
!1739 = !DILocation(line: 603, column: 43, scope: !1734)
!1740 = !DILocation(line: 603, column: 41, scope: !1734)
!1741 = !DILocation(line: 603, column: 58, scope: !1734)
!1742 = !DILocation(line: 603, column: 55, scope: !1734)
!1743 = !DILocation(line: 603, column: 13, scope: !1667)
!1744 = !DILocation(line: 605, column: 17, scope: !1745)
!1745 = distinct !DILexicalBlock(scope: !1734, file: !2, line: 604, column: 9)
!1746 = !DILocation(line: 605, column: 14, scope: !1745)
!1747 = !DILocation(line: 606, column: 11, scope: !1745)
!1748 = !DILocation(line: 609, column: 16, scope: !1667)
!1749 = !DILocation(line: 609, column: 24, scope: !1667)
!1750 = !DILocation(line: 609, column: 14, scope: !1667)
!1751 = !DILocation(line: 610, column: 18, scope: !1667)
!1752 = !DILocation(line: 610, column: 24, scope: !1667)
!1753 = !{!166, !167, i64 100}
!1754 = !DILocation(line: 610, column: 31, scope: !1667)
!1755 = !DILocation(line: 610, column: 39, scope: !1667)
!1756 = !DILocation(line: 610, column: 29, scope: !1667)
!1757 = !DILocation(line: 611, column: 21, scope: !1667)
!1758 = !DILocation(line: 611, column: 13, scope: !1667)
!1759 = !DILocation(line: 610, column: 16, scope: !1667)
!1760 = !DILocation(line: 613, column: 26, scope: !1667)
!1761 = !DILocation(line: 613, column: 32, scope: !1667)
!1762 = !{!166, !144, i64 0}
!1763 = !DILocation(line: 613, column: 24, scope: !1667)
!1764 = !DILocation(line: 615, column: 20, scope: !1667)
!1765 = !DILocation(line: 615, column: 37, scope: !1667)
!1766 = !DILocation(line: 615, column: 18, scope: !1667)
!1767 = !DILocation(line: 616, column: 9, scope: !1667)
!1768 = !DILocation(line: 616, column: 16, scope: !1667)
!1769 = !DILocation(line: 619, column: 19, scope: !1770)
!1770 = distinct !DILexicalBlock(scope: !1667, file: !2, line: 617, column: 9)
!1771 = !DILocation(line: 619, column: 29, scope: !1770)
!1772 = !DILocation(line: 619, column: 17, scope: !1770)
!1773 = !DILocation(line: 620, column: 18, scope: !1770)
!1774 = !DILocation(line: 620, column: 25, scope: !1770)
!1775 = !DILocation(line: 620, column: 16, scope: !1770)
!1776 = !DILocation(line: 622, column: 15, scope: !1777)
!1777 = distinct !DILexicalBlock(scope: !1770, file: !2, line: 622, column: 15)
!1778 = !DILocation(line: 622, column: 21, scope: !1777)
!1779 = !DILocation(line: 622, column: 28, scope: !1777)
!1780 = !DILocation(line: 622, column: 35, scope: !1777)
!1781 = !DILocation(line: 622, column: 26, scope: !1777)
!1782 = !DILocation(line: 622, column: 46, scope: !1777)
!1783 = !DILocation(line: 622, column: 44, scope: !1777)
!1784 = !DILocation(line: 622, column: 15, scope: !1770)
!1785 = !DILocation(line: 624, column: 24, scope: !1786)
!1786 = distinct !DILexicalBlock(scope: !1777, file: !2, line: 623, column: 11)
!1787 = !DILocation(line: 624, column: 34, scope: !1786)
!1788 = !DILocation(line: 624, column: 22, scope: !1786)
!1789 = !DILocation(line: 625, column: 15, scope: !1786)
!1790 = !DILocation(line: 626, column: 13, scope: !1786)
!1791 = distinct !{!1791, !1767, !1792, !229}
!1792 = !DILocation(line: 669, column: 9, scope: !1667)
!1793 = !DILocation(line: 629, column: 22, scope: !1770)
!1794 = !DILocation(line: 629, column: 33, scope: !1770)
!1795 = !DILocation(line: 629, column: 39, scope: !1770)
!1796 = !DILocation(line: 629, column: 31, scope: !1770)
!1797 = !DILocation(line: 629, column: 51, scope: !1770)
!1798 = !DILocation(line: 629, column: 57, scope: !1770)
!1799 = !DILocation(line: 629, column: 49, scope: !1770)
!1800 = !DILocation(line: 629, column: 20, scope: !1770)
!1801 = !DILocation(line: 631, column: 15, scope: !1802)
!1802 = distinct !DILexicalBlock(scope: !1770, file: !2, line: 631, column: 15)
!1803 = !DILocation(line: 631, column: 24, scope: !1802)
!1804 = !DILocation(line: 631, column: 15, scope: !1770)
!1805 = !DILocation(line: 634, column: 17, scope: !1806)
!1806 = distinct !DILexicalBlock(scope: !1807, file: !2, line: 634, column: 17)
!1807 = distinct !DILexicalBlock(scope: !1802, file: !2, line: 632, column: 11)
!1808 = !DILocation(line: 634, column: 32, scope: !1806)
!1809 = !DILocation(line: 634, column: 42, scope: !1806)
!1810 = !DILocation(line: 634, column: 40, scope: !1806)
!1811 = !DILocation(line: 634, column: 17, scope: !1807)
!1812 = !DILocation(line: 636, column: 31, scope: !1813)
!1813 = distinct !DILexicalBlock(scope: !1806, file: !2, line: 635, column: 13)
!1814 = !DILocation(line: 636, column: 39, scope: !1813)
!1815 = !DILocation(line: 636, column: 54, scope: !1813)
!1816 = !DILocation(line: 636, column: 63, scope: !1813)
!1817 = !DILocation(line: 636, column: 69, scope: !1813)
!1818 = !DILocation(line: 637, column: 19, scope: !1813)
!1819 = !DILocation(line: 637, column: 29, scope: !1813)
!1820 = !DILocation(line: 637, column: 39, scope: !1813)
!1821 = !DILocation(line: 637, column: 44, scope: !1813)
!1822 = !DILocation(line: 637, column: 47, scope: !1813)
!1823 = !DILocation(line: 636, column: 15, scope: !1813)
!1824 = !DILocation(line: 638, column: 15, scope: !1813)
!1825 = !DILocation(line: 638, column: 30, scope: !1813)
!1826 = !DILocation(line: 638, column: 37, scope: !1813)
!1827 = !DILocation(line: 639, column: 13, scope: !1813)
!1828 = !DILocation(line: 640, column: 30, scope: !1829)
!1829 = distinct !DILexicalBlock(scope: !1806, file: !2, line: 640, column: 22)
!1830 = !DILocation(line: 640, column: 40, scope: !1829)
!1831 = !DILocation(line: 640, column: 47, scope: !1829)
!1832 = !DILocation(line: 640, column: 45, scope: !1829)
!1833 = !DILocation(line: 640, column: 22, scope: !1806)
!1834 = !DILocation(line: 641, column: 19, scope: !1835)
!1835 = distinct !DILexicalBlock(scope: !1836, file: !2, line: 641, column: 19)
!1836 = distinct !DILexicalBlock(scope: !1829, file: !2, line: 640, column: 58)
!1837 = !DILocation(line: 641, column: 19, scope: !1836)
!1838 = !DILocation(line: 642, column: 31, scope: !1839)
!1839 = distinct !DILexicalBlock(scope: !1835, file: !2, line: 641, column: 40)
!1840 = !DILocation(line: 643, column: 37, scope: !1839)
!1841 = !DILocation(line: 644, column: 15, scope: !1839)
!1842 = !DILocation(line: 646, column: 15, scope: !1836)
!1843 = !DILocation(line: 646, column: 28, scope: !1836)
!1844 = !DILocation(line: 646, column: 36, scope: !1836)
!1845 = !DILocation(line: 646, column: 49, scope: !1836)
!1846 = !DILocation(line: 646, column: 60, scope: !1836)
!1847 = !DILocation(line: 647, column: 15, scope: !1836)
!1848 = !DILocation(line: 647, column: 28, scope: !1836)
!1849 = !DILocation(line: 647, column: 35, scope: !1836)
!1850 = !DILocation(line: 648, column: 20, scope: !1836)
!1851 = !DILocation(line: 649, column: 35, scope: !1836)
!1852 = !DILocation(line: 649, column: 43, scope: !1836)
!1853 = !DILocation(line: 649, column: 49, scope: !1836)
!1854 = !DILocation(line: 649, column: 55, scope: !1836)
!1855 = !DILocation(line: 649, column: 65, scope: !1836)
!1856 = !DILocation(line: 649, column: 75, scope: !1836)
!1857 = !DILocation(line: 649, column: 106, scope: !1836)
!1858 = !DILocation(line: 649, column: 15, scope: !1836)
!1859 = !DILocation(line: 650, column: 13, scope: !1836)
!1860 = !DILocation(line: 651, column: 22, scope: !1861)
!1861 = distinct !DILexicalBlock(scope: !1829, file: !2, line: 651, column: 22)
!1862 = !DILocation(line: 651, column: 33, scope: !1861)
!1863 = !DILocation(line: 651, column: 31, scope: !1861)
!1864 = !DILocation(line: 651, column: 22, scope: !1829)
!1865 = !DILocation(line: 652, column: 22, scope: !1866)
!1866 = distinct !DILexicalBlock(scope: !1861, file: !2, line: 651, column: 47)
!1867 = !DILocation(line: 652, column: 35, scope: !1866)
!1868 = !DILocation(line: 652, column: 43, scope: !1866)
!1869 = !DILocation(line: 652, column: 56, scope: !1866)
!1870 = !DILocation(line: 652, column: 63, scope: !1866)
!1871 = !DILocation(line: 652, column: 19, scope: !1866)
!1872 = !DILocation(line: 653, column: 31, scope: !1866)
!1873 = !DILocation(line: 653, column: 15, scope: !1866)
!1874 = !DILocation(line: 653, column: 20, scope: !1866)
!1875 = !DILocation(line: 653, column: 29, scope: !1866)
!1876 = !DILocation(line: 654, column: 31, scope: !1866)
!1877 = !DILocation(line: 654, column: 15, scope: !1866)
!1878 = !DILocation(line: 654, column: 20, scope: !1866)
!1879 = !DILocation(line: 654, column: 29, scope: !1866)
!1880 = !DILocation(line: 655, column: 31, scope: !1866)
!1881 = !DILocation(line: 655, column: 15, scope: !1866)
!1882 = !DILocation(line: 655, column: 20, scope: !1866)
!1883 = !DILocation(line: 655, column: 29, scope: !1866)
!1884 = !DILocation(line: 656, column: 31, scope: !1866)
!1885 = !DILocation(line: 656, column: 15, scope: !1866)
!1886 = !DILocation(line: 656, column: 20, scope: !1866)
!1887 = !DILocation(line: 656, column: 29, scope: !1866)
!1888 = !DILocation(line: 657, column: 39, scope: !1866)
!1889 = !DILocation(line: 657, column: 15, scope: !1866)
!1890 = !DILocation(line: 657, column: 20, scope: !1866)
!1891 = !DILocation(line: 657, column: 29, scope: !1866)
!1892 = !DILocation(line: 658, column: 31, scope: !1866)
!1893 = !DILocation(line: 658, column: 15, scope: !1866)
!1894 = !DILocation(line: 658, column: 20, scope: !1866)
!1895 = !DILocation(line: 658, column: 29, scope: !1866)
!1896 = !DILocation(line: 659, column: 20, scope: !1866)
!1897 = !DILocation(line: 660, column: 13, scope: !1866)
!1898 = !DILocation(line: 661, column: 17, scope: !1899)
!1899 = distinct !DILexicalBlock(scope: !1807, file: !2, line: 661, column: 17)
!1900 = !DILocation(line: 661, column: 30, scope: !1899)
!1901 = !DILocation(line: 661, column: 41, scope: !1899)
!1902 = !DILocation(line: 661, column: 38, scope: !1899)
!1903 = !DILocation(line: 661, column: 17, scope: !1807)
!1904 = !DILocation(line: 663, column: 15, scope: !1905)
!1905 = distinct !DILexicalBlock(scope: !1899, file: !2, line: 662, column: 13)
!1906 = !DILocation(line: 663, column: 28, scope: !1905)
!1907 = !DILocation(line: 663, column: 36, scope: !1905)
!1908 = !DILocation(line: 664, column: 13, scope: !1905)
!1909 = !DILocation(line: 665, column: 11, scope: !1807)
!1910 = !DILocation(line: 667, column: 22, scope: !1770)
!1911 = !DILocation(line: 667, column: 32, scope: !1770)
!1912 = !DILocation(line: 667, column: 20, scope: !1770)
!1913 = !DILocation(line: 668, column: 13, scope: !1770)
!1914 = !DILocation(line: 671, column: 7, scope: !1667)
!1915 = !DILocation(line: 574, column: 26, scope: !1660)
!1916 = !DILocation(line: 574, column: 37, scope: !1660)
!1917 = !DILocation(line: 574, column: 7, scope: !1660)
!1918 = distinct !{!1918, !1664, !1919, !229}
!1919 = !DILocation(line: 671, column: 7, scope: !1661)
!1920 = !DILocation(line: 673, column: 30, scope: !1582)
!1921 = !DILocation(line: 673, column: 7, scope: !1582)
!1922 = !DILocation(line: 673, column: 20, scope: !1582)
!1923 = !DILocation(line: 673, column: 28, scope: !1582)
!1924 = !DILocation(line: 674, column: 7, scope: !1582)
!1925 = !DILocation(line: 674, column: 15, scope: !1582)
!1926 = !DILocation(line: 674, column: 14, scope: !1582)
!1927 = !DILocation(line: 678, column: 23, scope: !1928)
!1928 = distinct !DILexicalBlock(scope: !1582, file: !2, line: 674, column: 30)
!1929 = !DILocation(line: 680, column: 31, scope: !1928)
!1930 = !DILocation(line: 680, column: 36, scope: !1928)
!1931 = !DILocation(line: 680, column: 50, scope: !1928)
!1932 = !DILocation(line: 680, column: 64, scope: !1928)
!1933 = !DILocation(line: 680, column: 72, scope: !1928)
!1934 = !DILocation(line: 680, column: 80, scope: !1928)
!1935 = !DILocation(line: 680, column: 111, scope: !1928)
!1936 = !DILocation(line: 680, column: 121, scope: !1928)
!1937 = !DILocation(line: 680, column: 19, scope: !1928)
!1938 = !DILocation(line: 680, column: 17, scope: !1928)
!1939 = !DILocation(line: 682, column: 15, scope: !1940)
!1940 = distinct !DILexicalBlock(scope: !1928, file: !2, line: 682, column: 15)
!1941 = !DILocation(line: 682, column: 15, scope: !1928)
!1942 = !DILocation(line: 683, column: 27, scope: !1940)
!1943 = !DILocation(line: 683, column: 13, scope: !1940)
!1944 = distinct !{!1944, !1924, !1945, !229}
!1945 = !DILocation(line: 687, column: 7, scope: !1582)
!1946 = !DILocation(line: 689, column: 7, scope: !1582)
!1947 = !DILocation(line: 689, column: 14, scope: !1582)
!1948 = !DILocation(line: 689, column: 31, scope: !1582)
!1949 = !DILocation(line: 690, column: 25, scope: !1950)
!1950 = distinct !DILexicalBlock(scope: !1582, file: !2, line: 689, column: 37)
!1951 = !DILocation(line: 690, column: 23, scope: !1950)
!1952 = !DILocation(line: 691, column: 27, scope: !1950)
!1953 = !DILocation(line: 691, column: 44, scope: !1950)
!1954 = !DILocation(line: 691, column: 25, scope: !1950)
!1955 = !DILocation(line: 692, column: 14, scope: !1950)
!1956 = !DILocation(line: 692, column: 9, scope: !1950)
!1957 = distinct !{!1957, !1946, !1958, !229}
!1958 = !DILocation(line: 693, column: 7, scope: !1582)
!1959 = !DILocation(line: 694, column: 12, scope: !1582)
!1960 = !DILocation(line: 694, column: 7, scope: !1582)
!1961 = !DILocation(line: 697, column: 20, scope: !1582)
!1962 = !DILocation(line: 697, column: 40, scope: !1582)
!1963 = !DILocation(line: 697, column: 49, scope: !1582)
!1964 = !DILocation(line: 697, column: 64, scope: !1582)
!1965 = !DILocation(line: 697, column: 9, scope: !1582)
!1966 = !DILocation(line: 709, column: 21, scope: !1967)
!1967 = distinct !DILexicalBlock(scope: !1582, file: !2, line: 708, column: 7)
!1968 = !DILocation(line: 709, column: 37, scope: !1967)
!1969 = !DILocation(line: 709, column: 53, scope: !1967)
!1970 = !DILocation(line: 709, column: 11, scope: !1967)
!1971 = !DILocation(line: 715, column: 8, scope: !1582)
!1972 = !DILocation(line: 715, column: 28, scope: !1582)
!1973 = !DILocation(line: 715, column: 3, scope: !1582)
!1974 = !DILocation(line: 716, column: 11, scope: !1975)
!1975 = distinct !DILexicalBlock(scope: !1582, file: !2, line: 716, column: 11)
!1976 = !DILocation(line: 716, column: 26, scope: !1975)
!1977 = !DILocation(line: 716, column: 11, scope: !1582)
!1978 = !DILocation(line: 718, column: 18, scope: !1979)
!1979 = distinct !DILexicalBlock(scope: !1975, file: !2, line: 717, column: 7)
!1980 = !DILocation(line: 718, column: 23, scope: !1979)
!1981 = !DILocation(line: 718, column: 35, scope: !1979)
!1982 = !DILocation(line: 718, column: 44, scope: !1979)
!1983 = !DILocation(line: 718, column: 42, scope: !1979)
!1984 = !DILocation(line: 718, column: 33, scope: !1979)
!1985 = !DILocation(line: 718, column: 16, scope: !1979)
!1986 = !DILocation(line: 719, column: 16, scope: !1979)
!1987 = !DILocation(line: 719, column: 25, scope: !1979)
!1988 = !DILocation(line: 719, column: 40, scope: !1979)
!1989 = !DILocation(line: 719, column: 23, scope: !1979)
!1990 = !DILocation(line: 719, column: 14, scope: !1979)
!1991 = !DILocation(line: 720, column: 13, scope: !1992)
!1992 = distinct !DILexicalBlock(scope: !1979, file: !2, line: 720, column: 13)
!1993 = !DILocation(line: 720, column: 13, scope: !1979)
!1994 = !DILocation(line: 722, column: 11, scope: !1995)
!1995 = distinct !DILexicalBlock(scope: !1992, file: !2, line: 721, column: 9)
!1996 = !DILocation(line: 722, column: 18, scope: !1997)
!1997 = distinct !DILexicalBlock(scope: !1998, file: !2, line: 722, column: 11)
!1998 = distinct !DILexicalBlock(scope: !1995, file: !2, line: 722, column: 11)
!1999 = !DILocation(line: 722, column: 28, scope: !1997)
!2000 = !DILocation(line: 722, column: 25, scope: !1997)
!2001 = !DILocation(line: 722, column: 11, scope: !1998)
!2002 = !DILocation(line: 724, column: 17, scope: !2003)
!2003 = distinct !DILexicalBlock(scope: !2004, file: !2, line: 724, column: 17)
!2004 = distinct !DILexicalBlock(scope: !1997, file: !2, line: 723, column: 11)
!2005 = !DILocation(line: 724, column: 25, scope: !2003)
!2006 = !DILocation(line: 724, column: 30, scope: !2003)
!2007 = !DILocation(line: 724, column: 17, scope: !2004)
!2008 = !DILocation(line: 725, column: 17, scope: !2009)
!2009 = distinct !DILexicalBlock(scope: !2003, file: !2, line: 724, column: 36)
!2010 = !DILocation(line: 725, column: 25, scope: !2009)
!2011 = !DILocation(line: 725, column: 30, scope: !2009)
!2012 = !DILocation(line: 726, column: 17, scope: !2009)
!2013 = !DILocation(line: 726, column: 25, scope: !2009)
!2014 = !DILocation(line: 726, column: 31, scope: !2009)
!2015 = !DILocation(line: 730, column: 10, scope: !2009)
!2016 = !DILocation(line: 730, column: 38, scope: !2009)
!2017 = !DILocation(line: 730, column: 43, scope: !2009)
!2018 = !DILocation(line: 730, column: 51, scope: !2009)
!2019 = !DILocation(line: 730, column: 23, scope: !2009)
!2020 = !DILocation(line: 730, column: 59, scope: !2009)
!2021 = !DILocation(line: 730, column: 58, scope: !2009)
!2022 = !DILocation(line: 731, column: 13, scope: !2009)
!2023 = !DILocation(line: 732, column: 11, scope: !2004)
!2024 = !DILocation(line: 722, column: 40, scope: !1997)
!2025 = !DILocation(line: 722, column: 11, scope: !1997)
!2026 = distinct !{!2026, !2001, !2027, !229}
!2027 = !DILocation(line: 732, column: 11, scope: !1998)
!2028 = !DILocation(line: 733, column: 9, scope: !1995)
!2029 = !DILocation(line: 736, column: 11, scope: !2030)
!2030 = distinct !DILexicalBlock(scope: !1992, file: !2, line: 735, column: 9)
!2031 = !DILocation(line: 736, column: 18, scope: !2032)
!2032 = distinct !DILexicalBlock(scope: !2033, file: !2, line: 736, column: 11)
!2033 = distinct !DILexicalBlock(scope: !2030, file: !2, line: 736, column: 11)
!2034 = !DILocation(line: 736, column: 28, scope: !2032)
!2035 = !DILocation(line: 736, column: 25, scope: !2032)
!2036 = !DILocation(line: 736, column: 11, scope: !2033)
!2037 = !DILocation(line: 738, column: 17, scope: !2038)
!2038 = distinct !DILexicalBlock(scope: !2039, file: !2, line: 738, column: 17)
!2039 = distinct !DILexicalBlock(scope: !2032, file: !2, line: 737, column: 11)
!2040 = !DILocation(line: 738, column: 25, scope: !2038)
!2041 = !DILocation(line: 738, column: 30, scope: !2038)
!2042 = !DILocation(line: 738, column: 17, scope: !2039)
!2043 = !DILocation(line: 739, column: 15, scope: !2044)
!2044 = distinct !DILexicalBlock(scope: !2038, file: !2, line: 738, column: 36)
!2045 = !DILocation(line: 739, column: 23, scope: !2044)
!2046 = !DILocation(line: 739, column: 28, scope: !2044)
!2047 = !DILocation(line: 740, column: 15, scope: !2044)
!2048 = !DILocation(line: 740, column: 23, scope: !2044)
!2049 = !DILocation(line: 740, column: 29, scope: !2044)
!2050 = !DILocation(line: 741, column: 33, scope: !2044)
!2051 = !DILocation(line: 741, column: 41, scope: !2044)
!2052 = !DILocation(line: 741, column: 47, scope: !2044)
!2053 = !DILocation(line: 741, column: 15, scope: !2044)
!2054 = !DILocation(line: 741, column: 23, scope: !2044)
!2055 = !DILocation(line: 741, column: 31, scope: !2044)
!2056 = !{!173, !131, i64 40}
!2057 = !DILocation(line: 742, column: 40, scope: !2044)
!2058 = !DILocation(line: 742, column: 15, scope: !2044)
!2059 = !DILocation(line: 742, column: 23, scope: !2044)
!2060 = !DILocation(line: 742, column: 29, scope: !2044)
!2061 = !DILocation(line: 742, column: 38, scope: !2044)
!2062 = !DILocation(line: 743, column: 32, scope: !2044)
!2063 = !DILocation(line: 743, column: 40, scope: !2044)
!2064 = !DILocation(line: 743, column: 46, scope: !2044)
!2065 = !DILocation(line: 743, column: 15, scope: !2044)
!2066 = !DILocation(line: 743, column: 23, scope: !2044)
!2067 = !DILocation(line: 743, column: 30, scope: !2044)
!2068 = !{!173, !131, i64 48}
!2069 = !DILocation(line: 744, column: 39, scope: !2044)
!2070 = !DILocation(line: 744, column: 15, scope: !2044)
!2071 = !DILocation(line: 744, column: 23, scope: !2044)
!2072 = !DILocation(line: 744, column: 29, scope: !2044)
!2073 = !DILocation(line: 744, column: 37, scope: !2044)
!2074 = !DILocation(line: 748, column: 15, scope: !2044)
!2075 = !DILocation(line: 748, column: 43, scope: !2044)
!2076 = !DILocation(line: 748, column: 48, scope: !2044)
!2077 = !DILocation(line: 748, column: 56, scope: !2044)
!2078 = !DILocation(line: 748, column: 28, scope: !2044)
!2079 = !DILocation(line: 748, column: 64, scope: !2044)
!2080 = !DILocation(line: 748, column: 63, scope: !2044)
!2081 = !DILocation(line: 749, column: 13, scope: !2044)
!2082 = !DILocation(line: 750, column: 11, scope: !2039)
!2083 = !DILocation(line: 736, column: 40, scope: !2032)
!2084 = !DILocation(line: 736, column: 11, scope: !2032)
!2085 = distinct !{!2085, !2036, !2086, !229}
!2086 = !DILocation(line: 750, column: 11, scope: !2033)
!2087 = !DILocation(line: 752, column: 7, scope: !1979)
!2088 = !DILocation(line: 755, column: 24, scope: !1353)
!2089 = !DILocation(line: 755, column: 9, scope: !1353)
!2090 = !DILocation(line: 755, column: 14, scope: !1353)
!2091 = !DILocation(line: 755, column: 21, scope: !1353)
!2092 = !{!151, !144, i64 440}
!2093 = !DILocation(line: 756, column: 36, scope: !1353)
!2094 = !DILocation(line: 756, column: 9, scope: !1353)
!2095 = !DILocation(line: 756, column: 14, scope: !1353)
!2096 = !DILocation(line: 756, column: 33, scope: !1353)
!2097 = !DILocation(line: 757, column: 26, scope: !1353)
!2098 = !DILocation(line: 757, column: 48, scope: !1353)
!2099 = !DILocation(line: 757, column: 53, scope: !1353)
!2100 = !DILocation(line: 757, column: 9, scope: !1353)
!2101 = !DILocation(line: 758, column: 18, scope: !1353)
!2102 = !DILocation(line: 758, column: 23, scope: !1353)
!2103 = !DILocation(line: 758, column: 27, scope: !1353)
!2104 = !DILocation(line: 758, column: 25, scope: !1353)
!2105 = !DILocation(line: 758, column: 9, scope: !1353)
!2106 = !DILocation(line: 758, column: 14, scope: !1353)
!2107 = !DILocation(line: 758, column: 16, scope: !1353)
!2108 = !DILocation(line: 759, column: 26, scope: !1353)
!2109 = !DILocation(line: 759, column: 31, scope: !1353)
!2110 = !DILocation(line: 759, column: 38, scope: !1353)
!2111 = !DILocation(line: 759, column: 43, scope: !1353)
!2112 = !DILocation(line: 759, column: 36, scope: !1353)
!2113 = !DILocation(line: 759, column: 9, scope: !1353)
!2114 = !DILocation(line: 759, column: 14, scope: !1353)
!2115 = !DILocation(line: 759, column: 24, scope: !1353)
!2116 = !DILocation(line: 775, column: 10, scope: !1353)
!2117 = !DILocation(line: 775, column: 5, scope: !1353)
!2118 = !DILocation(line: 776, column: 10, scope: !1353)
!2119 = !DILocation(line: 776, column: 5, scope: !1353)
!2120 = !DILocation(line: 777, column: 10, scope: !1353)
!2121 = !DILocation(line: 777, column: 5, scope: !1353)
!2122 = !DILocation(line: 778, column: 10, scope: !1353)
!2123 = !DILocation(line: 778, column: 5, scope: !1353)
!2124 = !DILocation(line: 780, column: 12, scope: !1353)
!2125 = !DILocation(line: 780, column: 5, scope: !1353)
!2126 = !DILocation(line: 781, column: 1, scope: !1353)
!2127 = !DISubprogram(name: "refresh_neighbour_lists", scope: !2128, file: !2128, line: 31, type: !2129, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !584)
!2128 = !DIFile(filename: "mcfutil.h", directory: "/home/michel/ETH/AST/specbuilder/src/605", checksumkind: CSK_MD5, checksum: "6fade418d230c2d9d39deb67b05e3ee3")
!2129 = !DISubroutineType(types: !2130)
!2130 = !{null, !80, !121}
!2131 = !DISubprogram(name: "calloc", scope: !578, file: !578, line: 556, type: !2132, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !584)
!2132 = !DISubroutineType(types: !2133)
!2133 = !{!63, !581, !581}
!2134 = !DISubprogram(name: "spec_qsort", scope: !2135, file: !2135, line: 9, type: !2136, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !584)
!2135 = !DIFile(filename: "spec_qsort/spec_qsort.h", directory: "/home/michel/ETH/AST/specbuilder/src/605", checksumkind: CSK_MD5, checksum: "2040d3b0b3e021f3f0b1e71d0e28f78d")
!2136 = !DISubroutineType(types: !2137)
!2137 = !{null, !63, !581, !581, !64}
!2138 = !DISubprogram(name: "getArcPosition", scope: !2128, file: !2128, line: 37, type: !122, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !584)
!2139 = distinct !DISubprogram(name: "suspend_impl", scope: !2, file: !2, line: 787, type: !2140, scopeLine: 794, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !7, retainedNodes: !2142)
!2140 = !DISubroutineType(types: !2141)
!2141 = !{!21, !80, !20, !21}
!2142 = !{!2143, !2144, !2145, !2146, !2147, !2148, !2149, !2150}
!2143 = !DILocalVariable(name: "net", arg: 1, scope: !2139, file: !2, line: 787, type: !80)
!2144 = !DILocalVariable(name: "threshold", arg: 2, scope: !2139, file: !2, line: 787, type: !20)
!2145 = !DILocalVariable(name: "all", arg: 3, scope: !2139, file: !2, line: 787, type: !21)
!2146 = !DILocalVariable(name: "susp", scope: !2139, file: !2, line: 795, type: !21)
!2147 = !DILocalVariable(name: "red_cost", scope: !2139, file: !2, line: 797, type: !20)
!2148 = !DILocalVariable(name: "arc", scope: !2139, file: !2, line: 798, type: !54)
!2149 = !DILocalVariable(name: "stop", scope: !2139, file: !2, line: 799, type: !21)
!2150 = !DILocalVariable(name: "startid", scope: !2139, file: !2, line: 799, type: !21)
!2151 = !DILocation(line: 787, column: 31, scope: !2139)
!2152 = !DILocation(line: 787, column: 43, scope: !2139)
!2153 = !DILocation(line: 787, column: 59, scope: !2139)
!2154 = !DILocation(line: 795, column: 5, scope: !2139)
!2155 = !DILocation(line: 795, column: 10, scope: !2139)
!2156 = !DILocation(line: 797, column: 5, scope: !2139)
!2157 = !DILocation(line: 797, column: 12, scope: !2139)
!2158 = !DILocation(line: 798, column: 5, scope: !2139)
!2159 = !DILocation(line: 798, column: 12, scope: !2139)
!2160 = !DILocation(line: 799, column: 5, scope: !2139)
!2161 = !DILocation(line: 799, column: 10, scope: !2139)
!2162 = !DILocation(line: 799, column: 16, scope: !2139)
!2163 = !DILocation(line: 801, column: 5, scope: !2139)
!2164 = !DILocation(line: 801, column: 10, scope: !2139)
!2165 = !DILocation(line: 801, column: 20, scope: !2139)
!2166 = !DILocation(line: 802, column: 24, scope: !2139)
!2167 = !DILocation(line: 802, column: 29, scope: !2139)
!2168 = !DILocation(line: 802, column: 31, scope: !2139)
!2169 = !DILocation(line: 802, column: 35, scope: !2139)
!2170 = !DILocation(line: 802, column: 41, scope: !2139)
!2171 = !DILocation(line: 802, column: 5, scope: !2139)
!2172 = !DILocation(line: 802, column: 10, scope: !2139)
!2173 = !DILocation(line: 802, column: 19, scope: !2139)
!2174 = !DILocation(line: 803, column: 24, scope: !2139)
!2175 = !DILocation(line: 803, column: 29, scope: !2139)
!2176 = !DILocation(line: 803, column: 46, scope: !2139)
!2177 = !DILocation(line: 803, column: 51, scope: !2139)
!2178 = !DILocation(line: 803, column: 53, scope: !2139)
!2179 = !DILocation(line: 803, column: 43, scope: !2139)
!2180 = !DILocation(line: 803, column: 38, scope: !2139)
!2181 = !DILocation(line: 803, column: 5, scope: !2139)
!2182 = !DILocation(line: 803, column: 10, scope: !2139)
!2183 = !DILocation(line: 803, column: 22, scope: !2139)
!2184 = !DILocation(line: 804, column: 3, scope: !2139)
!2185 = !DILocation(line: 804, column: 10, scope: !2139)
!2186 = !DILocation(line: 804, column: 15, scope: !2139)
!2187 = !DILocation(line: 804, column: 27, scope: !2139)
!2188 = !DILocation(line: 805, column: 24, scope: !2189)
!2189 = distinct !DILexicalBlock(scope: !2139, file: !2, line: 804, column: 32)
!2190 = !DILocation(line: 805, column: 29, scope: !2189)
!2191 = !DILocation(line: 805, column: 40, scope: !2189)
!2192 = !DILocation(line: 805, column: 45, scope: !2189)
!2193 = !DILocation(line: 805, column: 38, scope: !2189)
!2194 = !DILocation(line: 805, column: 5, scope: !2189)
!2195 = !DILocation(line: 805, column: 10, scope: !2189)
!2196 = !DILocation(line: 805, column: 22, scope: !2189)
!2197 = !DILocation(line: 806, column: 5, scope: !2189)
!2198 = !DILocation(line: 806, column: 10, scope: !2189)
!2199 = !DILocation(line: 806, column: 19, scope: !2189)
!2200 = distinct !{!2200, !2184, !2201, !229}
!2201 = !DILocation(line: 807, column: 3, scope: !2139)
!2202 = !DILocation(line: 809, column: 9, scope: !2203)
!2203 = distinct !DILexicalBlock(scope: !2139, file: !2, line: 809, column: 9)
!2204 = !DILocation(line: 809, column: 9, scope: !2139)
!2205 = !DILocation(line: 810, column: 16, scope: !2206)
!2206 = distinct !DILexicalBlock(scope: !2203, file: !2, line: 809, column: 15)
!2207 = !DILocation(line: 810, column: 21, scope: !2206)
!2208 = !DILocation(line: 810, column: 14, scope: !2206)
!2209 = !DILocation(line: 811, column: 5, scope: !2206)
!2210 = !DILocation(line: 815, column: 19, scope: !2211)
!2211 = distinct !DILexicalBlock(scope: !2203, file: !2, line: 813, column: 5)
!2212 = !DILocation(line: 815, column: 24, scope: !2211)
!2213 = !DILocation(line: 815, column: 28, scope: !2211)
!2214 = !DILocation(line: 815, column: 33, scope: !2211)
!2215 = !DILocation(line: 815, column: 26, scope: !2211)
!2216 = !DILocation(line: 815, column: 17, scope: !2211)
!2217 = !DILocation(line: 816, column: 21, scope: !2218)
!2218 = distinct !DILexicalBlock(scope: !2211, file: !2, line: 816, column: 9)
!2219 = !DILocation(line: 816, column: 26, scope: !2218)
!2220 = !DILocation(line: 816, column: 30, scope: !2218)
!2221 = !DILocation(line: 816, column: 35, scope: !2218)
!2222 = !DILocation(line: 816, column: 28, scope: !2218)
!2223 = !DILocation(line: 816, column: 19, scope: !2218)
!2224 = !DILocation(line: 816, column: 48, scope: !2218)
!2225 = !DILocation(line: 816, column: 14, scope: !2218)
!2226 = !DILocation(line: 816, column: 53, scope: !2227)
!2227 = distinct !DILexicalBlock(scope: !2218, file: !2, line: 816, column: 9)
!2228 = !DILocation(line: 816, column: 60, scope: !2227)
!2229 = !DILocation(line: 816, column: 65, scope: !2227)
!2230 = !DILocation(line: 816, column: 58, scope: !2227)
!2231 = !DILocation(line: 816, column: 9, scope: !2218)
!2232 = !DILocation(line: 818, column: 17, scope: !2233)
!2233 = distinct !DILexicalBlock(scope: !2227, file: !2, line: 817, column: 9)
!2234 = !DILocation(line: 818, column: 22, scope: !2233)
!2235 = !DILocation(line: 818, column: 44, scope: !2233)
!2236 = !DILocation(line: 818, column: 49, scope: !2233)
!2237 = !DILocation(line: 818, column: 29, scope: !2233)
!2238 = !DILocation(line: 818, column: 27, scope: !2233)
!2239 = !DILocation(line: 818, column: 15, scope: !2233)
!2240 = !DILocation(line: 819, column: 17, scope: !2241)
!2241 = distinct !DILexicalBlock(scope: !2233, file: !2, line: 819, column: 17)
!2242 = !DILocation(line: 819, column: 22, scope: !2241)
!2243 = !DILocation(line: 819, column: 28, scope: !2241)
!2244 = !DILocation(line: 819, column: 17, scope: !2233)
!2245 = !DILocation(line: 820, column: 28, scope: !2241)
!2246 = !DILocation(line: 820, column: 33, scope: !2241)
!2247 = !DILocation(line: 820, column: 40, scope: !2241)
!2248 = !DILocation(line: 820, column: 45, scope: !2241)
!2249 = !DILocation(line: 820, column: 51, scope: !2241)
!2250 = !DILocation(line: 820, column: 38, scope: !2241)
!2251 = !DILocation(line: 821, column: 27, scope: !2241)
!2252 = !DILocation(line: 821, column: 32, scope: !2241)
!2253 = !DILocation(line: 821, column: 38, scope: !2241)
!2254 = !DILocation(line: 821, column: 25, scope: !2241)
!2255 = !DILocation(line: 820, column: 26, scope: !2241)
!2256 = !DILocation(line: 820, column: 17, scope: !2241)
!2257 = !DILocation(line: 824, column: 26, scope: !2258)
!2258 = distinct !DILexicalBlock(scope: !2241, file: !2, line: 823, column: 13)
!2259 = !DILocation(line: 826, column: 21, scope: !2260)
!2260 = distinct !DILexicalBlock(scope: !2258, file: !2, line: 826, column: 21)
!2261 = !DILocation(line: 826, column: 26, scope: !2260)
!2262 = !DILocation(line: 826, column: 32, scope: !2260)
!2263 = !DILocation(line: 826, column: 21, scope: !2258)
!2264 = !DILocation(line: 828, column: 27, scope: !2265)
!2265 = distinct !DILexicalBlock(scope: !2266, file: !2, line: 828, column: 25)
!2266 = distinct !DILexicalBlock(scope: !2260, file: !2, line: 827, column: 17)
!2267 = !DILocation(line: 828, column: 32, scope: !2265)
!2268 = !DILocation(line: 828, column: 38, scope: !2265)
!2269 = !DILocation(line: 828, column: 51, scope: !2265)
!2270 = !DILocation(line: 828, column: 48, scope: !2265)
!2271 = !DILocation(line: 828, column: 25, scope: !2266)
!2272 = !DILocation(line: 829, column: 46, scope: !2265)
!2273 = !DILocation(line: 829, column: 23, scope: !2265)
!2274 = !DILocation(line: 829, column: 28, scope: !2265)
!2275 = !DILocation(line: 829, column: 34, scope: !2265)
!2276 = !DILocation(line: 829, column: 44, scope: !2265)
!2277 = !DILocation(line: 830, column: 17, scope: !2266)
!2278 = !DILocation(line: 833, column: 17, scope: !2279)
!2279 = distinct !DILexicalBlock(scope: !2233, file: !2, line: 833, column: 17)
!2280 = !DILocation(line: 833, column: 28, scope: !2279)
!2281 = !DILocation(line: 833, column: 26, scope: !2279)
!2282 = !DILocation(line: 833, column: 17, scope: !2233)
!2283 = !DILocation(line: 834, column: 21, scope: !2284)
!2284 = distinct !DILexicalBlock(scope: !2279, file: !2, line: 833, column: 40)
!2285 = !DILocation(line: 835, column: 17, scope: !2284)
!2286 = !DILocation(line: 835, column: 22, scope: !2284)
!2287 = !DILocation(line: 835, column: 25, scope: !2284)
!2288 = !DILocation(line: 836, column: 13, scope: !2284)
!2289 = !DILocation(line: 839, column: 25, scope: !2290)
!2290 = distinct !DILexicalBlock(scope: !2279, file: !2, line: 838, column: 13)
!2291 = !DILocation(line: 839, column: 15, scope: !2290)
!2292 = !DILocation(line: 839, column: 20, scope: !2290)
!2293 = !DILocation(line: 839, column: 23, scope: !2290)
!2294 = !DILocation(line: 840, column: 24, scope: !2290)
!2295 = !DILocation(line: 842, column: 9, scope: !2233)
!2296 = !DILocation(line: 816, column: 73, scope: !2227)
!2297 = !DILocation(line: 816, column: 9, scope: !2227)
!2298 = distinct !{!2298, !2231, !2299, !229}
!2299 = !DILocation(line: 842, column: 9, scope: !2218)
!2300 = !DILocation(line: 851, column: 9, scope: !2301)
!2301 = distinct !DILexicalBlock(scope: !2139, file: !2, line: 851, column: 9)
!2302 = !DILocation(line: 851, column: 9, scope: !2139)
!2303 = !DILocation(line: 853, column: 24, scope: !2304)
!2304 = distinct !DILexicalBlock(scope: !2301, file: !2, line: 852, column: 5)
!2305 = !DILocation(line: 853, column: 9, scope: !2304)
!2306 = !DILocation(line: 853, column: 14, scope: !2304)
!2307 = !DILocation(line: 853, column: 21, scope: !2304)
!2308 = !DILocation(line: 854, column: 36, scope: !2304)
!2309 = !DILocation(line: 854, column: 9, scope: !2304)
!2310 = !DILocation(line: 854, column: 14, scope: !2304)
!2311 = !DILocation(line: 854, column: 33, scope: !2304)
!2312 = !DILocation(line: 856, column: 9, scope: !2304)
!2313 = !DILocation(line: 856, column: 14, scope: !2304)
!2314 = !DILocation(line: 856, column: 24, scope: !2304)
!2315 = !DILocation(line: 857, column: 28, scope: !2304)
!2316 = !DILocation(line: 857, column: 33, scope: !2304)
!2317 = !DILocation(line: 857, column: 37, scope: !2304)
!2318 = !DILocation(line: 857, column: 35, scope: !2304)
!2319 = !DILocation(line: 857, column: 42, scope: !2304)
!2320 = !DILocation(line: 857, column: 46, scope: !2304)
!2321 = !DILocation(line: 857, column: 52, scope: !2304)
!2322 = !DILocation(line: 857, column: 9, scope: !2304)
!2323 = !DILocation(line: 857, column: 14, scope: !2304)
!2324 = !DILocation(line: 857, column: 23, scope: !2304)
!2325 = !DILocation(line: 858, column: 14, scope: !2326)
!2326 = distinct !DILexicalBlock(scope: !2304, file: !2, line: 858, column: 13)
!2327 = !DILocation(line: 858, column: 19, scope: !2326)
!2328 = !DILocation(line: 858, column: 23, scope: !2326)
!2329 = !DILocation(line: 858, column: 21, scope: !2326)
!2330 = !DILocation(line: 858, column: 29, scope: !2326)
!2331 = !DILocation(line: 858, column: 33, scope: !2326)
!2332 = !DILocation(line: 858, column: 13, scope: !2304)
!2333 = !DILocation(line: 859, column: 31, scope: !2326)
!2334 = !DILocation(line: 859, column: 36, scope: !2326)
!2335 = !DILocation(line: 859, column: 54, scope: !2326)
!2336 = !DILocation(line: 859, column: 59, scope: !2326)
!2337 = !DILocation(line: 859, column: 63, scope: !2326)
!2338 = !DILocation(line: 859, column: 61, scope: !2326)
!2339 = !DILocation(line: 859, column: 69, scope: !2326)
!2340 = !DILocation(line: 859, column: 50, scope: !2326)
!2341 = !DILocation(line: 859, column: 45, scope: !2326)
!2342 = !DILocation(line: 859, column: 12, scope: !2326)
!2343 = !DILocation(line: 859, column: 17, scope: !2326)
!2344 = !DILocation(line: 859, column: 29, scope: !2326)
!2345 = !DILocation(line: 861, column: 31, scope: !2326)
!2346 = !DILocation(line: 861, column: 36, scope: !2326)
!2347 = !DILocation(line: 861, column: 12, scope: !2326)
!2348 = !DILocation(line: 861, column: 17, scope: !2326)
!2349 = !DILocation(line: 861, column: 29, scope: !2326)
!2350 = !DILocation(line: 862, column: 7, scope: !2304)
!2351 = !DILocation(line: 862, column: 14, scope: !2304)
!2352 = !DILocation(line: 862, column: 19, scope: !2304)
!2353 = !DILocation(line: 862, column: 31, scope: !2304)
!2354 = !DILocation(line: 863, column: 28, scope: !2355)
!2355 = distinct !DILexicalBlock(scope: !2304, file: !2, line: 862, column: 36)
!2356 = !DILocation(line: 863, column: 33, scope: !2355)
!2357 = !DILocation(line: 863, column: 44, scope: !2355)
!2358 = !DILocation(line: 863, column: 49, scope: !2355)
!2359 = !DILocation(line: 863, column: 42, scope: !2355)
!2360 = !DILocation(line: 863, column: 9, scope: !2355)
!2361 = !DILocation(line: 863, column: 14, scope: !2355)
!2362 = !DILocation(line: 863, column: 26, scope: !2355)
!2363 = !DILocation(line: 864, column: 9, scope: !2355)
!2364 = !DILocation(line: 864, column: 14, scope: !2355)
!2365 = !DILocation(line: 864, column: 23, scope: !2355)
!2366 = distinct !{!2366, !2350, !2367, !229}
!2367 = !DILocation(line: 865, column: 7, scope: !2304)
!2368 = !DILocation(line: 866, column: 26, scope: !2304)
!2369 = !DILocation(line: 866, column: 56, scope: !2304)
!2370 = !DILocation(line: 866, column: 61, scope: !2304)
!2371 = !DILocation(line: 866, column: 9, scope: !2304)
!2372 = !DILocation(line: 867, column: 17, scope: !2304)
!2373 = !DILocation(line: 867, column: 7, scope: !2304)
!2374 = !DILocation(line: 867, column: 12, scope: !2304)
!2375 = !DILocation(line: 867, column: 14, scope: !2304)
!2376 = !DILocation(line: 868, column: 27, scope: !2304)
!2377 = !DILocation(line: 868, column: 9, scope: !2304)
!2378 = !DILocation(line: 868, column: 14, scope: !2304)
!2379 = !DILocation(line: 868, column: 24, scope: !2304)
!2380 = !DILocation(line: 869, column: 34, scope: !2304)
!2381 = !DILocation(line: 869, column: 9, scope: !2304)
!2382 = !DILocation(line: 870, column: 5, scope: !2304)
!2383 = !DILocation(line: 872, column: 12, scope: !2139)
!2384 = !DILocation(line: 873, column: 1, scope: !2139)
!2385 = !DILocation(line: 872, column: 5, scope: !2139)
