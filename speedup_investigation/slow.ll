; ModuleID = 'initial.bc'
source_filename = "/home/michel/ETH/AST/specbuilder/src/644/sff.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.molecule_t = type { [4 x [3 x double]], i32, ptr, i32, i32, i32, ptr }
%struct.parm = type { [81 x i8], i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, [3 x double], double, double, double, double, double, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr, ptr }

@ntpr = dso_local local_unnamed_addr global i32 100, align 4
@gb = dso_local local_unnamed_addr global i32 0, align 4
@blocksize = dso_local local_unnamed_addr global i32 8, align 4
@ntpr_md = dso_local local_unnamed_addr global i32 100, align 4
@dim = internal unnamed_addr global i1 false, align 4
@stdin = external local_unnamed_addr global ptr, align 8
@.str = private unnamed_addr constant [2 x i8] c"-\00", align 1
@.str.1 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@stderr = external local_unnamed_addr global ptr, align 8
@.str.2 = private unnamed_addr constant [26 x i8] c"getx: can't open file %s\0A\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@stdout = external local_unnamed_addr global ptr, align 8
@.str.4 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.5 = private unnamed_addr constant [21 x i8] c"Can't open file %s.\0A\00", align 1
@.str.6 = private unnamed_addr constant [5 x i8] c"%6d\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"%20.15f%20.15f%20.15f\0A\00", align 1
@.str.8 = private unnamed_addr constant [30 x i8] c"%20.15f%20.15f%20.15f%20.15f\0A\00", align 1
@.str.9 = private unnamed_addr constant [27 x i8] c"getxv: can't open file %s\0A\00", align 1
@.str.10 = private unnamed_addr constant [7 x i8] c"%d %lf\00", align 1
@nabout = external local_unnamed_addr global ptr, align 8
@.str.11 = private unnamed_addr constant [26 x i8] c"no velocities were found\0A\00", align 1
@.str.12 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1
@.str.13 = private unnamed_addr constant [11 x i8] c"%6d%15.5f\0A\00", align 1
@.str.14 = private unnamed_addr constant [38 x i8] c"%12.7f%12.7f%12.7f%12.7f%12.7f%12.7f\0A\00", align 1
@.str.15 = private unnamed_addr constant [20 x i8] c"%12.7f%12.7f%12.7f\0A\00", align 1
@.str.16 = private unnamed_addr constant [35 x i8] c"\0AFirst derivative timing summary:\0A\00", align 1
@.str.17 = private unnamed_addr constant [23 x i8] c"   constraints %10.2f\0A\00", align 1
@.str.18 = private unnamed_addr constant [23 x i8] c"   bonds       %10.2f\0A\00", align 1
@.str.19 = private unnamed_addr constant [23 x i8] c"   angles      %10.2f\0A\00", align 1
@.str.20 = private unnamed_addr constant [23 x i8] c"   torsions    %10.2f\0A\00", align 1
@.str.21 = private unnamed_addr constant [23 x i8] c"   pairlist    %10.2f\0A\00", align 1
@.str.22 = private unnamed_addr constant [23 x i8] c"   nonbonds    %10.2f\0A\00", align 1
@.str.23 = private unnamed_addr constant [23 x i8] c"   gen. Born   %10.2f\0A\00", align 1
@.str.24 = private unnamed_addr constant [23 x i8] c"   mme         %10.2f\0A\00", align 1
@.str.25 = private unnamed_addr constant [24 x i8] c"   Total       %10.2f\0A\0A\00", align 1
@.str.26 = private unnamed_addr constant [23 x i8] c"   reduction   %10.2f\0A\00", align 1
@.str.27 = private unnamed_addr constant [24 x i8] c"   molec. dyn. %10.2f\0A\0A\00", align 1
@mme_init.nold = internal unnamed_addr global i32 0, align 4
@prm = internal unnamed_addr global ptr null, align 8
@x0 = internal unnamed_addr global ptr null, align 8
@binposfp = internal unnamed_addr global ptr null, align 8
@frozen = internal unnamed_addr global ptr null, align 8
@constrained = internal unnamed_addr global ptr null, align 8
@nconstrained = internal unnamed_addr global i32 0, align 4
@.str.52 = private unnamed_addr constant [26 x i8] c"constrained all %d atoms\0A\00", align 1
@.str.53 = private unnamed_addr constant [42 x i8] c"constrained %d atoms using expression %s\0A\00", align 1
@gbalpha = internal unnamed_addr global double 0.000000e+00, align 8
@gbbeta = internal unnamed_addr global double 0.000000e+00, align 8
@gbgamma = internal unnamed_addr global double 0.000000e+00, align 8
@pairlistnp = internal unnamed_addr global ptr null, align 8
@upairsnp = internal unnamed_addr global ptr null, align 8
@lpairsnp = internal unnamed_addr global ptr null, align 8
@.str.54 = private unnamed_addr constant [48 x i8] c"Error allocating pairlistnp array in mme_init!\0A\00", align 1
@pairlist2np = internal unnamed_addr global ptr null, align 8
@upairs2np = internal unnamed_addr global ptr null, align 8
@lpairs2np = internal unnamed_addr global ptr null, align 8
@.str.55 = private unnamed_addr constant [49 x i8] c"Error allocating pairlist2np array in mme_init!\0A\00", align 1
@pairlist = internal unnamed_addr global ptr null, align 8
@nb_pairs = internal unnamed_addr global i32 -1, align 4
@upairs = internal unnamed_addr global ptr null, align 8
@lpairs = internal unnamed_addr global ptr null, align 8
@.str.56 = private unnamed_addr constant [46 x i8] c"Error allocating pairlist array in mme_init!\0A\00", align 1
@nfrozen = internal unnamed_addr global i32 0, align 4
@.str.57 = private unnamed_addr constant [56 x i8] c"freezing %d atoms using expression %s for moving atoms\0A\00", align 1
@N14pearlist = internal unnamed_addr global ptr null, align 8
@.str.58 = private unnamed_addr constant [49 x i8] c"Error allocating N14pearlist array in mme_init!\0A\00", align 1
@IexclAt = internal unnamed_addr global ptr null, align 8
@.str.59 = private unnamed_addr constant [45 x i8] c"Error allocating IexclAt array in mme_init!\0A\00", align 1
@tdiagd = dso_local local_unnamed_addr global double 0.000000e+00, align 8
@tdiag = dso_local local_unnamed_addr global double 0.000000e+00, align 8
@tlevel = dso_local local_unnamed_addr global double 0.000000e+00, align 8
@tnewton = dso_local local_unnamed_addr global double 0.000000e+00, align 8
@tcholesky = dso_local local_unnamed_addr global double 0.000000e+00, align 8
@tconjgrad = dso_local local_unnamed_addr global double 0.000000e+00, align 8
@tdgeev = dso_local local_unnamed_addr global double 0.000000e+00, align 8
@tmmetwo = dso_local local_unnamed_addr global double 0.000000e+00, align 8
@tmmeone = dso_local local_unnamed_addr global double 0.000000e+00, align 8
@chknm = internal unnamed_addr global ptr null, align 8
@.str.60 = private unnamed_addr constant [18 x i8] c"\09checkpoint:  %s\0A\00", align 1
@md.xold = internal unnamed_addr global ptr null, align 8
@md.accel = internal unnamed_addr global ptr null, align 8
@md.minv = internal unnamed_addr global ptr null, align 8
@md.nold = internal unnamed_addr global i32 0, align 4
@.str.61 = private unnamed_addr constant [35 x i8] c"unable to allocate space for minv\0A\00", align 1
@.str.62 = private unnamed_addr constant [35 x i8] c"unable to allocate space for xold\0A\00", align 1
@.str.64 = private unnamed_addr constant [36 x i8] c"unable to allocate space for accel\0A\00", align 1
@max_step = internal unnamed_addr global i32 -1, align 4
@t = internal unnamed_addr global double 0.000000e+00, align 8
@tnmode = dso_local local_unnamed_addr global double 0.000000e+00, align 8
@mme34.grad = internal unnamed_addr global ptr null, align 8
@.str.65 = private unnamed_addr constant [21 x i8] c"      iter    Total\0A\00", align 1
@.str.66 = private unnamed_addr constant [14 x i8] c"ff:%6d %9.2f\0A\00", align 1
@.str.67 = private unnamed_addr constant [20 x i8] c"     bond:  %15.9f\0A\00", align 1
@.str.68 = private unnamed_addr constant [20 x i8] c"    angle:  %15.9f\0A\00", align 1
@.str.69 = private unnamed_addr constant [20 x i8] c" dihedral:  %15.9f\0A\00", align 1
@.str.70 = private unnamed_addr constant [20 x i8] c"    enb14:  %15.9f\0A\00", align 1
@.str.71 = private unnamed_addr constant [20 x i8] c"    eel14:  %15.9f\0A\00", align 1
@.str.72 = private unnamed_addr constant [20 x i8] c"      enb:  %15.9f\0A\00", align 1
@.str.73 = private unnamed_addr constant [20 x i8] c"      eel:  %15.9f\0A\00", align 1
@.str.74 = private unnamed_addr constant [20 x i8] c"      egb:  %15.9f\0A\00", align 1
@.str.75 = private unnamed_addr constant [20 x i8] c"    econs:  %15.9f\0A\00", align 1
@.str.76 = private unnamed_addr constant [20 x i8] c"    esurf:  %15.9f\0A\00", align 1
@.str.77 = private unnamed_addr constant [20 x i8] c"    Total:  %15.9f\0A\00", align 1
@egb.reff = internal unnamed_addr global ptr null, align 8
@egb.sumdeijda = internal unnamed_addr global ptr null, align 8
@egb.psi = internal unnamed_addr global ptr null, align 8
@egb.reqack = internal unnamed_addr global ptr null, align 8
@egb.iexw = internal unnamed_addr global ptr null, align 8
@.str.80 = private unnamed_addr constant [49 x i8] c"NULL pair list entry in egb loop 1, taskid = %d\0A\00", align 1
@.str.82 = private unnamed_addr constant [49 x i8] c"NULL pair list entry in egb loop 3, taskid = %d\0A\00", align 1
@.str.83 = private unnamed_addr constant [49 x i8] c"NULL pair list entry in egb loop 5, taskid = %d\0A\00", align 1
@.str.84 = private unnamed_addr constant [37 x i8] c"bad value for Pn: %d %d %d %d %8.3f\0A\00", align 1
@.str.85 = private unnamed_addr constant [51 x i8] c"NULL pair list entry in nbond loop 1, taskid = %d\0A\00", align 1

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local double @seconds() local_unnamed_addr #0 {
entry:
  ret double 1.000000e-01
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local i32 @myroc(i32 noundef %i, i32 noundef %mb, i32 noundef %nprow, i32 noundef %myrow) local_unnamed_addr #0 {
entry:
  %cmp = icmp slt i32 %myrow, 0
  br i1 %cmp, label %return, label %if.else

if.else:                                          ; preds = %entry
  %div = sdiv i32 %i, %mb
  %rem = srem i32 %div, %nprow
  %cmp1 = icmp eq i32 %rem, %myrow
  %conv = zext i1 %cmp1 to i32
  br label %return

return:                                           ; preds = %entry, %if.else
  %retval.0 = phi i32 [ %conv, %if.else ], [ 0, %entry ]
  ret i32 %retval.0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local i32 @get_nr_debug() local_unnamed_addr #0 {
entry:
  ret i32 0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: none, inaccessiblemem: none) uwtable
define dso_local i32 @get_blocksize() local_unnamed_addr #1 {
entry:
  %0 = load i32, ptr @blocksize, align 4, !tbaa !5
  ret i32 %0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local i32 @get_mytaskid() local_unnamed_addr #0 {
entry:
  ret i32 0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local i32 @get_numtasks() local_unnamed_addr #0 {
entry:
  ret i32 1
}

; Function Attrs: nounwind uwtable
define dso_local i32 @mpierror(i32 noundef %myerror) local_unnamed_addr #2 {
entry:
  %cmp = icmp slt i32 %myerror, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  tail call void @exit(i32 noundef 1) #22
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #3

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) local_unnamed_addr #4

; Function Attrs: mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #3

; Function Attrs: nounwind uwtable
define dso_local i32 @reducerror(i32 noundef %myerror) local_unnamed_addr #2 {
entry:
  %cmp.i = icmp slt i32 %myerror, 0
  br i1 %cmp.i, label %if.then.i, label %mpierror.exit

if.then.i:                                        ; preds = %entry
  tail call void @exit(i32 noundef 1) #22
  unreachable

mpierror.exit:                                    ; preds = %entry
  ret i32 0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable
define dso_local i32 @mpifinalize() local_unnamed_addr #0 {
entry:
  ret i32 0
}

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write) uwtable
define dso_local i32 @mpiinit(ptr nocapture noundef readnone %argc, ptr nocapture noundef readnone %argv, ptr nocapture noundef writeonly %rank, ptr nocapture noundef writeonly %size) local_unnamed_addr #5 {
entry:
  store i32 0, ptr %rank, align 4, !tbaa !5
  store i32 1, ptr %size, align 4, !tbaa !5
  ret i32 0
}

; Function Attrs: nounwind uwtable
define dso_local i32 @getxyz(ptr nocapture noundef readonly %fname, ptr noundef %natom, ptr nocapture noundef writeonly %x) local_unnamed_addr #2 {
entry:
  %.b = load i1, ptr @dim, align 4
  %0 = select i1 %.b, i32 4, i32 3
  %call = tail call i32 @getxyzw(ptr noundef %fname, ptr noundef %natom, ptr noundef %x, i32 noundef %0)
  ret i32 0
}

; Function Attrs: nounwind uwtable
define dso_local i32 @getxyzw(ptr nocapture noundef readonly %fname, ptr noundef %natom, ptr nocapture noundef writeonly %x, i32 noundef %dim) local_unnamed_addr #2 {
entry:
  %line = alloca [82 x i8], align 16
  %field = alloca [21 x i8], align 16
  call void @llvm.lifetime.start.p0(i64 82, ptr nonnull %line) #23
  call void @llvm.lifetime.start.p0(i64 21, ptr nonnull %field) #23
  %0 = load ptr, ptr %fname, align 8, !tbaa !9
  %tobool.not = icmp eq ptr %0, null
  br i1 %tobool.not, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8, ptr %0, align 1, !tbaa !11
  %tobool1.not = icmp eq i8 %1, 0
  br i1 %tobool1.not, label %if.then, label %if.else

if.then:                                          ; preds = %lor.lhs.false, %entry
  %2 = load ptr, ptr @stdin, align 8, !tbaa !9
  br label %if.end18

if.else:                                          ; preds = %lor.lhs.false
  %call = tail call i32 @strcmp(ptr noundef nonnull dereferenceable(1) %0, ptr noundef nonnull dereferenceable(2) @.str) #24
  %tobool2.not = icmp eq i32 %call, 0
  br i1 %tobool2.not, label %if.then3, label %if.else4

if.then3:                                         ; preds = %if.else
  %3 = load ptr, ptr @stdin, align 8, !tbaa !9
  br label %if.end18

if.else4:                                         ; preds = %if.else
  %call7 = tail call noalias ptr @fopen(ptr noundef nonnull %0, ptr noundef nonnull @.str.1)
  %cmp8 = icmp eq ptr %call7, null
  br i1 %cmp8, label %if.then.i.i, label %if.end18

if.then.i.i:                                      ; preds = %if.else4
  %4 = load ptr, ptr @stderr, align 8, !tbaa !9
  %5 = load ptr, ptr %fname, align 8, !tbaa !9
  %call10 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %4, ptr noundef nonnull @.str.2, ptr noundef %5) #25
  tail call void @exit(i32 noundef 1) #22
  unreachable

if.end18:                                         ; preds = %if.else4, %if.then3, %if.then
  %fp.1 = phi ptr [ %3, %if.then3 ], [ %2, %if.then ], [ %call7, %if.else4 ]
  %call19 = call ptr @ggets(ptr noundef nonnull %line, i32 noundef 82, ptr noundef %fp.1) #23
  %call21 = call i32 (ptr, ptr, ...) @__isoc99_sscanf(ptr noundef nonnull %line, ptr noundef nonnull @.str.3, ptr noundef %natom) #23
  %call23 = call ptr @ggets(ptr noundef nonnull %line, i32 noundef 82, ptr noundef %fp.1) #23
  %6 = load i32, ptr %natom, align 4, !tbaa !5
  %mul23 = mul nsw i32 %6, %dim
  %cmp2424 = icmp sgt i32 %mul23, 0
  br i1 %cmp2424, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %if.end18
  %arrayidx = getelementptr inbounds [21 x i8], ptr %field, i64 0, i64 20
  %sub = add nsw i32 %dim, -1
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %for.inc
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %for.inc ]
  %7 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %7, %dim
  %mul27 = mul nsw i32 %rem, 20
  %idx.ext = zext i32 %mul27 to i64
  %add.ptr = getelementptr inbounds i8, ptr %line, i64 %idx.ext
  %call28 = call ptr @strncpy(ptr noundef nonnull dereferenceable(1) %field, ptr noundef nonnull dereferenceable(1) %add.ptr, i64 noundef 20) #23
  store i8 0, ptr %arrayidx, align 4, !tbaa !11
  %call.i = call double @strtod(ptr nocapture noundef nonnull %field, ptr noundef null) #23
  %arrayidx31 = getelementptr inbounds double, ptr %x, i64 %indvars.iv
  store double %call.i, ptr %arrayidx31, align 8, !tbaa !12
  %cmp33 = icmp eq i32 %rem, %sub
  br i1 %cmp33, label %land.lhs.true, label %for.inc

land.lhs.true:                                    ; preds = %for.body
  %8 = load i32, ptr %natom, align 4, !tbaa !5
  %mul34 = mul nsw i32 %8, %dim
  %sub35 = add nsw i32 %mul34, -1
  %9 = sext i32 %sub35 to i64
  %cmp36 = icmp slt i64 %indvars.iv, %9
  br i1 %cmp36, label %if.then37, label %for.inc

if.then37:                                        ; preds = %land.lhs.true
  %call39 = call ptr @ggets(ptr noundef nonnull %line, i32 noundef 82, ptr noundef %fp.1) #23
  br label %for.inc

for.inc:                                          ; preds = %for.body, %land.lhs.true, %if.then37
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %10 = load i32, ptr %natom, align 4, !tbaa !5
  %mul = mul nsw i32 %10, %dim
  %11 = sext i32 %mul to i64
  %cmp24 = icmp slt i64 %indvars.iv.next, %11
  br i1 %cmp24, label %for.body, label %for.end, !llvm.loop !14

for.end:                                          ; preds = %for.inc, %if.end18
  %12 = load ptr, ptr @stdin, align 8, !tbaa !9
  %cmp41.not = icmp eq ptr %fp.1, %12
  br i1 %cmp41.not, label %if.end48, label %if.then42

if.then42:                                        ; preds = %for.end
  %call46 = call i32 @fclose(ptr noundef %fp.1)
  br label %if.end48

if.end48:                                         ; preds = %if.then42, %for.end
  call void @llvm.lifetime.end.p0(i64 21, ptr nonnull %field) #23
  call void @llvm.lifetime.end.p0(i64 82, ptr nonnull %line) #23
  ret i32 0
}

; Function Attrs: nounwind uwtable
define dso_local i32 @putxyz(ptr nocapture noundef readonly %fname, ptr nocapture noundef readonly %natom, ptr nocapture noundef readonly %x) local_unnamed_addr #2 {
entry:
  %.b = load i1, ptr @dim, align 4
  %0 = select i1 %.b, i32 4, i32 3
  %call = tail call i32 @putxyzw(ptr noundef %fname, ptr noundef %natom, ptr noundef %x, i32 noundef %0)
  ret i32 0
}

; Function Attrs: nounwind uwtable
define dso_local i32 @putxyzw(ptr nocapture noundef readonly %fname, ptr nocapture noundef readonly %natom, ptr nocapture noundef readonly %x, i32 noundef %dim) local_unnamed_addr #2 {
entry:
  %0 = load ptr, ptr %fname, align 8, !tbaa !9
  %call1 = tail call i32 @strcmp(ptr noundef nonnull dereferenceable(1) %0, ptr noundef nonnull dereferenceable(2) @.str) #24
  %tobool.not = icmp eq i32 %call1, 0
  br i1 %tobool.not, label %if.then2, label %if.else

if.then2:                                         ; preds = %entry
  %1 = load ptr, ptr @stdout, align 8, !tbaa !9
  br label %if.then9

if.else:                                          ; preds = %entry
  %call3 = tail call noalias ptr @fopen(ptr noundef %0, ptr noundef nonnull @.str.4)
  %cmp4 = icmp eq ptr %call3, null
  br i1 %cmp4, label %if.then.i.i, label %if.then9

if.then9:                                         ; preds = %if.else, %if.then2
  %fp.0.ph = phi ptr [ %1, %if.then2 ], [ %call3, %if.else ]
  %2 = load i32, ptr %natom, align 4, !tbaa !5
  %call10 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %fp.0.ph, ptr noundef nonnull @.str.6, i32 noundef %2)
  %3 = load i32, ptr %natom, align 4, !tbaa !5
  %mul30 = mul nsw i32 %3, %dim
  %cmp1131 = icmp sgt i32 %mul30, 0
  br i1 %cmp1131, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %if.then9
  %cmp12 = icmp eq i32 %dim, 3
  br i1 %cmp12, label %for.body.us, label %for.body.preheader

for.body.preheader:                               ; preds = %for.body.lr.ph
  %4 = sext i32 %dim to i64
  br label %for.body

for.body.us:                                      ; preds = %for.body.lr.ph, %for.body.us
  %indvars.iv38 = phi i64 [ %indvars.iv.next39, %for.body.us ], [ 0, %for.body.lr.ph ]
  %arrayidx.us = getelementptr inbounds double, ptr %x, i64 %indvars.iv38
  %5 = load double, ptr %arrayidx.us, align 8, !tbaa !12
  %6 = add nsw i64 %indvars.iv38, 1
  %arrayidx15.us = getelementptr inbounds double, ptr %x, i64 %6
  %7 = load double, ptr %arrayidx15.us, align 8, !tbaa !12
  %8 = add nsw i64 %indvars.iv38, 2
  %arrayidx18.us = getelementptr inbounds double, ptr %x, i64 %8
  %9 = load double, ptr %arrayidx18.us, align 8, !tbaa !12
  %call19.us = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %fp.0.ph, ptr noundef nonnull @.str.7, double noundef %5, double noundef %7, double noundef %9)
  %indvars.iv.next39 = add i64 %indvars.iv38, 3
  %10 = load i32, ptr %natom, align 4, !tbaa !5
  %mul.us = mul nsw i32 %10, 3
  %11 = sext i32 %mul.us to i64
  %cmp11.us = icmp slt i64 %indvars.iv.next39, %11
  br i1 %cmp11.us, label %for.body.us, label %for.end, !llvm.loop !16

for.body:                                         ; preds = %for.body.preheader, %for.body
  %indvars.iv = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next, %for.body ]
  %arrayidx22 = getelementptr inbounds double, ptr %x, i64 %indvars.iv
  %12 = load double, ptr %arrayidx22, align 8, !tbaa !12
  %13 = add nsw i64 %indvars.iv, 1
  %arrayidx25 = getelementptr inbounds double, ptr %x, i64 %13
  %14 = load double, ptr %arrayidx25, align 8, !tbaa !12
  %15 = add nsw i64 %indvars.iv, 2
  %arrayidx28 = getelementptr inbounds double, ptr %x, i64 %15
  %16 = load double, ptr %arrayidx28, align 8, !tbaa !12
  %17 = add nsw i64 %indvars.iv, 3
  %arrayidx31 = getelementptr inbounds double, ptr %x, i64 %17
  %18 = load double, ptr %arrayidx31, align 8, !tbaa !12
  %call32 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %fp.0.ph, ptr noundef nonnull @.str.8, double noundef %12, double noundef %14, double noundef %16, double noundef %18)
  %indvars.iv.next = add i64 %indvars.iv, %4
  %19 = load i32, ptr %natom, align 4, !tbaa !5
  %mul = mul nsw i32 %19, %dim
  %20 = sext i32 %mul to i64
  %cmp11 = icmp slt i64 %indvars.iv.next, %20
  br i1 %cmp11, label %for.body, label %for.end, !llvm.loop !16

for.end:                                          ; preds = %for.body, %for.body.us, %if.then9
  %21 = load ptr, ptr @stdout, align 8, !tbaa !9
  %cmp35.not = icmp eq ptr %fp.0.ph, %21
  br i1 %cmp35.not, label %reducerror.exit, label %if.then36

if.then36:                                        ; preds = %for.end
  %call37 = tail call i32 @fclose(ptr noundef %fp.0.ph)
  br label %reducerror.exit

if.then.i.i:                                      ; preds = %if.else
  %22 = load ptr, ptr %fname, align 8, !tbaa !9
  %call6 = tail call i32 @rt_errormsg_s(i32 noundef 1, ptr noundef nonnull @.str.5, ptr noundef %22) #23
  tail call void @exit(i32 noundef 1) #22
  unreachable

reducerror.exit:                                  ; preds = %if.then36, %for.end
  ret i32 0
}

; Function Attrs: nofree norecurse nosync nounwind memory(argmem: read) uwtable
define dso_local i32 @strindex(ptr nocapture noundef readonly %s, ptr nocapture noundef readonly %t) local_unnamed_addr #6 {
entry:
  %0 = load i8, ptr %s, align 1, !tbaa !11
  %cmp.not17 = icmp eq i8 %0, 0
  br i1 %cmp.not17, label %cleanup, label %for.cond2.preheader.lr.ph

for.cond2.preheader.lr.ph:                        ; preds = %entry
  %1 = load i8, ptr %t, align 1, !tbaa !11
  %cmp6.not14 = icmp eq i8 %1, 0
  br i1 %cmp6.not14, label %cleanup, label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.cond2.preheader.lr.ph, %for.inc25
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %for.inc25 ], [ 0, %for.cond2.preheader.lr.ph ]
  br label %land.rhs

land.rhs:                                         ; preds = %for.cond2.preheader, %for.inc
  %indvars.iv27 = phi i64 [ %indvars.iv25, %for.cond2.preheader ], [ %indvars.iv.next28, %for.inc ]
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next, %for.inc ]
  %2 = phi i8 [ %1, %for.cond2.preheader ], [ %4, %for.inc ]
  %arrayidx9 = getelementptr inbounds i8, ptr %s, i64 %indvars.iv27
  %3 = load i8, ptr %arrayidx9, align 1, !tbaa !11
  %cmp14 = icmp eq i8 %3, %2
  br i1 %cmp14, label %for.inc, label %for.inc25

for.inc:                                          ; preds = %land.rhs
  %indvars.iv.next28 = add nuw i64 %indvars.iv27, 1
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %arrayidx4 = getelementptr inbounds i8, ptr %t, i64 %indvars.iv.next
  %4 = load i8, ptr %arrayidx4, align 1, !tbaa !11
  %cmp6.not = icmp eq i8 %4, 0
  br i1 %cmp6.not, label %cleanup.loopexit22, label %land.rhs, !llvm.loop !17

for.inc25:                                        ; preds = %land.rhs
  %indvars.iv.next26 = add nuw i64 %indvars.iv25, 1
  %arrayidx = getelementptr inbounds i8, ptr %s, i64 %indvars.iv.next26
  %5 = load i8, ptr %arrayidx, align 1, !tbaa !11
  %cmp.not = icmp eq i8 %5, 0
  br i1 %cmp.not, label %cleanup, label %for.cond2.preheader, !llvm.loop !18

cleanup.loopexit22:                               ; preds = %for.inc
  %6 = trunc i64 %indvars.iv25 to i32
  br label %cleanup

cleanup:                                          ; preds = %for.inc25, %for.cond2.preheader.lr.ph, %cleanup.loopexit22, %entry
  %retval.0 = phi i32 [ -1, %entry ], [ %6, %cleanup.loopexit22 ], [ -1, %for.cond2.preheader.lr.ph ], [ -1, %for.inc25 ]
  ret i32 %retval.0
}

; Function Attrs: mustprogress nofree nounwind willreturn memory(argmem: read)
declare i32 @strcmp(ptr nocapture noundef, ptr nocapture noundef) local_unnamed_addr #7

; Function Attrs: nofree nounwind
declare noalias noundef ptr @fopen(ptr nocapture noundef readonly, ptr nocapture noundef readonly) local_unnamed_addr #8

; Function Attrs: nofree nounwind
declare noundef i32 @fprintf(ptr nocapture noundef, ptr nocapture noundef readonly, ...) local_unnamed_addr #8

declare ptr @ggets(ptr noundef, i32 noundef, ptr noundef) local_unnamed_addr #9

; Function Attrs: nofree nounwind
declare noundef i32 @__isoc99_sscanf(ptr nocapture noundef readonly, ptr nocapture noundef readonly, ...) local_unnamed_addr #8

; Function Attrs: mustprogress nofree nounwind willreturn memory(argmem: readwrite)
declare ptr @strncpy(ptr noalias noundef returned writeonly, ptr noalias nocapture noundef readonly, i64 noundef) local_unnamed_addr #10

; Function Attrs: nofree nounwind
declare noundef i32 @fclose(ptr nocapture noundef) local_unnamed_addr #8

declare i32 @rt_errormsg_s(i32 noundef, ptr noundef, ptr noundef) local_unnamed_addr #9

; Function Attrs: nounwind uwtable
define dso_local i32 @getxv(ptr nocapture noundef readonly %fname, ptr noundef %natom, ptr noundef %start_time, ptr nocapture noundef writeonly %x, ptr nocapture noundef writeonly %v) local_unnamed_addr #2 {
entry:
  %line = alloca [82 x i8], align 16
  %field = alloca [13 x i8], align 1
  call void @llvm.lifetime.start.p0(i64 82, ptr nonnull %line) #23
  call void @llvm.lifetime.start.p0(i64 13, ptr nonnull %field) #23
  %0 = load ptr, ptr %fname, align 8, !tbaa !9
  %tobool.not = icmp eq ptr %0, null
  br i1 %tobool.not, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i8, ptr %0, align 1, !tbaa !11
  %tobool1.not = icmp eq i8 %1, 0
  br i1 %tobool1.not, label %if.then, label %if.else

if.then:                                          ; preds = %lor.lhs.false, %entry
  %2 = load ptr, ptr @stdin, align 8, !tbaa !9
  br label %if.end18

if.else:                                          ; preds = %lor.lhs.false
  %call = tail call i32 @strcmp(ptr noundef nonnull dereferenceable(1) %0, ptr noundef nonnull dereferenceable(2) @.str) #24
  %tobool2.not = icmp eq i32 %call, 0
  br i1 %tobool2.not, label %if.then3, label %if.else4

if.then3:                                         ; preds = %if.else
  %3 = load ptr, ptr @stdin, align 8, !tbaa !9
  br label %if.end18

if.else4:                                         ; preds = %if.else
  %call7 = tail call noalias ptr @fopen(ptr noundef nonnull %0, ptr noundef nonnull @.str.1)
  %cmp8 = icmp eq ptr %call7, null
  br i1 %cmp8, label %if.then.i.i, label %if.end18

if.then.i.i:                                      ; preds = %if.else4
  %4 = load ptr, ptr @stderr, align 8, !tbaa !9
  %5 = load ptr, ptr %fname, align 8, !tbaa !9
  %call10 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %4, ptr noundef nonnull @.str.9, ptr noundef %5) #25
  tail call void @exit(i32 noundef 1) #22
  unreachable

if.end18:                                         ; preds = %if.else4, %if.then3, %if.then
  %fp.1 = phi ptr [ %3, %if.then3 ], [ %2, %if.then ], [ %call7, %if.else4 ]
  %call19 = call ptr @ggets(ptr noundef nonnull %line, i32 noundef 82, ptr noundef %fp.1) #23
  %call21 = call ptr @ggets(ptr noundef nonnull %line, i32 noundef 82, ptr noundef %fp.1) #23
  store double 0.000000e+00, ptr %start_time, align 8, !tbaa !12
  %call23 = call i32 (ptr, ptr, ...) @__isoc99_sscanf(ptr noundef nonnull %line, ptr noundef nonnull @.str.10, ptr noundef %natom, ptr noundef nonnull %start_time) #23
  %call25 = call ptr @ggets(ptr noundef nonnull %line, i32 noundef 82, ptr noundef %fp.1) #23
  %6 = load i32, ptr %natom, align 4, !tbaa !5
  %cmp2636 = icmp sgt i32 %6, 0
  br i1 %cmp2636, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %if.end18
  %arrayidx = getelementptr inbounds [13 x i8], ptr %field, i64 0, i64 12
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %for.inc
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %for.inc ]
  %7 = trunc i64 %indvars.iv to i32
  %rem = urem i32 %7, 6
  %mul29 = mul nuw nsw i32 %rem, 12
  %idx.ext = zext i32 %mul29 to i64
  %add.ptr = getelementptr inbounds i8, ptr %line, i64 %idx.ext
  %call30 = call ptr @strncpy(ptr noundef nonnull dereferenceable(1) %field, ptr noundef nonnull dereferenceable(1) %add.ptr, i64 noundef 12) #23
  store i8 0, ptr %arrayidx, align 1, !tbaa !11
  %call.i = call double @strtod(ptr nocapture noundef nonnull %field, ptr noundef null) #23
  %arrayidx33 = getelementptr inbounds double, ptr %x, i64 %indvars.iv
  store double %call.i, ptr %arrayidx33, align 8, !tbaa !12
  %cmp35 = icmp eq i32 %rem, 5
  br i1 %cmp35, label %land.lhs.true, label %for.inc

land.lhs.true:                                    ; preds = %for.body
  %8 = load i32, ptr %natom, align 4, !tbaa !5
  %mul36 = mul nsw i32 %8, 3
  %sub = add nsw i32 %mul36, -1
  %9 = sext i32 %sub to i64
  %cmp37 = icmp slt i64 %indvars.iv, %9
  br i1 %cmp37, label %if.then38, label %for.inc

if.then38:                                        ; preds = %land.lhs.true
  %call40 = call ptr @ggets(ptr noundef nonnull %line, i32 noundef 82, ptr noundef %fp.1) #23
  br label %for.inc

for.inc:                                          ; preds = %for.body, %land.lhs.true, %if.then38
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %10 = load i32, ptr %natom, align 4, !tbaa !5
  %mul = mul nsw i32 %10, 3
  %11 = sext i32 %mul to i64
  %cmp26 = icmp slt i64 %indvars.iv.next, %11
  br i1 %cmp26, label %for.body, label %for.end, !llvm.loop !19

for.end:                                          ; preds = %for.inc, %if.end18
  %call43 = call ptr @ggets(ptr noundef nonnull %line, i32 noundef 82, ptr noundef %fp.1) #23
  %tobool44.not = icmp eq ptr %call43, null
  %12 = load i32, ptr %natom, align 4, !tbaa !5
  %cmp7442 = icmp sgt i32 %12, 0
  br i1 %tobool44.not, label %for.cond72.preheader, label %for.cond46.preheader

for.cond46.preheader:                             ; preds = %for.end
  br i1 %cmp7442, label %for.body49.lr.ph, label %if.end82

for.body49.lr.ph:                                 ; preds = %for.cond46.preheader
  %arrayidx57 = getelementptr inbounds [13 x i8], ptr %field, i64 0, i64 12
  br label %for.body49

for.cond72.preheader:                             ; preds = %for.end
  br i1 %cmp7442, label %for.body75, label %for.end80

for.body49:                                       ; preds = %for.body49.lr.ph, %for.inc68
  %indvars.iv45 = phi i64 [ 0, %for.body49.lr.ph ], [ %indvars.iv.next46, %for.inc68 ]
  %13 = trunc i64 %indvars.iv45 to i32
  %rem52 = urem i32 %13, 6
  %mul53 = mul nuw nsw i32 %rem52, 12
  %idx.ext54 = zext i32 %mul53 to i64
  %add.ptr55 = getelementptr inbounds i8, ptr %line, i64 %idx.ext54
  %call56 = call ptr @strncpy(ptr noundef nonnull dereferenceable(1) %field, ptr noundef nonnull dereferenceable(1) %add.ptr55, i64 noundef 12) #23
  store i8 0, ptr %arrayidx57, align 1, !tbaa !11
  %call.i31 = call double @strtod(ptr nocapture noundef nonnull %field, ptr noundef null) #23
  %arrayidx61 = getelementptr inbounds double, ptr %v, i64 %indvars.iv45
  store double %call.i31, ptr %arrayidx61, align 8, !tbaa !12
  %cmp63 = icmp eq i32 %rem52, 5
  br i1 %cmp63, label %if.then64, label %for.inc68

if.then64:                                        ; preds = %for.body49
  %call66 = call ptr @ggets(ptr noundef nonnull %line, i32 noundef 82, ptr noundef %fp.1) #23
  br label %for.inc68

for.inc68:                                        ; preds = %for.body49, %if.then64
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %14 = load i32, ptr %natom, align 4, !tbaa !5
  %mul47 = mul nsw i32 %14, 3
  %15 = sext i32 %mul47 to i64
  %cmp48 = icmp slt i64 %indvars.iv.next46, %15
  br i1 %cmp48, label %for.body49, label %if.end82, !llvm.loop !20

for.body75:                                       ; preds = %for.cond72.preheader, %for.body75
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %for.body75 ], [ 0, %for.cond72.preheader ]
  %arrayidx77 = getelementptr inbounds double, ptr %v, i64 %indvars.iv48
  store double 0.000000e+00, ptr %arrayidx77, align 8, !tbaa !12
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %16 = load i32, ptr %natom, align 4, !tbaa !5
  %mul73 = mul nsw i32 %16, 3
  %17 = sext i32 %mul73 to i64
  %cmp74 = icmp slt i64 %indvars.iv.next49, %17
  br i1 %cmp74, label %for.body75, label %for.end80, !llvm.loop !21

for.end80:                                        ; preds = %for.body75, %for.cond72.preheader
  %18 = load ptr, ptr @nabout, align 8, !tbaa !9
  %19 = call i64 @fwrite(ptr nonnull @.str.11, i64 25, i64 1, ptr %18)
  br label %if.end82

if.end82:                                         ; preds = %for.inc68, %for.cond46.preheader, %for.end80
  %20 = load ptr, ptr @stdin, align 8, !tbaa !9
  %cmp83.not = icmp eq ptr %fp.1, %20
  br i1 %cmp83.not, label %if.end90, label %if.then84

if.then84:                                        ; preds = %if.end82
  %call88 = call i32 @fclose(ptr noundef %fp.1)
  br label %if.end90

if.end90:                                         ; preds = %if.then84, %if.end82
  call void @llvm.lifetime.end.p0(i64 13, ptr nonnull %field) #23
  call void @llvm.lifetime.end.p0(i64 82, ptr nonnull %line) #23
  ret i32 0
}

; Function Attrs: nounwind uwtable
define dso_local i32 @putxv(ptr nocapture noundef readonly %fname, ptr nocapture noundef readonly %title, ptr nocapture noundef readonly %natom, ptr nocapture noundef readonly %start_time, ptr nocapture noundef readonly %x, ptr nocapture noundef readonly %v) local_unnamed_addr #2 {
entry:
  %0 = load ptr, ptr %fname, align 8, !tbaa !9
  %call1 = tail call i32 @strcmp(ptr noundef nonnull dereferenceable(1) %0, ptr noundef nonnull dereferenceable(2) @.str) #24
  %tobool.not = icmp eq i32 %call1, 0
  br i1 %tobool.not, label %if.then2, label %if.else

if.then2:                                         ; preds = %entry
  %1 = load ptr, ptr @stdout, align 8, !tbaa !9
  br label %if.then9

if.else:                                          ; preds = %entry
  %call3 = tail call noalias ptr @fopen(ptr noundef %0, ptr noundef nonnull @.str.4)
  %cmp4 = icmp eq ptr %call3, null
  br i1 %cmp4, label %if.then.i.i, label %if.then9

if.then9:                                         ; preds = %if.else, %if.then2
  %fp.0.ph = phi ptr [ %1, %if.then2 ], [ %call3, %if.else ]
  %2 = load ptr, ptr %title, align 8, !tbaa !9
  %call10 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %fp.0.ph, ptr noundef nonnull @.str.12, ptr noundef %2)
  %3 = load i32, ptr %natom, align 4, !tbaa !5
  %4 = load double, ptr %start_time, align 8, !tbaa !12
  %call11 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %fp.0.ph, ptr noundef nonnull @.str.13, i32 noundef %3, double noundef %4)
  %5 = load i32, ptr %natom, align 4, !tbaa !5
  %cmp1260 = icmp sgt i32 %5, 0
  br i1 %cmp1260, label %for.body.preheader, label %for.end83

for.body.preheader:                               ; preds = %if.then9
  %mul59 = mul nsw i32 %5, 3
  br label %for.body

for.cond44.preheader:                             ; preds = %for.inc
  %cmp4664 = icmp sgt i32 %18, 0
  br i1 %cmp4664, label %for.body47, label %for.end83

for.body:                                         ; preds = %for.body.preheader, %for.inc
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 0, %for.body.preheader ]
  %mul62 = phi i32 [ %mul, %for.inc ], [ %mul59, %for.body.preheader ]
  %6 = add nuw nsw i64 %indvars.iv, 3
  %7 = sext i32 %mul62 to i64
  %cmp14 = icmp slt i64 %6, %7
  %arrayidx = getelementptr inbounds double, ptr %x, i64 %indvars.iv
  %8 = load double, ptr %arrayidx, align 8, !tbaa !12
  %9 = or i64 %indvars.iv, 1
  %arrayidx18 = getelementptr inbounds double, ptr %x, i64 %9
  %10 = load double, ptr %arrayidx18, align 8, !tbaa !12
  %11 = add nuw nsw i64 %indvars.iv, 2
  %arrayidx21 = getelementptr inbounds double, ptr %x, i64 %11
  %12 = load double, ptr %arrayidx21, align 8, !tbaa !12
  br i1 %cmp14, label %if.then15, label %if.else32

if.then15:                                        ; preds = %for.body
  %arrayidx24 = getelementptr inbounds double, ptr %x, i64 %6
  %13 = load double, ptr %arrayidx24, align 8, !tbaa !12
  %14 = add nuw nsw i64 %indvars.iv, 4
  %arrayidx27 = getelementptr inbounds double, ptr %x, i64 %14
  %15 = load double, ptr %arrayidx27, align 8, !tbaa !12
  %16 = add nuw nsw i64 %indvars.iv, 5
  %arrayidx30 = getelementptr inbounds double, ptr %x, i64 %16
  %17 = load double, ptr %arrayidx30, align 8, !tbaa !12
  %call31 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %fp.0.ph, ptr noundef nonnull @.str.14, double noundef %8, double noundef %10, double noundef %12, double noundef %13, double noundef %15, double noundef %17)
  br label %for.inc

if.else32:                                        ; preds = %for.body
  %call41 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %fp.0.ph, ptr noundef nonnull @.str.15, double noundef %8, double noundef %10, double noundef %12)
  br label %for.inc

for.inc:                                          ; preds = %if.then15, %if.else32
  %indvars.iv.next = add nuw i64 %indvars.iv, 6
  %18 = load i32, ptr %natom, align 4, !tbaa !5
  %mul = mul nsw i32 %18, 3
  %19 = trunc i64 %indvars.iv.next to i32
  %cmp12 = icmp sgt i32 %mul, %19
  br i1 %cmp12, label %for.body, label %for.cond44.preheader, !llvm.loop !22

for.body47:                                       ; preds = %for.cond44.preheader, %for.inc81
  %indvars.iv75 = phi i64 [ %indvars.iv.next76, %for.inc81 ], [ 0, %for.cond44.preheader ]
  %mul4566 = phi i32 [ %mul45, %for.inc81 ], [ %mul, %for.cond44.preheader ]
  %20 = add nuw nsw i64 %indvars.iv75, 3
  %21 = sext i32 %mul4566 to i64
  %cmp50 = icmp slt i64 %20, %21
  %arrayidx53 = getelementptr inbounds double, ptr %v, i64 %indvars.iv75
  %22 = load double, ptr %arrayidx53, align 8, !tbaa !12
  %23 = or i64 %indvars.iv75, 1
  %arrayidx56 = getelementptr inbounds double, ptr %v, i64 %23
  %24 = load double, ptr %arrayidx56, align 8, !tbaa !12
  %25 = add nuw nsw i64 %indvars.iv75, 2
  %arrayidx59 = getelementptr inbounds double, ptr %v, i64 %25
  %26 = load double, ptr %arrayidx59, align 8, !tbaa !12
  br i1 %cmp50, label %if.then51, label %if.else70

if.then51:                                        ; preds = %for.body47
  %arrayidx62 = getelementptr inbounds double, ptr %v, i64 %20
  %27 = load double, ptr %arrayidx62, align 8, !tbaa !12
  %28 = add nuw nsw i64 %indvars.iv75, 4
  %arrayidx65 = getelementptr inbounds double, ptr %v, i64 %28
  %29 = load double, ptr %arrayidx65, align 8, !tbaa !12
  %30 = add nuw nsw i64 %indvars.iv75, 5
  %arrayidx68 = getelementptr inbounds double, ptr %v, i64 %30
  %31 = load double, ptr %arrayidx68, align 8, !tbaa !12
  %call69 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %fp.0.ph, ptr noundef nonnull @.str.14, double noundef %22, double noundef %24, double noundef %26, double noundef %27, double noundef %29, double noundef %31)
  br label %for.inc81

if.else70:                                        ; preds = %for.body47
  %call79 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %fp.0.ph, ptr noundef nonnull @.str.15, double noundef %22, double noundef %24, double noundef %26)
  br label %for.inc81

for.inc81:                                        ; preds = %if.then51, %if.else70
  %indvars.iv.next76 = add nuw i64 %indvars.iv75, 6
  %32 = load i32, ptr %natom, align 4, !tbaa !5
  %mul45 = mul nsw i32 %32, 3
  %33 = trunc i64 %indvars.iv.next76 to i32
  %cmp46 = icmp sgt i32 %mul45, %33
  br i1 %cmp46, label %for.body47, label %for.end83, !llvm.loop !23

for.end83:                                        ; preds = %for.inc81, %if.then9, %for.cond44.preheader
  %34 = load ptr, ptr @stdout, align 8, !tbaa !9
  %cmp84.not = icmp eq ptr %fp.0.ph, %34
  br i1 %cmp84.not, label %reducerror.exit, label %if.then85

if.then85:                                        ; preds = %for.end83
  %call86 = tail call i32 @fclose(ptr noundef %fp.0.ph)
  br label %reducerror.exit

if.then.i.i:                                      ; preds = %if.else
  %35 = load ptr, ptr %fname, align 8, !tbaa !9
  %call6 = tail call i32 @rt_errormsg_s(i32 noundef 1, ptr noundef nonnull @.str.5, ptr noundef %35) #23
  tail call void @exit(i32 noundef 1) #22
  unreachable

reducerror.exit:                                  ; preds = %if.then85, %for.end83
  ret i32 0
}

; Function Attrs: nounwind uwtable
define dso_local void @checkpoint(ptr nocapture noundef readonly %fname, i32 noundef %natom, ptr nocapture noundef readonly %x, i32 noundef %iter) local_unnamed_addr #2 {
entry:
  %natom.addr = alloca i32, align 4
  %filename = alloca ptr, align 8
  store i32 %natom, ptr %natom.addr, align 4, !tbaa !5
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %filename) #23
  %cmp = icmp slt i32 %iter, 0
  br i1 %cmp, label %cleanup, label %do.body

do.body:                                          ; preds = %entry, %do.body
  %j.0 = phi i32 [ %inc, %do.body ], [ 0, %entry ]
  %i.0 = phi i32 [ %div, %do.body ], [ %iter, %entry ]
  %inc = add nuw nsw i32 %j.0, 1
  %div = udiv i32 %i.0, 10
  %cmp1.not = icmp ult i32 %i.0, 10
  br i1 %cmp1.not, label %do.end, label %do.body, !llvm.loop !24

do.end:                                           ; preds = %do.body
  %add = add nuw nsw i32 %j.0, 2
  %conv = zext i32 %add to i64
  %call = tail call noalias ptr @malloc(i64 noundef %conv) #26
  %call2 = tail call i32 (ptr, ptr, ...) @sprintf(ptr noundef nonnull dereferenceable(1) %call, ptr noundef nonnull dereferenceable(1) @.str.3, i32 noundef %iter) #23
  %call3 = tail call i64 @strlen(ptr noundef nonnull dereferenceable(1) %fname) #24
  %conv4 = trunc i64 %call3 to i32
  %0 = load i8, ptr %fname, align 1, !tbaa !11
  %cmp.not17.i = icmp eq i8 %0, 0
  br i1 %cmp.not17.i, label %if.then8, label %for.cond2.preheader.i

for.cond2.preheader.i:                            ; preds = %do.end, %for.inc25.i
  %1 = phi i8 [ %2, %for.inc25.i ], [ %0, %do.end ]
  %indvars.iv25.i = phi i64 [ %indvars.iv.next28.i, %for.inc25.i ], [ 0, %do.end ]
  %cmp14.i = icmp eq i8 %1, 37
  %indvars.iv.next28.i = add nuw i64 %indvars.iv25.i, 1
  %arrayidx9.i.1 = getelementptr inbounds i8, ptr %fname, i64 %indvars.iv.next28.i
  %2 = load i8, ptr %arrayidx9.i.1, align 1, !tbaa !11
  %cmp14.i.1 = icmp eq i8 %2, 100
  %or.cond = select i1 %cmp14.i, i1 %cmp14.i.1, i1 false
  br i1 %or.cond, label %for.inc.i.1, label %for.inc25.i

for.inc.i.1:                                      ; preds = %for.cond2.preheader.i
  %3 = trunc i64 %indvars.iv25.i to i32
  %cmp6 = icmp slt i32 %3, 0
  br i1 %cmp6, label %if.then8, label %if.else

for.inc25.i:                                      ; preds = %for.cond2.preheader.i
  %cmp.not.i = icmp eq i8 %2, 0
  br i1 %cmp.not.i, label %if.then8, label %for.cond2.preheader.i, !llvm.loop !18

if.then8:                                         ; preds = %for.inc25.i, %do.end, %for.inc.i.1
  %add9 = add nsw i32 %inc, %conv4
  %add10 = add nsw i32 %add9, 1
  %conv11 = sext i32 %add10 to i64
  %call12 = tail call noalias ptr @malloc(i64 noundef %conv11) #26
  store ptr %call12, ptr %filename, align 8, !tbaa !9
  %sext = shl i64 %call3, 32
  %conv13 = ashr exact i64 %sext, 32
  %call14 = tail call ptr @strncpy(ptr noundef %call12, ptr noundef nonnull %fname, i64 noundef %conv13) #23
  %arrayidx = getelementptr inbounds i8, ptr %call12, i64 %conv13
  %conv15 = zext i32 %inc to i64
  %call16 = tail call ptr @strncpy(ptr noundef nonnull dereferenceable(1) %arrayidx, ptr noundef nonnull dereferenceable(1) %call, i64 noundef %conv15) #23
  br label %if.end43

if.else:                                          ; preds = %for.inc.i.1
  %sub = add i32 %j.0, %conv4
  %conv21 = sext i32 %sub to i64
  %call22 = tail call noalias ptr @malloc(i64 noundef %conv21) #26
  store ptr %call22, ptr %filename, align 8, !tbaa !9
  %conv23 = and i64 %indvars.iv25.i, 4294967295
  %call24 = tail call ptr @strncpy(ptr noundef %call22, ptr noundef nonnull %fname, i64 noundef %conv23) #23
  %arrayidx26 = getelementptr inbounds i8, ptr %call22, i64 %conv23
  %conv27 = zext i32 %inc to i64
  %call28 = tail call ptr @strncpy(ptr noundef nonnull dereferenceable(1) %arrayidx26, ptr noundef nonnull dereferenceable(1) %call, i64 noundef %conv27) #23
  %add29 = add nsw i32 %inc, %3
  %idxprom30 = sext i32 %add29 to i64
  %arrayidx31 = getelementptr inbounds i8, ptr %call22, i64 %idxprom30
  %add32 = add i64 %indvars.iv25.i, 2
  %idxprom33 = and i64 %add32, 4294967295
  %arrayidx34 = getelementptr inbounds i8, ptr %fname, i64 %idxprom33
  %sub35 = sub i64 %call3, %indvars.iv25.i
  %sub36 = shl i64 %sub35, 32
  %sext32 = add i64 %sub36, -8589934592
  %conv37 = ashr exact i64 %sext32, 32
  %call38 = tail call ptr @strncpy(ptr noundef %arrayidx31, ptr noundef nonnull %arrayidx34, i64 noundef %conv37) #23
  %add20 = add nsw i32 %j.0, -1
  %sub40 = add i32 %add20, %conv4
  br label %if.end43

if.end43:                                         ; preds = %if.else, %if.then8
  %sub40.sink = phi i32 [ %sub40, %if.else ], [ %add9, %if.then8 ]
  %call22.sink = phi ptr [ %call22, %if.else ], [ %call12, %if.then8 ]
  %idxprom41 = sext i32 %sub40.sink to i64
  %arrayidx42 = getelementptr inbounds i8, ptr %call22.sink, i64 %idxprom41
  store i8 0, ptr %arrayidx42, align 1, !tbaa !11
  %.b.i = load i1, ptr @dim, align 4
  %4 = select i1 %.b.i, i32 4, i32 3
  %call.i = call i32 @putxyzw(ptr noundef nonnull %filename, ptr noundef nonnull %natom.addr, ptr noundef %x, i32 noundef %4)
  tail call void @free(ptr noundef nonnull %call22.sink) #23
  tail call void @free(ptr noundef %call) #23
  br label %cleanup

cleanup:                                          ; preds = %entry, %if.end43
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %filename) #23
  ret void
}

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite)
declare noalias noundef ptr @malloc(i64 noundef) local_unnamed_addr #11

; Function Attrs: nofree nounwind
declare noundef i32 @sprintf(ptr noalias nocapture noundef writeonly, ptr nocapture noundef readonly, ...) local_unnamed_addr #8

; Function Attrs: mustprogress nofree nounwind willreturn memory(argmem: read)
declare i64 @strlen(ptr nocapture noundef) local_unnamed_addr #7

; Function Attrs: mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite)
declare void @free(ptr allocptr nocapture noundef) local_unnamed_addr #12

; Function Attrs: nofree nounwind uwtable
define dso_local i32 @mme_timer() local_unnamed_addr #13 {
entry:
  %0 = load ptr, ptr @nabout, align 8, !tbaa !9
  %1 = tail call i64 @fwrite(ptr nonnull @.str.16, i64 34, i64 1, ptr %0)
  %2 = load ptr, ptr @nabout, align 8, !tbaa !9
  %call1 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %2, ptr noundef nonnull @.str.17, double noundef 0.000000e+00)
  %3 = load ptr, ptr @nabout, align 8, !tbaa !9
  %call2 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %3, ptr noundef nonnull @.str.18, double noundef 0.000000e+00)
  %4 = load ptr, ptr @nabout, align 8, !tbaa !9
  %call3 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %4, ptr noundef nonnull @.str.19, double noundef 0.000000e+00)
  %5 = load ptr, ptr @nabout, align 8, !tbaa !9
  %call4 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %5, ptr noundef nonnull @.str.20, double noundef 0.000000e+00)
  %6 = load ptr, ptr @nabout, align 8, !tbaa !9
  %call5 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %6, ptr noundef nonnull @.str.21, double noundef 0.000000e+00)
  %7 = load ptr, ptr @nabout, align 8, !tbaa !9
  %call6 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %7, ptr noundef nonnull @.str.22, double noundef 0.000000e+00)
  %8 = load ptr, ptr @nabout, align 8, !tbaa !9
  %call7 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %8, ptr noundef nonnull @.str.23, double noundef 0.000000e+00)
  %9 = load ptr, ptr @nabout, align 8, !tbaa !9
  %call8 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %9, ptr noundef nonnull @.str.24, double noundef 0.000000e+00)
  %10 = load ptr, ptr @nabout, align 8, !tbaa !9
  %call15 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %10, ptr noundef nonnull @.str.25, double noundef 0.000000e+00)
  %11 = load ptr, ptr @nabout, align 8, !tbaa !9
  %call16 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %11, ptr noundef nonnull @.str.26, double noundef 0.000000e+00)
  %12 = load ptr, ptr @nabout, align 8, !tbaa !9
  %call17 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %12, ptr noundef nonnull @.str.27, double noundef 0.000000e+00)
  %13 = load ptr, ptr @nabout, align 8, !tbaa !9
  %call18 = tail call i32 @fflush(ptr noundef %13)
  ret i32 0
}

; Function Attrs: nofree nounwind
declare noundef i32 @fflush(ptr nocapture noundef) local_unnamed_addr #8

; Function Attrs: nounwind uwtable
define dso_local i32 @mme_init(ptr noundef %m, ptr noundef %aexp, ptr noundef %aexp2, ptr noundef %x0i, ptr noundef %bfpi) local_unnamed_addr #2 {
entry:
  %i = alloca i32, align 4
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %i) #23
  store i1 false, ptr @dim, align 4
  %m_prm = getelementptr inbounds %struct.molecule_t, ptr %m, i64 0, i32 6
  %0 = load ptr, ptr %m_prm, align 8, !tbaa !25
  store ptr %0, ptr @prm, align 8, !tbaa !9
  store ptr %x0i, ptr @x0, align 8, !tbaa !9
  store ptr %bfpi, ptr @binposfp, align 8, !tbaa !9
  %1 = load ptr, ptr @frozen, align 8, !tbaa !9
  %2 = load ptr, ptr @prm, align 8, !tbaa !9
  %Natom623 = getelementptr inbounds %struct.parm, ptr %2, i64 0, i32 4
  %3 = load i32, ptr %Natom623, align 8, !tbaa !27
  tail call void @free_ivector(ptr noundef %1, i32 noundef 0, i32 noundef %3) #23
  %4 = load ptr, ptr @constrained, align 8, !tbaa !9
  %5 = load ptr, ptr @prm, align 8, !tbaa !9
  %Natom624 = getelementptr inbounds %struct.parm, ptr %5, i64 0, i32 4
  %6 = load i32, ptr %Natom624, align 8, !tbaa !27
  tail call void @free_ivector(ptr noundef %4, i32 noundef 0, i32 noundef %6) #23
  %7 = load ptr, ptr @prm, align 8, !tbaa !9
  %Natom625 = getelementptr inbounds %struct.parm, ptr %7, i64 0, i32 4
  %8 = load i32, ptr %Natom625, align 8, !tbaa !27
  %call626 = tail call ptr @ivector(i32 noundef 0, i32 noundef %8) #23
  store ptr %call626, ptr @frozen, align 8, !tbaa !9
  %9 = load ptr, ptr @prm, align 8, !tbaa !9
  %Natom627 = getelementptr inbounds %struct.parm, ptr %9, i64 0, i32 4
  %10 = load i32, ptr %Natom627, align 8, !tbaa !27
  %call628 = tail call ptr @ivector(i32 noundef 0, i32 noundef %10) #23
  store ptr %call628, ptr @constrained, align 8, !tbaa !9
  %11 = load ptr, ptr @binposfp, align 8, !tbaa !9
  %cmp629.not = icmp eq ptr %11, null
  br i1 %cmp629.not, label %if.end633, label %if.then631

if.then631:                                       ; preds = %entry
  %call632 = tail call i32 @writebinposhdr(ptr noundef nonnull %11) #23
  %.pre = load ptr, ptr @constrained, align 8, !tbaa !9
  br label %if.end633

if.end633:                                        ; preds = %if.then631, %entry
  %12 = phi ptr [ %.pre, %if.then631 ], [ %call628, %entry ]
  %call634 = tail call i32 @set_cons_mask(ptr noundef nonnull %m, ptr noundef %aexp2, ptr noundef %12) #23
  store i32 %call634, ptr @nconstrained, align 4, !tbaa !5
  %tobool.not = icmp eq i32 %call634, 0
  br i1 %tobool.not, label %if.end651, label %if.then635

if.then635:                                       ; preds = %if.end633
  %cmp636 = icmp eq ptr %aexp2, null
  %13 = load ptr, ptr @nabout, align 8, !tbaa !9
  br i1 %cmp636, label %if.then641, label %if.then647

if.then641:                                       ; preds = %if.then635
  %call642 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %13, ptr noundef nonnull @.str.52, i32 noundef %call634)
  br label %if.end651

if.then647:                                       ; preds = %if.then635
  %call648 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %13, ptr noundef nonnull @.str.53, i32 noundef %call634, ptr noundef nonnull %aexp2)
  br label %if.end651

if.end651:                                        ; preds = %if.then641, %if.then647, %if.end633
  %14 = load i32, ptr @gb, align 4, !tbaa !5
  switch i32 %14, label %if.end660 [
    i32 2, label %if.end660.sink.split
    i32 5, label %if.then658
  ]

if.then658:                                       ; preds = %if.end651
  br label %if.end660.sink.split

if.end660.sink.split:                             ; preds = %if.end651, %if.then658
  %.sink171 = phi double [ 1.000000e+00, %if.then658 ], [ 8.000000e-01, %if.end651 ]
  %.sink170 = phi double [ 8.000000e-01, %if.then658 ], [ 0.000000e+00, %if.end651 ]
  %.sink = phi double [ 4.850000e+00, %if.then658 ], [ 0x400745E353F7CED9, %if.end651 ]
  store double %.sink171, ptr @gbalpha, align 8, !tbaa !12
  store double %.sink170, ptr @gbbeta, align 8, !tbaa !12
  store double %.sink, ptr @gbgamma, align 8, !tbaa !12
  br label %if.end660

if.end660:                                        ; preds = %if.end660.sink.split, %if.end651
  %15 = load ptr, ptr @pairlistnp, align 8, !tbaa !9
  %cmp661.not = icmp eq ptr %15, null
  br i1 %cmp661.not, label %if.end673, label %for.cond664.preheader

for.cond664.preheader:                            ; preds = %if.end660
  %16 = load i32, ptr @mme_init.nold, align 4, !tbaa !5
  %cmp66585 = icmp sgt i32 %16, 0
  br i1 %cmp66585, label %for.body667, label %for.end672

for.body667:                                      ; preds = %for.cond664.preheader, %for.body667
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body667 ], [ 0, %for.cond664.preheader ]
  %17 = load ptr, ptr @pairlistnp, align 8, !tbaa !9
  %arrayidx669 = getelementptr inbounds ptr, ptr %17, i64 %indvars.iv
  %18 = load ptr, ptr %arrayidx669, align 8, !tbaa !9
  tail call void @free_ivector(ptr noundef %18, i32 noundef 0, i32 noundef 1) #23
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %19 = load i32, ptr @mme_init.nold, align 4, !tbaa !5
  %20 = sext i32 %19 to i64
  %cmp665 = icmp slt i64 %indvars.iv.next, %20
  br i1 %cmp665, label %for.body667, label %for.end672.loopexit, !llvm.loop !29

for.end672.loopexit:                              ; preds = %for.body667
  %.pre162 = load ptr, ptr @pairlistnp, align 8, !tbaa !9
  br label %for.end672

for.end672:                                       ; preds = %for.end672.loopexit, %for.cond664.preheader
  %21 = phi ptr [ %15, %for.cond664.preheader ], [ %.pre162, %for.end672.loopexit ]
  tail call void @free(ptr noundef %21) #23
  br label %if.end673

if.end673:                                        ; preds = %for.end672, %if.end660
  %22 = load ptr, ptr @upairsnp, align 8, !tbaa !9
  %23 = load ptr, ptr @prm, align 8, !tbaa !9
  %Natom674 = getelementptr inbounds %struct.parm, ptr %23, i64 0, i32 4
  %24 = load i32, ptr %Natom674, align 8, !tbaa !27
  tail call void @free_ivector(ptr noundef %22, i32 noundef 0, i32 noundef %24) #23
  %25 = load ptr, ptr @lpairsnp, align 8, !tbaa !9
  %26 = load ptr, ptr @prm, align 8, !tbaa !9
  %Natom675 = getelementptr inbounds %struct.parm, ptr %26, i64 0, i32 4
  %27 = load i32, ptr %Natom675, align 8, !tbaa !27
  tail call void @free_ivector(ptr noundef %25, i32 noundef 0, i32 noundef %27) #23
  %28 = load ptr, ptr @prm, align 8, !tbaa !9
  %Natom676 = getelementptr inbounds %struct.parm, ptr %28, i64 0, i32 4
  %29 = load i32, ptr %Natom676, align 8, !tbaa !27
  %call677 = tail call ptr @ivector(i32 noundef 0, i32 noundef %29) #23
  store ptr %call677, ptr @upairsnp, align 8, !tbaa !9
  %30 = load ptr, ptr @prm, align 8, !tbaa !9
  %Natom678 = getelementptr inbounds %struct.parm, ptr %30, i64 0, i32 4
  %31 = load i32, ptr %Natom678, align 8, !tbaa !27
  %call679 = tail call ptr @ivector(i32 noundef 0, i32 noundef %31) #23
  store ptr %call679, ptr @lpairsnp, align 8, !tbaa !9
  %32 = load ptr, ptr @prm, align 8, !tbaa !9
  %Natom680 = getelementptr inbounds %struct.parm, ptr %32, i64 0, i32 4
  %33 = load i32, ptr %Natom680, align 8, !tbaa !27
  %conv681 = sext i32 %33 to i64
  %mul682 = shl nsw i64 %conv681, 3
  %call683 = tail call noalias ptr @malloc(i64 noundef %mul682) #26
  store ptr %call683, ptr @pairlistnp, align 8, !tbaa !9
  %cmp684 = icmp eq ptr %call683, null
  br i1 %cmp684, label %if.then686, label %for.cond691.preheader

for.cond691.preheader:                            ; preds = %if.end673
  %cmp69387 = icmp sgt i32 %33, 0
  br i1 %cmp69387, label %for.body695.lr.ph, label %for.end704

for.body695.lr.ph:                                ; preds = %for.cond691.preheader
  %34 = load ptr, ptr @upairsnp, align 8, !tbaa !9
  br label %for.body695

if.then686:                                       ; preds = %if.end673
  %35 = load ptr, ptr @nabout, align 8, !tbaa !9
  %36 = tail call i64 @fwrite(ptr nonnull @.str.54, i64 47, i64 1, ptr %35)
  %37 = load ptr, ptr @nabout, align 8, !tbaa !9
  %call688 = tail call i32 @fflush(ptr noundef %37)
  tail call void @exit(i32 noundef 1) #22
  unreachable

for.body695:                                      ; preds = %for.body695.lr.ph, %for.body695
  %indvars.iv127 = phi i64 [ 0, %for.body695.lr.ph ], [ %indvars.iv.next128, %for.body695 ]
  %arrayidx697 = getelementptr inbounds ptr, ptr %call683, i64 %indvars.iv127
  store ptr null, ptr %arrayidx697, align 8, !tbaa !9
  %arrayidx699 = getelementptr inbounds i32, ptr %34, i64 %indvars.iv127
  store i32 0, ptr %arrayidx699, align 4, !tbaa !5
  %arrayidx701 = getelementptr inbounds i32, ptr %call679, i64 %indvars.iv127
  store i32 0, ptr %arrayidx701, align 4, !tbaa !5
  %indvars.iv.next128 = add nuw nsw i64 %indvars.iv127, 1
  %38 = load i32, ptr %Natom680, align 8, !tbaa !27
  %39 = sext i32 %38 to i64
  %cmp693 = icmp slt i64 %indvars.iv.next128, %39
  br i1 %cmp693, label %for.body695, label %for.end704.loopexit, !llvm.loop !30

for.end704.loopexit:                              ; preds = %for.body695
  %40 = trunc i64 %indvars.iv.next128 to i32
  br label %for.end704

for.end704:                                       ; preds = %for.end704.loopexit, %for.cond691.preheader
  %storemerge.lcssa = phi i32 [ 0, %for.cond691.preheader ], [ %40, %for.end704.loopexit ]
  store i32 %storemerge.lcssa, ptr %i, align 4, !tbaa !5
  %41 = load ptr, ptr @pairlist2np, align 8, !tbaa !9
  %cmp705.not = icmp eq ptr %41, null
  br i1 %cmp705.not, label %if.end717, label %for.cond708.preheader

for.cond708.preheader:                            ; preds = %for.end704
  %42 = load i32, ptr @mme_init.nold, align 4, !tbaa !5
  %cmp70990 = icmp sgt i32 %42, 0
  br i1 %cmp70990, label %for.body711, label %for.end716

for.body711:                                      ; preds = %for.cond708.preheader, %for.body711
  %indvars.iv130 = phi i64 [ %indvars.iv.next131, %for.body711 ], [ 0, %for.cond708.preheader ]
  %43 = load ptr, ptr @pairlist2np, align 8, !tbaa !9
  %arrayidx713 = getelementptr inbounds ptr, ptr %43, i64 %indvars.iv130
  %44 = load ptr, ptr %arrayidx713, align 8, !tbaa !9
  tail call void @free_ivector(ptr noundef %44, i32 noundef 0, i32 noundef 1) #23
  %indvars.iv.next131 = add nuw nsw i64 %indvars.iv130, 1
  %45 = load i32, ptr @mme_init.nold, align 4, !tbaa !5
  %46 = sext i32 %45 to i64
  %cmp709 = icmp slt i64 %indvars.iv.next131, %46
  br i1 %cmp709, label %for.body711, label %for.end716.loopexit, !llvm.loop !31

for.end716.loopexit:                              ; preds = %for.body711
  %47 = trunc i64 %indvars.iv.next131 to i32
  %.pre163 = load ptr, ptr @pairlist2np, align 8, !tbaa !9
  br label %for.end716

for.end716:                                       ; preds = %for.end716.loopexit, %for.cond708.preheader
  %48 = phi ptr [ %41, %for.cond708.preheader ], [ %.pre163, %for.end716.loopexit ]
  %storemerge78.lcssa = phi i32 [ 0, %for.cond708.preheader ], [ %47, %for.end716.loopexit ]
  store i32 %storemerge78.lcssa, ptr %i, align 4, !tbaa !5
  tail call void @free(ptr noundef %48) #23
  br label %if.end717

if.end717:                                        ; preds = %for.end716, %for.end704
  %49 = load ptr, ptr @upairs2np, align 8, !tbaa !9
  %50 = load ptr, ptr @prm, align 8, !tbaa !9
  %Natom718 = getelementptr inbounds %struct.parm, ptr %50, i64 0, i32 4
  %51 = load i32, ptr %Natom718, align 8, !tbaa !27
  tail call void @free_ivector(ptr noundef %49, i32 noundef 0, i32 noundef %51) #23
  %52 = load ptr, ptr @lpairs2np, align 8, !tbaa !9
  %53 = load ptr, ptr @prm, align 8, !tbaa !9
  %Natom719 = getelementptr inbounds %struct.parm, ptr %53, i64 0, i32 4
  %54 = load i32, ptr %Natom719, align 8, !tbaa !27
  tail call void @free_ivector(ptr noundef %52, i32 noundef 0, i32 noundef %54) #23
  %55 = load ptr, ptr @prm, align 8, !tbaa !9
  %Natom720 = getelementptr inbounds %struct.parm, ptr %55, i64 0, i32 4
  %56 = load i32, ptr %Natom720, align 8, !tbaa !27
  %call721 = tail call ptr @ivector(i32 noundef 0, i32 noundef %56) #23
  store ptr %call721, ptr @upairs2np, align 8, !tbaa !9
  %57 = load ptr, ptr @prm, align 8, !tbaa !9
  %Natom722 = getelementptr inbounds %struct.parm, ptr %57, i64 0, i32 4
  %58 = load i32, ptr %Natom722, align 8, !tbaa !27
  %call723 = tail call ptr @ivector(i32 noundef 0, i32 noundef %58) #23
  store ptr %call723, ptr @lpairs2np, align 8, !tbaa !9
  %59 = load ptr, ptr @prm, align 8, !tbaa !9
  %Natom724 = getelementptr inbounds %struct.parm, ptr %59, i64 0, i32 4
  %60 = load i32, ptr %Natom724, align 8, !tbaa !27
  %conv725 = sext i32 %60 to i64
  %mul726 = shl nsw i64 %conv725, 3
  %call727 = tail call noalias ptr @malloc(i64 noundef %mul726) #26
  store ptr %call727, ptr @pairlist2np, align 8, !tbaa !9
  %cmp728 = icmp eq ptr %call727, null
  br i1 %cmp728, label %if.then730, label %for.cond735.preheader

for.cond735.preheader:                            ; preds = %if.end717
  %cmp73793 = icmp sgt i32 %60, 0
  br i1 %cmp73793, label %for.body739.lr.ph, label %for.end748

for.body739.lr.ph:                                ; preds = %for.cond735.preheader
  %61 = load ptr, ptr @upairs2np, align 8, !tbaa !9
  br label %for.body739

if.then730:                                       ; preds = %if.end717
  %62 = load ptr, ptr @nabout, align 8, !tbaa !9
  %63 = tail call i64 @fwrite(ptr nonnull @.str.55, i64 48, i64 1, ptr %62)
  %64 = load ptr, ptr @nabout, align 8, !tbaa !9
  %call732 = tail call i32 @fflush(ptr noundef %64)
  tail call void @exit(i32 noundef 1) #22
  unreachable

for.body739:                                      ; preds = %for.body739.lr.ph, %for.body739
  %indvars.iv133 = phi i64 [ 0, %for.body739.lr.ph ], [ %indvars.iv.next134, %for.body739 ]
  %arrayidx741 = getelementptr inbounds ptr, ptr %call727, i64 %indvars.iv133
  store ptr null, ptr %arrayidx741, align 8, !tbaa !9
  %arrayidx743 = getelementptr inbounds i32, ptr %61, i64 %indvars.iv133
  store i32 0, ptr %arrayidx743, align 4, !tbaa !5
  %arrayidx745 = getelementptr inbounds i32, ptr %call723, i64 %indvars.iv133
  store i32 0, ptr %arrayidx745, align 4, !tbaa !5
  %indvars.iv.next134 = add nuw nsw i64 %indvars.iv133, 1
  %65 = load i32, ptr %Natom724, align 8, !tbaa !27
  %66 = sext i32 %65 to i64
  %cmp737 = icmp slt i64 %indvars.iv.next134, %66
  br i1 %cmp737, label %for.body739, label %for.end748, !llvm.loop !32

for.end748:                                       ; preds = %for.body739, %for.cond735.preheader
  %67 = load ptr, ptr @pairlist, align 8, !tbaa !9
  %cmp749.not = icmp eq ptr %67, null
  br i1 %cmp749.not, label %if.end761, label %for.cond752.preheader

for.cond752.preheader:                            ; preds = %for.end748
  %68 = load i32, ptr @mme_init.nold, align 4, !tbaa !5
  %cmp75396 = icmp sgt i32 %68, 0
  br i1 %cmp75396, label %for.body755, label %for.end760

for.body755:                                      ; preds = %for.cond752.preheader, %for.body755
  %indvars.iv136 = phi i64 [ %indvars.iv.next137, %for.body755 ], [ 0, %for.cond752.preheader ]
  %69 = load ptr, ptr @pairlist, align 8, !tbaa !9
  %arrayidx757 = getelementptr inbounds ptr, ptr %69, i64 %indvars.iv136
  %70 = load ptr, ptr %arrayidx757, align 8, !tbaa !9
  tail call void @free_ivector(ptr noundef %70, i32 noundef 0, i32 noundef 1) #23
  %indvars.iv.next137 = add nuw nsw i64 %indvars.iv136, 1
  %71 = load i32, ptr @mme_init.nold, align 4, !tbaa !5
  %72 = sext i32 %71 to i64
  %cmp753 = icmp slt i64 %indvars.iv.next137, %72
  br i1 %cmp753, label %for.body755, label %for.end760.loopexit, !llvm.loop !33

for.end760.loopexit:                              ; preds = %for.body755
  %73 = trunc i64 %indvars.iv.next137 to i32
  %.pre164 = load ptr, ptr @pairlist, align 8, !tbaa !9
  br label %for.end760

for.end760:                                       ; preds = %for.end760.loopexit, %for.cond752.preheader
  %74 = phi ptr [ %67, %for.cond752.preheader ], [ %.pre164, %for.end760.loopexit ]
  %storemerge77.lcssa = phi i32 [ 0, %for.cond752.preheader ], [ %73, %for.end760.loopexit ]
  store i32 %storemerge77.lcssa, ptr %i, align 4, !tbaa !5
  tail call void @free(ptr noundef %74) #23
  br label %if.end761

if.end761:                                        ; preds = %for.end760, %for.end748
  store i32 -1, ptr @nb_pairs, align 4, !tbaa !5
  %75 = load ptr, ptr @upairs, align 8, !tbaa !9
  %76 = load ptr, ptr @prm, align 8, !tbaa !9
  %Natom762 = getelementptr inbounds %struct.parm, ptr %76, i64 0, i32 4
  %77 = load i32, ptr %Natom762, align 8, !tbaa !27
  tail call void @free_ivector(ptr noundef %75, i32 noundef 0, i32 noundef %77) #23
  %78 = load ptr, ptr @lpairs, align 8, !tbaa !9
  %79 = load ptr, ptr @prm, align 8, !tbaa !9
  %Natom763 = getelementptr inbounds %struct.parm, ptr %79, i64 0, i32 4
  %80 = load i32, ptr %Natom763, align 8, !tbaa !27
  tail call void @free_ivector(ptr noundef %78, i32 noundef 0, i32 noundef %80) #23
  %81 = load ptr, ptr @prm, align 8, !tbaa !9
  %Natom764 = getelementptr inbounds %struct.parm, ptr %81, i64 0, i32 4
  %82 = load i32, ptr %Natom764, align 8, !tbaa !27
  %call765 = tail call ptr @ivector(i32 noundef 0, i32 noundef %82) #23
  store ptr %call765, ptr @upairs, align 8, !tbaa !9
  %83 = load ptr, ptr @prm, align 8, !tbaa !9
  %Natom766 = getelementptr inbounds %struct.parm, ptr %83, i64 0, i32 4
  %84 = load i32, ptr %Natom766, align 8, !tbaa !27
  %call767 = tail call ptr @ivector(i32 noundef 0, i32 noundef %84) #23
  store ptr %call767, ptr @lpairs, align 8, !tbaa !9
  %85 = load ptr, ptr @prm, align 8, !tbaa !9
  %Natom768 = getelementptr inbounds %struct.parm, ptr %85, i64 0, i32 4
  %86 = load i32, ptr %Natom768, align 8, !tbaa !27
  %conv769 = sext i32 %86 to i64
  %mul770 = shl nsw i64 %conv769, 3
  %call771 = tail call noalias ptr @malloc(i64 noundef %mul770) #26
  store ptr %call771, ptr @pairlist, align 8, !tbaa !9
  %cmp772 = icmp eq ptr %call771, null
  br i1 %cmp772, label %if.then774, label %for.cond779.preheader

for.cond779.preheader:                            ; preds = %if.end761
  %cmp78199 = icmp sgt i32 %86, 0
  br i1 %cmp78199, label %for.body783.lr.ph, label %for.end792

for.body783.lr.ph:                                ; preds = %for.cond779.preheader
  %87 = load ptr, ptr @upairs, align 8, !tbaa !9
  br label %for.body783

if.then774:                                       ; preds = %if.end761
  %88 = load ptr, ptr @nabout, align 8, !tbaa !9
  %89 = tail call i64 @fwrite(ptr nonnull @.str.56, i64 45, i64 1, ptr %88)
  %90 = load ptr, ptr @nabout, align 8, !tbaa !9
  %call776 = tail call i32 @fflush(ptr noundef %90)
  tail call void @exit(i32 noundef 1) #22
  unreachable

for.body783:                                      ; preds = %for.body783.lr.ph, %for.body783
  %indvars.iv139 = phi i64 [ 0, %for.body783.lr.ph ], [ %indvars.iv.next140, %for.body783 ]
  %arrayidx785 = getelementptr inbounds ptr, ptr %call771, i64 %indvars.iv139
  store ptr null, ptr %arrayidx785, align 8, !tbaa !9
  %arrayidx787 = getelementptr inbounds i32, ptr %87, i64 %indvars.iv139
  store i32 0, ptr %arrayidx787, align 4, !tbaa !5
  %arrayidx789 = getelementptr inbounds i32, ptr %call767, i64 %indvars.iv139
  store i32 0, ptr %arrayidx789, align 4, !tbaa !5
  %indvars.iv.next140 = add nuw nsw i64 %indvars.iv139, 1
  %91 = load i32, ptr %Natom768, align 8, !tbaa !27
  %92 = sext i32 %91 to i64
  %cmp781 = icmp slt i64 %indvars.iv.next140, %92
  br i1 %cmp781, label %for.body783, label %for.end792, !llvm.loop !34

for.end792:                                       ; preds = %for.body783, %for.cond779.preheader
  %93 = load ptr, ptr @frozen, align 8, !tbaa !9
  %call793 = tail call i32 @set_belly_mask(ptr noundef %m, ptr noundef %aexp, ptr noundef %93) #23
  store i32 %call793, ptr @nfrozen, align 4, !tbaa !5
  %tobool794.not = icmp eq i32 %call793, 0
  br i1 %tobool794.not, label %if.end801, label %if.then798

if.then798:                                       ; preds = %for.end792
  %94 = load ptr, ptr @nabout, align 8, !tbaa !9
  %call799 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %94, ptr noundef nonnull @.str.57, i32 noundef %call793, ptr noundef %aexp)
  br label %if.end801

if.end801:                                        ; preds = %if.then798, %for.end792
  %95 = load ptr, ptr @N14pearlist, align 8, !tbaa !9
  %cmp802.not = icmp eq ptr %95, null
  br i1 %cmp802.not, label %if.end814, label %for.cond805.preheader

for.cond805.preheader:                            ; preds = %if.end801
  %96 = load i32, ptr @mme_init.nold, align 4, !tbaa !5
  %cmp806102 = icmp sgt i32 %96, 0
  br i1 %cmp806102, label %for.body808, label %for.end813

for.body808:                                      ; preds = %for.cond805.preheader, %for.body808
  %indvars.iv142 = phi i64 [ %indvars.iv.next143, %for.body808 ], [ 0, %for.cond805.preheader ]
  %97 = load ptr, ptr @N14pearlist, align 8, !tbaa !9
  %arrayidx810 = getelementptr inbounds ptr, ptr %97, i64 %indvars.iv142
  %98 = load ptr, ptr %arrayidx810, align 8, !tbaa !9
  tail call void @free_ivector(ptr noundef %98, i32 noundef 0, i32 noundef 1) #23
  %indvars.iv.next143 = add nuw nsw i64 %indvars.iv142, 1
  %99 = load i32, ptr @mme_init.nold, align 4, !tbaa !5
  %100 = sext i32 %99 to i64
  %cmp806 = icmp slt i64 %indvars.iv.next143, %100
  br i1 %cmp806, label %for.body808, label %for.end813.loopexit, !llvm.loop !35

for.end813.loopexit:                              ; preds = %for.body808
  %101 = trunc i64 %indvars.iv.next143 to i32
  %.pre165 = load ptr, ptr @N14pearlist, align 8, !tbaa !9
  br label %for.end813

for.end813:                                       ; preds = %for.end813.loopexit, %for.cond805.preheader
  %102 = phi ptr [ %95, %for.cond805.preheader ], [ %.pre165, %for.end813.loopexit ]
  %storemerge76.lcssa = phi i32 [ 0, %for.cond805.preheader ], [ %101, %for.end813.loopexit ]
  store i32 %storemerge76.lcssa, ptr %i, align 4, !tbaa !5
  tail call void @free(ptr noundef %102) #23
  br label %if.end814

if.end814:                                        ; preds = %for.end813, %if.end801
  %103 = load ptr, ptr @prm, align 8, !tbaa !9
  %Natom815 = getelementptr inbounds %struct.parm, ptr %103, i64 0, i32 4
  %104 = load i32, ptr %Natom815, align 8, !tbaa !27
  %conv816 = sext i32 %104 to i64
  %mul817 = shl nsw i64 %conv816, 3
  %call818 = tail call noalias ptr @malloc(i64 noundef %mul817) #26
  store ptr %call818, ptr @N14pearlist, align 8, !tbaa !9
  %cmp819 = icmp eq ptr %call818, null
  br i1 %cmp819, label %if.then821, label %for.cond826.preheader

for.cond826.preheader:                            ; preds = %if.end814
  %105 = load ptr, ptr @prm, align 8, !tbaa !9
  %Natom827108 = getelementptr inbounds %struct.parm, ptr %105, i64 0, i32 4
  %106 = load i32, ptr %Natom827108, align 8, !tbaa !27
  %cmp828109 = icmp sgt i32 %106, 0
  br i1 %cmp828109, label %for.body830, label %for.end868

if.then821:                                       ; preds = %if.end814
  %107 = load ptr, ptr @nabout, align 8, !tbaa !9
  %108 = tail call i64 @fwrite(ptr nonnull @.str.58, i64 48, i64 1, ptr %107)
  %109 = load ptr, ptr @nabout, align 8, !tbaa !9
  %call823 = tail call i32 @fflush(ptr noundef %109)
  tail call void @exit(i32 noundef 1) #22
  unreachable

for.body830:                                      ; preds = %for.cond826.preheader, %for.inc866
  %110 = phi ptr [ %124, %for.inc866 ], [ %call818, %for.cond826.preheader ]
  %indvars.iv149 = phi i64 [ %indvars.iv.next150, %for.inc866 ], [ 0, %for.cond826.preheader ]
  %111 = phi ptr [ %125, %for.inc866 ], [ %105, %for.cond826.preheader ]
  %npairs.0111 = phi i32 [ %npairs.1, %for.inc866 ], [ 0, %for.cond826.preheader ]
  %arrayidx832 = getelementptr inbounds ptr, ptr %110, i64 %indvars.iv149
  store ptr null, ptr %arrayidx832, align 8, !tbaa !9
  %N14pairs = getelementptr inbounds %struct.parm, ptr %111, i64 0, i32 91
  %112 = load ptr, ptr %N14pairs, align 8, !tbaa !36
  %arrayidx834 = getelementptr inbounds i32, ptr %112, i64 %indvars.iv149
  %113 = load i32, ptr %arrayidx834, align 4, !tbaa !5
  %cmp835 = icmp sgt i32 %113, 0
  br i1 %cmp835, label %if.then837, label %for.inc866

if.then837:                                       ; preds = %for.body830
  %call841 = tail call ptr @ivector(i32 noundef 0, i32 noundef %113) #23
  %114 = load ptr, ptr @N14pearlist, align 8, !tbaa !9
  %arrayidx843 = getelementptr inbounds ptr, ptr %114, i64 %indvars.iv149
  store ptr %call841, ptr %arrayidx843, align 8, !tbaa !9
  %115 = load ptr, ptr @prm, align 8, !tbaa !9
  %N14pairs845 = getelementptr inbounds %struct.parm, ptr %115, i64 0, i32 91
  %116 = load ptr, ptr %N14pairs845, align 8, !tbaa !36
  %arrayidx847 = getelementptr inbounds i32, ptr %116, i64 %indvars.iv149
  %117 = load i32, ptr %arrayidx847, align 4, !tbaa !5
  %cmp848105 = icmp sgt i32 %117, 0
  br i1 %cmp848105, label %for.body850.lr.ph, label %for.end860

for.body850.lr.ph:                                ; preds = %if.then837
  %N14pairlist = getelementptr inbounds %struct.parm, ptr %115, i64 0, i32 92
  %118 = load ptr, ptr %N14pairlist, align 8, !tbaa !37
  %119 = sext i32 %npairs.0111 to i64
  br label %for.body850

for.body850:                                      ; preds = %for.body850.lr.ph, %for.body850
  %indvars.iv145 = phi i64 [ 0, %for.body850.lr.ph ], [ %indvars.iv.next146, %for.body850 ]
  %120 = add nsw i64 %indvars.iv145, %119
  %arrayidx853 = getelementptr inbounds i32, ptr %118, i64 %120
  %121 = load i32, ptr %arrayidx853, align 4, !tbaa !5
  %arrayidx857 = getelementptr inbounds i32, ptr %call841, i64 %indvars.iv145
  store i32 %121, ptr %arrayidx857, align 4, !tbaa !5
  %indvars.iv.next146 = add nuw nsw i64 %indvars.iv145, 1
  %122 = load i32, ptr %arrayidx847, align 4, !tbaa !5
  %123 = sext i32 %122 to i64
  %cmp848 = icmp slt i64 %indvars.iv.next146, %123
  br i1 %cmp848, label %for.body850, label %for.end860, !llvm.loop !38

for.end860:                                       ; preds = %for.body850, %if.then837
  %.lcssa84 = phi i32 [ %117, %if.then837 ], [ %122, %for.body850 ]
  %add864 = add nsw i32 %.lcssa84, %npairs.0111
  br label %for.inc866

for.inc866:                                       ; preds = %for.body830, %for.end860
  %124 = phi ptr [ %114, %for.end860 ], [ %110, %for.body830 ]
  %npairs.1 = phi i32 [ %add864, %for.end860 ], [ %npairs.0111, %for.body830 ]
  %indvars.iv.next150 = add nuw nsw i64 %indvars.iv149, 1
  %125 = load ptr, ptr @prm, align 8, !tbaa !9
  %Natom827 = getelementptr inbounds %struct.parm, ptr %125, i64 0, i32 4
  %126 = load i32, ptr %Natom827, align 8, !tbaa !27
  %127 = sext i32 %126 to i64
  %cmp828 = icmp slt i64 %indvars.iv.next150, %127
  br i1 %cmp828, label %for.body830, label %for.end868, !llvm.loop !39

for.end868:                                       ; preds = %for.inc866, %for.cond826.preheader
  %128 = load ptr, ptr @IexclAt, align 8, !tbaa !9
  %cmp869.not = icmp eq ptr %128, null
  br i1 %cmp869.not, label %if.end881, label %for.cond872.preheader

for.cond872.preheader:                            ; preds = %for.end868
  %129 = load i32, ptr @mme_init.nold, align 4, !tbaa !5
  %cmp873113 = icmp sgt i32 %129, 0
  br i1 %cmp873113, label %for.body875, label %for.end880

for.body875:                                      ; preds = %for.cond872.preheader, %for.body875
  %indvars.iv152 = phi i64 [ %indvars.iv.next153, %for.body875 ], [ 0, %for.cond872.preheader ]
  %130 = load ptr, ptr @IexclAt, align 8, !tbaa !9
  %arrayidx877 = getelementptr inbounds ptr, ptr %130, i64 %indvars.iv152
  %131 = load ptr, ptr %arrayidx877, align 8, !tbaa !9
  tail call void @free_ivector(ptr noundef %131, i32 noundef 0, i32 noundef 1) #23
  %indvars.iv.next153 = add nuw nsw i64 %indvars.iv152, 1
  %132 = load i32, ptr @mme_init.nold, align 4, !tbaa !5
  %133 = sext i32 %132 to i64
  %cmp873 = icmp slt i64 %indvars.iv.next153, %133
  br i1 %cmp873, label %for.body875, label %for.end880, !llvm.loop !40

for.end880:                                       ; preds = %for.body875, %for.cond872.preheader
  %134 = load ptr, ptr @IexclAt, align 8, !tbaa !9
  tail call void @free(ptr noundef %134) #23
  br label %if.end881

if.end881:                                        ; preds = %for.end880, %for.end868
  %135 = load ptr, ptr @prm, align 8, !tbaa !9
  %Natom882 = getelementptr inbounds %struct.parm, ptr %135, i64 0, i32 4
  %136 = load i32, ptr %Natom882, align 8, !tbaa !27
  %conv883 = sext i32 %136 to i64
  %mul884 = shl nsw i64 %conv883, 3
  %call885 = tail call noalias ptr @malloc(i64 noundef %mul884) #26
  store ptr %call885, ptr @IexclAt, align 8, !tbaa !9
  %cmp886 = icmp eq ptr %call885, null
  br i1 %cmp886, label %if.then888, label %for.cond893.preheader

for.cond893.preheader:                            ; preds = %if.end881
  %137 = load ptr, ptr @prm, align 8, !tbaa !9
  %Natom894118 = getelementptr inbounds %struct.parm, ptr %137, i64 0, i32 4
  %138 = load i32, ptr %Natom894118, align 8, !tbaa !27
  %cmp895119 = icmp sgt i32 %138, 0
  br i1 %cmp895119, label %for.body897, label %for.end935

if.then888:                                       ; preds = %if.end881
  %139 = load ptr, ptr @nabout, align 8, !tbaa !9
  %140 = tail call i64 @fwrite(ptr nonnull @.str.59, i64 44, i64 1, ptr %139)
  %141 = load ptr, ptr @nabout, align 8, !tbaa !9
  %call890 = tail call i32 @fflush(ptr noundef %141)
  tail call void @exit(i32 noundef 1) #22
  unreachable

for.body897:                                      ; preds = %for.cond893.preheader, %if.end928
  %142 = phi ptr [ %156, %if.end928 ], [ %call885, %for.cond893.preheader ]
  %indvars.iv159 = phi i64 [ %indvars.iv.next160, %if.end928 ], [ 0, %for.cond893.preheader ]
  %143 = phi ptr [ %160, %if.end928 ], [ %137, %for.cond893.preheader ]
  %iexcl.0121 = phi i32 [ %add932, %if.end928 ], [ 0, %for.cond893.preheader ]
  %arrayidx899 = getelementptr inbounds ptr, ptr %142, i64 %indvars.iv159
  store ptr null, ptr %arrayidx899, align 8, !tbaa !9
  %Iblo = getelementptr inbounds %struct.parm, ptr %143, i64 0, i32 60
  %144 = load ptr, ptr %Iblo, align 8, !tbaa !41
  %arrayidx901 = getelementptr inbounds i32, ptr %144, i64 %indvars.iv159
  %145 = load i32, ptr %arrayidx901, align 4, !tbaa !5
  %cmp902 = icmp sgt i32 %145, 0
  br i1 %cmp902, label %if.then904, label %if.end928

if.then904:                                       ; preds = %for.body897
  %call908 = tail call ptr @ivector(i32 noundef 0, i32 noundef %145) #23
  %146 = load ptr, ptr @IexclAt, align 8, !tbaa !9
  %arrayidx910 = getelementptr inbounds ptr, ptr %146, i64 %indvars.iv159
  store ptr %call908, ptr %arrayidx910, align 8, !tbaa !9
  %147 = load ptr, ptr @prm, align 8, !tbaa !9
  %Iblo912 = getelementptr inbounds %struct.parm, ptr %147, i64 0, i32 60
  %148 = load ptr, ptr %Iblo912, align 8, !tbaa !41
  %arrayidx914 = getelementptr inbounds i32, ptr %148, i64 %indvars.iv159
  %149 = load i32, ptr %arrayidx914, align 4, !tbaa !5
  %cmp915116 = icmp sgt i32 %149, 0
  %.pre166 = load ptr, ptr @IexclAt, align 8, !tbaa !9
  br i1 %cmp915116, label %for.body917.lr.ph, label %if.end928

for.body917.lr.ph:                                ; preds = %if.then904
  %ExclAt = getelementptr inbounds %struct.parm, ptr %147, i64 0, i32 63
  %150 = load ptr, ptr %ExclAt, align 8, !tbaa !42
  %151 = sext i32 %iexcl.0121 to i64
  br label %for.body917

for.body917:                                      ; preds = %for.body917.lr.ph, %for.body917
  %indvars.iv155 = phi i64 [ 0, %for.body917.lr.ph ], [ %indvars.iv.next156, %for.body917 ]
  %152 = add nsw i64 %indvars.iv155, %151
  %arrayidx920 = getelementptr inbounds i32, ptr %150, i64 %152
  %153 = load i32, ptr %arrayidx920, align 4, !tbaa !5
  %arrayidx924 = getelementptr inbounds i32, ptr %call908, i64 %indvars.iv155
  store i32 %153, ptr %arrayidx924, align 4, !tbaa !5
  %indvars.iv.next156 = add nuw nsw i64 %indvars.iv155, 1
  %154 = load i32, ptr %arrayidx914, align 4, !tbaa !5
  %155 = sext i32 %154 to i64
  %cmp915 = icmp slt i64 %indvars.iv.next156, %155
  br i1 %cmp915, label %for.body917, label %if.end928, !llvm.loop !43

if.end928:                                        ; preds = %for.body917, %if.then904, %for.body897
  %156 = phi ptr [ %.pre166, %if.then904 ], [ %142, %for.body897 ], [ %.pre166, %for.body917 ]
  %157 = load ptr, ptr @prm, align 8, !tbaa !9
  %Iblo929 = getelementptr inbounds %struct.parm, ptr %157, i64 0, i32 60
  %158 = load ptr, ptr %Iblo929, align 8, !tbaa !41
  %arrayidx931 = getelementptr inbounds i32, ptr %158, i64 %indvars.iv159
  %159 = load i32, ptr %arrayidx931, align 4, !tbaa !5
  %add932 = add nsw i32 %159, %iexcl.0121
  %indvars.iv.next160 = add nuw nsw i64 %indvars.iv159, 1
  %160 = load ptr, ptr @prm, align 8, !tbaa !9
  %Natom894 = getelementptr inbounds %struct.parm, ptr %160, i64 0, i32 4
  %161 = load i32, ptr %Natom894, align 8, !tbaa !27
  %162 = sext i32 %161 to i64
  %cmp895 = icmp slt i64 %indvars.iv.next160, %162
  br i1 %cmp895, label %for.body897, label %for.end935, !llvm.loop !44

for.end935:                                       ; preds = %if.end928, %for.cond893.preheader
  %.lcssa = phi i32 [ %138, %for.cond893.preheader ], [ %161, %if.end928 ]
  store double 0.000000e+00, ptr @tdiagd, align 8, !tbaa !12
  store double 0.000000e+00, ptr @tdiag, align 8, !tbaa !12
  store double 0.000000e+00, ptr @tlevel, align 8, !tbaa !12
  store double 0.000000e+00, ptr @tnewton, align 8, !tbaa !12
  store double 0.000000e+00, ptr @tcholesky, align 8, !tbaa !12
  store double 0.000000e+00, ptr @tconjgrad, align 8, !tbaa !12
  store double 0.000000e+00, ptr @tdgeev, align 8, !tbaa !12
  store double 0.000000e+00, ptr @tmmetwo, align 8, !tbaa !12
  store double 0.000000e+00, ptr @tmmeone, align 8, !tbaa !12
  store i32 -3, ptr %i, align 4, !tbaa !5
  %163 = load i32, ptr @mme_init.nold, align 4, !tbaa !5
  %cmp937 = icmp sgt i32 %.lcssa, %163
  br i1 %cmp937, label %if.then939, label %if.end941

if.then939:                                       ; preds = %for.end935
  %call940 = call fastcc double @mme34(ptr noundef %x0i, ptr noundef %x0i, ptr noundef nonnull %i)
  br label %if.end941

if.end941:                                        ; preds = %if.then939, %for.end935
  %164 = load ptr, ptr @prm, align 8, !tbaa !9
  %Natom942 = getelementptr inbounds %struct.parm, ptr %164, i64 0, i32 4
  %165 = load i32, ptr %Natom942, align 8, !tbaa !27
  store i32 %165, ptr @mme_init.nold, align 4, !tbaa !5
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %i) #23
  ret i32 0
}

declare ptr @ivector(i32 noundef, i32 noundef) local_unnamed_addr #9

declare void @free_vector(ptr noundef, i64 noundef, i64 noundef) local_unnamed_addr #9

declare ptr @vector(i64 noundef, i64 noundef) local_unnamed_addr #9

declare void @free_ivector(ptr noundef, i32 noundef, i32 noundef) local_unnamed_addr #9

; Function Attrs: mustprogress nofree nounwind willreturn memory(write)
declare double @sqrt(double noundef) local_unnamed_addr #14

declare i32 @writebinposhdr(ptr noundef) local_unnamed_addr #9

declare i32 @set_cons_mask(ptr noundef, ptr noundef, ptr noundef) local_unnamed_addr #9

declare i32 @set_belly_mask(ptr noundef, ptr noundef, ptr noundef) local_unnamed_addr #9

; Function Attrs: nounwind uwtable
define internal fastcc double @mme34(ptr noundef %x, ptr nocapture noundef %f, ptr nocapture noundef readonly %iter) unnamed_addr #2 {
entry:
  %f188 = ptrtoint ptr %f to i64
  %enb = alloca double, align 8
  %eel = alloca double, align 8
  %enb14 = alloca double, align 8
  %eel14 = alloca double, align 8
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %enb) #23
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %eel) #23
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %enb14) #23
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %eel14) #23
  %0 = load ptr, ptr @prm, align 8, !tbaa !9
  %Natom = getelementptr inbounds %struct.parm, ptr %0, i64 0, i32 4
  %1 = load i32, ptr %Natom, align 8, !tbaa !27
  %conv = sext i32 %1 to i64
  %2 = load i32, ptr %iter, align 4, !tbaa !5
  switch i32 %2, label %if.end24 [
    i32 -3, label %if.then
    i32 0, label %if.end20
  ]

if.then:                                          ; preds = %entry
  %3 = load ptr, ptr @egb.reff, align 8, !tbaa !9
  %cmp2.not.i = icmp eq ptr %3, null
  br i1 %cmp2.not.i, label %if.end.i, label %if.then4.i

if.then4.i:                                       ; preds = %if.then
  tail call void @free_vector(ptr noundef nonnull %3, i64 noundef 0, i64 noundef %conv) #23
  store ptr null, ptr @egb.reff, align 8, !tbaa !9
  br label %if.end.i

if.end.i:                                         ; preds = %if.then4.i, %if.then
  %4 = load ptr, ptr @egb.iexw, align 8, !tbaa !9
  %cmp5.not.i = icmp eq ptr %4, null
  br i1 %cmp5.not.i, label %if.end10.i, label %if.then7.i

if.then7.i:                                       ; preds = %if.end.i
  %add.i = add i32 %1, 1
  tail call void @free_ivector(ptr noundef nonnull %4, i32 noundef -1, i32 noundef %add.i) #23
  store ptr null, ptr @egb.iexw, align 8, !tbaa !9
  br label %if.end10.i

if.end10.i:                                       ; preds = %if.then7.i, %if.end.i
  %5 = load ptr, ptr @egb.sumdeijda, align 8, !tbaa !9
  %cmp11.not.i = icmp eq ptr %5, null
  br i1 %cmp11.not.i, label %if.end16.i, label %if.then13.i

if.then13.i:                                      ; preds = %if.end10.i
  tail call void @free_vector(ptr noundef nonnull %5, i64 noundef 0, i64 noundef %conv) #23
  store ptr null, ptr @egb.sumdeijda, align 8, !tbaa !9
  br label %if.end16.i

if.end16.i:                                       ; preds = %if.then13.i, %if.end10.i
  %6 = load ptr, ptr @egb.psi, align 8, !tbaa !9
  %cmp17.not.i = icmp eq ptr %6, null
  br i1 %cmp17.not.i, label %if.end20.i, label %if.then19.i

if.then19.i:                                      ; preds = %if.end16.i
  tail call void @free_vector(ptr noundef nonnull %6, i64 noundef 0, i64 noundef %conv) #23
  store ptr null, ptr @egb.psi, align 8, !tbaa !9
  br label %if.end20.i

if.end20.i:                                       ; preds = %if.then19.i, %if.end16.i
  %7 = load ptr, ptr @egb.reqack, align 8, !tbaa !9
  %cmp21.not.i = icmp eq ptr %7, null
  br i1 %cmp21.not.i, label %egb.exit, label %if.then23.i

if.then23.i:                                      ; preds = %if.end20.i
  tail call void @free_ivector(ptr noundef nonnull %7, i32 noundef 0, i32 noundef 1) #23
  store ptr null, ptr @egb.reqack, align 8, !tbaa !9
  br label %egb.exit

egb.exit:                                         ; preds = %if.end20.i, %if.then23.i
  %8 = load ptr, ptr @mme34.grad, align 8, !tbaa !9
  %cmp3.not = icmp eq ptr %8, null
  br i1 %cmp3.not, label %cleanup, label %if.then5

if.then5:                                         ; preds = %egb.exit
  %.b100 = load i1, ptr @dim, align 4
  %conv6 = select i1 %.b100, i64 4, i64 3
  %mul7 = mul nsw i64 %conv6, %conv
  tail call void @free_vector(ptr noundef nonnull %8, i64 noundef 0, i64 noundef %mul7) #23
  store ptr null, ptr @mme34.grad, align 8, !tbaa !9
  br label %cleanup

if.end20:                                         ; preds = %entry
  %9 = load ptr, ptr @nabout, align 8, !tbaa !9
  %10 = tail call i64 @fwrite(ptr nonnull @.str.65, i64 20, i64 1, ptr %9)
  %11 = load ptr, ptr @nabout, align 8, !tbaa !9
  %call19 = tail call i32 @fflush(ptr noundef %11)
  %.pr = load i32, ptr %iter, align 4, !tbaa !5
  %cmp21 = icmp eq i32 %.pr, 0
  br i1 %cmp21, label %if.then23, label %if.end24

if.then23:                                        ; preds = %if.end20
  store double 0.000000e+00, ptr @tconjgrad, align 8, !tbaa !12
  br label %if.end24

if.end24:                                         ; preds = %entry, %if.then23, %if.end20
  %12 = phi i32 [ 0, %if.then23 ], [ %.pr, %if.end20 ], [ %2, %entry ]
  %13 = load ptr, ptr @chknm, align 8, !tbaa !9
  %cmp25.not = icmp eq ptr %13, null
  br i1 %cmp25.not, label %if.end35, label %land.lhs.true27

land.lhs.true27:                                  ; preds = %if.end24
  %cmp28 = icmp sgt i32 %12, 0
  %rem = urem i32 %12, 10000
  %cmp31 = icmp eq i32 %rem, 0
  %or.cond = and i1 %cmp28, %cmp31
  br i1 %or.cond, label %if.then33, label %if.end35

if.then33:                                        ; preds = %land.lhs.true27
  %14 = load ptr, ptr @prm, align 8, !tbaa !9
  %Natom34 = getelementptr inbounds %struct.parm, ptr %14, i64 0, i32 4
  %15 = load i32, ptr %Natom34, align 8, !tbaa !27
  tail call void @checkpoint(ptr noundef nonnull %13, i32 noundef %15, ptr noundef %x, i32 noundef %12)
  br label %if.end35

if.end35:                                         ; preds = %if.then33, %land.lhs.true27, %if.end24
  %16 = load i32, ptr @nb_pairs, align 4, !tbaa !5
  %cmp36 = icmp slt i32 %16, 0
  br i1 %cmp36, label %if.then44, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.end35
  %17 = load i32, ptr %iter, align 4, !tbaa !5
  %cmp38 = icmp sgt i32 %17, 0
  %rem41 = urem i32 %17, 10
  %cmp42 = icmp eq i32 %rem41, 0
  %or.cond101 = and i1 %cmp38, %cmp42
  br i1 %or.cond101, label %if.then44, label %if.end48

if.then44:                                        ; preds = %lor.lhs.false, %if.end35
  %18 = load ptr, ptr @lpairs, align 8, !tbaa !9
  %19 = load ptr, ptr @upairs, align 8, !tbaa !9
  %20 = load ptr, ptr @pairlist, align 8, !tbaa !9
  %21 = load ptr, ptr @prm, align 8, !tbaa !9
  %Natom45 = getelementptr inbounds %struct.parm, ptr %21, i64 0, i32 4
  %22 = load i32, ptr %Natom45, align 8, !tbaa !27
  %.b99 = load i1, ptr @dim, align 4
  %23 = select i1 %.b99, i32 4, i32 3
  %24 = load ptr, ptr @frozen, align 8, !tbaa !9
  %call46 = tail call i32 @nblist(ptr noundef %18, ptr noundef %19, ptr noundef %20, ptr noundef %x, i32 noundef 0, i32 noundef 1, double noundef 2.000000e+01, i32 noundef %22, i32 noundef %23, ptr noundef %24) #23
  store i32 %call46, ptr @nb_pairs, align 4, !tbaa !5
  br label %if.end48

if.end48:                                         ; preds = %if.then44, %lor.lhs.false
  %25 = load ptr, ptr @mme34.grad, align 8, !tbaa !9
  %cmp49 = icmp eq ptr %25, null
  br i1 %cmp49, label %if.then51, label %if.end56

if.then51:                                        ; preds = %if.end48
  %.b98 = load i1, ptr @dim, align 4
  %conv53 = select i1 %.b98, i64 4, i64 3
  %mul54 = mul nsw i64 %conv53, %conv
  %call55 = tail call ptr @vector(i64 noundef 0, i64 noundef %mul54) #23
  store ptr %call55, ptr @mme34.grad, align 8, !tbaa !9
  br label %if.end56

if.end56:                                         ; preds = %if.then51, %if.end48
  %26 = phi ptr [ %call55, %if.then51 ], [ %25, %if.end48 ]
  %.b97 = load i1, ptr @dim, align 4
  %27 = select i1 %.b97, i32 4, i32 3
  %28 = load ptr, ptr @prm, align 8, !tbaa !9
  %Natom57 = getelementptr inbounds %struct.parm, ptr %28, i64 0, i32 4
  %29 = load i32, ptr %Natom57, align 8, !tbaa !27
  %mul58 = mul nsw i32 %29, %27
  %cmp59122 = icmp sgt i32 %mul58, 0
  br i1 %cmp59122, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %if.end56
  %wide.trip.count = zext i32 %mul58 to i64
  %xtraiter = and i64 %wide.trip.count, 3
  %30 = icmp ult i32 %mul58, 4
  br i1 %30, label %for.end.loopexit.unr-lcssa, label %for.body.preheader.new

for.body.preheader.new:                           ; preds = %for.body.preheader
  %unroll_iter = and i64 %wide.trip.count, 4294967292
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.preheader.new
  %indvars.iv = phi i64 [ 0, %for.body.preheader.new ], [ %indvars.iv.next.3, %for.body ]
  %niter = phi i64 [ 0, %for.body.preheader.new ], [ %niter.next.3, %for.body ]
  %31 = load ptr, ptr @mme34.grad, align 8, !tbaa !9
  %arrayidx = getelementptr inbounds double, ptr %31, i64 %indvars.iv
  store double 0.000000e+00, ptr %arrayidx, align 8, !tbaa !12
  %indvars.iv.next = or i64 %indvars.iv, 1
  %32 = load ptr, ptr @mme34.grad, align 8, !tbaa !9
  %arrayidx.1 = getelementptr inbounds double, ptr %32, i64 %indvars.iv.next
  store double 0.000000e+00, ptr %arrayidx.1, align 8, !tbaa !12
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %arrayidx.2 = getelementptr inbounds double, ptr %32, i64 %indvars.iv.next.1
  store double 0.000000e+00, ptr %arrayidx.2, align 8, !tbaa !12
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %33 = load ptr, ptr @mme34.grad, align 8, !tbaa !9
  %arrayidx.3 = getelementptr inbounds double, ptr %33, i64 %indvars.iv.next.2
  store double 0.000000e+00, ptr %arrayidx.3, align 8, !tbaa !12
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %niter.next.3 = add i64 %niter, 4
  %niter.ncmp.3 = icmp eq i64 %niter.next.3, %unroll_iter
  br i1 %niter.ncmp.3, label %for.end.loopexit.unr-lcssa, label %for.body, !llvm.loop !45

for.end.loopexit.unr-lcssa:                       ; preds = %for.body, %for.body.preheader
  %indvars.iv.unr = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next.3, %for.body ]
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod.not, label %for.end.loopexit, label %for.body.epil.preheader

for.body.epil.preheader:                          ; preds = %for.end.loopexit.unr-lcssa
  %34 = load ptr, ptr @mme34.grad, align 8, !tbaa !9
  br label %for.body.epil

for.body.epil:                                    ; preds = %for.body.epil, %for.body.epil.preheader
  %indvars.iv.epil = phi i64 [ %indvars.iv.unr, %for.body.epil.preheader ], [ %indvars.iv.next.epil, %for.body.epil ]
  %epil.iter = phi i64 [ 0, %for.body.epil.preheader ], [ %epil.iter.next, %for.body.epil ]
  %arrayidx.epil = getelementptr inbounds double, ptr %34, i64 %indvars.iv.epil
  store double 0.000000e+00, ptr %arrayidx.epil, align 8, !tbaa !12
  %indvars.iv.next.epil = add nuw nsw i64 %indvars.iv.epil, 1
  %epil.iter.next = add i64 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i64 %epil.iter.next, %xtraiter
  br i1 %epil.iter.cmp.not, label %for.end.loopexit, label %for.body.epil, !llvm.loop !46

for.end.loopexit:                                 ; preds = %for.body.epil, %for.end.loopexit.unr-lcssa
  %.pre = load ptr, ptr @mme34.grad, align 8, !tbaa !9
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %if.end56
  %35 = phi ptr [ %.pre, %for.end.loopexit ], [ %26, %if.end56 ]
  %Nbonh = getelementptr inbounds %struct.parm, ptr %28, i64 0, i32 6
  %36 = load i32, ptr %Nbonh, align 8, !tbaa !48
  %BondHAt1 = getelementptr inbounds %struct.parm, ptr %28, i64 0, i32 66
  %37 = load ptr, ptr %BondHAt1, align 8, !tbaa !49
  %BondHAt2 = getelementptr inbounds %struct.parm, ptr %28, i64 0, i32 67
  %38 = load ptr, ptr %BondHAt2, align 8, !tbaa !50
  %BondHNum = getelementptr inbounds %struct.parm, ptr %28, i64 0, i32 68
  %39 = load ptr, ptr %BondHNum, align 8, !tbaa !51
  %Rk = getelementptr inbounds %struct.parm, ptr %28, i64 0, i32 39
  %40 = load ptr, ptr %Rk, align 8, !tbaa !52
  %Req = getelementptr inbounds %struct.parm, ptr %28, i64 0, i32 40
  %41 = load ptr, ptr %Req, align 8, !tbaa !53
  %call64 = tail call fastcc double @ebond(i32 noundef %36, ptr noundef %37, ptr noundef %38, ptr noundef %39, ptr noundef %40, ptr noundef %41, ptr noundef %x, ptr noundef %35)
  %42 = load ptr, ptr @prm, align 8, !tbaa !9
  %Mbona = getelementptr inbounds %struct.parm, ptr %42, i64 0, i32 7
  %43 = load i32, ptr %Mbona, align 4, !tbaa !54
  %BondAt1 = getelementptr inbounds %struct.parm, ptr %42, i64 0, i32 69
  %44 = load ptr, ptr %BondAt1, align 8, !tbaa !55
  %BondAt2 = getelementptr inbounds %struct.parm, ptr %42, i64 0, i32 70
  %45 = load ptr, ptr %BondAt2, align 8, !tbaa !56
  %BondNum = getelementptr inbounds %struct.parm, ptr %42, i64 0, i32 71
  %46 = load ptr, ptr %BondNum, align 8, !tbaa !57
  %Rk65 = getelementptr inbounds %struct.parm, ptr %42, i64 0, i32 39
  %47 = load ptr, ptr %Rk65, align 8, !tbaa !52
  %Req66 = getelementptr inbounds %struct.parm, ptr %42, i64 0, i32 40
  %48 = load ptr, ptr %Req66, align 8, !tbaa !53
  %49 = load ptr, ptr @mme34.grad, align 8, !tbaa !9
  %call67 = tail call fastcc double @ebond(i32 noundef %43, ptr noundef %44, ptr noundef %45, ptr noundef %46, ptr noundef %47, ptr noundef %48, ptr noundef %x, ptr noundef %49)
  %add68 = fadd double %call64, %call67
  %50 = load ptr, ptr @prm, align 8, !tbaa !9
  %Ntheth = getelementptr inbounds %struct.parm, ptr %50, i64 0, i32 8
  %51 = load i32, ptr %Ntheth, align 8, !tbaa !58
  %AngleHAt1 = getelementptr inbounds %struct.parm, ptr %50, i64 0, i32 72
  %52 = load ptr, ptr %AngleHAt1, align 8, !tbaa !59
  %AngleHAt2 = getelementptr inbounds %struct.parm, ptr %50, i64 0, i32 73
  %53 = load ptr, ptr %AngleHAt2, align 8, !tbaa !60
  %AngleHAt3 = getelementptr inbounds %struct.parm, ptr %50, i64 0, i32 74
  %54 = load ptr, ptr %AngleHAt3, align 8, !tbaa !61
  %AngleHNum = getelementptr inbounds %struct.parm, ptr %50, i64 0, i32 75
  %55 = load ptr, ptr %AngleHNum, align 8, !tbaa !62
  %Tk = getelementptr inbounds %struct.parm, ptr %50, i64 0, i32 41
  %56 = load ptr, ptr %Tk, align 8, !tbaa !63
  %Teq = getelementptr inbounds %struct.parm, ptr %50, i64 0, i32 42
  %57 = load ptr, ptr %Teq, align 8, !tbaa !64
  %58 = load ptr, ptr @mme34.grad, align 8, !tbaa !9
  %call73 = tail call fastcc double @eangl(i32 noundef %51, ptr noundef %52, ptr noundef %53, ptr noundef %54, ptr noundef %55, ptr noundef %56, ptr noundef %57, ptr noundef %x, ptr noundef %58)
  %59 = load ptr, ptr @prm, align 8, !tbaa !9
  %Ntheta = getelementptr inbounds %struct.parm, ptr %59, i64 0, i32 17
  %60 = load i32, ptr %Ntheta, align 4, !tbaa !65
  %AngleAt1 = getelementptr inbounds %struct.parm, ptr %59, i64 0, i32 76
  %61 = load ptr, ptr %AngleAt1, align 8, !tbaa !66
  %AngleAt2 = getelementptr inbounds %struct.parm, ptr %59, i64 0, i32 77
  %62 = load ptr, ptr %AngleAt2, align 8, !tbaa !67
  %AngleAt3 = getelementptr inbounds %struct.parm, ptr %59, i64 0, i32 78
  %63 = load ptr, ptr %AngleAt3, align 8, !tbaa !68
  %AngleNum = getelementptr inbounds %struct.parm, ptr %59, i64 0, i32 79
  %64 = load ptr, ptr %AngleNum, align 8, !tbaa !69
  %Tk74 = getelementptr inbounds %struct.parm, ptr %59, i64 0, i32 41
  %65 = load ptr, ptr %Tk74, align 8, !tbaa !63
  %Teq75 = getelementptr inbounds %struct.parm, ptr %59, i64 0, i32 42
  %66 = load ptr, ptr %Teq75, align 8, !tbaa !64
  %67 = load ptr, ptr @mme34.grad, align 8, !tbaa !9
  %call76 = tail call fastcc double @eangl(i32 noundef %60, ptr noundef %61, ptr noundef %62, ptr noundef %63, ptr noundef %64, ptr noundef %65, ptr noundef %66, ptr noundef %x, ptr noundef %67)
  %add77 = fadd double %call73, %call76
  %68 = load ptr, ptr @prm, align 8, !tbaa !9
  %Nphih = getelementptr inbounds %struct.parm, ptr %68, i64 0, i32 10
  %69 = load i32, ptr %Nphih, align 8, !tbaa !70
  %DihHAt1 = getelementptr inbounds %struct.parm, ptr %68, i64 0, i32 80
  %70 = load ptr, ptr %DihHAt1, align 8, !tbaa !71
  %DihHAt2 = getelementptr inbounds %struct.parm, ptr %68, i64 0, i32 81
  %71 = load ptr, ptr %DihHAt2, align 8, !tbaa !72
  %DihHAt3 = getelementptr inbounds %struct.parm, ptr %68, i64 0, i32 82
  %72 = load ptr, ptr %DihHAt3, align 8, !tbaa !73
  %DihHAt4 = getelementptr inbounds %struct.parm, ptr %68, i64 0, i32 83
  %73 = load ptr, ptr %DihHAt4, align 8, !tbaa !74
  %DihHNum = getelementptr inbounds %struct.parm, ptr %68, i64 0, i32 84
  %74 = load ptr, ptr %DihHNum, align 8, !tbaa !75
  %Pk = getelementptr inbounds %struct.parm, ptr %68, i64 0, i32 43
  %75 = load ptr, ptr %Pk, align 8, !tbaa !76
  %Pn = getelementptr inbounds %struct.parm, ptr %68, i64 0, i32 44
  %76 = load ptr, ptr %Pn, align 8, !tbaa !77
  %Phase = getelementptr inbounds %struct.parm, ptr %68, i64 0, i32 45
  %77 = load ptr, ptr %Phase, align 8, !tbaa !78
  %78 = load ptr, ptr @mme34.grad, align 8, !tbaa !9
  %call82 = tail call fastcc double @ephi(i32 noundef %69, ptr noundef %70, ptr noundef %71, ptr noundef %72, ptr noundef %73, ptr noundef %74, ptr noundef %75, ptr noundef %76, ptr noundef %77, ptr noundef %x, ptr noundef %78)
  %79 = load ptr, ptr @prm, align 8, !tbaa !9
  %Mphia = getelementptr inbounds %struct.parm, ptr %79, i64 0, i32 11
  %80 = load i32, ptr %Mphia, align 4, !tbaa !79
  %DihAt1 = getelementptr inbounds %struct.parm, ptr %79, i64 0, i32 85
  %81 = load ptr, ptr %DihAt1, align 8, !tbaa !80
  %DihAt2 = getelementptr inbounds %struct.parm, ptr %79, i64 0, i32 86
  %82 = load ptr, ptr %DihAt2, align 8, !tbaa !81
  %DihAt3 = getelementptr inbounds %struct.parm, ptr %79, i64 0, i32 87
  %83 = load ptr, ptr %DihAt3, align 8, !tbaa !82
  %DihAt4 = getelementptr inbounds %struct.parm, ptr %79, i64 0, i32 88
  %84 = load ptr, ptr %DihAt4, align 8, !tbaa !83
  %DihNum = getelementptr inbounds %struct.parm, ptr %79, i64 0, i32 89
  %85 = load ptr, ptr %DihNum, align 8, !tbaa !84
  %Pk83 = getelementptr inbounds %struct.parm, ptr %79, i64 0, i32 43
  %86 = load ptr, ptr %Pk83, align 8, !tbaa !76
  %Pn84 = getelementptr inbounds %struct.parm, ptr %79, i64 0, i32 44
  %87 = load ptr, ptr %Pn84, align 8, !tbaa !77
  %Phase85 = getelementptr inbounds %struct.parm, ptr %79, i64 0, i32 45
  %88 = load ptr, ptr %Phase85, align 8, !tbaa !78
  %89 = load ptr, ptr @mme34.grad, align 8, !tbaa !9
  %call86 = tail call fastcc double @ephi(i32 noundef %80, ptr noundef %81, ptr noundef %82, ptr noundef %83, ptr noundef %84, ptr noundef %85, ptr noundef %86, ptr noundef %87, ptr noundef %88, ptr noundef %x, ptr noundef %89)
  %add87 = fadd double %call82, %call86
  %90 = load ptr, ptr @lpairs, align 8, !tbaa !9
  %91 = load ptr, ptr @prm, align 8, !tbaa !9
  %N14pairs = getelementptr inbounds %struct.parm, ptr %91, i64 0, i32 91
  %92 = load ptr, ptr %N14pairs, align 8, !tbaa !36
  %93 = load ptr, ptr @N14pearlist, align 8, !tbaa !9
  %94 = load ptr, ptr @mme34.grad, align 8, !tbaa !9
  call fastcc void @nbond(ptr noundef %90, ptr noundef %92, ptr noundef %93, i32 noundef 1, ptr noundef %x, ptr noundef %94, ptr noundef nonnull %enb14, ptr noundef nonnull %eel14, double noundef 2.000000e+00, double noundef 1.200000e+00)
  %95 = load double, ptr %enb14, align 8, !tbaa !12
  %96 = load double, ptr %eel14, align 8, !tbaa !12
  %97 = load i32, ptr @nconstrained, align 4, !tbaa !5
  %tobool101.not = icmp eq i32 %97, 0
  br i1 %tobool101.not, label %if.end107, label %if.then102

if.then102:                                       ; preds = %for.end
  %98 = load ptr, ptr @mme34.grad, align 8, !tbaa !9
  %99 = load ptr, ptr @prm, align 8, !tbaa !9
  %Natom37.i = getelementptr inbounds %struct.parm, ptr %99, i64 0, i32 4
  %100 = load i32, ptr %Natom37.i, align 8, !tbaa !27
  %cmp38.i = icmp sgt i32 %100, 0
  br i1 %cmp38.i, label %for.body.i.preheader, label %if.end107

for.body.i.preheader:                             ; preds = %if.then102
  %101 = load ptr, ptr @constrained, align 8, !tbaa !9
  %102 = zext i32 %100 to i64
  %.b36.i = load i1, ptr @dim, align 4
  %103 = select i1 %.b36.i, i32 4, i32 3
  %104 = load ptr, ptr @x0, align 8
  %105 = select i1 %.b36.i, i64 4, i64 3
  br label %for.body.i

for.body.i:                                       ; preds = %for.body.i.preheader, %for.inc.i
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i, %for.inc.i ], [ 0, %for.body.i.preheader ]
  %e_cons.039.i = phi double [ %e_cons.1.i, %for.inc.i ], [ 0.000000e+00, %for.body.i.preheader ]
  %arrayidx.i = getelementptr inbounds i32, ptr %101, i64 %indvars.iv.i
  %106 = load i32, ptr %arrayidx.i, align 4, !tbaa !5
  %tobool.not.i = icmp eq i32 %106, 0
  br i1 %tobool.not.i, label %for.inc.i, label %if.then.i

if.then.i:                                        ; preds = %for.body.i
  %107 = trunc i64 %indvars.iv.i to i32
  %mul.i = mul nuw nsw i32 %103, %107
  %idxprom1.i = zext i32 %mul.i to i64
  %arrayidx2.i = getelementptr inbounds double, ptr %x, i64 %idxprom1.i
  %108 = load double, ptr %arrayidx2.i, align 8, !tbaa !12
  %arrayidx5.i = getelementptr inbounds double, ptr %104, i64 %idxprom1.i
  %109 = load double, ptr %arrayidx5.i, align 8, !tbaa !12
  %sub.i = fsub double %108, %109
  %add.i103 = add nuw nsw i32 %mul.i, 1
  %idxprom7.i = zext i32 %add.i103 to i64
  %arrayidx8.i = getelementptr inbounds double, ptr %x, i64 %idxprom7.i
  %110 = load double, ptr %arrayidx8.i, align 8, !tbaa !12
  %arrayidx12.i = getelementptr inbounds double, ptr %104, i64 %idxprom7.i
  %111 = load double, ptr %arrayidx12.i, align 8, !tbaa !12
  %sub13.i = fsub double %110, %111
  %add15.i = add nuw nsw i32 %mul.i, 2
  %idxprom16.i = zext i32 %add15.i to i64
  %arrayidx17.i = getelementptr inbounds double, ptr %x, i64 %idxprom16.i
  %112 = load double, ptr %arrayidx17.i, align 8, !tbaa !12
  %arrayidx21.i = getelementptr inbounds double, ptr %104, i64 %idxprom16.i
  %113 = load double, ptr %arrayidx21.i, align 8, !tbaa !12
  %sub22.i = fsub double %112, %113
  %mul24.i = fmul double %sub13.i, %sub13.i
  %114 = tail call double @llvm.fmuladd.f64(double %sub.i, double %sub.i, double %mul24.i)
  %115 = tail call double @llvm.fmuladd.f64(double %sub22.i, double %sub22.i, double %114)
  %116 = tail call double @llvm.fmuladd.f64(double %115, double 0.000000e+00, double %e_cons.039.i)
  %arrayidx32.i = getelementptr inbounds double, ptr %98, i64 %idxprom1.i
  %117 = load double, ptr %arrayidx32.i, align 8, !tbaa !12
  %118 = tail call double @llvm.fmuladd.f64(double %sub.i, double 0.000000e+00, double %117)
  store double %118, ptr %arrayidx32.i, align 8, !tbaa !12
  %mul35.i = mul nuw nsw i64 %105, %indvars.iv.i
  %add37.i = add nuw nsw i64 %mul35.i, 1
  %idxprom38.i = and i64 %add37.i, 4294967295
  %arrayidx39.i = getelementptr inbounds double, ptr %98, i64 %idxprom38.i
  %119 = load double, ptr %arrayidx39.i, align 8, !tbaa !12
  %120 = tail call double @llvm.fmuladd.f64(double %sub13.i, double 0.000000e+00, double %119)
  store double %120, ptr %arrayidx39.i, align 8, !tbaa !12
  %add44.i = add nuw nsw i64 %mul35.i, 2
  %idxprom45.i = and i64 %add44.i, 4294967295
  %arrayidx46.i = getelementptr inbounds double, ptr %98, i64 %idxprom45.i
  %121 = load double, ptr %arrayidx46.i, align 8, !tbaa !12
  %122 = tail call double @llvm.fmuladd.f64(double %sub22.i, double 0.000000e+00, double %121)
  store double %122, ptr %arrayidx46.i, align 8, !tbaa !12
  br i1 %.b36.i, label %if.then48.i, label %for.inc.i

if.then48.i:                                      ; preds = %if.then.i
  %mul49.i = shl i64 %indvars.iv.i, 2
  %add50.i = and i64 %mul49.i, 4294967292
  %idxprom51.i = or i64 %add50.i, 3
  %arrayidx52.i = getelementptr inbounds double, ptr %x, i64 %idxprom51.i
  %123 = load double, ptr %arrayidx52.i, align 8, !tbaa !12
  %arrayidx56.i = getelementptr inbounds double, ptr %104, i64 %idxprom51.i
  %124 = load double, ptr %arrayidx56.i, align 8, !tbaa !12
  %sub57.i = fsub double %123, %124
  %mul58.i = fmul double %sub57.i, 0.000000e+00
  %125 = tail call double @llvm.fmuladd.f64(double %mul58.i, double %sub57.i, double %116)
  %arrayidx66.i = getelementptr inbounds double, ptr %98, i64 %idxprom51.i
  %126 = load double, ptr %arrayidx66.i, align 8, !tbaa !12
  %127 = tail call double @llvm.fmuladd.f64(double %sub57.i, double 0.000000e+00, double %126)
  store double %127, ptr %arrayidx66.i, align 8, !tbaa !12
  br label %for.inc.i

for.inc.i:                                        ; preds = %if.then48.i, %if.then.i, %for.body.i
  %e_cons.1.i = phi double [ %125, %if.then48.i ], [ %116, %if.then.i ], [ %e_cons.039.i, %for.body.i ]
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %exitcond139.not = icmp eq i64 %indvars.iv.next.i, %102
  br i1 %exitcond139.not, label %if.end107, label %for.body.i, !llvm.loop !85

if.end107:                                        ; preds = %for.inc.i, %if.then102, %for.end
  %ecn.0 = phi double [ 0.000000e+00, %for.end ], [ 0.000000e+00, %if.then102 ], [ %e_cons.1.i, %for.inc.i ]
  %128 = load i32, ptr @gb, align 4, !tbaa !5
  %tobool109.not = icmp eq i32 %128, 0
  %129 = load ptr, ptr @lpairs, align 8, !tbaa !9
  %130 = load ptr, ptr @upairs, align 8, !tbaa !9
  %131 = load ptr, ptr @pairlist, align 8, !tbaa !9
  %132 = load ptr, ptr @mme34.grad, align 8, !tbaa !9
  br i1 %tobool109.not, label %if.else126, label %if.then110

if.then110:                                       ; preds = %if.end107
  %133 = load ptr, ptr @prm, align 8, !tbaa !9
  %Fs111 = getelementptr inbounds %struct.parm, ptr %133, i64 0, i32 52
  %134 = load ptr, ptr %Fs111, align 8, !tbaa !86
  %Rborn112 = getelementptr inbounds %struct.parm, ptr %133, i64 0, i32 51
  %135 = load ptr, ptr %Rborn112, align 8, !tbaa !87
  %Charges113 = getelementptr inbounds %struct.parm, ptr %133, i64 0, i32 37
  %136 = load ptr, ptr %Charges113, align 8, !tbaa !88
  %Natom.i105 = getelementptr inbounds %struct.parm, ptr %133, i64 0, i32 4
  %137 = load i32, ptr %Natom.i105, align 8, !tbaa !27
  %conv.i106 = sext i32 %137 to i64
  %Fsmax.i = getelementptr inbounds %struct.parm, ptr %133, i64 0, i32 58
  %138 = load double, ptr %Fsmax.i, align 8, !tbaa !89
  %add31.i = fadd double %138, 2.000000e+01
  %mul34.i = fmul double %add31.i, %add31.i
  %139 = load ptr, ptr @egb.reff, align 8, !tbaa !9
  %cmp35.i = icmp eq ptr %139, null
  br i1 %cmp35.i, label %if.then37.i, label %if.end39.i

if.then37.i:                                      ; preds = %if.then110
  %call38.i = tail call ptr @vector(i64 noundef 0, i64 noundef %conv.i106) #23
  store ptr %call38.i, ptr @egb.reff, align 8, !tbaa !9
  br label %if.end39.i

if.end39.i:                                       ; preds = %if.then37.i, %if.then110
  %140 = load ptr, ptr @egb.iexw, align 8, !tbaa !9
  %cmp40.i = icmp eq ptr %140, null
  br i1 %cmp40.i, label %if.then42.i, label %if.end48.i

if.then42.i:                                      ; preds = %if.end39.i
  %add44.i114 = add i32 %137, 1
  %call47.i = tail call ptr @ivector(i32 noundef -1, i32 noundef %add44.i114) #23
  store ptr %call47.i, ptr @egb.iexw, align 8, !tbaa !9
  br label %if.end48.i

if.end48.i:                                       ; preds = %if.then42.i, %if.end39.i
  %141 = load ptr, ptr @egb.sumdeijda, align 8, !tbaa !9
  %cmp49.i = icmp eq ptr %141, null
  br i1 %cmp49.i, label %if.then51.i, label %if.end55.i

if.then51.i:                                      ; preds = %if.end48.i
  %call54.i = tail call ptr @vector(i64 noundef 0, i64 noundef %conv.i106) #23
  store ptr %call54.i, ptr @egb.sumdeijda, align 8, !tbaa !9
  br label %if.end55.i

if.end55.i:                                       ; preds = %if.then51.i, %if.end48.i
  %142 = load ptr, ptr @egb.psi, align 8, !tbaa !9
  %cmp56.i = icmp eq ptr %142, null
  br i1 %cmp56.i, label %land.lhs.true.i, label %if.end64.i

land.lhs.true.i:                                  ; preds = %if.end55.i
  %143 = load i32, ptr @gb, align 4
  switch i32 %143, label %if.end64.i [
    i32 5, label %if.then62.i
    i32 2, label %if.then62.i
  ]

if.then62.i:                                      ; preds = %land.lhs.true.i, %land.lhs.true.i
  %call63.i = tail call ptr @vector(i64 noundef 0, i64 noundef %conv.i106) #23
  store ptr %call63.i, ptr @egb.psi, align 8, !tbaa !9
  br label %if.end64.i

if.end64.i:                                       ; preds = %if.then62.i, %land.lhs.true.i, %if.end55.i
  %144 = load ptr, ptr @egb.reqack, align 8, !tbaa !9
  %cmp65.i = icmp eq ptr %144, null
  br i1 %cmp65.i, label %if.then67.i, label %if.end72.i

if.then67.i:                                      ; preds = %if.end64.i
  %call68.i = tail call ptr @ivector(i32 noundef 0, i32 noundef 1) #23
  store ptr %call68.i, ptr @egb.reqack, align 8, !tbaa !9
  br label %if.end72.i

if.end72.i:                                       ; preds = %if.then67.i, %if.end64.i
  %145 = load ptr, ptr @prm, align 8, !tbaa !9
  %Natom737.i = getelementptr inbounds %struct.parm, ptr %145, i64 0, i32 4
  %146 = load i32, ptr %Natom737.i, align 8, !tbaa !27
  %cmp748.i = icmp sgt i32 %146, 0
  br i1 %cmp748.i, label %for.body.i108, label %for.end300.i

for.body.i108:                                    ; preds = %if.end72.i, %for.inc298.i
  %indvars.iv78.i = phi i64 [ %indvars.iv.next79.i, %for.inc298.i ], [ 0, %if.end72.i ]
  %wi.010.i = phi double [ %wi.1.i, %for.inc298.i ], [ 0.000000e+00, %if.end72.i ]
  %wij.09.i = phi double [ %wij.1.lcssa.i, %for.inc298.i ], [ undef, %if.end72.i ]
  %.b535.i = load i1, ptr @dim, align 4
  %147 = select i1 %.b535.i, i32 4, i32 3
  %148 = trunc i64 %indvars.iv78.i to i32
  %mul76.i = mul nuw nsw i32 %147, %148
  %idxprom.i = zext i32 %mul76.i to i64
  %arrayidx.i109 = getelementptr inbounds double, ptr %x, i64 %idxprom.i
  %149 = load double, ptr %arrayidx.i109, align 8, !tbaa !12
  %add78.i = add nuw nsw i32 %mul76.i, 1
  %idxprom79.i = zext i32 %add78.i to i64
  %arrayidx80.i = getelementptr inbounds double, ptr %x, i64 %idxprom79.i
  %150 = load double, ptr %arrayidx80.i, align 8, !tbaa !12
  %add82.i = add nuw nsw i32 %mul76.i, 2
  %idxprom83.i = zext i32 %add82.i to i64
  %arrayidx84.i = getelementptr inbounds double, ptr %x, i64 %idxprom83.i
  %151 = load double, ptr %arrayidx84.i, align 8, !tbaa !12
  br i1 %.b535.i, label %if.then87.i, label %if.end92.i

if.then87.i:                                      ; preds = %for.body.i108
  %add89.i = add nuw nsw i32 %mul76.i, 3
  %idxprom90.i = zext i32 %add89.i to i64
  %arrayidx91.i = getelementptr inbounds double, ptr %x, i64 %idxprom90.i
  %152 = load double, ptr %arrayidx91.i, align 8, !tbaa !12
  br label %if.end92.i

if.end92.i:                                       ; preds = %if.then87.i, %for.body.i108
  %wi.1.i = phi double [ %152, %if.then87.i ], [ %wi.010.i, %for.body.i108 ]
  %arrayidx94.i = getelementptr inbounds double, ptr %135, i64 %indvars.iv78.i
  %153 = load double, ptr %arrayidx94.i, align 8, !tbaa !12
  %sub.i110 = fadd double %153, 0xBFB70A3D70A3D70A
  %div95.i = fdiv double 1.000000e+00, %sub.i110
  %arrayidx98.i = getelementptr inbounds i32, ptr %129, i64 %indvars.iv78.i
  %arrayidx100.i = getelementptr inbounds i32, ptr %130, i64 %indvars.iv78.i
  %154 = load i32, ptr %arrayidx98.i, align 4, !tbaa !5
  %155 = load i32, ptr %arrayidx100.i, align 4, !tbaa !5
  %add1011.i = add nsw i32 %155, %154
  %cmp1022.i = icmp sgt i32 %add1011.i, 0
  br i1 %cmp1022.i, label %for.body104.lr.ph.i, label %for.end.i

for.body104.lr.ph.i:                              ; preds = %if.end92.i
  %arrayidx106.i = getelementptr inbounds ptr, ptr %131, i64 %indvars.iv78.i
  %mul215.i = fmul double %div95.i, 5.000000e-01
  br label %for.body104.i

for.body104.i:                                    ; preds = %for.inc.i112, %for.body104.lr.ph.i
  %indvars.iv.i111 = phi i64 [ 0, %for.body104.lr.ph.i ], [ %indvars.iv.next.i113, %for.inc.i112 ]
  %wij.14.i = phi double [ %wij.09.i, %for.body104.lr.ph.i ], [ %wij.2.i, %for.inc.i112 ]
  %sumi.03.i = phi double [ 0.000000e+00, %for.body104.lr.ph.i ], [ %sumi.1.i, %for.inc.i112 ]
  %156 = load ptr, ptr %arrayidx106.i, align 8, !tbaa !9
  %cmp107.i = icmp eq ptr %156, null
  br i1 %cmp107.i, label %if.then109.i, label %if.end112.i

if.then109.i:                                     ; preds = %for.body104.i
  %157 = load ptr, ptr @nabout, align 8, !tbaa !9
  %call110.i = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %157, ptr noundef nonnull @.str.80, i32 noundef 0)
  %158 = load ptr, ptr @nabout, align 8, !tbaa !9
  %call111.i = tail call i32 @fflush(ptr noundef %158)
  %.pre171 = load ptr, ptr %arrayidx106.i, align 8, !tbaa !9
  br label %if.end112.i

if.end112.i:                                      ; preds = %if.then109.i, %for.body104.i
  %159 = phi ptr [ %.pre171, %if.then109.i ], [ %156, %for.body104.i ]
  %arrayidx116.i = getelementptr inbounds i32, ptr %159, i64 %indvars.iv.i111
  %160 = load i32, ptr %arrayidx116.i, align 4, !tbaa !5
  %.b534.i = load i1, ptr @dim, align 4
  %161 = select i1 %.b534.i, i32 4, i32 3
  %mul117.i = mul nsw i32 %161, %160
  %idxprom118.i = sext i32 %mul117.i to i64
  %arrayidx119.i = getelementptr inbounds double, ptr %x, i64 %idxprom118.i
  %162 = load double, ptr %arrayidx119.i, align 8, !tbaa !12
  %sub120.i = fsub double %149, %162
  %add122.i = add nsw i32 %mul117.i, 1
  %idxprom123.i = sext i32 %add122.i to i64
  %arrayidx124.i = getelementptr inbounds double, ptr %x, i64 %idxprom123.i
  %163 = load double, ptr %arrayidx124.i, align 8, !tbaa !12
  %sub125.i = fsub double %150, %163
  %add127.i = add nsw i32 %mul117.i, 2
  %idxprom128.i = sext i32 %add127.i to i64
  %arrayidx129.i = getelementptr inbounds double, ptr %x, i64 %idxprom128.i
  %164 = load double, ptr %arrayidx129.i, align 8, !tbaa !12
  %sub130.i = fsub double %151, %164
  %mul132.i = fmul double %sub125.i, %sub125.i
  %165 = tail call double @llvm.fmuladd.f64(double %sub120.i, double %sub120.i, double %mul132.i)
  %166 = tail call double @llvm.fmuladd.f64(double %sub130.i, double %sub130.i, double %165)
  br i1 %.b534.i, label %if.then136.i, label %if.end143.i

if.then136.i:                                     ; preds = %if.end112.i
  %add138.i = add nsw i32 %mul117.i, 3
  %idxprom139.i = sext i32 %add138.i to i64
  %arrayidx140.i = getelementptr inbounds double, ptr %x, i64 %idxprom139.i
  %167 = load double, ptr %arrayidx140.i, align 8, !tbaa !12
  %sub141.i = fsub double %wi.1.i, %167
  %168 = tail call double @llvm.fmuladd.f64(double %sub141.i, double %sub141.i, double %166)
  br label %if.end143.i

if.end143.i:                                      ; preds = %if.then136.i, %if.end112.i
  %r2.0.i = phi double [ %168, %if.then136.i ], [ %166, %if.end112.i ]
  %wij.2.i = phi double [ %sub141.i, %if.then136.i ], [ %wij.14.i, %if.end112.i ]
  %cmp144.i = fcmp ogt double %r2.0.i, %mul34.i
  br i1 %cmp144.i, label %for.inc.i112, label %if.end147.i

if.end147.i:                                      ; preds = %if.end143.i
  %call148.i = tail call double @sqrt(double noundef %r2.0.i) #23
  %div149.i = fdiv double 1.000000e+00, %call148.i
  %mul150.i = fmul double %r2.0.i, %div149.i
  %idxprom151.i = sext i32 %160 to i64
  %arrayidx152.i = getelementptr inbounds double, ptr %134, i64 %idxprom151.i
  %169 = load double, ptr %arrayidx152.i, align 8, !tbaa !12
  %arrayidx154.i = getelementptr inbounds double, ptr %135, i64 %idxprom151.i
  %170 = load double, ptr %arrayidx154.i, align 8, !tbaa !12
  %sub155.i = fadd double %170, 0xBFB70A3D70A3D70A
  %mul156.i = fmul double %169, %sub155.i
  %mul157.i = fmul double %mul156.i, %mul156.i
  %add158.i = fadd double %mul156.i, 2.000000e+01
  %cmp159.i = fcmp ogt double %mul150.i, %add158.i
  br i1 %cmp159.i, label %for.inc.i112, label %if.end162.i

if.end162.i:                                      ; preds = %if.end147.i
  %sub163.i = fsub double 2.000000e+01, %mul156.i
  %cmp164.i = fcmp ogt double %mul150.i, %sub163.i
  br i1 %cmp164.i, label %if.then166.i, label %if.else.i

if.then166.i:                                     ; preds = %if.end162.i
  %sub167.i = fsub double %mul150.i, %mul156.i
  %div168.i = fdiv double 1.000000e+00, %sub167.i
  %mul170.i = fmul double %mul150.i, 2.000000e+00
  %171 = tail call double @llvm.fmuladd.f64(double %mul170.i, double %div168.i, double 1.000000e+00)
  %172 = tail call double @llvm.fmuladd.f64(double %mul150.i, double -8.000000e+01, double %r2.0.i)
  %sub174.i = fsub double %172, %mul157.i
  %173 = tail call double @llvm.fmuladd.f64(double %sub174.i, double 0x3F647AE147AE147C, double %171)
  %mul177.i = fmul double %sub167.i, 5.000000e-02
  %call178.i = tail call double @log(double noundef %mul177.i) #23
  %174 = tail call double @llvm.fmuladd.f64(double %call178.i, double 2.000000e+00, double %173)
  %neg181.i = fmul double %div149.i, -1.250000e-01
  %175 = tail call double @llvm.fmuladd.f64(double %neg181.i, double %174, double %sumi.03.i)
  br label %for.inc.i112

if.else.i:                                        ; preds = %if.end162.i
  %mul182.i = fmul double %mul156.i, 4.000000e+00
  %cmp183.i = fcmp ogt double %mul150.i, %mul182.i
  br i1 %cmp183.i, label %if.then185.i, label %if.else196.i

if.then185.i:                                     ; preds = %if.else.i
  %mul186.i = fmul double %div149.i, %div149.i
  %mul187.i = fmul double %mul186.i, %mul157.i
  %176 = tail call double @llvm.fmuladd.f64(double %mul187.i, double 0x3FDD1745D1745D17, double 0x3FDC71C71C71C71C)
  %177 = tail call double @llvm.fmuladd.f64(double %mul187.i, double %176, double 0x3FDB6DB6DB6DB6DB)
  %178 = tail call double @llvm.fmuladd.f64(double %mul187.i, double %177, double 4.000000e-01)
  %179 = tail call double @llvm.fmuladd.f64(double %mul187.i, double %178, double 0x3FD5555555555555)
  %180 = fneg double %mul156.i
  %181 = fmul double %mul187.i, %180
  %neg195.i = fmul double %mul186.i, %181
  %182 = tail call double @llvm.fmuladd.f64(double %neg195.i, double %179, double %sumi.03.i)
  br label %for.inc.i112

if.else196.i:                                     ; preds = %if.else.i
  %add197.i = fadd double %sub.i110, %mul156.i
  %cmp198.i = fcmp ogt double %mul150.i, %add197.i
  br i1 %cmp198.i, label %if.then200.i, label %if.else210.i

if.then200.i:                                     ; preds = %if.else196.i
  %sub201.i = fsub double %r2.0.i, %mul157.i
  %div202.i = fdiv double %mul156.i, %sub201.i
  %mul203.i = fmul double %div149.i, 5.000000e-01
  %sub204.i = fsub double %mul150.i, %mul156.i
  %add205.i = fadd double %mul150.i, %mul156.i
  %div206.i = fdiv double %sub204.i, %add205.i
  %call207.i = tail call double @log(double noundef %div206.i) #23
  %183 = tail call double @llvm.fmuladd.f64(double %mul203.i, double %call207.i, double %div202.i)
  %184 = tail call double @llvm.fmuladd.f64(double %183, double -5.000000e-01, double %sumi.03.i)
  br label %for.inc.i112

if.else210.i:                                     ; preds = %if.else196.i
  %sub211.i = fsub double %sub.i110, %mul156.i
  %185 = tail call double @llvm.fabs.f64(double %sub211.i)
  %cmp212.i = fcmp ogt double %mul150.i, %185
  br i1 %cmp212.i, label %if.then214.i, label %if.else229.i

if.then214.i:                                     ; preds = %if.else210.i
  %mul216.i = fmul double %mul215.i, %div149.i
  %186 = tail call double @llvm.fmuladd.f64(double %sub.i110, double %sub.i110, double %r2.0.i)
  %sub218.i = fsub double %186, %mul157.i
  %mul219.i = fmul double %mul216.i, %sub218.i
  %add220.i = fadd double %mul150.i, %mul156.i
  %div221.i = fdiv double 1.000000e+00, %add220.i
  %sub222.i = fsub double 2.000000e+00, %mul219.i
  %neg224.i = fneg double %div221.i
  %187 = tail call double @llvm.fmuladd.f64(double %div95.i, double %sub222.i, double %neg224.i)
  %mul225.i = fmul double %sub.i110, %div221.i
  %call226.i = tail call double @log(double noundef %mul225.i) #23
  %188 = tail call double @llvm.fmuladd.f64(double %div149.i, double %call226.i, double %187)
  %189 = tail call double @llvm.fmuladd.f64(double %188, double -2.500000e-01, double %sumi.03.i)
  br label %for.inc.i112

if.else229.i:                                     ; preds = %if.else210.i
  %cmp230.i = fcmp olt double %sub.i110, %mul156.i
  br i1 %cmp230.i, label %if.then232.i, label %for.inc.i112

if.then232.i:                                     ; preds = %if.else229.i
  %sub233.i = fsub double %r2.0.i, %mul157.i
  %div234.i = fdiv double %mul156.i, %sub233.i
  %190 = tail call double @llvm.fmuladd.f64(double %div95.i, double 2.000000e+00, double %div234.i)
  %mul236.i = fmul double %div149.i, 5.000000e-01
  %sub237.i = fsub double %mul156.i, %mul150.i
  %add238.i = fadd double %mul150.i, %mul156.i
  %div239.i = fdiv double %sub237.i, %add238.i
  %call240.i = tail call double @log(double noundef %div239.i) #23
  %191 = tail call double @llvm.fmuladd.f64(double %mul236.i, double %call240.i, double %190)
  %192 = tail call double @llvm.fmuladd.f64(double %191, double -5.000000e-01, double %sumi.03.i)
  br label %for.inc.i112

for.inc.i112:                                     ; preds = %if.then232.i, %if.else229.i, %if.then214.i, %if.then200.i, %if.then185.i, %if.then166.i, %if.end147.i, %if.end143.i
  %sumi.1.i = phi double [ %sumi.03.i, %if.end143.i ], [ %sumi.03.i, %if.end147.i ], [ %175, %if.then166.i ], [ %182, %if.then185.i ], [ %184, %if.then200.i ], [ %189, %if.then214.i ], [ %192, %if.then232.i ], [ %sumi.03.i, %if.else229.i ]
  %indvars.iv.next.i113 = add nuw nsw i64 %indvars.iv.i111, 1
  %193 = load i32, ptr %arrayidx98.i, align 4, !tbaa !5
  %194 = load i32, ptr %arrayidx100.i, align 4, !tbaa !5
  %add101.i = add nsw i32 %194, %193
  %195 = sext i32 %add101.i to i64
  %cmp102.i = icmp slt i64 %indvars.iv.next.i113, %195
  br i1 %cmp102.i, label %for.body104.i, label %for.end.i, !llvm.loop !90

for.end.i:                                        ; preds = %for.inc.i112, %if.end92.i
  %sumi.0.lcssa.i = phi double [ 0.000000e+00, %if.end92.i ], [ %sumi.1.i, %for.inc.i112 ]
  %wij.1.lcssa.i = phi double [ %wij.09.i, %if.end92.i ], [ %wij.2.i, %for.inc.i112 ]
  %196 = load i32, ptr @gb, align 4, !tbaa !5
  %cmp248.i = icmp eq i32 %196, 1
  br i1 %cmp248.i, label %if.then250.i, label %if.else263.i

if.then250.i:                                     ; preds = %for.end.i
  %add251.i = fadd double %div95.i, %sumi.0.lcssa.i
  %div252.i = fdiv double 1.000000e+00, %add251.i
  %197 = load ptr, ptr @egb.reff, align 8, !tbaa !9
  %arrayidx254.i = getelementptr inbounds double, ptr %197, i64 %indvars.iv78.i
  store double %div252.i, ptr %arrayidx254.i, align 8, !tbaa !12
  %cmp257.i = fcmp olt double %div252.i, 0.000000e+00
  br i1 %cmp257.i, label %if.then259.i, label %for.inc298.i

if.then259.i:                                     ; preds = %if.then250.i
  store double 3.000000e+01, ptr %arrayidx254.i, align 8, !tbaa !12
  br label %for.inc298.i

if.else263.i:                                     ; preds = %for.end.i
  %fneg.i = fneg double %sub.i110
  %mul264.i = fmul double %sumi.0.lcssa.i, %fneg.i
  %198 = load ptr, ptr @egb.psi, align 8, !tbaa !9
  %arrayidx266.i = getelementptr inbounds double, ptr %198, i64 %indvars.iv78.i
  store double %mul264.i, ptr %arrayidx266.i, align 8, !tbaa !12
  %199 = load double, ptr @gbalpha, align 8, !tbaa !12
  %200 = load double, ptr @gbbeta, align 8, !tbaa !12
  %neg270.i = fneg double %200
  %201 = tail call double @llvm.fmuladd.f64(double %neg270.i, double %mul264.i, double %199)
  %202 = load double, ptr @gbgamma, align 8, !tbaa !12
  %mul273.i = fmul double %mul264.i, %202
  %203 = tail call double @llvm.fmuladd.f64(double %mul273.i, double %mul264.i, double %201)
  %mul279.i = fmul double %mul264.i, %203
  %call280.i = tail call double @tanh(double noundef %mul279.i) #23
  %204 = load double, ptr %arrayidx94.i, align 8, !tbaa !12
  %div283.i = fdiv double %call280.i, %204
  %sub284.i = fsub double %div95.i, %div283.i
  %div285.i = fdiv double 1.000000e+00, %sub284.i
  %205 = load ptr, ptr @egb.reff, align 8, !tbaa !9
  %arrayidx287.i = getelementptr inbounds double, ptr %205, i64 %indvars.iv78.i
  store double %div285.i, ptr %arrayidx287.i, align 8, !tbaa !12
  br label %for.inc298.i

for.inc298.i:                                     ; preds = %if.else263.i, %if.then259.i, %if.then250.i
  %indvars.iv.next79.i = add nuw nsw i64 %indvars.iv78.i, 1
  %206 = load ptr, ptr @prm, align 8, !tbaa !9
  %Natom73.i = getelementptr inbounds %struct.parm, ptr %206, i64 0, i32 4
  %207 = load i32, ptr %Natom73.i, align 8, !tbaa !27
  %208 = sext i32 %207 to i64
  %cmp74.i = icmp slt i64 %indvars.iv.next79.i, %208
  br i1 %cmp74.i, label %for.body.i108, label %for.end300.i, !llvm.loop !91

for.end300.i:                                     ; preds = %for.inc298.i, %if.end72.i
  %wij.0.lcssa.i = phi double [ undef, %if.end72.i ], [ %wij.1.lcssa.i, %for.inc298.i ]
  %wi.0.lcssa.i = phi double [ 0.000000e+00, %if.end72.i ], [ %wi.1.i, %for.inc298.i ]
  %209 = load ptr, ptr @prm, align 8, !tbaa !9
  %Natom30214.i = getelementptr inbounds %struct.parm, ptr %209, i64 0, i32 4
  %210 = load i32, ptr %Natom30214.i, align 8, !tbaa !27
  %cmp30315.i = icmp sgt i32 %210, 0
  br i1 %cmp30315.i, label %for.cond312.preheader.i.thread, label %for.cond312.preheader.i

for.cond312.preheader.i.thread:                   ; preds = %for.end300.i
  %211 = load ptr, ptr @egb.sumdeijda, align 8, !tbaa !9
  %212 = zext i32 %210 to i64
  %213 = shl nuw nsw i64 %212, 3
  tail call void @llvm.memset.p0.i64(ptr align 8 %211, i8 0, i64 %213, i1 false), !tbaa !12
  br label %for.body316.lr.ph.i

for.cond312.preheader.i:                          ; preds = %for.end300.i
  %cmp31418.i = icmp sgt i32 %210, -1
  br i1 %cmp31418.i, label %for.body316.lr.ph.i, label %for.cond593.preheader.i

for.body316.lr.ph.i:                              ; preds = %for.cond312.preheader.i.thread, %for.cond312.preheader.i
  %214 = load ptr, ptr @egb.iexw, align 8, !tbaa !9
  br label %for.body316.i

for.cond323.preheader.i:                          ; preds = %for.body316.i
  %215 = icmp sgt i32 %216, 0
  br i1 %215, label %for.body327.i, label %for.cond593.preheader.i

for.body316.i:                                    ; preds = %for.body316.i, %for.body316.lr.ph.i
  %indvars.iv84.i = phi i64 [ -1, %for.body316.lr.ph.i ], [ %indvars.iv.next85.i, %for.body316.i ]
  %arrayidx319.i = getelementptr inbounds i32, ptr %214, i64 %indvars.iv84.i
  store i32 -1, ptr %arrayidx319.i, align 4, !tbaa !5
  %indvars.iv.next85.i = add nsw i64 %indvars.iv84.i, 1
  %216 = load i32, ptr %Natom30214.i, align 8, !tbaa !27
  %217 = sext i32 %216 to i64
  %cmp314.i = icmp slt i64 %indvars.iv.next85.i, %217
  br i1 %cmp314.i, label %for.body316.i, label %for.cond323.preheader.i, !llvm.loop !92

for.cond593.preheader.i:                          ; preds = %for.inc590.i, %for.cond312.preheader.i, %for.cond323.preheader.i
  %wij.3.lcssa.i = phi double [ %wij.0.lcssa.i, %for.cond323.preheader.i ], [ %wij.0.lcssa.i, %for.cond312.preheader.i ], [ %wij.6.i, %for.inc590.i ]
  %wi.2.lcssa.i = phi double [ %wi.0.lcssa.i, %for.cond323.preheader.i ], [ %wi.0.lcssa.i, %for.cond312.preheader.i ], [ %wi.4.i, %for.inc590.i ]
  %evdw.0.lcssa.i = phi double [ 0.000000e+00, %for.cond323.preheader.i ], [ 0.000000e+00, %for.cond312.preheader.i ], [ %evdw.3.i, %for.inc590.i ]
  %elec.0.lcssa.i = phi double [ 0.000000e+00, %for.cond323.preheader.i ], [ 0.000000e+00, %for.cond312.preheader.i ], [ %elec.3.i, %for.inc590.i ]
  %epol.0.lcssa.i = phi double [ 0.000000e+00, %for.cond323.preheader.i ], [ 0.000000e+00, %for.cond312.preheader.i ], [ %epol.3.i, %for.inc590.i ]
  %218 = load ptr, ptr @prm, align 8, !tbaa !9
  %Natom59470.i = getelementptr inbounds %struct.parm, ptr %218, i64 0, i32 4
  %219 = load i32, ptr %Natom59470.i, align 8, !tbaa !27
  %cmp59571.i = icmp sgt i32 %219, 0
  br i1 %cmp59571.i, label %for.body597.i, label %if.end139

for.body327.i:                                    ; preds = %for.cond323.preheader.i, %for.inc590.i
  %indvars.iv93.i = phi i64 [ %indvars.iv.next94.i, %for.inc590.i ], [ 0, %for.cond323.preheader.i ]
  %epol.051.i = phi double [ %epol.3.i, %for.inc590.i ], [ 0.000000e+00, %for.cond323.preheader.i ]
  %elec.050.i = phi double [ %elec.3.i, %for.inc590.i ], [ 0.000000e+00, %for.cond323.preheader.i ]
  %evdw.049.i = phi double [ %evdw.3.i, %for.inc590.i ], [ 0.000000e+00, %for.cond323.preheader.i ]
  %wi.248.i = phi double [ %wi.4.i, %for.inc590.i ], [ %wi.0.lcssa.i, %for.cond323.preheader.i ]
  %wij.347.i = phi double [ %wij.6.i, %for.inc590.i ], [ %wij.0.lcssa.i, %for.cond323.preheader.i ]
  %220 = load ptr, ptr @egb.reff, align 8, !tbaa !9
  %arrayidx329.i = getelementptr inbounds double, ptr %220, i64 %indvars.iv93.i
  %221 = load double, ptr %arrayidx329.i, align 8, !tbaa !12
  %arrayidx331.i = getelementptr inbounds double, ptr %136, i64 %indvars.iv93.i
  %222 = load double, ptr %arrayidx331.i, align 8, !tbaa !12
  %223 = load ptr, ptr @frozen, align 8, !tbaa !9
  %arrayidx333.i = getelementptr inbounds i32, ptr %223, i64 %indvars.iv93.i
  %224 = load i32, ptr %arrayidx333.i, align 4, !tbaa !5
  %tobool334.not.i = icmp eq i32 %224, 0
  br i1 %tobool334.not.i, label %if.then335.i, label %if.end357.i

if.then335.i:                                     ; preds = %for.body327.i
  %mul337.i = fmul double %221, -0.000000e+00
  %call338.i = tail call double @exp(double noundef %mul337.i) #23
  %div339.i = fdiv double %call338.i, 7.850000e+01
  %sub340.i = fsub double 1.000000e+00, %div339.i
  %mul341.i = fmul double %222, 5.000000e-01
  %mul342.i = fmul double %222, %mul341.i
  %mul343.i = fmul double %mul342.i, %sub340.i
  %225 = fdiv double %mul343.i, %221
  %add346.i = fsub double %epol.051.i, %225
  %226 = fmul double %mul342.i, -0.000000e+00
  %neg351.i = fmul double %div339.i, %226
  %227 = tail call double @llvm.fmuladd.f64(double %neg351.i, double %221, double %mul343.i)
  %add352.i = fadd double %227, 0.000000e+00
  %228 = load ptr, ptr @egb.sumdeijda, align 8, !tbaa !9
  %arrayidx355.i = getelementptr inbounds double, ptr %228, i64 %indvars.iv93.i
  %229 = load double, ptr %arrayidx355.i, align 8, !tbaa !12
  %add356.i = fadd double %229, %add352.i
  store double %add356.i, ptr %arrayidx355.i, align 8, !tbaa !12
  br label %if.end357.i

if.end357.i:                                      ; preds = %if.then335.i, %for.body327.i
  %epol.1.i = phi double [ %epol.051.i, %for.body327.i ], [ %add346.i, %if.then335.i ]
  %arrayidx359.i = getelementptr inbounds i32, ptr %130, i64 %indvars.iv93.i
  %230 = load i32, ptr %arrayidx359.i, align 4, !tbaa !5
  %cmp360.i = icmp slt i32 %230, 1
  br i1 %cmp360.i, label %for.inc590.i, label %if.end363.i

if.end363.i:                                      ; preds = %if.end357.i
  %.b533.i = load i1, ptr @dim, align 4
  %231 = select i1 %.b533.i, i32 4, i32 3
  %232 = trunc i64 %indvars.iv93.i to i32
  %mul364.i = mul nuw nsw i32 %231, %232
  %idxprom365.i = zext i32 %mul364.i to i64
  %arrayidx366.i = getelementptr inbounds double, ptr %x, i64 %idxprom365.i
  %233 = load <2 x double>, ptr %arrayidx366.i, align 8, !tbaa !12
  %add370.i = add nuw nsw i32 %mul364.i, 2
  %idxprom371.i = zext i32 %add370.i to i64
  %arrayidx372.i = getelementptr inbounds double, ptr %x, i64 %idxprom371.i
  %234 = load double, ptr %arrayidx372.i, align 8, !tbaa !12
  br i1 %.b533.i, label %if.then375.i, label %if.end379.i

if.then375.i:                                     ; preds = %if.end363.i
  %add376.i = add nuw nsw i32 %mul364.i, 3
  %idxprom377.i = zext i32 %add376.i to i64
  %arrayidx378.i = getelementptr inbounds double, ptr %x, i64 %idxprom377.i
  %235 = load double, ptr %arrayidx378.i, align 8, !tbaa !12
  br label %if.end379.i

if.end379.i:                                      ; preds = %if.then375.i, %if.end363.i
  %wi.3.i = phi double [ %235, %if.then375.i ], [ %wi.248.i, %if.end363.i ]
  %236 = load ptr, ptr @prm, align 8, !tbaa !9
  %Ntypes.i = getelementptr inbounds %struct.parm, ptr %236, i64 0, i32 5
  %237 = load i32, ptr %Ntypes.i, align 4, !tbaa !93
  %Iac.i = getelementptr inbounds %struct.parm, ptr %236, i64 0, i32 59
  %238 = load ptr, ptr %Iac.i, align 8, !tbaa !94
  %arrayidx381.i = getelementptr inbounds i32, ptr %238, i64 %indvars.iv93.i
  %239 = load i32, ptr %arrayidx381.i, align 4, !tbaa !5
  %sub382.i = add nsw i32 %239, -1
  %mul383.i = mul nsw i32 %sub382.i, %237
  %Iblo.i = getelementptr inbounds %struct.parm, ptr %236, i64 0, i32 60
  %240 = load ptr, ptr %Iblo.i, align 8, !tbaa !41
  %arrayidx38620.i = getelementptr inbounds i32, ptr %240, i64 %indvars.iv93.i
  %241 = load i32, ptr %arrayidx38620.i, align 4, !tbaa !5
  %cmp38721.i = icmp sgt i32 %241, 0
  br i1 %cmp38721.i, label %for.body389.lr.ph.i, label %for.body409.lr.ph.i

for.body389.lr.ph.i:                              ; preds = %if.end379.i
  %242 = load ptr, ptr @IexclAt, align 8, !tbaa !9
  %arrayidx391.i = getelementptr inbounds ptr, ptr %242, i64 %indvars.iv93.i
  %243 = load ptr, ptr %arrayidx391.i, align 8, !tbaa !9
  %244 = load ptr, ptr @egb.iexw, align 8, !tbaa !9
  br label %for.body389.i

for.body389.i:                                    ; preds = %for.body389.i, %for.body389.lr.ph.i
  %indvars.iv87.i = phi i64 [ 0, %for.body389.lr.ph.i ], [ %indvars.iv.next88.i, %for.body389.i ]
  %arrayidx393.i = getelementptr inbounds i32, ptr %243, i64 %indvars.iv87.i
  %245 = load i32, ptr %arrayidx393.i, align 4, !tbaa !5
  %sub395.i = add nsw i32 %245, -1
  %idxprom396.i = sext i32 %sub395.i to i64
  %arrayidx397.i = getelementptr inbounds i32, ptr %244, i64 %idxprom396.i
  store i32 %232, ptr %arrayidx397.i, align 4, !tbaa !5
  %indvars.iv.next88.i = add nuw nsw i64 %indvars.iv87.i, 1
  %246 = load i32, ptr %arrayidx38620.i, align 4, !tbaa !5
  %247 = sext i32 %246 to i64
  %cmp387.i = icmp slt i64 %indvars.iv.next88.i, %247
  br i1 %cmp387.i, label %for.body389.i, label %for.body409.lr.ph.i, !llvm.loop !95

for.body409.lr.ph.i:                              ; preds = %for.body389.i, %if.end379.i
  %arrayidx402106.i = getelementptr inbounds i32, ptr %129, i64 %indvars.iv93.i
  %248 = load i32, ptr %arrayidx402106.i, align 4, !tbaa !5
  %arrayidx411.i = getelementptr inbounds ptr, ptr %131, i64 %indvars.iv93.i
  %add503.i = add i32 %mul383.i, -1
  %249 = sext i32 %248 to i64
  br label %for.body409.i

for.body409.i:                                    ; preds = %for.inc564.i, %for.body409.lr.ph.i
  %.b532103.i = phi i1 [ %.b533.i, %for.body409.lr.ph.i ], [ %.b531.i, %for.inc564.i ]
  %indvars.iv90.i = phi i64 [ %249, %for.body409.lr.ph.i ], [ %indvars.iv.next91.i, %for.inc564.i ]
  %epol.233.i = phi double [ %epol.1.i, %for.body409.lr.ph.i ], [ %270, %for.inc564.i ]
  %elec.132.i = phi double [ %elec.050.i, %for.body409.lr.ph.i ], [ %elec.2.i, %for.inc564.i ]
  %evdw.131.i = phi double [ %evdw.049.i, %for.body409.lr.ph.i ], [ %evdw.2.i, %for.inc564.i ]
  %daiz.028.i = phi double [ 0.000000e+00, %for.body409.lr.ph.i ], [ %add534.i, %for.inc564.i ]
  %daiw.027.i = phi double [ 0.000000e+00, %for.body409.lr.ph.i ], [ %daiw.1.i, %for.inc564.i ]
  %wij.426.i = phi double [ %wij.347.i, %for.body409.lr.ph.i ], [ %wij.5.i, %for.inc564.i ]
  %250 = phi <2 x double> [ zeroinitializer, %for.body409.lr.ph.i ], [ %297, %for.inc564.i ]
  %251 = load ptr, ptr %arrayidx411.i, align 8, !tbaa !9
  %cmp412.i = icmp eq ptr %251, null
  br i1 %cmp412.i, label %if.then414.i, label %if.end417.i

if.then414.i:                                     ; preds = %for.body409.i
  %252 = load ptr, ptr @nabout, align 8, !tbaa !9
  %call415.i = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %252, ptr noundef nonnull @.str.82, i32 noundef 0)
  %253 = load ptr, ptr @nabout, align 8, !tbaa !9
  %call416.i = tail call i32 @fflush(ptr noundef %253)
  %.pre.i = load ptr, ptr %arrayidx411.i, align 8, !tbaa !9
  %.b532.pre.i = load i1, ptr @dim, align 4
  br label %if.end417.i

if.end417.i:                                      ; preds = %if.then414.i, %for.body409.i
  %.b532.i = phi i1 [ %.b532.pre.i, %if.then414.i ], [ %.b532103.i, %for.body409.i ]
  %254 = phi ptr [ %.pre.i, %if.then414.i ], [ %251, %for.body409.i ]
  %arrayidx421.i = getelementptr inbounds i32, ptr %254, i64 %indvars.iv90.i
  %255 = load i32, ptr %arrayidx421.i, align 4, !tbaa !5
  %256 = select i1 %.b532.i, i32 4, i32 3
  %mul422.i = mul nsw i32 %255, %256
  %idxprom423.i = sext i32 %mul422.i to i64
  %arrayidx424.i = getelementptr inbounds double, ptr %x, i64 %idxprom423.i
  %257 = load <2 x double>, ptr %arrayidx424.i, align 8, !tbaa !12
  %258 = fsub <2 x double> %233, %257
  %add430.i = add nsw i32 %mul422.i, 2
  %idxprom431.i = sext i32 %add430.i to i64
  %arrayidx432.i = getelementptr inbounds double, ptr %x, i64 %idxprom431.i
  %259 = load double, ptr %arrayidx432.i, align 8, !tbaa !12
  %sub433.i = fsub double %234, %259
  %260 = fmul <2 x double> %258, %258
  %mul435.i = extractelement <2 x double> %260, i64 1
  %261 = extractelement <2 x double> %258, i64 0
  %262 = tail call double @llvm.fmuladd.f64(double %261, double %261, double %mul435.i)
  %263 = tail call double @llvm.fmuladd.f64(double %sub433.i, double %sub433.i, double %262)
  br i1 %.b532.i, label %if.then439.i, label %if.end445.i

if.then439.i:                                     ; preds = %if.end417.i
  %add440.i = add nsw i32 %mul422.i, 3
  %idxprom441.i = sext i32 %add440.i to i64
  %arrayidx442.i = getelementptr inbounds double, ptr %x, i64 %idxprom441.i
  %264 = load double, ptr %arrayidx442.i, align 8, !tbaa !12
  %sub443.i = fsub double %wi.3.i, %264
  %265 = tail call double @llvm.fmuladd.f64(double %sub443.i, double %sub443.i, double %263)
  br label %if.end445.i

if.end445.i:                                      ; preds = %if.then439.i, %if.end417.i
  %r2.1.i = phi double [ %265, %if.then439.i ], [ %263, %if.end417.i ]
  %wij.5.i = phi double [ %sub443.i, %if.then439.i ], [ %wij.426.i, %if.end417.i ]
  %idxprom446.i = sext i32 %255 to i64
  %arrayidx447.i = getelementptr inbounds double, ptr %136, i64 %idxprom446.i
  %266 = load double, ptr %arrayidx447.i, align 8, !tbaa !12
  %mul448.i = fmul double %222, %266
  %267 = load ptr, ptr @egb.reff, align 8, !tbaa !9
  %arrayidx450.i = getelementptr inbounds double, ptr %267, i64 %idxprom446.i
  %268 = load double, ptr %arrayidx450.i, align 8, !tbaa !12
  %mul451.i = fmul double %221, %268
  %fneg452.i = fneg double %r2.1.i
  %mul453.i = fmul double %mul451.i, 4.000000e+00
  %div454.i = fdiv double %fneg452.i, %mul453.i
  %call455.i = tail call double @exp(double noundef %div454.i) #23
  %269 = tail call double @llvm.fmuladd.f64(double %mul451.i, double %call455.i, double %r2.1.i)
  %call457.i = tail call double @sqrt(double noundef %269) #23
  %div458.i = fdiv double 1.000000e+00, %call457.i
  %div461.i = fdiv double -0.000000e+00, %div458.i
  %call462.i = tail call double @exp(double noundef %div461.i) #23
  %div463.i = fdiv double %call462.i, 7.850000e+01
  %sub464.i = fsub double 1.000000e+00, %div463.i
  %fneg465.i = fneg double %mul448.i
  %mul466.i = fmul double %sub464.i, %fneg465.i
  %270 = tail call double @llvm.fmuladd.f64(double %mul466.i, double %div458.i, double %epol.233.i)
  %mul468.i = fmul double %div458.i, %div458.i
  %mul469.i = fmul double %div458.i, %mul468.i
  %mul470.i = fmul double %mul448.i, %mul469.i
  %271 = tail call double @llvm.fmuladd.f64(double %div461.i, double %div463.i, double %sub464.i)
  %mul472.i = fmul double %mul470.i, %271
  %272 = tail call double @llvm.fmuladd.f64(double %call455.i, double -2.500000e-01, double 1.000000e+00)
  %mul474.i = fmul double %272, %mul472.i
  %mul475.i = fmul double %call455.i, 5.000000e-01
  %mul476.i = fmul double %mul475.i, %mul472.i
  %273 = tail call double @llvm.fmuladd.f64(double %r2.1.i, double 2.500000e-01, double %mul451.i)
  %mul478.i = fmul double %273, %mul476.i
  %274 = load ptr, ptr @egb.sumdeijda, align 8, !tbaa !9
  %arrayidx482.i = getelementptr inbounds double, ptr %274, i64 %indvars.iv93.i
  %275 = load double, ptr %arrayidx482.i, align 8, !tbaa !12
  %276 = tail call double @llvm.fmuladd.f64(double %221, double %mul478.i, double %275)
  store double %276, ptr %arrayidx482.i, align 8, !tbaa !12
  %arrayidx486.i = getelementptr inbounds double, ptr %274, i64 %idxprom446.i
  %277 = load double, ptr %arrayidx486.i, align 8, !tbaa !12
  %278 = tail call double @llvm.fmuladd.f64(double %268, double %mul478.i, double %277)
  store double %278, ptr %arrayidx486.i, align 8, !tbaa !12
  %279 = load ptr, ptr @egb.iexw, align 8, !tbaa !9
  %arrayidx489.i = getelementptr inbounds i32, ptr %279, i64 %idxprom446.i
  %280 = load i32, ptr %arrayidx489.i, align 4, !tbaa !5
  %281 = zext i32 %280 to i64
  %cmp490.not.i = icmp eq i64 %indvars.iv93.i, %281
  br i1 %cmp490.not.i, label %if.end528.i, label %if.then492.i

if.then492.i:                                     ; preds = %if.end445.i
  %call493.i = tail call double @sqrt(double noundef %r2.1.i) #23
  %div494.i = fdiv double 1.000000e+00, %call493.i
  %mul495.i = fmul double %div494.i, %div494.i
  %mul496.i = fmul double %mul448.i, %div494.i
  %add497.i = fadd double %elec.132.i, %mul496.i
  %neg499.i = fneg double %mul496.i
  %282 = tail call double @llvm.fmuladd.f64(double %neg499.i, double %mul495.i, double %mul474.i)
  %283 = load ptr, ptr @prm, align 8, !tbaa !9
  %Cno.i = getelementptr inbounds %struct.parm, ptr %283, i64 0, i32 61
  %284 = load ptr, ptr %Cno.i, align 8, !tbaa !96
  %Iac500.i = getelementptr inbounds %struct.parm, ptr %283, i64 0, i32 59
  %285 = load ptr, ptr %Iac500.i, align 8, !tbaa !94
  %arrayidx502.i = getelementptr inbounds i32, ptr %285, i64 %idxprom446.i
  %286 = load i32, ptr %arrayidx502.i, align 4, !tbaa !5
  %sub504.i = add i32 %add503.i, %286
  %idxprom505.i = sext i32 %sub504.i to i64
  %arrayidx506.i = getelementptr inbounds i32, ptr %284, i64 %idxprom505.i
  %287 = load i32, ptr %arrayidx506.i, align 4, !tbaa !5
  %cmp508.i = icmp sgt i32 %287, 0
  br i1 %cmp508.i, label %if.then510.i, label %if.end528.i

if.then510.i:                                     ; preds = %if.then492.i
  %sub507.i = add nsw i32 %287, -1
  %mul511.i = fmul double %mul495.i, %mul495.i
  %mul512.i = fmul double %mul495.i, %mul511.i
  %Cn2.i = getelementptr inbounds %struct.parm, ptr %283, i64 0, i32 48
  %288 = load ptr, ptr %Cn2.i, align 8, !tbaa !97
  %idxprom513.i = zext i32 %sub507.i to i64
  %arrayidx514.i = getelementptr inbounds double, ptr %288, i64 %idxprom513.i
  %289 = load double, ptr %arrayidx514.i, align 8, !tbaa !12
  %mul515.i = fmul double %mul512.i, %289
  %Cn1.i = getelementptr inbounds %struct.parm, ptr %283, i64 0, i32 47
  %290 = load ptr, ptr %Cn1.i, align 8, !tbaa !98
  %arrayidx517.i = getelementptr inbounds double, ptr %290, i64 %idxprom513.i
  %291 = load double, ptr %arrayidx517.i, align 8, !tbaa !12
  %mul518.i = fmul double %mul512.i, %291
  %mul519.i = fmul double %mul512.i, %mul518.i
  %sub520.i = fsub double %mul519.i, %mul515.i
  %add521.i = fadd double %evdw.131.i, %sub520.i
  %neg524.i = fmul double %mul515.i, -6.000000e+00
  %292 = tail call double @llvm.fmuladd.f64(double %mul519.i, double 1.200000e+01, double %neg524.i)
  %neg526.i = fneg double %292
  %293 = tail call double @llvm.fmuladd.f64(double %neg526.i, double %mul495.i, double %282)
  br label %if.end528.i

if.end528.i:                                      ; preds = %if.then510.i, %if.then492.i, %if.end445.i
  %de.0.i = phi double [ %293, %if.then510.i ], [ %282, %if.then492.i ], [ %mul474.i, %if.end445.i ]
  %evdw.2.i = phi double [ %add521.i, %if.then510.i ], [ %evdw.131.i, %if.then492.i ], [ %evdw.131.i, %if.end445.i ]
  %elec.2.i = phi double [ %add497.i, %if.then510.i ], [ %add497.i, %if.then492.i ], [ %elec.132.i, %if.end445.i ]
  %294 = insertelement <2 x double> poison, double %de.0.i, i64 0
  %295 = shufflevector <2 x double> %294, <2 x double> poison, <2 x i32> zeroinitializer
  %296 = fmul <2 x double> %258, %295
  %mul531.i = fmul double %sub433.i, %de.0.i
  %297 = fadd <2 x double> %250, %296
  %add534.i = fadd double %daiz.028.i, %mul531.i
  %.b531.i = load i1, ptr @dim, align 4
  %mul538.i = fmul double %wij.5.i, %de.0.i
  %add539.i = select i1 %.b531.i, double %mul538.i, double -0.000000e+00
  %daiw.1.i = fadd double %daiw.027.i, %add539.i
  %arrayidx543.i = getelementptr inbounds double, ptr %132, i64 %idxprom423.i
  %298 = load <2 x double>, ptr %arrayidx543.i, align 8, !tbaa !12
  %299 = fsub <2 x double> %298, %296
  store <2 x double> %299, ptr %arrayidx543.i, align 8, !tbaa !12
  %arrayidx553.i = getelementptr inbounds double, ptr %132, i64 %idxprom431.i
  %300 = load double, ptr %arrayidx553.i, align 8, !tbaa !12
  %sub554.i = fsub double %300, %mul531.i
  store double %sub554.i, ptr %arrayidx553.i, align 8, !tbaa !12
  br i1 %.b531.i, label %if.then557.i, label %for.inc564.i

if.then557.i:                                     ; preds = %if.end528.i
  %add559.i = add nsw i32 %mul422.i, 3
  %idxprom560.i = sext i32 %add559.i to i64
  %arrayidx561.i = getelementptr inbounds double, ptr %132, i64 %idxprom560.i
  %301 = load double, ptr %arrayidx561.i, align 8, !tbaa !12
  %sub562.i = fsub double %301, %mul538.i
  store double %sub562.i, ptr %arrayidx561.i, align 8, !tbaa !12
  br label %for.inc564.i

for.inc564.i:                                     ; preds = %if.then557.i, %if.end528.i
  %indvars.iv.next91.i = add nsw i64 %indvars.iv90.i, 1
  %302 = load i32, ptr %arrayidx402106.i, align 4, !tbaa !5
  %add406.i = add nsw i32 %302, %230
  %303 = sext i32 %add406.i to i64
  %cmp407.i = icmp slt i64 %indvars.iv.next91.i, %303
  br i1 %cmp407.i, label %for.body409.i, label %for.end566.i, !llvm.loop !99

for.end566.i:                                     ; preds = %for.inc564.i
  %arrayidx569.i = getelementptr inbounds double, ptr %132, i64 %idxprom365.i
  %304 = load <2 x double>, ptr %arrayidx569.i, align 8, !tbaa !12
  %305 = fadd <2 x double> %297, %304
  store <2 x double> %305, ptr %arrayidx569.i, align 8, !tbaa !12
  %arrayidx579.i = getelementptr inbounds double, ptr %132, i64 %idxprom371.i
  %306 = load double, ptr %arrayidx579.i, align 8, !tbaa !12
  %add580.i = fadd double %add534.i, %306
  store double %add580.i, ptr %arrayidx579.i, align 8, !tbaa !12
  br i1 %.b531.i, label %if.then583.i, label %for.inc590.i

if.then583.i:                                     ; preds = %for.end566.i
  %add585.i = add nuw nsw i32 %mul364.i, 3
  %idxprom586.i = zext i32 %add585.i to i64
  %arrayidx587.i = getelementptr inbounds double, ptr %132, i64 %idxprom586.i
  %307 = load double, ptr %arrayidx587.i, align 8, !tbaa !12
  %add588.i = fadd double %daiw.1.i, %307
  store double %add588.i, ptr %arrayidx587.i, align 8, !tbaa !12
  br label %for.inc590.i

for.inc590.i:                                     ; preds = %if.then583.i, %for.end566.i, %if.end357.i
  %wij.6.i = phi double [ %wij.347.i, %if.end357.i ], [ %wij.5.i, %if.then583.i ], [ %wij.5.i, %for.end566.i ]
  %wi.4.i = phi double [ %wi.248.i, %if.end357.i ], [ %wi.3.i, %if.then583.i ], [ %wi.3.i, %for.end566.i ]
  %evdw.3.i = phi double [ %evdw.049.i, %if.end357.i ], [ %evdw.2.i, %if.then583.i ], [ %evdw.2.i, %for.end566.i ]
  %elec.3.i = phi double [ %elec.050.i, %if.end357.i ], [ %elec.2.i, %if.then583.i ], [ %elec.2.i, %for.end566.i ]
  %epol.3.i = phi double [ %epol.1.i, %if.end357.i ], [ %270, %if.then583.i ], [ %270, %for.end566.i ]
  %indvars.iv.next94.i = add nuw nsw i64 %indvars.iv93.i, 1
  %308 = load ptr, ptr @prm, align 8, !tbaa !9
  %Natom324.i = getelementptr inbounds %struct.parm, ptr %308, i64 0, i32 4
  %309 = load i32, ptr %Natom324.i, align 8, !tbaa !27
  %310 = sext i32 %309 to i64
  %cmp325.i = icmp slt i64 %indvars.iv.next94.i, %310
  br i1 %cmp325.i, label %for.body327.i, label %for.cond593.preheader.i, !llvm.loop !100

for.body597.i:                                    ; preds = %for.cond593.preheader.i, %for.inc894.i
  %indvars.iv99.i = phi i64 [ %indvars.iv.next100.i, %for.inc894.i ], [ 0, %for.cond593.preheader.i ]
  %wi.573.i = phi double [ %wi.7.i, %for.inc894.i ], [ %wi.2.lcssa.i, %for.cond593.preheader.i ]
  %wij.772.i = phi double [ %wij.10.i, %for.inc894.i ], [ %wij.3.lcssa.i, %for.cond593.preheader.i ]
  %arrayidx599.i = getelementptr inbounds i32, ptr %129, i64 %indvars.iv99.i
  %311 = load i32, ptr %arrayidx599.i, align 4, !tbaa !5
  %arrayidx601.i = getelementptr inbounds i32, ptr %130, i64 %indvars.iv99.i
  %312 = load i32, ptr %arrayidx601.i, align 4, !tbaa !5
  %add602.i = add i32 %312, %311
  %313 = load ptr, ptr @frozen, align 8, !tbaa !9
  %arrayidx604.i = getelementptr inbounds i32, ptr %313, i64 %indvars.iv99.i
  %314 = load i32, ptr %arrayidx604.i, align 4, !tbaa !5
  %tobool605.i = icmp ne i32 %314, 0
  %cmp607.i = icmp slt i32 %add602.i, 1
  %or.cond1.i = select i1 %tobool605.i, i1 true, i1 %cmp607.i
  br i1 %or.cond1.i, label %for.inc894.i, label %if.end610.i

if.end610.i:                                      ; preds = %for.body597.i
  %.b528.i = load i1, ptr @dim, align 4
  %315 = select i1 %.b528.i, i32 4, i32 3
  %316 = trunc i64 %indvars.iv99.i to i32
  %mul611.i = mul nuw nsw i32 %315, %316
  %idxprom612.i = zext i32 %mul611.i to i64
  %arrayidx613.i = getelementptr inbounds double, ptr %x, i64 %idxprom612.i
  %317 = load <2 x double>, ptr %arrayidx613.i, align 8, !tbaa !12
  %add617.i = add nuw nsw i32 %mul611.i, 2
  %idxprom618.i = zext i32 %add617.i to i64
  %arrayidx619.i = getelementptr inbounds double, ptr %x, i64 %idxprom618.i
  %318 = load double, ptr %arrayidx619.i, align 8, !tbaa !12
  br i1 %.b528.i, label %if.then622.i, label %if.end626.i

if.then622.i:                                     ; preds = %if.end610.i
  %add623.i = add nuw nsw i32 %mul611.i, 3
  %idxprom624.i = zext i32 %add623.i to i64
  %arrayidx625.i = getelementptr inbounds double, ptr %x, i64 %idxprom624.i
  %319 = load double, ptr %arrayidx625.i, align 8, !tbaa !12
  br label %if.end626.i

if.end626.i:                                      ; preds = %if.then622.i, %if.end610.i
  %wi.6.i = phi double [ %319, %if.then622.i ], [ %wi.573.i, %if.end610.i ]
  %arrayidx628.i = getelementptr inbounds double, ptr %135, i64 %indvars.iv99.i
  %320 = load double, ptr %arrayidx628.i, align 8, !tbaa !12
  %sub629.i = fadd double %320, 0xBFB70A3D70A3D70A
  %div630.i = fdiv double 1.000000e+00, %sub629.i
  %321 = load ptr, ptr @egb.sumdeijda, align 8, !tbaa !9
  %arrayidx632.i = getelementptr inbounds double, ptr %321, i64 %indvars.iv99.i
  %322 = load double, ptr %arrayidx632.i, align 8, !tbaa !12
  %323 = load i32, ptr @gb, align 4, !tbaa !5
  %cmp633.i = icmp sgt i32 %323, 1
  br i1 %cmp633.i, label %if.then635.i, label %for.body677.lr.ph.i

if.then635.i:                                     ; preds = %if.end626.i
  %324 = load double, ptr @gbalpha, align 8, !tbaa !12
  %325 = load double, ptr @gbbeta, align 8, !tbaa !12
  %326 = load ptr, ptr @egb.psi, align 8, !tbaa !9
  %arrayidx640.i = getelementptr inbounds double, ptr %326, i64 %indvars.iv99.i
  %327 = load double, ptr %arrayidx640.i, align 8, !tbaa !12
  %neg642.i = fneg double %325
  %328 = tail call double @llvm.fmuladd.f64(double %neg642.i, double %327, double %324)
  %329 = load double, ptr @gbgamma, align 8, !tbaa !12
  %mul645.i = fmul double %327, %329
  %330 = tail call double @llvm.fmuladd.f64(double %mul645.i, double %327, double %328)
  %mul651.i = fmul double %327, %330
  %call652.i = tail call double @tanh(double noundef %mul651.i) #23
  %331 = load double, ptr @gbalpha, align 8, !tbaa !12
  %332 = load double, ptr @gbbeta, align 8, !tbaa !12
  %333 = load ptr, ptr @egb.psi, align 8, !tbaa !9
  %arrayidx655.i = getelementptr inbounds double, ptr %333, i64 %indvars.iv99.i
  %334 = load double, ptr %arrayidx655.i, align 8, !tbaa !12
  %neg657.i = fmul double %332, -2.000000e+00
  %335 = tail call double @llvm.fmuladd.f64(double %neg657.i, double %334, double %331)
  %336 = load double, ptr @gbgamma, align 8, !tbaa !12
  %mul658.i = fmul double %336, 3.000000e+00
  %mul661.i = fmul double %334, %mul658.i
  %337 = tail call double @llvm.fmuladd.f64(double %mul661.i, double %334, double %335)
  %neg666.i = fneg double %call652.i
  %338 = tail call double @llvm.fmuladd.f64(double %neg666.i, double %call652.i, double 1.000000e+00)
  %mul667.i = fmul double %338, %337
  %mul668.i = fmul double %sub629.i, %mul667.i
  %339 = load double, ptr %arrayidx628.i, align 8, !tbaa !12
  %div671.i = fdiv double %mul668.i, %339
  %mul672.i = fmul double %322, %div671.i
  br label %for.body677.lr.ph.i

for.body677.lr.ph.i:                              ; preds = %if.then635.i, %if.end626.i
  %sumda.0.i = phi double [ %mul672.i, %if.then635.i ], [ %322, %if.end626.i ]
  %arrayidx679.i = getelementptr inbounds ptr, ptr %131, i64 %indvars.iv99.i
  %neg791.i = fneg double %sub629.i
  %wide.trip.count.i = zext i32 %add602.i to i64
  br label %for.body677.i

for.body677.i:                                    ; preds = %for.inc864.i, %for.body677.lr.ph.i
  %indvars.iv96.i = phi i64 [ 0, %for.body677.lr.ph.i ], [ %indvars.iv.next97.i, %for.inc864.i ]
  %daiz.161.i = phi double [ 0.000000e+00, %for.body677.lr.ph.i ], [ %daiz.2.i, %for.inc864.i ]
  %daiw.260.i = phi double [ 0.000000e+00, %for.body677.lr.ph.i ], [ %daiw.4.i, %for.inc864.i ]
  %wij.859.i = phi double [ %wij.772.i, %for.body677.lr.ph.i ], [ %wij.9.i, %for.inc864.i ]
  %340 = phi <2 x double> [ zeroinitializer, %for.body677.lr.ph.i ], [ %388, %for.inc864.i ]
  %341 = load ptr, ptr %arrayidx679.i, align 8, !tbaa !9
  %cmp680.i = icmp eq ptr %341, null
  br i1 %cmp680.i, label %if.then682.i, label %if.end685.i

if.then682.i:                                     ; preds = %for.body677.i
  %342 = load ptr, ptr @nabout, align 8, !tbaa !9
  %call683.i = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %342, ptr noundef nonnull @.str.83, i32 noundef 0)
  %343 = load ptr, ptr @nabout, align 8, !tbaa !9
  %call684.i = tail call i32 @fflush(ptr noundef %343)
  %.pre172 = load ptr, ptr %arrayidx679.i, align 8, !tbaa !9
  br label %if.end685.i

if.end685.i:                                      ; preds = %if.then682.i, %for.body677.i
  %344 = phi ptr [ %.pre172, %if.then682.i ], [ %341, %for.body677.i ]
  %arrayidx689.i = getelementptr inbounds i32, ptr %344, i64 %indvars.iv96.i
  %345 = load i32, ptr %arrayidx689.i, align 4, !tbaa !5
  %.b527.i = load i1, ptr @dim, align 4
  %346 = select i1 %.b527.i, i32 4, i32 3
  %mul690.i = mul nsw i32 %346, %345
  %idxprom691.i = sext i32 %mul690.i to i64
  %arrayidx692.i = getelementptr inbounds double, ptr %x, i64 %idxprom691.i
  %347 = load <2 x double>, ptr %arrayidx692.i, align 8, !tbaa !12
  %348 = fsub <2 x double> %317, %347
  %add698.i = add nsw i32 %mul690.i, 2
  %idxprom699.i = sext i32 %add698.i to i64
  %arrayidx700.i = getelementptr inbounds double, ptr %x, i64 %idxprom699.i
  %349 = load double, ptr %arrayidx700.i, align 8, !tbaa !12
  %sub701.i = fsub double %318, %349
  %350 = fmul <2 x double> %348, %348
  %mul703.i = extractelement <2 x double> %350, i64 1
  %351 = extractelement <2 x double> %348, i64 0
  %352 = tail call double @llvm.fmuladd.f64(double %351, double %351, double %mul703.i)
  %353 = tail call double @llvm.fmuladd.f64(double %sub701.i, double %sub701.i, double %352)
  br i1 %.b527.i, label %if.then707.i, label %if.end713.i

if.then707.i:                                     ; preds = %if.end685.i
  %add708.i = add nsw i32 %mul690.i, 3
  %idxprom709.i = sext i32 %add708.i to i64
  %arrayidx710.i = getelementptr inbounds double, ptr %x, i64 %idxprom709.i
  %354 = load double, ptr %arrayidx710.i, align 8, !tbaa !12
  %sub711.i = fsub double %wi.6.i, %354
  %355 = tail call double @llvm.fmuladd.f64(double %sub711.i, double %sub711.i, double %353)
  br label %if.end713.i

if.end713.i:                                      ; preds = %if.then707.i, %if.end685.i
  %r2.2.i = phi double [ %355, %if.then707.i ], [ %353, %if.end685.i ]
  %wij.9.i = phi double [ %sub711.i, %if.then707.i ], [ %wij.859.i, %if.end685.i ]
  %cmp714.i = fcmp ogt double %r2.2.i, %mul34.i
  br i1 %cmp714.i, label %for.inc864.i, label %if.end717.i

if.end717.i:                                      ; preds = %if.end713.i
  %call718.i = tail call double @sqrt(double noundef %r2.2.i) #23
  %div719.i = fdiv double 1.000000e+00, %call718.i
  %mul720.i = fmul double %div719.i, %div719.i
  %mul721.i = fmul double %r2.2.i, %div719.i
  %idxprom722.i = sext i32 %345 to i64
  %arrayidx723.i = getelementptr inbounds double, ptr %134, i64 %idxprom722.i
  %356 = load double, ptr %arrayidx723.i, align 8, !tbaa !12
  %arrayidx725.i = getelementptr inbounds double, ptr %135, i64 %idxprom722.i
  %357 = load double, ptr %arrayidx725.i, align 8, !tbaa !12
  %sub726.i = fadd double %357, 0xBFB70A3D70A3D70A
  %mul727.i = fmul double %356, %sub726.i
  %mul728.i = fmul double %mul727.i, %mul727.i
  %add729.i = fadd double %mul727.i, 2.000000e+01
  %cmp730.i = fcmp ogt double %mul721.i, %add729.i
  br i1 %cmp730.i, label %for.inc864.i, label %if.end733.i

if.end733.i:                                      ; preds = %if.end717.i
  %sub734.i = fsub double 2.000000e+01, %mul727.i
  %cmp735.i = fcmp ogt double %mul721.i, %sub734.i
  br i1 %cmp735.i, label %if.then737.i, label %if.else751.i

if.then737.i:                                     ; preds = %if.end733.i
  %sub738.i = fsub double %mul721.i, %mul727.i
  %div739.i = fdiv double 1.000000e+00, %sub738.i
  %mul740.i = fmul double %div719.i, %mul720.i
  %mul741.i = fmul double %mul740.i, 1.250000e-01
  %add742.i = fadd double %r2.2.i, %mul728.i
  %358 = tail call double @llvm.fmuladd.f64(double %div739.i, double %div739.i, double 0xBF647AE147AE147C)
  %mul746.i = fmul double %div739.i, 2.000000e+01
  %call747.i = tail call double @log(double noundef %mul746.i) #23
  %neg749.i = fmul double %call747.i, -2.000000e+00
  %359 = tail call double @llvm.fmuladd.f64(double %add742.i, double %358, double %neg749.i)
  %mul750.i = fmul double %mul741.i, %359
  br label %if.end831.i

if.else751.i:                                     ; preds = %if.end733.i
  %mul752.i = fmul double %mul727.i, 4.000000e+00
  %cmp753.i = fcmp ogt double %mul721.i, %mul752.i
  br i1 %cmp753.i, label %if.then755.i, label %if.else765.i

if.then755.i:                                     ; preds = %if.else751.i
  %mul756.i = fmul double %mul720.i, %mul728.i
  %360 = tail call double @llvm.fmuladd.f64(double %mul756.i, double 0x4015D1745D1745D1, double 0x4011C71C71C71C72)
  %361 = tail call double @llvm.fmuladd.f64(double %mul756.i, double %360, double 0x400B6DB6DB6DB6DB)
  %362 = tail call double @llvm.fmuladd.f64(double %mul756.i, double %361, double 2.400000e+00)
  %363 = tail call double @llvm.fmuladd.f64(double %mul756.i, double %362, double 0x3FF5555555555555)
  %mul761.i = fmul double %mul727.i, %mul756.i
  %mul762.i = fmul double %mul720.i, %mul761.i
  %mul763.i = fmul double %mul720.i, %mul762.i
  %mul764.i = fmul double %mul763.i, %363
  br label %if.end831.i

if.else765.i:                                     ; preds = %if.else751.i
  %add766.i = fadd double %sub629.i, %mul727.i
  %cmp767.i = fcmp ogt double %mul721.i, %add766.i
  br i1 %cmp767.i, label %if.then769.i, label %if.else782.i

if.then769.i:                                     ; preds = %if.else765.i
  %sub770.i = fsub double %r2.2.i, %mul728.i
  %div771.i = fdiv double 1.000000e+00, %sub770.i
  %mul772.i = fmul double %mul727.i, %div771.i
  %364 = tail call double @llvm.fmuladd.f64(double %mul720.i, double -5.000000e-01, double %div771.i)
  %mul775.i = fmul double %div719.i, 2.500000e-01
  %mul776.i = fmul double %mul775.i, %mul720.i
  %sub777.i = fsub double %mul721.i, %mul727.i
  %add778.i = fadd double %mul721.i, %mul727.i
  %div779.i = fdiv double %sub777.i, %add778.i
  %call780.i = tail call double @log(double noundef %div779.i) #23
  %mul781.i = fmul double %mul776.i, %call780.i
  %365 = tail call double @llvm.fmuladd.f64(double %mul772.i, double %364, double %mul781.i)
  br label %if.end831.i

if.else782.i:                                     ; preds = %if.else765.i
  %sub783.i = fsub double %sub629.i, %mul727.i
  %366 = tail call double @llvm.fabs.f64(double %sub783.i)
  %cmp784.i = fcmp ogt double %mul721.i, %366
  br i1 %cmp784.i, label %if.then786.i, label %if.else805.i

if.then786.i:                                     ; preds = %if.else782.i
  %add787.i = fadd double %mul721.i, %mul727.i
  %div788.i = fdiv double 1.000000e+00, %add787.i
  %mul789.i = fmul double %div719.i, %mul720.i
  %367 = tail call double @llvm.fmuladd.f64(double %neg791.i, double %sub629.i, double %r2.2.i)
  %add792.i = fadd double %367, %mul728.i
  %mul793.i = fmul double %add792.i, -5.000000e-01
  %mul794.i = fmul double %mul789.i, %mul793.i
  %mul795.i = fmul double %div630.i, %mul794.i
  %mul797.i = fmul double %div719.i, %div788.i
  %sub798.i = fsub double %div788.i, %div719.i
  %mul799.i = fmul double %mul797.i, %sub798.i
  %368 = tail call double @llvm.fmuladd.f64(double %mul795.i, double %div630.i, double %mul799.i)
  %mul800.i = fmul double %sub629.i, %div788.i
  %call801.i = tail call double @log(double noundef %mul800.i) #23
  %neg803.i = fneg double %mul789.i
  %369 = tail call double @llvm.fmuladd.f64(double %neg803.i, double %call801.i, double %368)
  %mul804.i = fmul double %369, -2.500000e-01
  br label %if.end831.i

if.else805.i:                                     ; preds = %if.else782.i
  %cmp806.i = fcmp olt double %sub629.i, %mul727.i
  br i1 %cmp806.i, label %if.then808.i, label %if.end831.i

if.then808.i:                                     ; preds = %if.else805.i
  %sub809.i = fsub double %r2.2.i, %mul728.i
  %div810.i = fdiv double 1.000000e+00, %sub809.i
  %mul811.i = fmul double %mul720.i, %mul727.i
  %370 = fmul double %mul727.i, -2.000000e+00
  %371 = fmul double %370, %div810.i
  %neg816.i = fmul double %div810.i, %371
  %372 = tail call double @llvm.fmuladd.f64(double %mul811.i, double %div810.i, double %neg816.i)
  %sub819.i = fsub double %mul727.i, %mul721.i
  %add820.i = fadd double %mul721.i, %mul727.i
  %div821.i = fdiv double %sub819.i, %add820.i
  %call822.i = tail call double @log(double noundef %div821.i) #23
  %373 = fmul double %mul720.i, -5.000000e-01
  %neg824.i = fmul double %div719.i, %373
  %374 = tail call double @llvm.fmuladd.f64(double %neg824.i, double %call822.i, double %372)
  %mul825.i = fmul double %374, -5.000000e-01
  br label %if.end831.i

if.end831.i:                                      ; preds = %if.then808.i, %if.else805.i, %if.then786.i, %if.then769.i, %if.then755.i, %if.then737.i
  %datmp.0.i = phi double [ %mul750.i, %if.then737.i ], [ %mul764.i, %if.then755.i ], [ %365, %if.then769.i ], [ %mul804.i, %if.then786.i ], [ %mul825.i, %if.then808.i ], [ 0.000000e+00, %if.else805.i ]
  %375 = insertelement <2 x double> poison, double %datmp.0.i, i64 0
  %376 = shufflevector <2 x double> %375, <2 x double> poison, <2 x i32> zeroinitializer
  %377 = tail call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %348, <2 x double> %376, <2 x double> %340)
  %378 = tail call double @llvm.fmuladd.f64(double %sub701.i, double %datmp.0.i, double %daiz.161.i)
  %.b526.i = load i1, ptr @dim, align 4
  %mul840.i = fmul double %sumda.0.i, %datmp.0.i
  %arrayidx844.i = getelementptr inbounds double, ptr %132, i64 %idxprom691.i
  %379 = load <2 x double>, ptr %arrayidx844.i, align 8, !tbaa !12
  %380 = insertelement <2 x double> poison, double %mul840.i, i64 0
  %381 = shufflevector <2 x double> %380, <2 x double> poison, <2 x i32> zeroinitializer
  %382 = tail call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %348, <2 x double> %381, <2 x double> %379)
  store <2 x double> %382, ptr %arrayidx844.i, align 8, !tbaa !12
  %arrayidx854.i = getelementptr inbounds double, ptr %132, i64 %idxprom699.i
  %383 = load double, ptr %arrayidx854.i, align 8, !tbaa !12
  %384 = tail call double @llvm.fmuladd.f64(double %sub701.i, double %mul840.i, double %383)
  store double %384, ptr %arrayidx854.i, align 8, !tbaa !12
  br i1 %.b526.i, label %if.then857.i, label %for.inc864.i

if.then857.i:                                     ; preds = %if.end831.i
  %385 = tail call double @llvm.fmuladd.f64(double %wij.9.i, double %datmp.0.i, double %daiw.260.i)
  %add860.i = add nsw i32 %mul690.i, 3
  %idxprom861.i = sext i32 %add860.i to i64
  %arrayidx862.i = getelementptr inbounds double, ptr %132, i64 %idxprom861.i
  %386 = load double, ptr %arrayidx862.i, align 8, !tbaa !12
  %387 = tail call double @llvm.fmuladd.f64(double %wij.9.i, double %mul840.i, double %386)
  store double %387, ptr %arrayidx862.i, align 8, !tbaa !12
  br label %for.inc864.i

for.inc864.i:                                     ; preds = %if.then857.i, %if.end831.i, %if.end717.i, %if.end713.i
  %daiw.4.i = phi double [ %daiw.260.i, %if.end713.i ], [ %daiw.260.i, %if.end717.i ], [ %385, %if.then857.i ], [ %daiw.260.i, %if.end831.i ]
  %daiz.2.i = phi double [ %daiz.161.i, %if.end713.i ], [ %daiz.161.i, %if.end717.i ], [ %378, %if.then857.i ], [ %378, %if.end831.i ]
  %388 = phi <2 x double> [ %340, %if.end713.i ], [ %340, %if.end717.i ], [ %377, %if.then857.i ], [ %377, %if.end831.i ]
  %indvars.iv.next97.i = add nuw nsw i64 %indvars.iv96.i, 1
  %exitcond.not.i = icmp eq i64 %indvars.iv.next97.i, %wide.trip.count.i
  br i1 %exitcond.not.i, label %for.end866.i, label %for.body677.i, !llvm.loop !101

for.end866.i:                                     ; preds = %for.inc864.i
  %arrayidx870.i = getelementptr inbounds double, ptr %132, i64 %idxprom612.i
  %neg871.i = fneg double %sumda.0.i
  %389 = load <2 x double>, ptr %arrayidx870.i, align 8, !tbaa !12
  %390 = insertelement <2 x double> poison, double %neg871.i, i64 0
  %391 = shufflevector <2 x double> %390, <2 x double> poison, <2 x i32> zeroinitializer
  %392 = tail call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %391, <2 x double> %388, <2 x double> %389)
  store <2 x double> %392, ptr %arrayidx870.i, align 8, !tbaa !12
  %arrayidx882.i = getelementptr inbounds double, ptr %132, i64 %idxprom618.i
  %393 = load double, ptr %arrayidx882.i, align 8, !tbaa !12
  %394 = tail call double @llvm.fmuladd.f64(double %neg871.i, double %daiz.2.i, double %393)
  store double %394, ptr %arrayidx882.i, align 8, !tbaa !12
  %.b.i107 = load i1, ptr @dim, align 4
  br i1 %.b.i107, label %if.then886.i, label %for.inc894.i

if.then886.i:                                     ; preds = %for.end866.i
  %add889.i = add nuw nsw i32 %mul611.i, 3
  %idxprom890.i = zext i32 %add889.i to i64
  %arrayidx891.i = getelementptr inbounds double, ptr %132, i64 %idxprom890.i
  %395 = load double, ptr %arrayidx891.i, align 8, !tbaa !12
  %396 = tail call double @llvm.fmuladd.f64(double %neg871.i, double %daiw.4.i, double %395)
  store double %396, ptr %arrayidx891.i, align 8, !tbaa !12
  br label %for.inc894.i

for.inc894.i:                                     ; preds = %if.then886.i, %for.end866.i, %for.body597.i
  %wij.10.i = phi double [ %wij.772.i, %for.body597.i ], [ %wij.9.i, %if.then886.i ], [ %wij.9.i, %for.end866.i ]
  %wi.7.i = phi double [ %wi.573.i, %for.body597.i ], [ %wi.6.i, %if.then886.i ], [ %wi.6.i, %for.end866.i ]
  %indvars.iv.next100.i = add nuw nsw i64 %indvars.iv99.i, 1
  %397 = load ptr, ptr @prm, align 8, !tbaa !9
  %Natom594.i = getelementptr inbounds %struct.parm, ptr %397, i64 0, i32 4
  %398 = load i32, ptr %Natom594.i, align 8, !tbaa !27
  %399 = sext i32 %398 to i64
  %cmp595.i = icmp slt i64 %indvars.iv.next100.i, %399
  br i1 %cmp595.i, label %for.body597.i, label %if.end139, !llvm.loop !102

if.else126:                                       ; preds = %if.end107
  call fastcc void @nbond(ptr noundef %129, ptr noundef %130, ptr noundef %131, i32 noundef 0, ptr noundef %x, ptr noundef %132, ptr noundef nonnull %enb, ptr noundef nonnull %eel, double noundef 1.000000e+00, double noundef 1.000000e+00)
  %400 = load double, ptr %enb, align 8, !tbaa !12
  %401 = load double, ptr %eel, align 8, !tbaa !12
  br label %if.end139

if.end139:                                        ; preds = %for.inc894.i, %for.cond593.preheader.i, %if.else126
  %ene.sroa.35.0 = phi double [ 0.000000e+00, %if.else126 ], [ %epol.0.lcssa.i, %for.cond593.preheader.i ], [ %epol.0.lcssa.i, %for.inc894.i ]
  %ene.sroa.11.0 = phi double [ %401, %if.else126 ], [ %elec.0.lcssa.i, %for.cond593.preheader.i ], [ %elec.0.lcssa.i, %for.inc894.i ]
  %ene.sroa.7.0 = phi double [ %400, %if.else126 ], [ %evdw.0.lcssa.i, %for.cond593.preheader.i ], [ %evdw.0.lcssa.i, %for.inc894.i ]
  %.b96 = load i1, ptr @dim, align 4
  %402 = select i1 %.b96, i32 4, i32 3
  %403 = load ptr, ptr @prm, align 8, !tbaa !9
  %Natom141 = getelementptr inbounds %struct.parm, ptr %403, i64 0, i32 4
  %404 = load i32, ptr %Natom141, align 8, !tbaa !27
  %mul142 = mul nsw i32 %404, %402
  %cmp143124 = icmp sgt i32 %mul142, 0
  br i1 %cmp143124, label %for.body145.lr.ph, label %for.cond153.preheader

for.body145.lr.ph:                                ; preds = %if.end139
  %405 = load ptr, ptr @mme34.grad, align 8, !tbaa !9
  %wide.trip.count143 = zext i32 %mul142 to i64
  %min.iters.check = icmp ult i32 %mul142, 6
  %406 = ptrtoint ptr %405 to i64
  %407 = sub i64 %f188, %406
  %diff.check = icmp ult i64 %407, 32
  %or.cond191 = select i1 %min.iters.check, i1 true, i1 %diff.check
  br i1 %or.cond191, label %for.body145.preheader, label %vector.ph

vector.ph:                                        ; preds = %for.body145.lr.ph
  %n.vec = and i64 %wide.trip.count143, 4294967292
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %408 = getelementptr inbounds double, ptr %405, i64 %index
  %wide.load = load <2 x double>, ptr %408, align 8, !tbaa !12
  %409 = getelementptr inbounds double, ptr %408, i64 2
  %wide.load189 = load <2 x double>, ptr %409, align 8, !tbaa !12
  %410 = getelementptr inbounds double, ptr %f, i64 %index
  store <2 x double> %wide.load, ptr %410, align 8, !tbaa !12
  %411 = getelementptr inbounds double, ptr %410, i64 2
  store <2 x double> %wide.load189, ptr %411, align 8, !tbaa !12
  %index.next = add nuw i64 %index, 4
  %412 = icmp eq i64 %index.next, %n.vec
  br i1 %412, label %middle.block, label %vector.body, !llvm.loop !103

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count143
  br i1 %cmp.n, label %for.cond153.preheader, label %for.body145.preheader

for.body145.preheader:                            ; preds = %for.body145.lr.ph, %middle.block
  %indvars.iv140.ph = phi i64 [ 0, %for.body145.lr.ph ], [ %n.vec, %middle.block ]
  %413 = xor i64 %indvars.iv140.ph, -1
  %414 = add nsw i64 %413, %wide.trip.count143
  %xtraiter196 = and i64 %wide.trip.count143, 3
  %lcmp.mod197.not = icmp eq i64 %xtraiter196, 0
  br i1 %lcmp.mod197.not, label %for.body145.prol.loopexit, label %for.body145.prol

for.body145.prol:                                 ; preds = %for.body145.preheader, %for.body145.prol
  %indvars.iv140.prol = phi i64 [ %indvars.iv.next141.prol, %for.body145.prol ], [ %indvars.iv140.ph, %for.body145.preheader ]
  %prol.iter = phi i64 [ %prol.iter.next, %for.body145.prol ], [ 0, %for.body145.preheader ]
  %arrayidx147.prol = getelementptr inbounds double, ptr %405, i64 %indvars.iv140.prol
  %415 = load double, ptr %arrayidx147.prol, align 8, !tbaa !12
  %arrayidx149.prol = getelementptr inbounds double, ptr %f, i64 %indvars.iv140.prol
  store double %415, ptr %arrayidx149.prol, align 8, !tbaa !12
  %indvars.iv.next141.prol = add nuw nsw i64 %indvars.iv140.prol, 1
  %prol.iter.next = add i64 %prol.iter, 1
  %prol.iter.cmp.not = icmp eq i64 %prol.iter.next, %xtraiter196
  br i1 %prol.iter.cmp.not, label %for.body145.prol.loopexit, label %for.body145.prol, !llvm.loop !106

for.body145.prol.loopexit:                        ; preds = %for.body145.prol, %for.body145.preheader
  %indvars.iv140.unr = phi i64 [ %indvars.iv140.ph, %for.body145.preheader ], [ %indvars.iv.next141.prol, %for.body145.prol ]
  %416 = icmp ult i64 %414, 3
  br i1 %416, label %for.cond153.preheader, label %for.body145

for.cond153.preheader:                            ; preds = %for.body145.prol.loopexit, %for.body145, %middle.block, %if.end139
  %cmp155127 = icmp sgt i32 %404, 0
  br i1 %cmp155127, label %for.body157.lr.ph, label %for.cond186.preheader

for.body157.lr.ph:                                ; preds = %for.cond153.preheader
  %417 = load ptr, ptr @frozen, align 8, !tbaa !9
  %wide.trip.count148 = zext i32 %404 to i64
  br label %for.body157

for.body145:                                      ; preds = %for.body145.prol.loopexit, %for.body145
  %indvars.iv140 = phi i64 [ %indvars.iv.next141.3, %for.body145 ], [ %indvars.iv140.unr, %for.body145.prol.loopexit ]
  %arrayidx147 = getelementptr inbounds double, ptr %405, i64 %indvars.iv140
  %418 = load double, ptr %arrayidx147, align 8, !tbaa !12
  %arrayidx149 = getelementptr inbounds double, ptr %f, i64 %indvars.iv140
  store double %418, ptr %arrayidx149, align 8, !tbaa !12
  %indvars.iv.next141 = add nuw nsw i64 %indvars.iv140, 1
  %arrayidx147.1 = getelementptr inbounds double, ptr %405, i64 %indvars.iv.next141
  %419 = load double, ptr %arrayidx147.1, align 8, !tbaa !12
  %arrayidx149.1 = getelementptr inbounds double, ptr %f, i64 %indvars.iv.next141
  store double %419, ptr %arrayidx149.1, align 8, !tbaa !12
  %indvars.iv.next141.1 = add nuw nsw i64 %indvars.iv140, 2
  %arrayidx147.2 = getelementptr inbounds double, ptr %405, i64 %indvars.iv.next141.1
  %420 = load double, ptr %arrayidx147.2, align 8, !tbaa !12
  %arrayidx149.2 = getelementptr inbounds double, ptr %f, i64 %indvars.iv.next141.1
  store double %420, ptr %arrayidx149.2, align 8, !tbaa !12
  %indvars.iv.next141.2 = add nuw nsw i64 %indvars.iv140, 3
  %arrayidx147.3 = getelementptr inbounds double, ptr %405, i64 %indvars.iv.next141.2
  %421 = load double, ptr %arrayidx147.3, align 8, !tbaa !12
  %arrayidx149.3 = getelementptr inbounds double, ptr %f, i64 %indvars.iv.next141.2
  store double %421, ptr %arrayidx149.3, align 8, !tbaa !12
  %indvars.iv.next141.3 = add nuw nsw i64 %indvars.iv140, 4
  %exitcond144.not.3 = icmp eq i64 %indvars.iv.next141.3, %wide.trip.count143
  br i1 %exitcond144.not.3, label %for.cond153.preheader, label %for.body145, !llvm.loop !107

for.cond186.preheader.loopexit:                   ; preds = %for.inc183
  %.pre179 = select i1 %.b176, i32 4, i32 3
  %.pre180 = mul nsw i32 %.pre179, %404
  br label %for.cond186.preheader

for.cond186.preheader:                            ; preds = %for.cond186.preheader.loopexit, %for.cond153.preheader
  %mul188.pre-phi = phi i32 [ %.pre180, %for.cond186.preheader.loopexit ], [ %mul142, %for.cond153.preheader ]
  %cmp189129 = icmp sgt i32 %mul188.pre-phi, 0
  br i1 %cmp189129, label %for.body191.preheader, label %for.end199

for.body191.preheader:                            ; preds = %for.cond186.preheader
  %wide.trip.count153 = zext i32 %mul188.pre-phi to i64
  %xtraiter198 = and i64 %wide.trip.count153, 3
  %422 = icmp ult i32 %mul188.pre-phi, 4
  br i1 %422, label %for.end199.loopexit.unr-lcssa, label %for.body191.preheader.new

for.body191.preheader.new:                        ; preds = %for.body191.preheader
  %unroll_iter202 = and i64 %wide.trip.count153, 4294967292
  br label %for.body191

for.body157:                                      ; preds = %for.body157.lr.ph, %for.inc183
  %.b177 = phi i1 [ %.b96, %for.body157.lr.ph ], [ %.b176, %for.inc183 ]
  %.b95 = phi i1 [ %.b96, %for.body157.lr.ph ], [ %.b95174, %for.inc183 ]
  %indvars.iv145 = phi i64 [ 0, %for.body157.lr.ph ], [ %indvars.iv.next146, %for.inc183 ]
  %arrayidx159 = getelementptr inbounds i32, ptr %417, i64 %indvars.iv145
  %423 = load i32, ptr %arrayidx159, align 4, !tbaa !5
  %tobool160.not = icmp eq i32 %423, 0
  br i1 %tobool160.not, label %for.inc183, label %if.then161

if.then161:                                       ; preds = %for.body157
  %424 = select i1 %.b95, i32 4, i32 3
  %425 = trunc i64 %indvars.iv145 to i32
  %mul162 = mul nuw nsw i32 %424, %425
  %add163 = add nuw nsw i32 %mul162, 2
  %idxprom164 = zext i32 %add163 to i64
  %arrayidx165 = getelementptr inbounds double, ptr %f, i64 %idxprom164
  store double 0.000000e+00, ptr %arrayidx165, align 8, !tbaa !12
  %idxprom172 = zext i32 %mul162 to i64
  %arrayidx173 = getelementptr inbounds double, ptr %f, i64 %idxprom172
  store <2 x double> zeroinitializer, ptr %arrayidx173, align 8, !tbaa !12
  %.b92 = load i1, ptr @dim, align 4
  br i1 %.b92, label %if.then176, label %for.inc183

if.then176:                                       ; preds = %if.then161
  %mul177 = shl i64 %indvars.iv145, 2
  %add178 = and i64 %mul177, 4294967292
  %idxprom179 = or i64 %add178, 3
  %arrayidx180 = getelementptr inbounds double, ptr %f, i64 %idxprom179
  store double 0.000000e+00, ptr %arrayidx180, align 8, !tbaa !12
  br label %for.inc183

for.inc183:                                       ; preds = %for.body157, %if.then176, %if.then161
  %.b176 = phi i1 [ %.b177, %for.body157 ], [ true, %if.then176 ], [ false, %if.then161 ]
  %.b95174 = phi i1 [ %.b95, %for.body157 ], [ true, %if.then176 ], [ false, %if.then161 ]
  %indvars.iv.next146 = add nuw nsw i64 %indvars.iv145, 1
  %exitcond149.not = icmp eq i64 %indvars.iv.next146, %wide.trip.count148
  br i1 %exitcond149.not, label %for.cond186.preheader.loopexit, label %for.body157, !llvm.loop !108

for.body191:                                      ; preds = %for.body191, %for.body191.preheader.new
  %indvars.iv150 = phi i64 [ 0, %for.body191.preheader.new ], [ %indvars.iv.next151.3, %for.body191 ]
  %frms.0131 = phi double [ 0.000000e+00, %for.body191.preheader.new ], [ %433, %for.body191 ]
  %niter203 = phi i64 [ 0, %for.body191.preheader.new ], [ %niter203.next.3, %for.body191 ]
  %arrayidx193 = getelementptr inbounds double, ptr %f, i64 %indvars.iv150
  %426 = load double, ptr %arrayidx193, align 8, !tbaa !12
  %427 = tail call double @llvm.fmuladd.f64(double %426, double %426, double %frms.0131)
  %indvars.iv.next151 = or i64 %indvars.iv150, 1
  %arrayidx193.1 = getelementptr inbounds double, ptr %f, i64 %indvars.iv.next151
  %428 = load double, ptr %arrayidx193.1, align 8, !tbaa !12
  %429 = tail call double @llvm.fmuladd.f64(double %428, double %428, double %427)
  %indvars.iv.next151.1 = or i64 %indvars.iv150, 2
  %arrayidx193.2 = getelementptr inbounds double, ptr %f, i64 %indvars.iv.next151.1
  %430 = load double, ptr %arrayidx193.2, align 8, !tbaa !12
  %431 = tail call double @llvm.fmuladd.f64(double %430, double %430, double %429)
  %indvars.iv.next151.2 = or i64 %indvars.iv150, 3
  %arrayidx193.3 = getelementptr inbounds double, ptr %f, i64 %indvars.iv.next151.2
  %432 = load double, ptr %arrayidx193.3, align 8, !tbaa !12
  %433 = tail call double @llvm.fmuladd.f64(double %432, double %432, double %431)
  %indvars.iv.next151.3 = add nuw nsw i64 %indvars.iv150, 4
  %niter203.next.3 = add i64 %niter203, 4
  %niter203.ncmp.3 = icmp eq i64 %niter203.next.3, %unroll_iter202
  br i1 %niter203.ncmp.3, label %for.end199.loopexit.unr-lcssa, label %for.body191, !llvm.loop !109

for.end199.loopexit.unr-lcssa:                    ; preds = %for.body191, %for.body191.preheader
  %.lcssa.ph = phi double [ undef, %for.body191.preheader ], [ %433, %for.body191 ]
  %indvars.iv150.unr = phi i64 [ 0, %for.body191.preheader ], [ %indvars.iv.next151.3, %for.body191 ]
  %frms.0131.unr = phi double [ 0.000000e+00, %for.body191.preheader ], [ %433, %for.body191 ]
  %lcmp.mod200.not = icmp eq i64 %xtraiter198, 0
  br i1 %lcmp.mod200.not, label %for.end199, label %for.body191.epil

for.body191.epil:                                 ; preds = %for.end199.loopexit.unr-lcssa, %for.body191.epil
  %indvars.iv150.epil = phi i64 [ %indvars.iv.next151.epil, %for.body191.epil ], [ %indvars.iv150.unr, %for.end199.loopexit.unr-lcssa ]
  %frms.0131.epil = phi double [ %435, %for.body191.epil ], [ %frms.0131.unr, %for.end199.loopexit.unr-lcssa ]
  %epil.iter199 = phi i64 [ %epil.iter199.next, %for.body191.epil ], [ 0, %for.end199.loopexit.unr-lcssa ]
  %arrayidx193.epil = getelementptr inbounds double, ptr %f, i64 %indvars.iv150.epil
  %434 = load double, ptr %arrayidx193.epil, align 8, !tbaa !12
  %435 = tail call double @llvm.fmuladd.f64(double %434, double %434, double %frms.0131.epil)
  %indvars.iv.next151.epil = add nuw nsw i64 %indvars.iv150.epil, 1
  %epil.iter199.next = add i64 %epil.iter199, 1
  %epil.iter199.cmp.not = icmp eq i64 %epil.iter199.next, %xtraiter198
  br i1 %epil.iter199.cmp.not, label %for.end199, label %for.body191.epil, !llvm.loop !110

for.end199:                                       ; preds = %for.end199.loopexit.unr-lcssa, %for.body191.epil, %for.cond186.preheader
  %frms.0.lcssa = phi double [ 0.000000e+00, %for.cond186.preheader ], [ %.lcssa.ph, %for.end199.loopexit.unr-lcssa ], [ %435, %for.body191.epil ]
  %conv202 = sitofp i32 %mul188.pre-phi to double
  %div = fdiv double %frms.0.lcssa, %conv202
  %436 = fcmp olt double %div, 0.000000e+00
  br i1 %436, label %cdce.call, label %cdce.end, !prof !111

cdce.call:                                        ; preds = %for.end199
  %call203 = tail call double @sqrt(double noundef %div) #23
  br label %cdce.end

cdce.end:                                         ; preds = %for.end199, %cdce.call
  %add212 = fadd double %ene.sroa.7.0, 0.000000e+00
  %add212.1 = fadd double %ene.sroa.11.0, %add212
  %add212.2 = fadd double %add68, %add212.1
  %add212.3 = fadd double %add77, %add212.2
  %add212.4 = fadd double %add87, %add212.3
  %add212.6 = fadd double %95, %add212.4
  %add212.7 = fadd double %96, %add212.6
  %add212.8 = fadd double %ecn.0, %add212.7
  %add212.9 = fadd double %ene.sroa.35.0, %add212.8
  %add212.10 = fadd double %add212.9, 0.000000e+00
  %437 = load i32, ptr %iter, align 4, !tbaa !5
  %cmp219 = icmp sgt i32 %437, -1
  br i1 %cmp219, label %land.lhs.true221, label %if.end232

land.lhs.true221:                                 ; preds = %cdce.end
  %cmp222 = icmp eq i32 %437, 0
  %438 = load i32, ptr @max_step, align 4
  %cmp225 = icmp eq i32 %437, %438
  %or.cond102 = select i1 %cmp222, i1 true, i1 %cmp225
  br i1 %or.cond102, label %if.then227, label %cleanup

if.then227:                                       ; preds = %land.lhs.true221
  %439 = load ptr, ptr @nabout, align 8, !tbaa !9
  %call229 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %439, ptr noundef nonnull @.str.66, i32 noundef %437, double noundef %add212.10)
  %440 = load ptr, ptr @nabout, align 8, !tbaa !9
  %call230 = tail call i32 @fflush(ptr noundef %440)
  %.pr118.pre = load i32, ptr %iter, align 4, !tbaa !5
  br label %if.end232

if.end232:                                        ; preds = %if.then227, %cdce.end
  %441 = phi i32 [ %437, %cdce.end ], [ %.pr118.pre, %if.then227 ]
  %cmp233 = icmp eq i32 %441, -1
  br i1 %cmp233, label %if.then235, label %cleanup

if.then235:                                       ; preds = %if.end232
  %442 = load ptr, ptr @nabout, align 8, !tbaa !9
  %call237 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %442, ptr noundef nonnull @.str.67, double noundef %add68)
  %443 = load ptr, ptr @nabout, align 8, !tbaa !9
  %call239 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %443, ptr noundef nonnull @.str.68, double noundef %add77)
  %444 = load ptr, ptr @nabout, align 8, !tbaa !9
  %call241 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %444, ptr noundef nonnull @.str.69, double noundef %add87)
  %445 = load ptr, ptr @nabout, align 8, !tbaa !9
  %call243 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %445, ptr noundef nonnull @.str.70, double noundef %95)
  %446 = load ptr, ptr @nabout, align 8, !tbaa !9
  %call245 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %446, ptr noundef nonnull @.str.71, double noundef %96)
  %447 = load ptr, ptr @nabout, align 8, !tbaa !9
  %call247 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %447, ptr noundef nonnull @.str.72, double noundef %ene.sroa.7.0)
  %448 = load ptr, ptr @nabout, align 8, !tbaa !9
  %call249 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %448, ptr noundef nonnull @.str.73, double noundef %ene.sroa.11.0)
  %449 = load ptr, ptr @nabout, align 8, !tbaa !9
  %call251 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %449, ptr noundef nonnull @.str.74, double noundef %ene.sroa.35.0)
  %450 = load ptr, ptr @nabout, align 8, !tbaa !9
  %call253 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %450, ptr noundef nonnull @.str.75, double noundef %ecn.0)
  %451 = load ptr, ptr @nabout, align 8, !tbaa !9
  %call255 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %451, ptr noundef nonnull @.str.76, double noundef 0.000000e+00)
  %452 = load ptr, ptr @nabout, align 8, !tbaa !9
  %call257 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %452, ptr noundef nonnull @.str.77, double noundef %add212.10)
  br label %cleanup

cleanup:                                          ; preds = %land.lhs.true221, %if.then235, %if.end232, %if.then5, %egb.exit
  %retval.0 = phi double [ 0.000000e+00, %egb.exit ], [ 0.000000e+00, %if.then5 ], [ %add212.10, %if.end232 ], [ %add212.10, %if.then235 ], [ %add212.10, %land.lhs.true221 ]
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %eel14) #23
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %enb14) #23
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %eel) #23
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %enb) #23
  ret double %retval.0
}

; Function Attrs: nounwind uwtable
define dso_local double @mme(ptr noundef %x, ptr nocapture noundef %f, ptr nocapture noundef readonly %iter) local_unnamed_addr #2 {
entry:
  store i1 false, ptr @dim, align 4
  %call = tail call fastcc double @mme34(ptr noundef %x, ptr noundef %f, ptr noundef %iter)
  ret double %call
}

; Function Attrs: nounwind uwtable
define dso_local double @mme4(ptr noundef %x, ptr nocapture noundef %f, ptr nocapture noundef readonly %iter) local_unnamed_addr #2 {
entry:
  store i1 true, ptr @dim, align 4
  %call = tail call fastcc double @mme34(ptr noundef %x, ptr noundef %f, ptr noundef %iter)
  ret double %call
}

; Function Attrs: nofree nounwind uwtable
define dso_local void @mm_set_checkpoint(ptr nocapture noundef readonly %fname) local_unnamed_addr #13 {
entry:
  %0 = load ptr, ptr %fname, align 8, !tbaa !9
  %call.i = tail call i64 @strlen(ptr noundef nonnull dereferenceable(1) %0) #24
  %add.i = add i64 %call.i, 1
  %call1.i = tail call noalias ptr @malloc(i64 noundef %add.i) #26
  %tobool.not.i = icmp eq ptr %call1.i, null
  br i1 %tobool.not.i, label %spec_strdup.exit, label %if.then.i

if.then.i:                                        ; preds = %entry
  %call2.i = tail call ptr @strcpy(ptr noundef nonnull dereferenceable(1) %call1.i, ptr noundef nonnull dereferenceable(1) %0) #23
  br label %spec_strdup.exit

spec_strdup.exit:                                 ; preds = %entry, %if.then.i
  store ptr %call1.i, ptr @chknm, align 8, !tbaa !9
  %1 = load ptr, ptr @nabout, align 8, !tbaa !9
  %call1 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %1, ptr noundef nonnull @.str.60, ptr noundef %0)
  %2 = load ptr, ptr @nabout, align 8, !tbaa !9
  %call2 = tail call i32 @fflush(ptr noundef %2)
  ret void
}

; Function Attrs: nounwind uwtable
define dso_local i32 @md(i32 noundef %n, i32 noundef %maxstep, ptr noundef %x, ptr noundef %f, ptr nocapture noundef %v, ptr nocapture noundef readonly %func) local_unnamed_addr #2 {
entry:
  %x393 = ptrtoint ptr %x to i64
  %f306 = ptrtoint ptr %f to i64
  %sd = alloca double, align 8
  %zero = alloca double, align 8
  %nstep = alloca i32, align 4
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %sd) #23
  call void @llvm.lifetime.start.p0(i64 8, ptr nonnull %zero) #23
  call void @llvm.lifetime.start.p0(i64 4, ptr nonnull %nstep) #23
  %0 = load ptr, ptr @md.minv, align 8, !tbaa !9
  %cmp = icmp eq ptr %0, null
  %1 = load i32, ptr @md.nold, align 4
  %cmp1 = icmp slt i32 %1, %n
  %or.cond = select i1 %cmp, i1 true, i1 %cmp1
  br i1 %or.cond, label %if.then, label %if.end9

if.then:                                          ; preds = %entry
  tail call void @free(ptr noundef %0) #23
  %conv = sext i32 %n to i64
  %call2 = tail call noalias ptr @calloc(i64 noundef %conv, i64 noundef 8) #27
  store ptr %call2, ptr @md.minv, align 8, !tbaa !9
  %cmp3 = icmp eq ptr %call2, null
  br i1 %cmp3, label %if.then5, label %if.end9

if.then5:                                         ; preds = %if.then
  %2 = load ptr, ptr @stderr, align 8, !tbaa !9
  %3 = tail call i64 @fwrite(ptr nonnull @.str.61, i64 34, i64 1, ptr %2) #25
  %4 = load ptr, ptr @stderr, align 8, !tbaa !9
  %call7 = tail call i32 @fflush(ptr noundef %4)
  tail call void @exit(i32 noundef 1) #22
  unreachable

if.end9:                                          ; preds = %entry, %if.then
  %5 = phi ptr [ %0, %entry ], [ %call2, %if.then ]
  %6 = load ptr, ptr @md.xold, align 8, !tbaa !9
  %cmp10 = icmp eq ptr %6, null
  %or.cond196 = select i1 %cmp10, i1 true, i1 %cmp1
  br i1 %or.cond196, label %if.then15, label %if.end43

if.then15:                                        ; preds = %if.end9
  tail call void @free(ptr noundef %6) #23
  %conv16 = sext i32 %n to i64
  %call17 = tail call noalias ptr @calloc(i64 noundef %conv16, i64 noundef 8) #27
  store ptr %call17, ptr @md.xold, align 8, !tbaa !9
  %cmp18 = icmp eq ptr %call17, null
  br i1 %cmp18, label %if.then20, label %if.end43

if.then20:                                        ; preds = %if.then15
  %7 = load ptr, ptr @stderr, align 8, !tbaa !9
  %8 = tail call i64 @fwrite(ptr nonnull @.str.62, i64 34, i64 1, ptr %7) #25
  %9 = load ptr, ptr @stderr, align 8, !tbaa !9
  %call22 = tail call i32 @fflush(ptr noundef %9)
  tail call void @exit(i32 noundef 1) #22
  unreachable

if.end43:                                         ; preds = %if.then15, %if.end9
  %10 = load ptr, ptr @md.accel, align 8, !tbaa !9
  %cmp44 = icmp eq ptr %10, null
  %or.cond197 = select i1 %cmp44, i1 true, i1 %cmp1
  br i1 %or.cond197, label %if.then49, label %if.end59

if.then49:                                        ; preds = %if.end43
  tail call void @free(ptr noundef %10) #23
  %conv50 = sext i32 %n to i64
  %call51 = tail call noalias ptr @calloc(i64 noundef %conv50, i64 noundef 8) #27
  store ptr %call51, ptr @md.accel, align 8, !tbaa !9
  %cmp52 = icmp eq ptr %call51, null
  br i1 %cmp52, label %if.then54, label %if.end59

if.then54:                                        ; preds = %if.then49
  %11 = load ptr, ptr @stderr, align 8, !tbaa !9
  %12 = tail call i64 @fwrite(ptr nonnull @.str.64, i64 35, i64 1, ptr %11) #25
  %13 = load ptr, ptr @stderr, align 8, !tbaa !9
  %call56 = tail call i32 @fflush(ptr noundef %13)
  tail call void @exit(i32 noundef 1) #22
  unreachable

if.end59:                                         ; preds = %if.end43, %if.then49
  store i32 %n, ptr @md.nold, align 4, !tbaa !5
  %14 = load i32, ptr @nfrozen, align 4, !tbaa !5
  %mul61.neg = mul i32 %14, -3
  %sub = add i32 %mul61.neg, %n
  %conv62 = sitofp i32 %sub to double
  %mul63 = fmul double %conv62, 0x3F50477081F334C0
  %mul64 = fmul double %mul63, 1.000000e+02
  store double 0.000000e+00, ptr %zero, align 8, !tbaa !12
  %15 = load ptr, ptr @prm, align 8, !tbaa !9
  %tobool.not = icmp eq ptr %15, null
  br i1 %tobool.not, label %for.cond.preheader, label %if.then78

for.cond.preheader:                               ; preds = %if.end59
  %cmp80202 = icmp sgt i32 %n, 0
  br i1 %cmp80202, label %for.body.lr.ph, label %if.end152.thread

for.body.lr.ph:                                   ; preds = %for.cond.preheader
  %wide.trip.count = zext i32 %n to i64
  %min.iters.check296 = icmp ult i32 %n, 4
  br i1 %min.iters.check296, label %for.body.preheader, label %vector.ph297

vector.ph297:                                     ; preds = %for.body.lr.ph
  %n.vec299 = and i64 %wide.trip.count, 4294967292
  br label %vector.body302

vector.body302:                                   ; preds = %vector.body302, %vector.ph297
  %index303 = phi i64 [ 0, %vector.ph297 ], [ %index.next304, %vector.body302 ]
  %16 = getelementptr inbounds double, ptr %5, i64 %index303
  store <2 x double> <double 1.000000e-01, double 1.000000e-01>, ptr %16, align 8, !tbaa !12
  %17 = getelementptr inbounds double, ptr %16, i64 2
  store <2 x double> <double 1.000000e-01, double 1.000000e-01>, ptr %17, align 8, !tbaa !12
  %index.next304 = add nuw i64 %index303, 4
  %18 = icmp eq i64 %index.next304, %n.vec299
  br i1 %18, label %middle.block294, label %vector.body302, !llvm.loop !112

middle.block294:                                  ; preds = %vector.body302
  %cmp.n301 = icmp eq i64 %n.vec299, %wide.trip.count
  br i1 %cmp.n301, label %if.then97, label %for.body.preheader

for.body.preheader:                               ; preds = %for.body.lr.ph, %middle.block294
  %indvars.iv.ph = phi i64 [ 0, %for.body.lr.ph ], [ %n.vec299, %middle.block294 ]
  br label %for.body

if.then78:                                        ; preds = %if.end59
  %Natom.i = getelementptr inbounds %struct.parm, ptr %15, i64 0, i32 4
  %19 = load i32, ptr %Natom.i, align 8, !tbaa !27
  %cmp14.i = icmp sgt i32 %19, 0
  br i1 %cmp14.i, label %for.body.lr.ph.i, label %if.then97

for.body.lr.ph.i:                                 ; preds = %if.then78
  %Masses.i = getelementptr inbounds %struct.parm, ptr %15, i64 0, i32 38
  %20 = load ptr, ptr %Masses.i, align 8, !tbaa !113
  %.b13.i = load i1, ptr @dim, align 4
  %wide.trip.count35.i = zext i32 %19 to i64
  %min.iters.check280 = icmp eq i32 %19, 1
  br i1 %.b13.i, label %for.body.us.i.preheader, label %for.body.i.preheader

for.body.i.preheader:                             ; preds = %for.body.lr.ph.i
  br i1 %min.iters.check280, label %for.body.i.preheader412, label %vector.memcheck

vector.memcheck:                                  ; preds = %for.body.i.preheader
  %21 = mul nuw nsw i64 %wide.trip.count35.i, 24
  %scevgep = getelementptr i8, ptr %5, i64 %21
  %22 = shl nuw nsw i64 %wide.trip.count35.i, 3
  %scevgep270 = getelementptr i8, ptr %20, i64 %22
  %bound0 = icmp ult ptr %5, %scevgep270
  %bound1 = icmp ult ptr %20, %scevgep
  %found.conflict = and i1 %bound0, %bound1
  br i1 %found.conflict, label %for.body.i.preheader412, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %n.vec = and i64 %wide.trip.count35.i, 4294967294
  %ind.end = mul nuw nsw i64 %n.vec, 3
  %invariant.gep = getelementptr double, ptr %5, i64 -2
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %offset.idx = mul i64 %index, 3
  %23 = getelementptr inbounds double, ptr %20, i64 %index
  %wide.load = load <2 x double>, ptr %23, align 8, !tbaa !12, !alias.scope !114
  %24 = fdiv <2 x double> <double 1.000000e+00, double 1.000000e+00>, %wide.load
  %25 = add nuw nsw i64 %offset.idx, 2
  %gep = getelementptr double, ptr %invariant.gep, i64 %25
  %26 = shufflevector <2 x double> %24, <2 x double> poison, <4 x i32> <i32 0, i32 1, i32 0, i32 1>
  %27 = shufflevector <2 x double> %24, <2 x double> poison, <4 x i32> <i32 0, i32 1, i32 poison, i32 poison>
  %interleaved.vec = shufflevector <4 x double> %26, <4 x double> %27, <6 x i32> <i32 0, i32 2, i32 4, i32 1, i32 3, i32 5>
  store <6 x double> %interleaved.vec, ptr %gep, align 8, !tbaa !12
  %index.next = add nuw i64 %index, 2
  %28 = icmp eq i64 %index.next, %n.vec
  br i1 %28, label %middle.block, label %vector.body, !llvm.loop !117

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.vec, %wide.trip.count35.i
  br i1 %cmp.n, label %if.then97, label %for.body.i.preheader412

for.body.i.preheader412:                          ; preds = %vector.memcheck, %for.body.i.preheader, %middle.block
  %indvars.iv18.i.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %for.body.i.preheader ], [ %ind.end, %middle.block ]
  %indvars.iv.i.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %for.body.i.preheader ], [ %n.vec, %middle.block ]
  %29 = xor i64 %indvars.iv.i.ph, -1
  %xtraiter = and i64 %wide.trip.count35.i, 1
  %lcmp.mod.not = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod.not, label %for.body.i.prol.loopexit, label %for.body.i.prol

for.body.i.prol:                                  ; preds = %for.body.i.preheader412
  %arrayidx.i.prol = getelementptr inbounds double, ptr %20, i64 %indvars.iv.i.ph
  %30 = load double, ptr %arrayidx.i.prol, align 8, !tbaa !12
  %div.i.prol = fdiv double 1.000000e+00, %30
  %arrayidx2.i.prol = getelementptr inbounds double, ptr %5, i64 %indvars.iv18.i.ph
  store double %div.i.prol, ptr %arrayidx2.i.prol, align 8, !tbaa !12
  %31 = add nuw nsw i64 %indvars.iv18.i.ph, 1
  %arrayidx5.i.prol = getelementptr inbounds double, ptr %5, i64 %31
  store double %div.i.prol, ptr %arrayidx5.i.prol, align 8, !tbaa !12
  %32 = add nuw nsw i64 %indvars.iv18.i.ph, 2
  %arrayidx8.i.prol = getelementptr inbounds double, ptr %5, i64 %32
  store double %div.i.prol, ptr %arrayidx8.i.prol, align 8, !tbaa !12
  %indvars.iv.next19.i.prol = add nuw nsw i64 %indvars.iv18.i.ph, 3
  %indvars.iv.next.i.prol = or i64 %indvars.iv.i.ph, 1
  br label %for.body.i.prol.loopexit

for.body.i.prol.loopexit:                         ; preds = %for.body.i.prol, %for.body.i.preheader412
  %indvars.iv18.i.unr = phi i64 [ %indvars.iv18.i.ph, %for.body.i.preheader412 ], [ %indvars.iv.next19.i.prol, %for.body.i.prol ]
  %indvars.iv.i.unr = phi i64 [ %indvars.iv.i.ph, %for.body.i.preheader412 ], [ %indvars.iv.next.i.prol, %for.body.i.prol ]
  %33 = sub nsw i64 0, %wide.trip.count35.i
  %34 = icmp eq i64 %29, %33
  br i1 %34, label %if.then97, label %for.body.i

for.body.us.i.preheader:                          ; preds = %for.body.lr.ph.i
  br i1 %min.iters.check280, label %for.body.us.i.preheader410, label %vector.memcheck272

vector.memcheck272:                               ; preds = %for.body.us.i.preheader
  %35 = shl nuw nsw i64 %wide.trip.count35.i, 5
  %scevgep273 = getelementptr i8, ptr %5, i64 %35
  %36 = shl nuw nsw i64 %wide.trip.count35.i, 3
  %scevgep274 = getelementptr i8, ptr %20, i64 %36
  %bound0275 = icmp ult ptr %5, %scevgep274
  %bound1276 = icmp ult ptr %20, %scevgep273
  %found.conflict277 = and i1 %bound0275, %bound1276
  br i1 %found.conflict277, label %for.body.us.i.preheader410, label %vector.ph281

vector.ph281:                                     ; preds = %vector.memcheck272
  %n.vec283 = and i64 %wide.trip.count35.i, 4294967294
  %ind.end284 = shl nuw nsw i64 %n.vec283, 2
  %invariant.gep424 = getelementptr double, ptr %5, i64 -3
  br label %vector.body288

vector.body288:                                   ; preds = %vector.body288, %vector.ph281
  %index289 = phi i64 [ 0, %vector.ph281 ], [ %index.next293, %vector.body288 ]
  %offset.idx290 = shl i64 %index289, 2
  %37 = getelementptr inbounds double, ptr %20, i64 %index289
  %wide.load291 = load <2 x double>, ptr %37, align 8, !tbaa !12, !alias.scope !118
  %38 = fdiv <2 x double> <double 1.000000e+00, double 1.000000e+00>, %wide.load291
  %39 = or i64 %offset.idx290, 3
  %gep425 = getelementptr double, ptr %invariant.gep424, i64 %39
  %40 = shufflevector <2 x double> %38, <2 x double> poison, <4 x i32> <i32 0, i32 1, i32 0, i32 1>
  %41 = shufflevector <4 x double> %40, <4 x double> poison, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec292 = shufflevector <8 x double> %41, <8 x double> poison, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec292, ptr %gep425, align 8, !tbaa !12
  %index.next293 = add nuw i64 %index289, 2
  %42 = icmp eq i64 %index.next293, %n.vec283
  br i1 %42, label %middle.block278, label %vector.body288, !llvm.loop !121

middle.block278:                                  ; preds = %vector.body288
  %cmp.n287 = icmp eq i64 %n.vec283, %wide.trip.count35.i
  br i1 %cmp.n287, label %if.then97, label %for.body.us.i.preheader410

for.body.us.i.preheader410:                       ; preds = %vector.memcheck272, %for.body.us.i.preheader, %middle.block278
  %indvars.iv27.i.ph = phi i64 [ 0, %vector.memcheck272 ], [ 0, %for.body.us.i.preheader ], [ %ind.end284, %middle.block278 ]
  %indvars.iv25.i.ph = phi i64 [ 0, %vector.memcheck272 ], [ 0, %for.body.us.i.preheader ], [ %n.vec283, %middle.block278 ]
  br label %for.body.us.i

for.body.us.i:                                    ; preds = %for.body.us.i.preheader410, %for.body.us.i
  %indvars.iv27.i = phi i64 [ %indvars.iv.next28.i, %for.body.us.i ], [ %indvars.iv27.i.ph, %for.body.us.i.preheader410 ]
  %indvars.iv25.i = phi i64 [ %indvars.iv.next26.i, %for.body.us.i ], [ %indvars.iv25.i.ph, %for.body.us.i.preheader410 ]
  %arrayidx.us.i = getelementptr inbounds double, ptr %20, i64 %indvars.iv25.i
  %43 = load double, ptr %arrayidx.us.i, align 8, !tbaa !12
  %div.us.i = fdiv double 1.000000e+00, %43
  %arrayidx2.us.i = getelementptr inbounds double, ptr %5, i64 %indvars.iv27.i
  store double %div.us.i, ptr %arrayidx2.us.i, align 8, !tbaa !12
  %44 = or i64 %indvars.iv27.i, 1
  %arrayidx5.us.i = getelementptr inbounds double, ptr %5, i64 %44
  store double %div.us.i, ptr %arrayidx5.us.i, align 8, !tbaa !12
  %45 = or i64 %indvars.iv27.i, 2
  %arrayidx8.us.i = getelementptr inbounds double, ptr %5, i64 %45
  store double %div.us.i, ptr %arrayidx8.us.i, align 8, !tbaa !12
  %46 = or i64 %indvars.iv27.i, 3
  %arrayidx12.us.i = getelementptr inbounds double, ptr %5, i64 %46
  store double %div.us.i, ptr %arrayidx12.us.i, align 8, !tbaa !12
  %indvars.iv.next28.i = add nuw nsw i64 %indvars.iv27.i, 4
  %indvars.iv.next26.i = add nuw nsw i64 %indvars.iv25.i, 1
  %exitcond36.not.i = icmp eq i64 %indvars.iv.next26.i, %wide.trip.count35.i
  br i1 %exitcond36.not.i, label %if.then97, label %for.body.us.i, !llvm.loop !122

for.body.i:                                       ; preds = %for.body.i.prol.loopexit, %for.body.i
  %indvars.iv18.i = phi i64 [ %indvars.iv.next19.i.1, %for.body.i ], [ %indvars.iv18.i.unr, %for.body.i.prol.loopexit ]
  %indvars.iv.i = phi i64 [ %indvars.iv.next.i.1, %for.body.i ], [ %indvars.iv.i.unr, %for.body.i.prol.loopexit ]
  %arrayidx.i = getelementptr inbounds double, ptr %20, i64 %indvars.iv.i
  %47 = load double, ptr %arrayidx.i, align 8, !tbaa !12
  %div.i = fdiv double 1.000000e+00, %47
  %arrayidx2.i = getelementptr inbounds double, ptr %5, i64 %indvars.iv18.i
  store double %div.i, ptr %arrayidx2.i, align 8, !tbaa !12
  %48 = add nuw nsw i64 %indvars.iv18.i, 1
  %arrayidx5.i = getelementptr inbounds double, ptr %5, i64 %48
  store double %div.i, ptr %arrayidx5.i, align 8, !tbaa !12
  %49 = add nuw nsw i64 %indvars.iv18.i, 2
  %arrayidx8.i = getelementptr inbounds double, ptr %5, i64 %49
  store double %div.i, ptr %arrayidx8.i, align 8, !tbaa !12
  %indvars.iv.next19.i = add nuw nsw i64 %indvars.iv18.i, 3
  %indvars.iv.next.i = add nuw nsw i64 %indvars.iv.i, 1
  %arrayidx.i.1 = getelementptr inbounds double, ptr %20, i64 %indvars.iv.next.i
  %50 = load double, ptr %arrayidx.i.1, align 8, !tbaa !12
  %div.i.1 = fdiv double 1.000000e+00, %50
  %arrayidx2.i.1 = getelementptr inbounds double, ptr %5, i64 %indvars.iv.next19.i
  store double %div.i.1, ptr %arrayidx2.i.1, align 8, !tbaa !12
  %51 = add nuw nsw i64 %indvars.iv18.i, 4
  %arrayidx5.i.1 = getelementptr inbounds double, ptr %5, i64 %51
  store double %div.i.1, ptr %arrayidx5.i.1, align 8, !tbaa !12
  %52 = add nuw nsw i64 %indvars.iv18.i, 5
  %arrayidx8.i.1 = getelementptr inbounds double, ptr %5, i64 %52
  store double %div.i.1, ptr %arrayidx8.i.1, align 8, !tbaa !12
  %indvars.iv.next19.i.1 = add nuw nsw i64 %indvars.iv18.i, 6
  %indvars.iv.next.i.1 = add nuw nsw i64 %indvars.iv.i, 2
  %exitcond.not.i.1 = icmp eq i64 %indvars.iv.next.i.1, %wide.trip.count35.i
  br i1 %exitcond.not.i.1, label %if.then97, label %for.body.i, !llvm.loop !123

for.body:                                         ; preds = %for.body.preheader, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ %indvars.iv.ph, %for.body.preheader ]
  %arrayidx = getelementptr inbounds double, ptr %5, i64 %indvars.iv
  store double 1.000000e-01, ptr %arrayidx, align 8, !tbaa !12
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %if.then97, label %for.body, !llvm.loop !124

if.then97:                                        ; preds = %for.body.i.prol.loopexit, %for.body.i, %for.body.us.i, %for.body, %middle.block, %middle.block278, %middle.block294, %if.then78
  %cmp99204 = icmp sgt i32 %n, 0
  br i1 %cmp99204, label %for.body101.preheader, label %if.end152.thread

for.body101.preheader:                            ; preds = %if.then97
  %wide.trip.count228 = zext i32 %n to i64
  %.b.pre255 = load i1, ptr @dim, align 4
  br label %for.body101

for.body101:                                      ; preds = %for.body101.preheader, %for.inc128
  %53 = phi ptr [ %5, %for.body101.preheader ], [ %61, %for.inc128 ]
  %.b = phi i1 [ %.b.pre255, %for.body101.preheader ], [ %.b256, %for.inc128 ]
  %indvars.iv225 = phi i64 [ 0, %for.body101.preheader ], [ %indvars.iv.next226, %for.inc128 ]
  %ekin.0205 = phi double [ 0.000000e+00, %for.body101.preheader ], [ %ekin.1, %for.inc128 ]
  %54 = load ptr, ptr @frozen, align 8, !tbaa !9
  %55 = select i1 %.b, i32 4, i32 3
  %56 = trunc i64 %indvars.iv225 to i32
  %div102 = udiv i32 %56, %55
  %idxprom103 = zext i32 %div102 to i64
  %arrayidx104 = getelementptr inbounds i32, ptr %54, i64 %idxprom103
  %57 = load i32, ptr %arrayidx104, align 4, !tbaa !5
  %tobool105.not = icmp eq i32 %57, 0
  br i1 %tobool105.not, label %if.else109, label %if.then106

if.then106:                                       ; preds = %for.body101
  %arrayidx108 = getelementptr inbounds double, ptr %v, i64 %indvars.iv225
  store double 0.000000e+00, ptr %arrayidx108, align 8, !tbaa !12
  br label %for.inc128

if.else109:                                       ; preds = %for.body101
  %arrayidx113 = getelementptr inbounds double, ptr %53, i64 %indvars.iv225
  %58 = load double, ptr %arrayidx113, align 8, !tbaa !12
  %mul114 = fmul double %58, 0x3FB96F9FCB0C026C
  %call115 = call double @sqrt(double noundef %mul114) #23
  store double %call115, ptr %sd, align 8, !tbaa !12
  %call116 = call double @gauss(ptr noundef nonnull %zero, ptr noundef nonnull %sd) #23
  %arrayidx118 = getelementptr inbounds double, ptr %v, i64 %indvars.iv225
  store double %call116, ptr %arrayidx118, align 8, !tbaa !12
  %mul123 = fmul double %call116, %call116
  %59 = load ptr, ptr @md.minv, align 8, !tbaa !9
  %arrayidx125 = getelementptr inbounds double, ptr %59, i64 %indvars.iv225
  %60 = load double, ptr %arrayidx125, align 8, !tbaa !12
  %div126 = fdiv double %mul123, %60
  %add = fadd double %ekin.0205, %div126
  %.b.pre = load i1, ptr @dim, align 4
  br label %for.inc128

for.inc128:                                       ; preds = %if.then106, %if.else109
  %61 = phi ptr [ %53, %if.then106 ], [ %59, %if.else109 ]
  %.b256 = phi i1 [ %.b, %if.then106 ], [ %.b.pre, %if.else109 ]
  %ekin.1 = phi double [ %ekin.0205, %if.then106 ], [ %add, %if.else109 ]
  %indvars.iv.next226 = add nuw nsw i64 %indvars.iv225, 1
  %exitcond229.not = icmp eq i64 %indvars.iv.next226, %wide.trip.count228
  br i1 %exitcond229.not, label %if.end152, label %for.body101, !llvm.loop !125

if.end152.thread:                                 ; preds = %if.then97, %for.cond.preheader
  store i32 0, ptr %nstep, align 4, !tbaa !5
  %call156262 = call double %func(ptr noundef %x, ptr noundef %f, ptr noundef nonnull %nstep) #23
  br label %if.end213

if.end152:                                        ; preds = %for.inc128
  store i32 0, ptr %nstep, align 4, !tbaa !5
  %call156 = call double %func(ptr noundef %x, ptr noundef %f, ptr noundef nonnull %nstep) #23
  br i1 %cmp99204, label %for.body164.lr.ph, label %if.end213

for.body164.lr.ph:                                ; preds = %if.end152
  %62 = load ptr, ptr @md.minv, align 8, !tbaa !9
  %63 = load ptr, ptr @md.accel, align 8, !tbaa !9
  %wide.trip.count233 = zext i32 %n to i64
  %min.iters.check310 = icmp ult i32 %n, 6
  br i1 %min.iters.check310, label %for.body164.preheader, label %vector.memcheck305

vector.memcheck305:                               ; preds = %for.body164.lr.ph
  %64 = ptrtoint ptr %63 to i64
  %65 = ptrtoint ptr %62 to i64
  %66 = sub i64 %64, %f306
  %diff.check = icmp ult i64 %66, 32
  %67 = sub i64 %64, %65
  %diff.check307 = icmp ult i64 %67, 32
  %conflict.rdx = or i1 %diff.check, %diff.check307
  br i1 %conflict.rdx, label %for.body164.preheader, label %vector.ph311

vector.ph311:                                     ; preds = %vector.memcheck305
  %n.vec313 = and i64 %wide.trip.count228, 4294967292
  br label %vector.body316

vector.body316:                                   ; preds = %vector.body316, %vector.ph311
  %index317 = phi i64 [ 0, %vector.ph311 ], [ %index.next322, %vector.body316 ]
  %68 = getelementptr inbounds double, ptr %f, i64 %index317
  %wide.load318 = load <2 x double>, ptr %68, align 8, !tbaa !12
  %69 = getelementptr inbounds double, ptr %68, i64 2
  %wide.load319 = load <2 x double>, ptr %69, align 8, !tbaa !12
  %70 = fneg <2 x double> %wide.load318
  %71 = fneg <2 x double> %wide.load319
  %72 = getelementptr inbounds double, ptr %62, i64 %index317
  %wide.load320 = load <2 x double>, ptr %72, align 8, !tbaa !12
  %73 = getelementptr inbounds double, ptr %72, i64 2
  %wide.load321 = load <2 x double>, ptr %73, align 8, !tbaa !12
  %74 = fmul <2 x double> %wide.load320, %70
  %75 = fmul <2 x double> %wide.load321, %71
  %76 = fmul <2 x double> %74, <double 0x3F84F227D028A1DF, double 0x3F84F227D028A1DF>
  %77 = fmul <2 x double> %75, <double 0x3F84F227D028A1DF, double 0x3F84F227D028A1DF>
  %78 = getelementptr inbounds double, ptr %63, i64 %index317
  store <2 x double> %76, ptr %78, align 8, !tbaa !12
  %79 = getelementptr inbounds double, ptr %78, i64 2
  store <2 x double> %77, ptr %79, align 8, !tbaa !12
  %index.next322 = add nuw i64 %index317, 4
  %80 = icmp eq i64 %index.next322, %n.vec313
  br i1 %80, label %middle.block308, label %vector.body316, !llvm.loop !126

middle.block308:                                  ; preds = %vector.body316
  %cmp.n315 = icmp eq i64 %n.vec313, %wide.trip.count228
  br i1 %cmp.n315, label %if.end213, label %for.body164.preheader

for.body164.preheader:                            ; preds = %vector.memcheck305, %for.body164.lr.ph, %middle.block308
  %indvars.iv230.ph = phi i64 [ 0, %vector.memcheck305 ], [ 0, %for.body164.lr.ph ], [ %n.vec313, %middle.block308 ]
  %81 = xor i64 %indvars.iv230.ph, -1
  %xtraiter414 = and i64 %wide.trip.count228, 1
  %lcmp.mod415.not = icmp eq i64 %xtraiter414, 0
  br i1 %lcmp.mod415.not, label %for.body164.prol.loopexit, label %for.body164.prol

for.body164.prol:                                 ; preds = %for.body164.preheader
  %arrayidx166.prol = getelementptr inbounds double, ptr %f, i64 %indvars.iv230.ph
  %82 = load double, ptr %arrayidx166.prol, align 8, !tbaa !12
  %fneg.prol = fneg double %82
  %arrayidx168.prol = getelementptr inbounds double, ptr %62, i64 %indvars.iv230.ph
  %83 = load double, ptr %arrayidx168.prol, align 8, !tbaa !12
  %mul169.prol = fmul double %83, %fneg.prol
  %mul170.prol = fmul double %mul169.prol, 0x3F84F227D028A1DF
  %arrayidx172.prol = getelementptr inbounds double, ptr %63, i64 %indvars.iv230.ph
  store double %mul170.prol, ptr %arrayidx172.prol, align 8, !tbaa !12
  %indvars.iv.next231.prol = or i64 %indvars.iv230.ph, 1
  br label %for.body164.prol.loopexit

for.body164.prol.loopexit:                        ; preds = %for.body164.prol, %for.body164.preheader
  %indvars.iv230.unr = phi i64 [ %indvars.iv230.ph, %for.body164.preheader ], [ %indvars.iv.next231.prol, %for.body164.prol ]
  %84 = sub nsw i64 0, %wide.trip.count228
  %85 = icmp eq i64 %81, %84
  br i1 %85, label %if.end213, label %for.body164

for.body164:                                      ; preds = %for.body164.prol.loopexit, %for.body164
  %indvars.iv230 = phi i64 [ %indvars.iv.next231.1, %for.body164 ], [ %indvars.iv230.unr, %for.body164.prol.loopexit ]
  %arrayidx166 = getelementptr inbounds double, ptr %f, i64 %indvars.iv230
  %86 = load double, ptr %arrayidx166, align 8, !tbaa !12
  %fneg = fneg double %86
  %arrayidx168 = getelementptr inbounds double, ptr %62, i64 %indvars.iv230
  %87 = load double, ptr %arrayidx168, align 8, !tbaa !12
  %mul169 = fmul double %87, %fneg
  %mul170 = fmul double %mul169, 0x3F84F227D028A1DF
  %arrayidx172 = getelementptr inbounds double, ptr %63, i64 %indvars.iv230
  store double %mul170, ptr %arrayidx172, align 8, !tbaa !12
  %indvars.iv.next231 = add nuw nsw i64 %indvars.iv230, 1
  %arrayidx166.1 = getelementptr inbounds double, ptr %f, i64 %indvars.iv.next231
  %88 = load double, ptr %arrayidx166.1, align 8, !tbaa !12
  %fneg.1 = fneg double %88
  %arrayidx168.1 = getelementptr inbounds double, ptr %62, i64 %indvars.iv.next231
  %89 = load double, ptr %arrayidx168.1, align 8, !tbaa !12
  %mul169.1 = fmul double %89, %fneg.1
  %mul170.1 = fmul double %mul169.1, 0x3F84F227D028A1DF
  %arrayidx172.1 = getelementptr inbounds double, ptr %63, i64 %indvars.iv.next231
  store double %mul170.1, ptr %arrayidx172.1, align 8, !tbaa !12
  %indvars.iv.next231.1 = add nuw nsw i64 %indvars.iv230, 2
  %exitcond234.not.1 = icmp eq i64 %indvars.iv.next231.1, %wide.trip.count233
  br i1 %exitcond234.not.1, label %if.end213, label %for.body164, !llvm.loop !127

if.end213:                                        ; preds = %for.body164.prol.loopexit, %for.body164, %middle.block308, %if.end152.thread, %if.end152
  %ekin.0.lcssa264 = phi double [ 0.000000e+00, %if.end152.thread ], [ %ekin.1, %if.end152 ], [ %ekin.1, %middle.block308 ], [ %ekin.1, %for.body164 ], [ %ekin.1, %for.body164.prol.loopexit ]
  %cmp99204259263 = phi i1 [ false, %if.end152.thread ], [ false, %if.end152 ], [ %cmp99204, %middle.block308 ], [ %cmp99204, %for.body164 ], [ %cmp99204, %for.body164.prol.loopexit ]
  store i32 %maxstep, ptr @max_step, align 4, !tbaa !5
  store i32 1, ptr %nstep, align 4, !tbaa !5
  %cmp215.not220 = icmp slt i32 %maxstep, 1
  br i1 %cmp215.not220, label %for.end439, label %for.body217.lr.ph

for.body217.lr.ph:                                ; preds = %if.end213
  %wide.trip.count238 = zext i32 %n to i64
  %wide.trip.count243 = zext i32 %n to i64
  %wide.trip.count248 = zext i32 %n to i64
  %90 = shl nuw nsw i64 %wide.trip.count238, 3
  %scevgep325 = getelementptr i8, ptr %v, i64 %90
  %scevgep326 = getelementptr i8, ptr %f, i64 %90
  %91 = shl nuw nsw i64 %wide.trip.count238, 3
  %scevgep362 = getelementptr i8, ptr %v, i64 %91
  %scevgep363 = getelementptr i8, ptr %x, i64 %91
  %92 = add nsw i64 %wide.trip.count238, -1
  %min.iters.check397 = icmp ult i32 %n, 6
  %n.vec400 = and i64 %wide.trip.count238, 4294967292
  %cmp.n402 = icmp eq i64 %n.vec400, %wide.trip.count238
  %xtraiter416 = and i64 %wide.trip.count238, 3
  %lcmp.mod417.not = icmp eq i64 %xtraiter416, 0
  %min.iters.check378 = icmp ult i32 %n, 6
  %bound0365 = icmp ugt ptr %scevgep363, %v
  %bound1366 = icmp ugt ptr %scevgep362, %x
  %found.conflict367 = and i1 %bound0365, %bound1366
  %n.vec381 = and i64 %wide.trip.count238, 4294967294
  %cmp.n383 = icmp eq i64 %n.vec381, %wide.trip.count238
  %min.iters.check349 = icmp ult i32 %n, 12
  %bound0339 = icmp ugt ptr %scevgep326, %v
  %bound1340 = icmp ugt ptr %scevgep325, %f
  %found.conflict341 = and i1 %bound0339, %bound1340
  %n.vec352 = and i64 %wide.trip.count238, 4294967294
  %cmp.n354 = icmp eq i64 %n.vec352, %wide.trip.count238
  %xtraiter418 = and i64 %wide.trip.count238, 1
  %lcmp.mod419.not = icmp eq i64 %xtraiter418, 0
  %93 = sub nsw i64 0, %wide.trip.count238
  %xtraiter421 = and i64 %wide.trip.count238, 3
  %94 = icmp ult i64 %92, 3
  %unroll_iter = and i64 %wide.trip.count238, 4294967292
  %lcmp.mod422.not = icmp eq i64 %xtraiter421, 0
  br label %for.body217

for.body217:                                      ; preds = %for.body217.lr.ph, %if.end420
  %ekin.4221.in = phi double [ %ekin.0.lcssa264, %for.body217.lr.ph ], [ %ekin.5.lcssa, %if.end420 ]
  %ekin.4221 = fmul double %ekin.4221.in, 5.000000e-01
  %cmp218 = fcmp ogt double %ekin.4221, 1.000000e-02
  br i1 %cmp218, label %if.then220, label %if.end226

if.then220:                                       ; preds = %for.body217
  %div221 = fdiv double %mul64, %ekin.4221
  %sub222 = fadd double %div221, -1.000000e+00
  %95 = call double @llvm.fmuladd.f64(double %sub222, double 2.500000e-03, double 1.000000e+00)
  %call224 = call double @sqrt(double noundef %95) #23
  br label %if.end226

if.end226:                                        ; preds = %for.body217, %if.then220
  %tscal.0 = phi double [ %call224, %if.then220 ], [ 1.000000e+00, %for.body217 ]
  br i1 %cmp99204259263, label %for.body230.lr.ph, label %if.end329.thread

for.body230.lr.ph:                                ; preds = %if.end226
  %96 = load ptr, ptr @md.xold, align 8, !tbaa !9
  %97 = ptrtoint ptr %96 to i64
  %98 = sub i64 %97, %x393
  %diff.check394 = icmp ult i64 %98, 32
  %or.cond409 = select i1 %min.iters.check397, i1 true, i1 %diff.check394
  br i1 %or.cond409, label %for.body230.preheader, label %vector.body403

vector.body403:                                   ; preds = %for.body230.lr.ph, %vector.body403
  %index404 = phi i64 [ %index.next407, %vector.body403 ], [ 0, %for.body230.lr.ph ]
  %99 = getelementptr inbounds double, ptr %x, i64 %index404
  %wide.load405 = load <2 x double>, ptr %99, align 8, !tbaa !12
  %100 = getelementptr inbounds double, ptr %99, i64 2
  %wide.load406 = load <2 x double>, ptr %100, align 8, !tbaa !12
  %101 = getelementptr inbounds double, ptr %96, i64 %index404
  store <2 x double> %wide.load405, ptr %101, align 8, !tbaa !12
  %102 = getelementptr inbounds double, ptr %101, i64 2
  store <2 x double> %wide.load406, ptr %102, align 8, !tbaa !12
  %index.next407 = add nuw i64 %index404, 4
  %103 = icmp eq i64 %index.next407, %n.vec400
  br i1 %103, label %middle.block395, label %vector.body403, !llvm.loop !128

middle.block395:                                  ; preds = %vector.body403
  br i1 %cmp.n402, label %for.cond241.preheader, label %for.body230.preheader

for.body230.preheader:                            ; preds = %for.body230.lr.ph, %middle.block395
  %indvars.iv235.ph = phi i64 [ 0, %for.body230.lr.ph ], [ %n.vec400, %middle.block395 ]
  %104 = sub nsw i64 %92, %indvars.iv235.ph
  br i1 %lcmp.mod417.not, label %for.body230.prol.loopexit, label %for.body230.prol

for.body230.prol:                                 ; preds = %for.body230.preheader, %for.body230.prol
  %indvars.iv235.prol = phi i64 [ %indvars.iv.next236.prol, %for.body230.prol ], [ %indvars.iv235.ph, %for.body230.preheader ]
  %prol.iter = phi i64 [ %prol.iter.next, %for.body230.prol ], [ 0, %for.body230.preheader ]
  %arrayidx232.prol = getelementptr inbounds double, ptr %x, i64 %indvars.iv235.prol
  %105 = load double, ptr %arrayidx232.prol, align 8, !tbaa !12
  %arrayidx234.prol = getelementptr inbounds double, ptr %96, i64 %indvars.iv235.prol
  store double %105, ptr %arrayidx234.prol, align 8, !tbaa !12
  %indvars.iv.next236.prol = add nuw nsw i64 %indvars.iv235.prol, 1
  %prol.iter.next = add i64 %prol.iter, 1
  %prol.iter.cmp.not = icmp eq i64 %prol.iter.next, %xtraiter416
  br i1 %prol.iter.cmp.not, label %for.body230.prol.loopexit, label %for.body230.prol, !llvm.loop !129

for.body230.prol.loopexit:                        ; preds = %for.body230.prol, %for.body230.preheader
  %indvars.iv235.unr = phi i64 [ %indvars.iv235.ph, %for.body230.preheader ], [ %indvars.iv.next236.prol, %for.body230.prol ]
  %106 = icmp ult i64 %104, 3
  br i1 %106, label %for.cond241.preheader, label %for.body230

for.cond241.preheader:                            ; preds = %for.body230.prol.loopexit, %for.body230, %middle.block395
  br i1 %cmp99204259263, label %for.body244.lr.ph, label %if.end329.thread

for.body244.lr.ph:                                ; preds = %for.cond241.preheader
  %107 = load ptr, ptr @md.accel, align 8, !tbaa !9
  br i1 %min.iters.check378, label %for.body244.preheader, label %vector.memcheck361

vector.memcheck361:                               ; preds = %for.body244.lr.ph
  %scevgep364 = getelementptr i8, ptr %107, i64 %91
  %bound0368 = icmp ugt ptr %scevgep364, %v
  %bound1369 = icmp ult ptr %107, %scevgep362
  %found.conflict370 = and i1 %bound0368, %bound1369
  %conflict.rdx371 = or i1 %found.conflict367, %found.conflict370
  %bound0372 = icmp ugt ptr %scevgep364, %x
  %bound1373 = icmp ult ptr %107, %scevgep363
  %found.conflict374 = and i1 %bound0372, %bound1373
  %conflict.rdx375 = or i1 %conflict.rdx371, %found.conflict374
  br i1 %conflict.rdx375, label %for.body244.preheader, label %vector.ph379

vector.ph379:                                     ; preds = %vector.memcheck361
  %broadcast.splatinsert388 = insertelement <2 x double> poison, double %tscal.0, i64 0
  %broadcast.splat389 = shufflevector <2 x double> %broadcast.splatinsert388, <2 x double> poison, <2 x i32> zeroinitializer
  br label %vector.body384

vector.body384:                                   ; preds = %vector.body384, %vector.ph379
  %index385 = phi i64 [ 0, %vector.ph379 ], [ %index.next391, %vector.body384 ]
  %108 = getelementptr inbounds double, ptr %v, i64 %index385
  %wide.load386 = load <2 x double>, ptr %108, align 8, !tbaa !12, !alias.scope !130, !noalias !133
  %109 = getelementptr inbounds double, ptr %107, i64 %index385
  %wide.load387 = load <2 x double>, ptr %109, align 8, !tbaa !12, !alias.scope !136
  %110 = fadd <2 x double> %wide.load386, %wide.load387
  %111 = fmul <2 x double> %broadcast.splat389, %110
  %112 = fcmp ogt <2 x double> %111, <double 1.000000e+01, double 1.000000e+01>
  %113 = select <2 x i1> %112, <2 x double> <double 1.000000e+01, double 1.000000e+01>, <2 x double> %111
  %114 = fcmp olt <2 x double> %113, <double -1.000000e+01, double -1.000000e+01>
  %115 = select <2 x i1> %114, <2 x double> <double -1.000000e+01, double -1.000000e+01>, <2 x double> %113
  store <2 x double> %115, ptr %108, align 8, !tbaa !12, !alias.scope !130, !noalias !133
  %116 = getelementptr inbounds double, ptr %x, i64 %index385
  %wide.load390 = load <2 x double>, ptr %116, align 8, !tbaa !12, !alias.scope !137, !noalias !136
  %117 = call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %115, <2 x double> <double 0x3F94F227D028A1DF, double 0x3F94F227D028A1DF>, <2 x double> %wide.load390)
  store <2 x double> %117, ptr %116, align 8, !tbaa !12, !alias.scope !137, !noalias !136
  %index.next391 = add nuw i64 %index385, 2
  %118 = icmp eq i64 %index.next391, %n.vec381
  br i1 %118, label %middle.block376, label %vector.body384, !llvm.loop !138

middle.block376:                                  ; preds = %vector.body384
  br i1 %cmp.n383, label %if.end329, label %for.body244.preheader

for.body244.preheader:                            ; preds = %vector.memcheck361, %for.body244.lr.ph, %middle.block376
  %indvars.iv240.ph = phi i64 [ 0, %vector.memcheck361 ], [ 0, %for.body244.lr.ph ], [ %n.vec381, %middle.block376 ]
  br label %for.body244

for.body230:                                      ; preds = %for.body230.prol.loopexit, %for.body230
  %indvars.iv235 = phi i64 [ %indvars.iv.next236.3, %for.body230 ], [ %indvars.iv235.unr, %for.body230.prol.loopexit ]
  %arrayidx232 = getelementptr inbounds double, ptr %x, i64 %indvars.iv235
  %119 = load double, ptr %arrayidx232, align 8, !tbaa !12
  %arrayidx234 = getelementptr inbounds double, ptr %96, i64 %indvars.iv235
  store double %119, ptr %arrayidx234, align 8, !tbaa !12
  %indvars.iv.next236 = add nuw nsw i64 %indvars.iv235, 1
  %arrayidx232.1 = getelementptr inbounds double, ptr %x, i64 %indvars.iv.next236
  %120 = load double, ptr %arrayidx232.1, align 8, !tbaa !12
  %arrayidx234.1 = getelementptr inbounds double, ptr %96, i64 %indvars.iv.next236
  store double %120, ptr %arrayidx234.1, align 8, !tbaa !12
  %indvars.iv.next236.1 = add nuw nsw i64 %indvars.iv235, 2
  %arrayidx232.2 = getelementptr inbounds double, ptr %x, i64 %indvars.iv.next236.1
  %121 = load double, ptr %arrayidx232.2, align 8, !tbaa !12
  %arrayidx234.2 = getelementptr inbounds double, ptr %96, i64 %indvars.iv.next236.1
  store double %121, ptr %arrayidx234.2, align 8, !tbaa !12
  %indvars.iv.next236.2 = add nuw nsw i64 %indvars.iv235, 3
  %arrayidx232.3 = getelementptr inbounds double, ptr %x, i64 %indvars.iv.next236.2
  %122 = load double, ptr %arrayidx232.3, align 8, !tbaa !12
  %arrayidx234.3 = getelementptr inbounds double, ptr %96, i64 %indvars.iv.next236.2
  store double %122, ptr %arrayidx234.3, align 8, !tbaa !12
  %indvars.iv.next236.3 = add nuw nsw i64 %indvars.iv235, 4
  %exitcond239.not.3 = icmp eq i64 %indvars.iv.next236.3, %wide.trip.count238
  br i1 %exitcond239.not.3, label %for.cond241.preheader, label %for.body230, !llvm.loop !139

for.body244:                                      ; preds = %for.body244.preheader, %for.body244
  %indvars.iv240 = phi i64 [ %indvars.iv.next241, %for.body244 ], [ %indvars.iv240.ph, %for.body244.preheader ]
  %arrayidx246 = getelementptr inbounds double, ptr %v, i64 %indvars.iv240
  %123 = load double, ptr %arrayidx246, align 8, !tbaa !12
  %arrayidx248 = getelementptr inbounds double, ptr %107, i64 %indvars.iv240
  %124 = load double, ptr %arrayidx248, align 8, !tbaa !12
  %add249 = fadd double %123, %124
  %mul250 = fmul double %tscal.0, %add249
  %cmp255 = fcmp ogt double %mul250, 1.000000e+01
  %.mul250 = select i1 %cmp255, double 1.000000e+01, double %mul250
  %cmp264 = fcmp olt double %.mul250, -1.000000e+01
  %cond272 = select i1 %cmp264, double -1.000000e+01, double %.mul250
  store double %cond272, ptr %arrayidx246, align 8, !tbaa !12
  %arrayidx279 = getelementptr inbounds double, ptr %x, i64 %indvars.iv240
  %125 = load double, ptr %arrayidx279, align 8, !tbaa !12
  %126 = call double @llvm.fmuladd.f64(double %cond272, double 0x3F94F227D028A1DF, double %125)
  store double %126, ptr %arrayidx279, align 8, !tbaa !12
  %indvars.iv.next241 = add nuw nsw i64 %indvars.iv240, 1
  %exitcond244.not = icmp eq i64 %indvars.iv.next241, %wide.trip.count243
  br i1 %exitcond244.not, label %if.end329, label %for.body244, !llvm.loop !140

if.end329.thread:                                 ; preds = %for.cond241.preheader, %if.end226
  %call333265 = call double %func(ptr noundef %x, ptr noundef %f, ptr noundef nonnull %nstep) #23
  br label %if.end420

if.end329:                                        ; preds = %for.body244, %middle.block376
  %call333 = call double %func(ptr noundef nonnull %x, ptr noundef %f, ptr noundef nonnull %nstep) #23
  br i1 %cmp99204259263, label %for.body341.lr.ph, label %if.end420

for.body341.lr.ph:                                ; preds = %if.end329
  %127 = load ptr, ptr @md.minv, align 8, !tbaa !9
  %128 = load ptr, ptr @md.accel, align 8, !tbaa !9
  br i1 %min.iters.check349, label %for.body341.preheader, label %vector.memcheck323

vector.memcheck323:                               ; preds = %for.body341.lr.ph
  %scevgep324 = getelementptr i8, ptr %128, i64 %90
  %scevgep327 = getelementptr i8, ptr %127, i64 %90
  %bound0328 = icmp ult ptr %128, %scevgep325
  %bound1329 = icmp ugt ptr %scevgep324, %v
  %found.conflict330 = and i1 %bound0328, %bound1329
  %bound0331 = icmp ult ptr %128, %scevgep326
  %bound1332 = icmp ugt ptr %scevgep324, %f
  %found.conflict333 = and i1 %bound0331, %bound1332
  %conflict.rdx334 = or i1 %found.conflict330, %found.conflict333
  %bound0335 = icmp ult ptr %128, %scevgep327
  %bound1336 = icmp ult ptr %127, %scevgep324
  %found.conflict337 = and i1 %bound0335, %bound1336
  %conflict.rdx338 = or i1 %conflict.rdx334, %found.conflict337
  %conflict.rdx342 = or i1 %conflict.rdx338, %found.conflict341
  %bound0343 = icmp ugt ptr %scevgep327, %v
  %bound1344 = icmp ult ptr %127, %scevgep325
  %found.conflict345 = and i1 %bound0343, %bound1344
  %conflict.rdx346 = or i1 %conflict.rdx342, %found.conflict345
  br i1 %conflict.rdx346, label %for.body341.preheader, label %vector.ph350

vector.ph350:                                     ; preds = %vector.memcheck323
  %broadcast.splatinsert = insertelement <2 x double> poison, double %tscal.0, i64 0
  %broadcast.splat = shufflevector <2 x double> %broadcast.splatinsert, <2 x double> poison, <2 x i32> zeroinitializer
  br label %vector.body355

vector.body355:                                   ; preds = %vector.body355, %vector.ph350
  %index356 = phi i64 [ 0, %vector.ph350 ], [ %index.next360, %vector.body355 ]
  %129 = getelementptr inbounds double, ptr %f, i64 %index356
  %wide.load357 = load <2 x double>, ptr %129, align 8, !tbaa !12, !alias.scope !141
  %130 = fneg <2 x double> %wide.load357
  %131 = getelementptr inbounds double, ptr %127, i64 %index356
  %wide.load358 = load <2 x double>, ptr %131, align 8, !tbaa !12, !alias.scope !144
  %132 = fmul <2 x double> %wide.load358, %130
  %133 = fmul <2 x double> %132, <double 0x3F84F227D028A1DF, double 0x3F84F227D028A1DF>
  %134 = getelementptr inbounds double, ptr %128, i64 %index356
  store <2 x double> %133, ptr %134, align 8, !tbaa !12, !alias.scope !146, !noalias !148
  %135 = getelementptr inbounds double, ptr %v, i64 %index356
  %wide.load359 = load <2 x double>, ptr %135, align 8, !tbaa !12, !alias.scope !150, !noalias !151
  %136 = fadd <2 x double> %133, %wide.load359
  %137 = fmul <2 x double> %broadcast.splat, %136
  store <2 x double> %137, ptr %135, align 8, !tbaa !12, !alias.scope !150, !noalias !151
  %index.next360 = add nuw i64 %index356, 2
  %138 = icmp eq i64 %index.next360, %n.vec352
  br i1 %138, label %middle.block347, label %vector.body355, !llvm.loop !152

middle.block347:                                  ; preds = %vector.body355
  br i1 %cmp.n354, label %for.cond399.preheader, label %for.body341.preheader

for.body341.preheader:                            ; preds = %vector.memcheck323, %for.body341.lr.ph, %middle.block347
  %indvars.iv245.ph = phi i64 [ 0, %vector.memcheck323 ], [ 0, %for.body341.lr.ph ], [ %n.vec352, %middle.block347 ]
  %139 = xor i64 %indvars.iv245.ph, -1
  br i1 %lcmp.mod419.not, label %for.body341.prol.loopexit, label %for.body341.prol

for.body341.prol:                                 ; preds = %for.body341.preheader
  %arrayidx343.prol = getelementptr inbounds double, ptr %f, i64 %indvars.iv245.ph
  %140 = load double, ptr %arrayidx343.prol, align 8, !tbaa !12
  %fneg344.prol = fneg double %140
  %arrayidx346.prol = getelementptr inbounds double, ptr %127, i64 %indvars.iv245.ph
  %141 = load double, ptr %arrayidx346.prol, align 8, !tbaa !12
  %mul347.prol = fmul double %141, %fneg344.prol
  %mul348.prol = fmul double %mul347.prol, 0x3F84F227D028A1DF
  %arrayidx350.prol = getelementptr inbounds double, ptr %128, i64 %indvars.iv245.ph
  store double %mul348.prol, ptr %arrayidx350.prol, align 8, !tbaa !12
  %arrayidx352.prol = getelementptr inbounds double, ptr %v, i64 %indvars.iv245.ph
  %142 = load double, ptr %arrayidx352.prol, align 8, !tbaa !12
  %add355.prol = fadd double %mul348.prol, %142
  %mul356.prol = fmul double %tscal.0, %add355.prol
  store double %mul356.prol, ptr %arrayidx352.prol, align 8, !tbaa !12
  %indvars.iv.next246.prol = or i64 %indvars.iv245.ph, 1
  br label %for.body341.prol.loopexit

for.body341.prol.loopexit:                        ; preds = %for.body341.prol, %for.body341.preheader
  %indvars.iv245.unr = phi i64 [ %indvars.iv245.ph, %for.body341.preheader ], [ %indvars.iv.next246.prol, %for.body341.prol ]
  %143 = icmp eq i64 %139, %93
  br i1 %143, label %for.cond399.preheader, label %for.body341

for.cond399.preheader:                            ; preds = %for.body341.prol.loopexit, %for.body341, %middle.block347
  br i1 %cmp99204259263, label %for.body402.lr.ph, label %if.end420

for.body402.lr.ph:                                ; preds = %for.cond399.preheader
  %144 = load ptr, ptr @md.minv, align 8, !tbaa !9
  br i1 %94, label %if.end420.loopexit.unr-lcssa, label %for.body402

for.body341:                                      ; preds = %for.body341.prol.loopexit, %for.body341
  %indvars.iv245 = phi i64 [ %indvars.iv.next246.1, %for.body341 ], [ %indvars.iv245.unr, %for.body341.prol.loopexit ]
  %arrayidx343 = getelementptr inbounds double, ptr %f, i64 %indvars.iv245
  %145 = load double, ptr %arrayidx343, align 8, !tbaa !12
  %fneg344 = fneg double %145
  %arrayidx346 = getelementptr inbounds double, ptr %127, i64 %indvars.iv245
  %146 = load double, ptr %arrayidx346, align 8, !tbaa !12
  %mul347 = fmul double %146, %fneg344
  %mul348 = fmul double %mul347, 0x3F84F227D028A1DF
  %arrayidx350 = getelementptr inbounds double, ptr %128, i64 %indvars.iv245
  store double %mul348, ptr %arrayidx350, align 8, !tbaa !12
  %arrayidx352 = getelementptr inbounds double, ptr %v, i64 %indvars.iv245
  %147 = load double, ptr %arrayidx352, align 8, !tbaa !12
  %add355 = fadd double %mul348, %147
  %mul356 = fmul double %tscal.0, %add355
  store double %mul356, ptr %arrayidx352, align 8, !tbaa !12
  %indvars.iv.next246 = add nuw nsw i64 %indvars.iv245, 1
  %arrayidx343.1 = getelementptr inbounds double, ptr %f, i64 %indvars.iv.next246
  %148 = load double, ptr %arrayidx343.1, align 8, !tbaa !12
  %fneg344.1 = fneg double %148
  %arrayidx346.1 = getelementptr inbounds double, ptr %127, i64 %indvars.iv.next246
  %149 = load double, ptr %arrayidx346.1, align 8, !tbaa !12
  %mul347.1 = fmul double %149, %fneg344.1
  %mul348.1 = fmul double %mul347.1, 0x3F84F227D028A1DF
  %arrayidx350.1 = getelementptr inbounds double, ptr %128, i64 %indvars.iv.next246
  store double %mul348.1, ptr %arrayidx350.1, align 8, !tbaa !12
  %arrayidx352.1 = getelementptr inbounds double, ptr %v, i64 %indvars.iv.next246
  %150 = load double, ptr %arrayidx352.1, align 8, !tbaa !12
  %add355.1 = fadd double %mul348.1, %150
  %mul356.1 = fmul double %tscal.0, %add355.1
  store double %mul356.1, ptr %arrayidx352.1, align 8, !tbaa !12
  %indvars.iv.next246.1 = add nuw nsw i64 %indvars.iv245, 2
  %exitcond249.not.1 = icmp eq i64 %indvars.iv.next246.1, %wide.trip.count248
  br i1 %exitcond249.not.1, label %for.cond399.preheader, label %for.body341, !llvm.loop !153

for.body402:                                      ; preds = %for.body402.lr.ph, %for.body402
  %indvars.iv250 = phi i64 [ %indvars.iv.next251.3, %for.body402 ], [ 0, %for.body402.lr.ph ]
  %ekin.5216 = phi double [ %add411.3, %for.body402 ], [ 0.000000e+00, %for.body402.lr.ph ]
  %niter = phi i64 [ %niter.next.3, %for.body402 ], [ 0, %for.body402.lr.ph ]
  %arrayidx404 = getelementptr inbounds double, ptr %v, i64 %indvars.iv250
  %151 = load double, ptr %arrayidx404, align 8, !tbaa !12
  %mul407 = fmul double %151, %151
  %arrayidx409 = getelementptr inbounds double, ptr %144, i64 %indvars.iv250
  %152 = load double, ptr %arrayidx409, align 8, !tbaa !12
  %div410 = fdiv double %mul407, %152
  %add411 = fadd double %ekin.5216, %div410
  %indvars.iv.next251 = or i64 %indvars.iv250, 1
  %arrayidx404.1 = getelementptr inbounds double, ptr %v, i64 %indvars.iv.next251
  %153 = load double, ptr %arrayidx404.1, align 8, !tbaa !12
  %mul407.1 = fmul double %153, %153
  %arrayidx409.1 = getelementptr inbounds double, ptr %144, i64 %indvars.iv.next251
  %154 = load double, ptr %arrayidx409.1, align 8, !tbaa !12
  %div410.1 = fdiv double %mul407.1, %154
  %add411.1 = fadd double %add411, %div410.1
  %indvars.iv.next251.1 = or i64 %indvars.iv250, 2
  %arrayidx404.2 = getelementptr inbounds double, ptr %v, i64 %indvars.iv.next251.1
  %155 = load double, ptr %arrayidx404.2, align 8, !tbaa !12
  %mul407.2 = fmul double %155, %155
  %arrayidx409.2 = getelementptr inbounds double, ptr %144, i64 %indvars.iv.next251.1
  %156 = load double, ptr %arrayidx409.2, align 8, !tbaa !12
  %div410.2 = fdiv double %mul407.2, %156
  %add411.2 = fadd double %add411.1, %div410.2
  %indvars.iv.next251.2 = or i64 %indvars.iv250, 3
  %arrayidx404.3 = getelementptr inbounds double, ptr %v, i64 %indvars.iv.next251.2
  %157 = load double, ptr %arrayidx404.3, align 8, !tbaa !12
  %mul407.3 = fmul double %157, %157
  %arrayidx409.3 = getelementptr inbounds double, ptr %144, i64 %indvars.iv.next251.2
  %158 = load double, ptr %arrayidx409.3, align 8, !tbaa !12
  %div410.3 = fdiv double %mul407.3, %158
  %add411.3 = fadd double %add411.2, %div410.3
  %indvars.iv.next251.3 = add nuw nsw i64 %indvars.iv250, 4
  %niter.next.3 = add i64 %niter, 4
  %niter.ncmp.3 = icmp eq i64 %niter.next.3, %unroll_iter
  br i1 %niter.ncmp.3, label %if.end420.loopexit.unr-lcssa, label %for.body402, !llvm.loop !154

if.end420.loopexit.unr-lcssa:                     ; preds = %for.body402, %for.body402.lr.ph
  %add411.lcssa.ph = phi double [ undef, %for.body402.lr.ph ], [ %add411.3, %for.body402 ]
  %indvars.iv250.unr = phi i64 [ 0, %for.body402.lr.ph ], [ %indvars.iv.next251.3, %for.body402 ]
  %ekin.5216.unr = phi double [ 0.000000e+00, %for.body402.lr.ph ], [ %add411.3, %for.body402 ]
  br i1 %lcmp.mod422.not, label %if.end420, label %for.body402.epil

for.body402.epil:                                 ; preds = %if.end420.loopexit.unr-lcssa, %for.body402.epil
  %indvars.iv250.epil = phi i64 [ %indvars.iv.next251.epil, %for.body402.epil ], [ %indvars.iv250.unr, %if.end420.loopexit.unr-lcssa ]
  %ekin.5216.epil = phi double [ %add411.epil, %for.body402.epil ], [ %ekin.5216.unr, %if.end420.loopexit.unr-lcssa ]
  %epil.iter = phi i64 [ %epil.iter.next, %for.body402.epil ], [ 0, %if.end420.loopexit.unr-lcssa ]
  %arrayidx404.epil = getelementptr inbounds double, ptr %v, i64 %indvars.iv250.epil
  %159 = load double, ptr %arrayidx404.epil, align 8, !tbaa !12
  %mul407.epil = fmul double %159, %159
  %arrayidx409.epil = getelementptr inbounds double, ptr %144, i64 %indvars.iv250.epil
  %160 = load double, ptr %arrayidx409.epil, align 8, !tbaa !12
  %div410.epil = fdiv double %mul407.epil, %160
  %add411.epil = fadd double %ekin.5216.epil, %div410.epil
  %indvars.iv.next251.epil = add nuw nsw i64 %indvars.iv250.epil, 1
  %epil.iter.next = add i64 %epil.iter, 1
  %epil.iter.cmp.not = icmp eq i64 %epil.iter.next, %xtraiter421
  br i1 %epil.iter.cmp.not, label %if.end420, label %for.body402.epil, !llvm.loop !155

if.end420:                                        ; preds = %if.end420.loopexit.unr-lcssa, %for.body402.epil, %if.end329, %if.end329.thread, %for.cond399.preheader
  %ekin.5.lcssa = phi double [ 0.000000e+00, %for.cond399.preheader ], [ 0.000000e+00, %if.end329.thread ], [ 0.000000e+00, %if.end329 ], [ %add411.lcssa.ph, %if.end420.loopexit.unr-lcssa ], [ %add411.epil, %for.body402.epil ]
  %161 = load double, ptr @t, align 8, !tbaa !12
  %add424 = fadd double %161, 1.000000e-03
  store double %add424, ptr @t, align 8, !tbaa !12
  %162 = load i32, ptr %nstep, align 4, !tbaa !5
  %inc438 = add nsw i32 %162, 1
  store i32 %inc438, ptr %nstep, align 4, !tbaa !5
  %cmp215.not.not = icmp slt i32 %162, %maxstep
  br i1 %cmp215.not.not, label %for.body217, label %for.end439, !llvm.loop !156

for.end439:                                       ; preds = %if.end420, %if.end213
  store i32 -3, ptr %nstep, align 4, !tbaa !5
  %call440 = call double %func(ptr noundef %x, ptr noundef %f, ptr noundef nonnull %nstep) #23
  call void @llvm.lifetime.end.p0(i64 4, ptr nonnull %nstep) #23
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %zero) #23
  call void @llvm.lifetime.end.p0(i64 8, ptr nonnull %sd) #23
  ret i32 0
}

; Function Attrs: mustprogress nofree nounwind willreturn allockind("alloc,zeroed") allocsize(0,1) memory(inaccessiblemem: readwrite)
declare noalias noundef ptr @calloc(i64 noundef, i64 noundef) local_unnamed_addr #15

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fmuladd.f64(double, double, double) #16

declare double @gauss(ptr noundef, ptr noundef) local_unnamed_addr #9

; Function Attrs: mustprogress nofree nounwind willreturn
declare double @strtod(ptr noundef readonly, ptr nocapture noundef) local_unnamed_addr #17

declare i32 @nblist(ptr noundef, ptr noundef, ptr noundef, ptr noundef, i32 noundef, i32 noundef, double noundef, i32 noundef, i32 noundef, ptr noundef) local_unnamed_addr #9

; Function Attrs: nofree nounwind memory(readwrite, inaccessiblemem: write) uwtable
define internal fastcc double @ebond(i32 noundef %nbond, ptr nocapture noundef readonly %a1, ptr nocapture noundef readonly %a2, ptr nocapture noundef readonly %atype, ptr nocapture noundef readonly %Rk, ptr nocapture noundef readonly %Req, ptr nocapture noundef readonly %x, ptr nocapture noundef %f) unnamed_addr #18 {
entry:
  %cmp67 = icmp sgt i32 %nbond, 0
  br i1 %cmp67, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %nbond to i64
  %.b66.pre72 = load i1, ptr @dim, align 4
  br label %for.body

for.body:                                         ; preds = %for.body.preheader, %for.inc
  %.b66 = phi i1 [ %.b66.pre72, %for.body.preheader ], [ %.b6674, %for.inc ]
  %indvars.iv = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next, %for.inc ]
  %e_bond.069 = phi double [ 0.000000e+00, %for.body.preheader ], [ %add45, %for.inc ]
  %rw.068 = phi double [ undef, %for.body.preheader ], [ %rw.1, %for.inc ]
  %0 = select i1 %.b66, i32 4, i32 3
  %arrayidx = getelementptr inbounds i32, ptr %a1, i64 %indvars.iv
  %1 = load i32, ptr %arrayidx, align 4, !tbaa !5
  %mul = mul nsw i32 %0, %1
  %div = sdiv i32 %mul, 3
  %arrayidx2 = getelementptr inbounds i32, ptr %a2, i64 %indvars.iv
  %2 = load i32, ptr %arrayidx2, align 4, !tbaa !5
  %mul3 = mul nsw i32 %2, %0
  %div4 = sdiv i32 %mul3, 3
  %arrayidx6 = getelementptr inbounds i32, ptr %atype, i64 %indvars.iv
  %3 = load i32, ptr %arrayidx6, align 4, !tbaa !5
  %sub = add nsw i32 %3, -1
  %idxprom7 = sext i32 %div to i64
  %arrayidx8 = getelementptr inbounds double, ptr %x, i64 %idxprom7
  %idxprom9 = sext i32 %div4 to i64
  %arrayidx10 = getelementptr inbounds double, ptr %x, i64 %idxprom9
  %add14 = add nsw i32 %div4, 1
  %idxprom15 = sext i32 %add14 to i64
  %4 = load <2 x double>, ptr %arrayidx8, align 8, !tbaa !12
  %5 = load <2 x double>, ptr %arrayidx10, align 8, !tbaa !12
  %6 = fsub <2 x double> %4, %5
  %add18 = add nsw i32 %div, 2
  %idxprom19 = sext i32 %add18 to i64
  %arrayidx20 = getelementptr inbounds double, ptr %x, i64 %idxprom19
  %7 = load double, ptr %arrayidx20, align 8, !tbaa !12
  %add21 = add nsw i32 %div4, 2
  %idxprom22 = sext i32 %add21 to i64
  %arrayidx23 = getelementptr inbounds double, ptr %x, i64 %idxprom22
  %8 = load double, ptr %arrayidx23, align 8, !tbaa !12
  %sub24 = fsub double %7, %8
  %9 = extractelement <2 x double> %6, i64 1
  %mul26 = fmul double %9, %9
  %10 = extractelement <2 x double> %6, i64 0
  %11 = tail call double @llvm.fmuladd.f64(double %10, double %10, double %mul26)
  %12 = tail call double @llvm.fmuladd.f64(double %sub24, double %sub24, double %11)
  br i1 %.b66, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %add29 = add nsw i32 %div, 3
  %idxprom30 = sext i32 %add29 to i64
  %arrayidx31 = getelementptr inbounds double, ptr %x, i64 %idxprom30
  %13 = load double, ptr %arrayidx31, align 8, !tbaa !12
  %add32 = add nsw i32 %div4, 3
  %idxprom33 = sext i32 %add32 to i64
  %arrayidx34 = getelementptr inbounds double, ptr %x, i64 %idxprom33
  %14 = load double, ptr %arrayidx34, align 8, !tbaa !12
  %sub35 = fsub double %13, %14
  %15 = tail call double @llvm.fmuladd.f64(double %sub35, double %sub35, double %12)
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %r2.0 = phi double [ %15, %if.then ], [ %12, %for.body ]
  %rw.1 = phi double [ %sub35, %if.then ], [ %rw.068, %for.body ]
  %call = tail call double @sqrt(double noundef %r2.0) #23
  %div37 = fdiv double 2.000000e+00, %call
  %idxprom38 = sext i32 %sub to i64
  %arrayidx39 = getelementptr inbounds double, ptr %Req, i64 %idxprom38
  %16 = load double, ptr %arrayidx39, align 8, !tbaa !12
  %sub40 = fsub double %call, %16
  %arrayidx42 = getelementptr inbounds double, ptr %Rk, i64 %idxprom38
  %17 = load double, ptr %arrayidx42, align 8, !tbaa !12
  %mul43 = fmul double %17, %sub40
  %mul44 = fmul double %sub40, %mul43
  %add45 = fadd double %e_bond.069, %mul44
  %mul46 = fmul double %div37, %mul43
  %arrayidx51 = getelementptr inbounds double, ptr %f, i64 %idxprom7
  %18 = load <2 x double>, ptr %arrayidx51, align 8, !tbaa !12
  %19 = insertelement <2 x double> poison, double %mul46, i64 0
  %20 = shufflevector <2 x double> %19, <2 x double> poison, <2 x i32> zeroinitializer
  %21 = tail call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %6, <2 x double> %20, <2 x double> %18)
  store <2 x double> %21, ptr %arrayidx51, align 8, !tbaa !12
  %arrayidx61 = getelementptr inbounds double, ptr %f, i64 %idxprom19
  %22 = load double, ptr %arrayidx61, align 8, !tbaa !12
  %23 = tail call double @llvm.fmuladd.f64(double %sub24, double %mul46, double %22)
  store double %23, ptr %arrayidx61, align 8, !tbaa !12
  %arrayidx66 = getelementptr inbounds double, ptr %f, i64 %idxprom9
  %24 = load double, ptr %arrayidx66, align 8, !tbaa !12
  %neg = fneg double %10
  %25 = tail call double @llvm.fmuladd.f64(double %neg, double %mul46, double %24)
  store double %25, ptr %arrayidx66, align 8, !tbaa !12
  %arrayidx71 = getelementptr inbounds double, ptr %f, i64 %idxprom15
  %26 = load double, ptr %arrayidx71, align 8, !tbaa !12
  %neg72 = fneg double %9
  %27 = tail call double @llvm.fmuladd.f64(double %neg72, double %mul46, double %26)
  store double %27, ptr %arrayidx71, align 8, !tbaa !12
  %arrayidx77 = getelementptr inbounds double, ptr %f, i64 %idxprom22
  %28 = load double, ptr %arrayidx77, align 8, !tbaa !12
  %neg78 = fneg double %sub24
  %29 = tail call double @llvm.fmuladd.f64(double %neg78, double %mul46, double %28)
  store double %29, ptr %arrayidx77, align 8, !tbaa !12
  %.b = load i1, ptr @dim, align 4
  br i1 %.b, label %if.then80, label %for.inc

if.then80:                                        ; preds = %if.end
  %add83 = add nsw i32 %div, 3
  %idxprom84 = sext i32 %add83 to i64
  %arrayidx85 = getelementptr inbounds double, ptr %f, i64 %idxprom84
  %30 = load double, ptr %arrayidx85, align 8, !tbaa !12
  %31 = tail call double @llvm.fmuladd.f64(double %rw.1, double %mul46, double %30)
  store double %31, ptr %arrayidx85, align 8, !tbaa !12
  %add88 = add nsw i32 %div4, 3
  %idxprom89 = sext i32 %add88 to i64
  %arrayidx90 = getelementptr inbounds double, ptr %f, i64 %idxprom89
  %32 = load double, ptr %arrayidx90, align 8, !tbaa !12
  %neg91 = fneg double %rw.1
  %33 = tail call double @llvm.fmuladd.f64(double %neg91, double %mul46, double %32)
  store double %33, ptr %arrayidx90, align 8, !tbaa !12
  %.b66.pre = load i1, ptr @dim, align 4
  br label %for.inc

for.inc:                                          ; preds = %if.end, %if.then80
  %.b6674 = phi i1 [ false, %if.end ], [ %.b66.pre, %if.then80 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.end, label %for.body, !llvm.loop !157

for.end:                                          ; preds = %for.inc, %entry
  %e_bond.0.lcssa = phi double [ 0.000000e+00, %entry ], [ %add45, %for.inc ]
  ret double %e_bond.0.lcssa
}

; Function Attrs: nofree nounwind memory(readwrite, inaccessiblemem: write) uwtable
define internal fastcc double @eangl(i32 noundef %nang, ptr nocapture noundef readonly %a1, ptr nocapture noundef readonly %a2, ptr nocapture noundef readonly %a3, ptr nocapture noundef readonly %atype, ptr nocapture noundef readonly %Tk, ptr nocapture noundef readonly %Teq, ptr nocapture noundef readonly %x, ptr nocapture noundef %f) unnamed_addr #18 {
entry:
  %cmp158 = icmp sgt i32 %nang, 0
  br i1 %cmp158, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %nang to i64
  %.b157.pre166 = load i1, ptr @dim, align 4
  br label %for.body

for.body:                                         ; preds = %for.body.preheader, %for.inc
  %.b157 = phi i1 [ %.b157.pre166, %for.body.preheader ], [ %.b157168, %for.inc ]
  %indvars.iv = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next, %for.inc ]
  %e_theta.0159 = phi double [ 0.000000e+00, %for.body.preheader ], [ %add103, %for.inc ]
  %0 = phi <2 x double> [ undef, %for.body.preheader ], [ %67, %for.inc ]
  %1 = phi <2 x double> [ undef, %for.body.preheader ], [ %44, %for.inc ]
  %2 = select i1 %.b157, i32 4, i32 3
  %arrayidx = getelementptr inbounds i32, ptr %a1, i64 %indvars.iv
  %3 = load i32, ptr %arrayidx, align 4, !tbaa !5
  %mul = mul nsw i32 %2, %3
  %div = sdiv i32 %mul, 3
  %arrayidx2 = getelementptr inbounds i32, ptr %a2, i64 %indvars.iv
  %4 = load i32, ptr %arrayidx2, align 4, !tbaa !5
  %mul3 = mul nsw i32 %4, %2
  %div4 = sdiv i32 %mul3, 3
  %arrayidx6 = getelementptr inbounds i32, ptr %a3, i64 %indvars.iv
  %5 = load i32, ptr %arrayidx6, align 4, !tbaa !5
  %mul7 = mul nsw i32 %5, %2
  %div8 = sdiv i32 %mul7, 3
  %arrayidx10 = getelementptr inbounds i32, ptr %atype, i64 %indvars.iv
  %6 = load i32, ptr %arrayidx10, align 4, !tbaa !5
  %sub = add nsw i32 %6, -1
  %idxprom11 = sext i32 %div to i64
  %arrayidx12 = getelementptr inbounds double, ptr %x, i64 %idxprom11
  %7 = load double, ptr %arrayidx12, align 8, !tbaa !12
  %idxprom13 = sext i32 %div4 to i64
  %arrayidx14 = getelementptr inbounds double, ptr %x, i64 %idxprom13
  %8 = load double, ptr %arrayidx14, align 8, !tbaa !12
  %add = add nsw i32 %div, 1
  %idxprom16 = sext i32 %add to i64
  %arrayidx17 = getelementptr inbounds double, ptr %x, i64 %idxprom16
  %9 = load double, ptr %arrayidx17, align 8, !tbaa !12
  %add18 = add nsw i32 %div4, 1
  %idxprom19 = sext i32 %add18 to i64
  %arrayidx20 = getelementptr inbounds double, ptr %x, i64 %idxprom19
  %10 = load double, ptr %arrayidx20, align 8, !tbaa !12
  %add22 = add nsw i32 %div, 2
  %idxprom23 = sext i32 %add22 to i64
  %arrayidx24 = getelementptr inbounds double, ptr %x, i64 %idxprom23
  %11 = load double, ptr %arrayidx24, align 8, !tbaa !12
  %add25 = add nsw i32 %div4, 2
  %idxprom26 = sext i32 %add25 to i64
  %arrayidx27 = getelementptr inbounds double, ptr %x, i64 %idxprom26
  %12 = load double, ptr %arrayidx27, align 8, !tbaa !12
  %idxprom29 = sext i32 %div8 to i64
  %arrayidx30 = getelementptr inbounds double, ptr %x, i64 %idxprom29
  %13 = load double, ptr %arrayidx30, align 8, !tbaa !12
  %add34 = add nsw i32 %div8, 1
  %idxprom35 = sext i32 %add34 to i64
  %arrayidx36 = getelementptr inbounds double, ptr %x, i64 %idxprom35
  %14 = load double, ptr %arrayidx36, align 8, !tbaa !12
  %add41 = add nsw i32 %div8, 2
  %idxprom42 = sext i32 %add41 to i64
  %arrayidx43 = getelementptr inbounds double, ptr %x, i64 %idxprom42
  %15 = load double, ptr %arrayidx43, align 8, !tbaa !12
  %16 = insertelement <2 x double> poison, double %13, i64 0
  %17 = insertelement <2 x double> %16, double %7, i64 1
  %18 = insertelement <2 x double> poison, double %8, i64 0
  %19 = shufflevector <2 x double> %18, <2 x double> poison, <2 x i32> zeroinitializer
  %20 = fsub <2 x double> %17, %19
  %21 = insertelement <2 x double> poison, double %14, i64 0
  %22 = insertelement <2 x double> %21, double %9, i64 1
  %23 = insertelement <2 x double> poison, double %10, i64 0
  %24 = shufflevector <2 x double> %23, <2 x double> poison, <2 x i32> zeroinitializer
  %25 = fsub <2 x double> %22, %24
  %26 = insertelement <2 x double> poison, double %15, i64 0
  %27 = insertelement <2 x double> %26, double %11, i64 1
  %28 = insertelement <2 x double> poison, double %12, i64 0
  %29 = shufflevector <2 x double> %28, <2 x double> poison, <2 x i32> zeroinitializer
  %30 = fsub <2 x double> %27, %29
  %31 = fmul <2 x double> %25, %25
  %32 = tail call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %20, <2 x double> %20, <2 x double> %31)
  %33 = tail call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %30, <2 x double> %30, <2 x double> %32)
  br i1 %.b157, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %add55 = add nsw i32 %div, 3
  %idxprom56 = sext i32 %add55 to i64
  %arrayidx57 = getelementptr inbounds double, ptr %x, i64 %idxprom56
  %34 = load double, ptr %arrayidx57, align 8, !tbaa !12
  %add58 = add nsw i32 %div4, 3
  %idxprom59 = sext i32 %add58 to i64
  %arrayidx60 = getelementptr inbounds double, ptr %x, i64 %idxprom59
  %35 = load double, ptr %arrayidx60, align 8, !tbaa !12
  %add62 = add nsw i32 %div8, 3
  %idxprom63 = sext i32 %add62 to i64
  %arrayidx64 = getelementptr inbounds double, ptr %x, i64 %idxprom63
  %36 = load double, ptr %arrayidx64, align 8, !tbaa !12
  %37 = insertelement <2 x double> poison, double %36, i64 0
  %38 = insertelement <2 x double> %37, double %34, i64 1
  %39 = insertelement <2 x double> poison, double %35, i64 0
  %40 = shufflevector <2 x double> %39, <2 x double> poison, <2 x i32> zeroinitializer
  %41 = fsub <2 x double> %38, %40
  %42 = tail call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %41, <2 x double> %41, <2 x double> %33)
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %43 = phi <2 x double> [ %42, %if.then ], [ %33, %for.body ]
  %44 = phi <2 x double> [ %41, %if.then ], [ %1, %for.body ]
  %45 = extractelement <2 x double> %43, i64 1
  %call = tail call double @sqrt(double noundef %45) #23
  %46 = extractelement <2 x double> %43, i64 0
  %call71 = tail call double @sqrt(double noundef %46) #23
  %47 = insertelement <2 x double> poison, double %call71, i64 0
  %48 = insertelement <2 x double> %47, double %call, i64 1
  %49 = fdiv <2 x double> <double 1.000000e+00, double 1.000000e+00>, %48
  %50 = extractelement <2 x double> %49, i64 1
  %51 = fmul <2 x double> %20, %49
  %mul74 = extractelement <2 x double> %51, i64 1
  %52 = fmul <2 x double> %30, %49
  %mul76 = extractelement <2 x double> %52, i64 1
  %53 = extractelement <2 x double> %49, i64 0
  %54 = fmul <2 x double> %20, %49
  %mul77 = extractelement <2 x double> %54, i64 0
  %55 = fmul <2 x double> %25, %49
  %56 = fmul <2 x double> %30, %49
  %mul79 = extractelement <2 x double> %56, i64 0
  %57 = extractelement <2 x double> %55, i64 0
  %58 = extractelement <2 x double> %55, i64 1
  %mul81 = fmul double %58, %57
  %59 = tail call double @llvm.fmuladd.f64(double %mul74, double %mul77, double %mul81)
  %60 = tail call double @llvm.fmuladd.f64(double %mul76, double %mul79, double %59)
  %.b156 = load i1, ptr @dim, align 4
  %61 = fmul <2 x double> %44, %49
  %62 = extractelement <2 x double> %61, i64 0
  %63 = extractelement <2 x double> %61, i64 1
  %64 = tail call double @llvm.fmuladd.f64(double %63, double %62, double %60)
  %cst.0 = select i1 %.b156, double %64, double %60
  %65 = insertelement <2 x i1> poison, i1 %.b156, i64 0
  %66 = shufflevector <2 x i1> %65, <2 x i1> poison, <2 x i32> zeroinitializer
  %67 = select <2 x i1> %66, <2 x double> %61, <2 x double> %0
  %cmp89 = fcmp ogt double %cst.0, 1.000000e+00
  %cst.1 = select i1 %cmp89, double 1.000000e+00, double %cst.0
  %cmp92 = fcmp olt double %cst.1, -1.000000e+00
  %cst.2 = select i1 %cmp92, double -1.000000e+00, double %cst.1
  %call95 = tail call double @acos(double noundef %cst.2) #23
  %idxprom96 = sext i32 %sub to i64
  %arrayidx97 = getelementptr inbounds double, ptr %Teq, i64 %idxprom96
  %68 = load double, ptr %arrayidx97, align 8, !tbaa !12
  %sub98 = fsub double %call95, %68
  %arrayidx100 = getelementptr inbounds double, ptr %Tk, i64 %idxprom96
  %69 = load double, ptr %arrayidx100, align 8, !tbaa !12
  %mul101 = fmul double %sub98, %69
  %mul102 = fmul double %sub98, %mul101
  %add103 = fadd double %e_theta.0159, %mul102
  %add104 = fadd double %mul101, %mul101
  %call105 = tail call double @sin(double noundef %call95) #23
  %cmp106 = fcmp ogt double %call105, 0.000000e+00
  %cmp107 = fcmp olt double %call105, 1.000000e-03
  %or.cond = and i1 %cmp106, %cmp107
  br i1 %or.cond, label %if.end114, label %if.else

if.else:                                          ; preds = %if.end
  %cmp109 = fcmp olt double %call105, 0.000000e+00
  %cmp111 = fcmp ogt double %call105, -1.000000e-03
  %or.cond1 = and i1 %cmp109, %cmp111
  %spec.store.select = select i1 %or.cond1, double -1.000000e-03, double %call105
  br label %if.end114

if.end114:                                        ; preds = %if.end, %if.else
  %at.0 = phi double [ %spec.store.select, %if.else ], [ 1.000000e-03, %if.end ]
  %fneg = fneg double %add104
  %div115 = fdiv double %fneg, %at.0
  %mul116 = fmul double %50, %div115
  %neg = fneg double %cst.2
  %70 = tail call double @llvm.fmuladd.f64(double %neg, double %mul74, double %mul77)
  %mul118 = fmul double %70, %mul116
  %mul119 = fmul double %53, %div115
  %71 = tail call double @llvm.fmuladd.f64(double %neg, double %mul77, double %mul74)
  %mul122 = fmul double %71, %mul119
  %72 = tail call double @llvm.fmuladd.f64(double %neg, double %58, double %57)
  %mul126 = fmul double %72, %mul116
  %73 = tail call double @llvm.fmuladd.f64(double %neg, double %57, double %58)
  %mul130 = fmul double %73, %mul119
  %74 = tail call double @llvm.fmuladd.f64(double %neg, double %mul76, double %mul79)
  %mul134 = fmul double %74, %mul116
  %75 = tail call double @llvm.fmuladd.f64(double %neg, double %mul79, double %mul76)
  %mul138 = fmul double %75, %mul119
  %arrayidx142 = getelementptr inbounds double, ptr %f, i64 %idxprom11
  %76 = load double, ptr %arrayidx142, align 8, !tbaa !12
  %add143 = fadd double %76, %mul118
  store double %add143, ptr %arrayidx142, align 8, !tbaa !12
  %arrayidx147 = getelementptr inbounds double, ptr %f, i64 %idxprom29
  %77 = load double, ptr %arrayidx147, align 8, !tbaa !12
  %add148 = fadd double %77, %mul122
  store double %add148, ptr %arrayidx147, align 8, !tbaa !12
  %add149 = fadd double %mul118, %mul122
  %arrayidx153 = getelementptr inbounds double, ptr %f, i64 %idxprom13
  %78 = load double, ptr %arrayidx153, align 8, !tbaa !12
  %sub154 = fsub double %78, %add149
  store double %sub154, ptr %arrayidx153, align 8, !tbaa !12
  %arrayidx158 = getelementptr inbounds double, ptr %f, i64 %idxprom16
  %79 = load double, ptr %arrayidx158, align 8, !tbaa !12
  %add159 = fadd double %mul126, %79
  store double %add159, ptr %arrayidx158, align 8, !tbaa !12
  %arrayidx163 = getelementptr inbounds double, ptr %f, i64 %idxprom35
  %80 = load double, ptr %arrayidx163, align 8, !tbaa !12
  %add164 = fadd double %mul130, %80
  store double %add164, ptr %arrayidx163, align 8, !tbaa !12
  %add165 = fadd double %mul126, %mul130
  %arrayidx169 = getelementptr inbounds double, ptr %f, i64 %idxprom19
  %81 = load double, ptr %arrayidx169, align 8, !tbaa !12
  %sub170 = fsub double %81, %add165
  store double %sub170, ptr %arrayidx169, align 8, !tbaa !12
  %arrayidx174 = getelementptr inbounds double, ptr %f, i64 %idxprom23
  %82 = load double, ptr %arrayidx174, align 8, !tbaa !12
  %add175 = fadd double %mul134, %82
  store double %add175, ptr %arrayidx174, align 8, !tbaa !12
  %arrayidx179 = getelementptr inbounds double, ptr %f, i64 %idxprom42
  %83 = load double, ptr %arrayidx179, align 8, !tbaa !12
  %add180 = fadd double %mul138, %83
  store double %add180, ptr %arrayidx179, align 8, !tbaa !12
  %add181 = fadd double %mul134, %mul138
  %arrayidx185 = getelementptr inbounds double, ptr %f, i64 %idxprom26
  %84 = load double, ptr %arrayidx185, align 8, !tbaa !12
  %sub186 = fsub double %84, %add181
  store double %sub186, ptr %arrayidx185, align 8, !tbaa !12
  %.b = load i1, ptr @dim, align 4
  br i1 %.b, label %if.then188, label %for.inc

if.then188:                                       ; preds = %if.end114
  %85 = extractelement <2 x double> %67, i64 0
  %86 = extractelement <2 x double> %67, i64 1
  %87 = tail call double @llvm.fmuladd.f64(double %neg, double %86, double %85)
  %mul192 = fmul double %87, %mul116
  %88 = tail call double @llvm.fmuladd.f64(double %neg, double %85, double %86)
  %mul196 = fmul double %88, %mul119
  %add198 = add nsw i32 %div, 3
  %idxprom199 = sext i32 %add198 to i64
  %arrayidx200 = getelementptr inbounds double, ptr %f, i64 %idxprom199
  %89 = load double, ptr %arrayidx200, align 8, !tbaa !12
  %add201 = fadd double %mul192, %89
  store double %add201, ptr %arrayidx200, align 8, !tbaa !12
  %add203 = add nsw i32 %div8, 3
  %idxprom204 = sext i32 %add203 to i64
  %arrayidx205 = getelementptr inbounds double, ptr %f, i64 %idxprom204
  %90 = load double, ptr %arrayidx205, align 8, !tbaa !12
  %add206 = fadd double %mul196, %90
  store double %add206, ptr %arrayidx205, align 8, !tbaa !12
  %add207 = fadd double %mul192, %mul196
  %add209 = add nsw i32 %div4, 3
  %idxprom210 = sext i32 %add209 to i64
  %arrayidx211 = getelementptr inbounds double, ptr %f, i64 %idxprom210
  %91 = load double, ptr %arrayidx211, align 8, !tbaa !12
  %sub212 = fsub double %91, %add207
  store double %sub212, ptr %arrayidx211, align 8, !tbaa !12
  %.b157.pre = load i1, ptr @dim, align 4
  br label %for.inc

for.inc:                                          ; preds = %if.end114, %if.then188
  %.b157168 = phi i1 [ false, %if.end114 ], [ %.b157.pre, %if.then188 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.end, label %for.body, !llvm.loop !158

for.end:                                          ; preds = %for.inc, %entry
  %e_theta.0.lcssa = phi double [ 0.000000e+00, %entry ], [ %add103, %for.inc ]
  ret double %e_theta.0.lcssa
}

; Function Attrs: nounwind uwtable
define internal fastcc double @ephi(i32 noundef %nphi, ptr nocapture noundef readonly %a1, ptr nocapture noundef readonly %a2, ptr nocapture noundef readonly %a3, ptr nocapture noundef readonly %a4, ptr nocapture noundef readonly %atype, ptr nocapture noundef readonly %Pk, ptr nocapture noundef readonly %Pn, ptr nocapture noundef readonly %Phase, ptr nocapture noundef readonly %x, ptr nocapture noundef %f) unnamed_addr #2 {
entry:
  %cmp529 = icmp sgt i32 %nphi, 0
  br i1 %cmp529, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %nphi to i64
  %.b524.pre544 = load i1, ptr @dim, align 4
  br label %for.body

for.body:                                         ; preds = %for.body.preheader, %for.inc
  %.b524 = phi i1 [ %.b524.pre544, %for.body.preheader ], [ %.b524546, %for.inc ]
  %indvars.iv = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next, %for.inc ]
  %bw.0537 = phi double [ undef, %for.body.preheader ], [ %bw.1, %for.inc ]
  %e_tors.0530 = phi double [ 0.000000e+00, %for.body.preheader ], [ %e_tors.2, %for.inc ]
  %0 = phi <4 x double> [ zeroinitializer, %for.body.preheader ], [ %246, %for.inc ]
  %1 = phi <2 x double> [ undef, %for.body.preheader ], [ %87, %for.inc ]
  %2 = select i1 %.b524, i32 4, i32 3
  %arrayidx = getelementptr inbounds i32, ptr %a1, i64 %indvars.iv
  %3 = load i32, ptr %arrayidx, align 4, !tbaa !5
  %mul = mul nsw i32 %2, %3
  %div = sdiv i32 %mul, 3
  %arrayidx2 = getelementptr inbounds i32, ptr %a2, i64 %indvars.iv
  %4 = load i32, ptr %arrayidx2, align 4, !tbaa !5
  %mul3 = mul nsw i32 %4, %2
  %div4 = sdiv i32 %mul3, 3
  %arrayidx6 = getelementptr inbounds i32, ptr %a3, i64 %indvars.iv
  %5 = load i32, ptr %arrayidx6, align 4, !tbaa !5
  %call = tail call i32 @llvm.abs.i32(i32 %5, i1 true)
  %mul7 = mul nsw i32 %call, %2
  %div8 = udiv i32 %mul7, 3
  %arrayidx10 = getelementptr inbounds i32, ptr %a4, i64 %indvars.iv
  %6 = load i32, ptr %arrayidx10, align 4, !tbaa !5
  %call11 = tail call i32 @llvm.abs.i32(i32 %6, i1 true)
  %mul12 = mul nsw i32 %call11, %2
  %div13 = udiv i32 %mul12, 3
  %arrayidx15 = getelementptr inbounds i32, ptr %atype, i64 %indvars.iv
  %7 = load i32, ptr %arrayidx15, align 4, !tbaa !5
  %sub = add nsw i32 %7, -1
  %idxprom16 = sext i32 %div4 to i64
  %arrayidx17 = getelementptr inbounds double, ptr %x, i64 %idxprom16
  %8 = load double, ptr %arrayidx17, align 8, !tbaa !12
  %idxprom19 = sext i32 %div to i64
  %arrayidx20 = getelementptr inbounds double, ptr %x, i64 %idxprom19
  %9 = load double, ptr %arrayidx20, align 8, !tbaa !12
  %add22 = add nsw i32 %div4, 1
  %idxprom23 = sext i32 %add22 to i64
  %arrayidx24 = getelementptr inbounds double, ptr %x, i64 %idxprom23
  %add25 = add nsw i32 %div, 1
  %idxprom26 = sext i32 %add25 to i64
  %arrayidx27 = getelementptr inbounds double, ptr %x, i64 %idxprom26
  %add29 = add nsw i32 %div4, 2
  %idxprom30 = sext i32 %add29 to i64
  %add32 = add nsw i32 %div, 2
  %idxprom33 = sext i32 %add32 to i64
  %idxprom37 = zext i32 %div8 to i64
  %arrayidx38 = getelementptr inbounds double, ptr %x, i64 %idxprom37
  %10 = load double, ptr %arrayidx38, align 8, !tbaa !12
  %11 = insertelement <2 x double> poison, double %8, i64 0
  %12 = insertelement <2 x double> %11, double %10, i64 1
  %13 = insertelement <2 x double> poison, double %9, i64 0
  %14 = insertelement <2 x double> %13, double %8, i64 1
  %15 = fsub <2 x double> %12, %14
  %add43 = add nuw nsw i32 %div8, 1
  %idxprom44 = zext i32 %add43 to i64
  %arrayidx45 = getelementptr inbounds double, ptr %x, i64 %idxprom44
  %idxprom58 = zext i32 %div13 to i64
  %arrayidx59 = getelementptr inbounds double, ptr %x, i64 %idxprom58
  %16 = load double, ptr %arrayidx59, align 8, !tbaa !12
  %sub63 = fsub double %16, %10
  %add64 = add nuw nsw i32 %div13, 1
  %idxprom65 = zext i32 %add64 to i64
  %arrayidx66 = getelementptr inbounds double, ptr %x, i64 %idxprom65
  %add71 = add nuw nsw i32 %div13, 2
  %idxprom72 = zext i32 %add71 to i64
  %17 = load <2 x double>, ptr %arrayidx66, align 8, !tbaa !12
  %18 = load <2 x double>, ptr %arrayidx24, align 8, !tbaa !12
  %19 = load <2 x double>, ptr %arrayidx27, align 8, !tbaa !12
  %20 = fsub <2 x double> %18, %19
  %21 = load <2 x double>, ptr %arrayidx45, align 8, !tbaa !12
  %22 = fsub <2 x double> %21, %18
  %23 = fsub <2 x double> %17, %21
  br i1 %.b524, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  %add79 = add nsw i32 %div4, 3
  %idxprom80 = sext i32 %add79 to i64
  %arrayidx81 = getelementptr inbounds double, ptr %x, i64 %idxprom80
  %24 = load double, ptr %arrayidx81, align 8, !tbaa !12
  %add82 = add nsw i32 %div, 3
  %idxprom83 = sext i32 %add82 to i64
  %arrayidx84 = getelementptr inbounds double, ptr %x, i64 %idxprom83
  %25 = load double, ptr %arrayidx84, align 8, !tbaa !12
  %add86 = add nuw nsw i32 %div8, 3
  %idxprom87 = zext i32 %add86 to i64
  %arrayidx88 = getelementptr inbounds double, ptr %x, i64 %idxprom87
  %26 = load double, ptr %arrayidx88, align 8, !tbaa !12
  %add93 = add nuw nsw i32 %div13, 3
  %idxprom94 = zext i32 %add93 to i64
  %arrayidx95 = getelementptr inbounds double, ptr %x, i64 %idxprom94
  %27 = load double, ptr %arrayidx95, align 8, !tbaa !12
  %sub99 = fsub double %27, %26
  %28 = insertelement <2 x double> poison, double %24, i64 0
  %29 = insertelement <2 x double> %28, double %26, i64 1
  %30 = insertelement <2 x double> poison, double %25, i64 0
  %31 = insertelement <2 x double> %30, double %24, i64 1
  %32 = fsub <2 x double> %29, %31
  %33 = shufflevector <2 x double> %22, <2 x double> poison, <2 x i32> zeroinitializer
  %34 = shufflevector <2 x double> %20, <2 x double> %23, <2 x i32> <i32 0, i32 2>
  %35 = fmul <2 x double> %33, %34
  %36 = shufflevector <2 x double> %15, <2 x double> poison, <2 x i32> <i32 1, i32 poison>
  %37 = insertelement <2 x double> %36, double %sub63, i64 1
  %38 = tail call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %15, <2 x double> %37, <2 x double> %35)
  %39 = shufflevector <2 x double> %20, <2 x double> %22, <2 x i32> <i32 1, i32 3>
  %40 = shufflevector <2 x double> %22, <2 x double> %23, <2 x i32> <i32 1, i32 3>
  %41 = tail call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %39, <2 x double> %40, <2 x double> %38)
  %42 = shufflevector <2 x double> %32, <2 x double> poison, <2 x i32> <i32 1, i32 poison>
  %43 = insertelement <2 x double> %42, double %sub99, i64 1
  %44 = tail call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %32, <2 x double> %43, <2 x double> %41)
  %45 = shufflevector <2 x double> %20, <2 x double> %22, <2 x i32> <i32 0, i32 2>
  %46 = fmul <2 x double> %45, %45
  %47 = tail call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %15, <2 x double> %15, <2 x double> %46)
  %48 = tail call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %39, <2 x double> %39, <2 x double> %47)
  %49 = tail call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %32, <2 x double> %32, <2 x double> %48)
  %50 = shufflevector <2 x double> %23, <2 x double> poison, <2 x i32> zeroinitializer
  %51 = fmul <2 x double> %50, %34
  %52 = insertelement <2 x double> %15, double %sub63, i64 1
  %53 = shufflevector <2 x double> %52, <2 x double> poison, <2 x i32> <i32 1, i32 1>
  %54 = tail call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %52, <2 x double> %53, <2 x double> %51)
  %55 = shufflevector <2 x double> %20, <2 x double> %23, <2 x i32> <i32 1, i32 3>
  %56 = shufflevector <2 x double> %23, <2 x double> poison, <2 x i32> <i32 1, i32 1>
  %57 = tail call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %55, <2 x double> %56, <2 x double> %54)
  %58 = insertelement <2 x double> %32, double %sub99, i64 1
  %59 = shufflevector <2 x double> %58, <2 x double> poison, <2 x i32> <i32 1, i32 1>
  %60 = tail call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %58, <2 x double> %59, <2 x double> %57)
  %61 = insertelement <2 x double> poison, double %sub99, i64 0
  %62 = shufflevector <2 x double> %61, <2 x double> %32, <2 x i32> <i32 0, i32 2>
  %63 = extractelement <2 x double> %32, i64 1
  br label %if.end

if.else:                                          ; preds = %for.body
  %64 = shufflevector <2 x double> %22, <2 x double> poison, <2 x i32> zeroinitializer
  %65 = shufflevector <2 x double> %20, <2 x double> %23, <2 x i32> <i32 0, i32 2>
  %66 = fmul <2 x double> %64, %65
  %67 = shufflevector <2 x double> %15, <2 x double> poison, <2 x i32> <i32 1, i32 poison>
  %68 = insertelement <2 x double> %67, double %sub63, i64 1
  %69 = tail call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %15, <2 x double> %68, <2 x double> %66)
  %70 = shufflevector <2 x double> %20, <2 x double> %22, <2 x i32> <i32 1, i32 3>
  %71 = shufflevector <2 x double> %22, <2 x double> %23, <2 x i32> <i32 1, i32 3>
  %72 = tail call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %70, <2 x double> %71, <2 x double> %69)
  %73 = shufflevector <2 x double> %20, <2 x double> %22, <2 x i32> <i32 0, i32 2>
  %74 = fmul <2 x double> %73, %73
  %75 = tail call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %15, <2 x double> %15, <2 x double> %74)
  %76 = tail call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %70, <2 x double> %70, <2 x double> %75)
  %77 = shufflevector <2 x double> %23, <2 x double> poison, <2 x i32> zeroinitializer
  %78 = fmul <2 x double> %77, %65
  %79 = insertelement <2 x double> %15, double %sub63, i64 1
  %80 = shufflevector <2 x double> %79, <2 x double> poison, <2 x i32> <i32 1, i32 1>
  %81 = tail call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %79, <2 x double> %80, <2 x double> %78)
  %82 = shufflevector <2 x double> %20, <2 x double> %23, <2 x i32> <i32 1, i32 3>
  %83 = shufflevector <2 x double> %23, <2 x double> poison, <2 x i32> <i32 1, i32 1>
  %84 = tail call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %82, <2 x double> %83, <2 x double> %81)
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %bw.1 = phi double [ %63, %if.then ], [ %bw.0537, %if.else ]
  %85 = phi <2 x double> [ %49, %if.then ], [ %76, %if.else ]
  %86 = phi <2 x double> [ %44, %if.then ], [ %72, %if.else ]
  %87 = phi <2 x double> [ %62, %if.then ], [ %1, %if.else ]
  %88 = phi <2 x double> [ %60, %if.then ], [ %84, %if.else ]
  %89 = fneg <2 x double> %86
  %90 = extractelement <2 x double> %88, i64 0
  %91 = fneg double %90
  %92 = extractelement <2 x double> %85, i64 1
  %neg149 = fmul double %92, %91
  %93 = extractelement <2 x double> %86, i64 0
  %94 = extractelement <2 x double> %86, i64 1
  %95 = tail call double @llvm.fmuladd.f64(double %93, double %94, double %neg149)
  %96 = extractelement <2 x double> %22, i64 0
  %97 = extractelement <2 x double> %23, i64 1
  %mul163 = fmul double %97, %92
  %98 = extractelement <2 x double> %22, i64 1
  %99 = extractelement <2 x double> %89, i64 1
  %100 = tail call double @llvm.fmuladd.f64(double %99, double %98, double %mul163)
  %101 = extractelement <2 x double> %15, i64 0
  %mul165 = fmul double %101, %94
  %102 = tail call double @llvm.fmuladd.f64(double %93, double %sub63, double %mul165)
  %neg168 = fmul double %90, -2.000000e+00
  %103 = extractelement <2 x double> %15, i64 1
  %104 = tail call double @llvm.fmuladd.f64(double %neg168, double %103, double %102)
  %105 = shufflevector <2 x double> %86, <2 x double> poison, <2 x i32> <i32 1, i32 1>
  %106 = fmul <2 x double> %20, %105
  %107 = fneg double %92
  %neg181 = fmul double %101, %107
  %108 = tail call double @llvm.fmuladd.f64(double %93, double %103, double %neg181)
  %109 = extractelement <2 x double> %88, i64 1
  %fneg189 = fneg double %109
  %mul191 = fmul double %sub63, %94
  %110 = tail call double @llvm.fmuladd.f64(double %fneg189, double %103, double %mul191)
  %111 = fmul <2 x double> %23, %105
  %neg206 = fmul double %103, %99
  %112 = tail call double @llvm.fmuladd.f64(double %92, double %sub63, double %neg206)
  %113 = fmul <2 x double> %86, %89
  %114 = shufflevector <2 x double> %85, <2 x double> poison, <2 x i32> <i32 1, i32 1>
  %115 = shufflevector <2 x double> %114, <2 x double> %88, <2 x i32> <i32 0, i32 3>
  %116 = tail call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %85, <2 x double> %115, <2 x double> %113)
  %117 = extractelement <2 x double> %116, i64 0
  %118 = extractelement <2 x double> %116, i64 1
  %mul150 = fmul double %118, %117
  %call151 = tail call double @sqrt(double noundef %mul150) #23
  %div152 = fdiv double 1.000000e+00, %call151
  %mul153 = fmul double %95, %div152
  %mul154 = fmul double %mul153, 5.000000e-01
  %mul155 = fmul double %div152, %mul154
  %119 = fmul <2 x double> %116, <double 2.000000e+00, double -2.000000e+00>
  %120 = extractelement <2 x double> %119, i64 0
  %mul192 = fmul double %110, %120
  %mul207 = fmul double %112, %120
  %121 = extractelement <2 x double> %89, i64 0
  %neg231 = fmul double %98, %121
  %122 = extractelement <2 x double> %20, i64 1
  %123 = tail call double @llvm.fmuladd.f64(double %92, double %122, double %neg231)
  %124 = extractelement <2 x double> %119, i64 1
  %mul232 = fmul double %123, %124
  %mul233 = fmul double %118, 2.000000e+00
  %125 = fmul <2 x double> %15, %89
  %neg236 = extractelement <2 x double> %125, i64 0
  %126 = extractelement <2 x double> %85, i64 0
  %127 = tail call double @llvm.fmuladd.f64(double %126, double %103, double %neg236)
  %mul237 = fmul double %mul233, %127
  %neg255 = fneg double %mul232
  %128 = tail call double @llvm.fmuladd.f64(double %neg255, double %mul155, double %100)
  %mul256 = fmul double %div152, %128
  %fneg271 = fneg double %100
  %sub278 = fsub double %104, %108
  %fneg279 = fneg double %mul192
  %sub280 = fsub double %fneg279, %mul207
  %add281 = fadd double %mul237, %sub280
  %neg283 = fneg double %add281
  %129 = tail call double @llvm.fmuladd.f64(double %neg283, double %mul155, double %sub278)
  %mul284 = fmul double %div152, %129
  %130 = shufflevector <2 x double> %86, <2 x double> poison, <2 x i32> zeroinitializer
  %131 = tail call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %130, <2 x double> %23, <2 x double> %106)
  %132 = insertelement <2 x double> poison, double %neg168, i64 0
  %133 = shufflevector <2 x double> %132, <2 x double> poison, <2 x i32> zeroinitializer
  %134 = tail call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %133, <2 x double> %22, <2 x double> %131)
  %135 = insertelement <2 x double> poison, double %107, i64 0
  %136 = shufflevector <2 x double> %135, <2 x double> poison, <2 x i32> zeroinitializer
  %137 = fmul <2 x double> %20, %136
  %138 = tail call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %130, <2 x double> %22, <2 x double> %137)
  %139 = insertelement <2 x double> poison, double %fneg189, i64 0
  %140 = shufflevector <2 x double> %139, <2 x double> poison, <2 x i32> zeroinitializer
  %141 = tail call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %140, <2 x double> %22, <2 x double> %111)
  %142 = shufflevector <2 x double> %119, <2 x double> poison, <2 x i32> zeroinitializer
  %143 = fmul <2 x double> %141, %142
  %144 = shufflevector <2 x double> %89, <2 x double> poison, <2 x i32> <i32 1, i32 1>
  %145 = fmul <2 x double> %22, %144
  %146 = tail call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %114, <2 x double> %23, <2 x double> %145)
  %147 = fmul <2 x double> %146, %142
  %148 = shufflevector <2 x double> %89, <2 x double> poison, <2 x i32> zeroinitializer
  %149 = fmul <2 x double> %20, %148
  %150 = shufflevector <2 x double> %85, <2 x double> poison, <2 x i32> zeroinitializer
  %151 = tail call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %150, <2 x double> %22, <2 x double> %149)
  %152 = insertelement <2 x double> poison, double %mul233, i64 0
  %153 = shufflevector <2 x double> %152, <2 x double> poison, <2 x i32> zeroinitializer
  %154 = fmul <2 x double> %153, %151
  %155 = shufflevector <2 x double> %23, <2 x double> poison, <2 x i32> <i32 poison, i32 0>
  %156 = insertelement <2 x double> %155, double %sub63, i64 0
  %157 = fmul <2 x double> %156, %114
  %158 = shufflevector <2 x double> %22, <2 x double> poison, <2 x i32> <i32 poison, i32 0>
  %159 = shufflevector <2 x double> %158, <2 x double> %15, <2 x i32> <i32 3, i32 1>
  %160 = tail call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %144, <2 x double> %159, <2 x double> %157)
  %161 = fmul <2 x double> %159, %148
  %162 = shufflevector <2 x double> %20, <2 x double> poison, <2 x i32> <i32 poison, i32 0>
  %163 = shufflevector <2 x double> %15, <2 x double> %162, <2 x i32> <i32 0, i32 3>
  %164 = tail call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %114, <2 x double> %163, <2 x double> %161)
  %165 = shufflevector <2 x double> %119, <2 x double> poison, <2 x i32> <i32 1, i32 1>
  %166 = fmul <2 x double> %164, %165
  %167 = fneg <2 x double> %166
  %168 = insertelement <2 x double> poison, double %mul155, i64 0
  %169 = shufflevector <2 x double> %168, <2 x double> poison, <2 x i32> zeroinitializer
  %170 = tail call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %167, <2 x double> %169, <2 x double> %160)
  %171 = insertelement <2 x double> poison, double %div152, i64 0
  %172 = shufflevector <2 x double> %171, <2 x double> poison, <2 x i32> zeroinitializer
  %173 = fmul <2 x double> %172, %170
  %174 = fneg <2 x double> %160
  %175 = shufflevector <2 x double> %134, <2 x double> poison, <2 x i32> <i32 poison, i32 0>
  %176 = insertelement <2 x double> %175, double %104, i64 0
  %177 = fsub <2 x double> %174, %176
  %178 = shufflevector <2 x double> %143, <2 x double> poison, <2 x i32> <i32 poison, i32 0>
  %179 = insertelement <2 x double> %178, double %mul192, i64 0
  %180 = fsub <2 x double> %179, %166
  %181 = shufflevector <2 x double> %154, <2 x double> poison, <2 x i32> <i32 poison, i32 0>
  %182 = insertelement <2 x double> %181, double %mul237, i64 0
  %183 = fsub <2 x double> %180, %182
  %184 = fneg <2 x double> %183
  %185 = tail call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %184, <2 x double> %169, <2 x double> %177)
  %186 = fmul <2 x double> %172, %185
  %187 = extractelement <2 x double> %134, i64 1
  %sub272 = fsub double %fneg271, %187
  %188 = extractelement <2 x double> %143, i64 1
  %sub273 = fsub double %188, %mul232
  %189 = extractelement <2 x double> %154, i64 1
  %sub274 = fsub double %sub273, %189
  %neg276 = fneg double %sub274
  %190 = tail call double @llvm.fmuladd.f64(double %neg276, double %mul155, double %sub272)
  %mul277 = fmul double %div152, %190
  %191 = fsub <2 x double> %134, %138
  %192 = fneg <2 x double> %143
  %193 = fsub <2 x double> %192, %147
  %194 = fadd <2 x double> %154, %193
  %195 = fneg <2 x double> %194
  %196 = tail call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %195, <2 x double> %169, <2 x double> %191)
  %197 = fmul <2 x double> %172, %196
  %neg300 = fneg double %mul207
  %198 = tail call double @llvm.fmuladd.f64(double %neg300, double %mul155, double %108)
  %mul301 = fmul double %div152, %198
  %199 = extractelement <2 x double> %147, i64 0
  %neg303 = fneg double %199
  %200 = extractelement <2 x double> %138, i64 0
  %201 = tail call double @llvm.fmuladd.f64(double %neg303, double %mul155, double %200)
  %mul304 = fmul double %div152, %201
  %202 = extractelement <2 x double> %147, i64 1
  %neg306 = fneg double %202
  %203 = extractelement <2 x double> %138, i64 1
  %204 = tail call double @llvm.fmuladd.f64(double %neg306, double %mul155, double %203)
  %mul307 = fmul double %div152, %204
  %.b523 = load i1, ptr @dim, align 4
  br i1 %.b523, label %if.then309, label %if.end361

if.then309:                                       ; preds = %if.end
  %205 = shufflevector <2 x double> %89, <2 x double> poison, <2 x i32> <i32 1, i32 0>
  %206 = shufflevector <2 x double> %86, <2 x double> poison, <2 x i32> <i32 poison, i32 0>
  %207 = extractelement <2 x double> %87, i64 0
  %mul312 = fmul double %92, %207
  %208 = tail call double @llvm.fmuladd.f64(double %99, double %bw.1, double %mul312)
  %209 = extractelement <2 x double> %87, i64 1
  %mul314 = fmul double %94, %209
  %210 = tail call double @llvm.fmuladd.f64(double %93, double %207, double %mul314)
  %neg320 = fmul double %209, %107
  %211 = insertelement <2 x double> %206, double %neg168, i64 0
  %212 = insertelement <2 x double> poison, double %bw.1, i64 0
  %213 = shufflevector <2 x double> %212, <2 x double> poison, <2 x i32> zeroinitializer
  %214 = insertelement <2 x double> poison, double %210, i64 0
  %215 = insertelement <2 x double> %214, double %neg320, i64 1
  %216 = tail call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %211, <2 x double> %213, <2 x double> %215)
  %mul324 = fmul double %94, %207
  %217 = tail call double @llvm.fmuladd.f64(double %fneg189, double %bw.1, double %mul324)
  %mul325 = fmul double %120, %217
  %218 = fmul <2 x double> %213, %205
  %neg339 = fmul double %209, %121
  %219 = tail call double @llvm.fmuladd.f64(double %126, double %bw.1, double %neg339)
  %mul340 = fmul double %mul233, %219
  %fneg344 = fneg double %208
  %220 = extractelement <2 x double> %216, i64 0
  %sub345 = fsub double %fneg344, %220
  %shift = shufflevector <2 x double> %216, <2 x double> poison, <2 x i32> <i32 1, i32 poison>
  %221 = fsub <2 x double> %216, %shift
  %sub351 = extractelement <2 x double> %221, i64 0
  %fneg352 = fneg double %mul325
  %222 = tail call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %114, <2 x double> %87, <2 x double> %218)
  %223 = fmul <2 x double> %119, %222
  %224 = insertelement <2 x double> poison, double %fneg352, i64 0
  %225 = insertelement <2 x double> %224, double %mul325, i64 1
  %226 = fsub <2 x double> %225, %223
  %227 = insertelement <2 x double> poison, double %mul340, i64 0
  %228 = shufflevector <2 x double> %227, <2 x double> poison, <2 x i32> zeroinitializer
  %229 = fadd <2 x double> %226, %228
  %230 = fsub <2 x double> %226, %228
  %231 = shufflevector <2 x double> %229, <2 x double> %230, <2 x i32> <i32 0, i32 3>
  %232 = shufflevector <2 x double> %223, <2 x double> %231, <4 x i32> <i32 0, i32 2, i32 3, i32 poison>
  %233 = shufflevector <2 x double> %223, <2 x double> poison, <4 x i32> <i32 poison, i32 1, i32 poison, i32 poison>
  %234 = shufflevector <4 x double> %232, <4 x double> %233, <4 x i32> <i32 0, i32 1, i32 2, i32 5>
  %235 = fneg <4 x double> %234
  %236 = insertelement <4 x double> poison, double %mul155, i64 0
  %237 = shufflevector <4 x double> %236, <4 x double> poison, <4 x i32> zeroinitializer
  %238 = shufflevector <2 x double> %216, <2 x double> poison, <4 x i32> <i32 1, i32 poison, i32 poison, i32 poison>
  %239 = insertelement <4 x double> %238, double %sub351, i64 1
  %240 = insertelement <4 x double> %239, double %sub345, i64 2
  %241 = insertelement <4 x double> %240, double %208, i64 3
  %242 = tail call <4 x double> @llvm.fmuladd.v4f64(<4 x double> %235, <4 x double> %237, <4 x double> %241)
  %243 = insertelement <4 x double> poison, double %div152, i64 0
  %244 = shufflevector <4 x double> %243, <4 x double> poison, <4 x i32> zeroinitializer
  %245 = fmul <4 x double> %244, %242
  br label %if.end361

if.end361:                                        ; preds = %if.then309, %if.end
  %246 = phi <4 x double> [ %245, %if.then309 ], [ %0, %if.end ]
  %247 = load ptr, ptr @prm, align 8, !tbaa !9
  %Nhparm = getelementptr inbounds %struct.parm, ptr %247, i64 0, i32 12
  %248 = load i32, ptr %Nhparm, align 8, !tbaa !159
  %tobool.not = icmp eq i32 %248, 0
  br i1 %tobool.not, label %multi_term, label %land.lhs.true

land.lhs.true:                                    ; preds = %if.end361
  %249 = load i32, ptr %arrayidx6, align 4, !tbaa !5
  %cmp364 = icmp slt i32 %249, 0
  br i1 %cmp364, label %if.then365, label %multi_term

if.then365:                                       ; preds = %land.lhs.true
  %cmp366 = fcmp ogt double %mul153, 1.000000e+00
  %cond = select i1 %cmp366, double 1.000000e+00, double %mul153
  %cmp367 = fcmp olt double %cond, -1.000000e+00
  %cond371 = select i1 %cmp367, double -1.000000e+00, double %cond
  %call372 = tail call double @acos(double noundef %cond371) #23
  %250 = fneg double %122
  %neg375 = fmul double %96, %250
  %251 = extractelement <2 x double> %20, i64 0
  %252 = tail call double @llvm.fmuladd.f64(double %251, double %98, double %neg375)
  %253 = fneg double %101
  %neg378 = fmul double %98, %253
  %254 = tail call double @llvm.fmuladd.f64(double %122, double %103, double %neg378)
  %255 = fneg double %251
  %neg381 = fmul double %103, %255
  %256 = tail call double @llvm.fmuladd.f64(double %101, double %96, double %neg381)
  %257 = fneg double %98
  %258 = extractelement <2 x double> %23, i64 0
  %neg384 = fmul double %258, %257
  %259 = tail call double @llvm.fmuladd.f64(double %96, double %97, double %neg384)
  %260 = fneg double %103
  %neg387 = fmul double %97, %260
  %261 = tail call double @llvm.fmuladd.f64(double %98, double %sub63, double %neg387)
  %262 = fneg double %96
  %neg390 = fmul double %sub63, %262
  %263 = tail call double @llvm.fmuladd.f64(double %103, double %258, double %neg390)
  %264 = fneg double %256
  %neg393 = fmul double %261, %264
  %265 = tail call double @llvm.fmuladd.f64(double %254, double %263, double %neg393)
  %266 = fneg double %252
  %neg396 = fmul double %263, %266
  %267 = tail call double @llvm.fmuladd.f64(double %256, double %259, double %neg396)
  %268 = fneg double %254
  %neg399 = fmul double %259, %268
  %269 = tail call double @llvm.fmuladd.f64(double %252, double %261, double %neg399)
  %mul401 = fmul double %96, %267
  %270 = tail call double @llvm.fmuladd.f64(double %265, double %103, double %mul401)
  %271 = tail call double @llvm.fmuladd.f64(double %269, double %98, double %270)
  %cmp403 = fcmp olt double %271, 0.000000e+00
  %fneg405 = fneg double %call372
  %phi.0 = select i1 %cmp403, double %fneg405, double %call372
  %idxprom407 = sext i32 %sub to i64
  %arrayidx408 = getelementptr inbounds double, ptr %Phase, i64 %idxprom407
  %272 = load double, ptr %arrayidx408, align 8, !tbaa !12
  %sub409 = fsub double %phi.0, %272
  %cmp410 = fcmp ogt double %sub409, 0x400921FB5A7ED197
  %cond414 = select i1 %cmp410, double 0x400921FB5A7ED197, double %sub409
  %cmp416 = fcmp olt double %cond414, 0xC00921FB5A7ED197
  %cond421 = select i1 %cmp416, double 0xC00921FB5A7ED197, double %cond414
  %arrayidx423 = getelementptr inbounds double, ptr %Pk, i64 %idxprom407
  %273 = load double, ptr %arrayidx423, align 8, !tbaa !12
  %mul424 = fmul double %273, %cond421
  %mul425 = fmul double %cond421, %mul424
  %add426 = fadd double %e_tors.0530, %mul425
  %call427 = tail call double @sin(double noundef %phi.0) #23
  %274 = tail call double @llvm.fabs.f64(double %call427)
  %cmp428 = fcmp ogt double %274, 1.000000e-03
  br i1 %cmp428, label %if.then429, label %if.else432

if.then429:                                       ; preds = %if.then365
  %mul430 = fmul double %mul424, -2.000000e+00
  %div431 = fdiv double %mul430, %call427
  br label %if.end545

if.else432:                                       ; preds = %if.then365
  %275 = tail call double @llvm.fabs.f64(double %cond421)
  %cmp433 = fcmp olt double %275, 1.000000e-01
  br i1 %cmp433, label %if.then434, label %if.else460

if.then434:                                       ; preds = %if.else432
  %276 = load double, ptr %arrayidx408, align 8, !tbaa !12
  %cmp437 = fcmp oeq double %276, 0.000000e+00
  br i1 %cmp437, label %if.then438, label %if.else446

if.then438:                                       ; preds = %if.then434
  %277 = load double, ptr %arrayidx423, align 8, !tbaa !12
  %mul441 = fmul double %277, -2.000000e+00
  %mul442 = fmul double %phi.0, %phi.0
  %div443 = fdiv double %mul442, 6.000000e+00
  %add444 = fadd double %div443, 1.000000e+00
  %mul445 = fmul double %add444, %mul441
  br label %if.end545

if.else446:                                       ; preds = %if.then434
  %278 = tail call double @llvm.fabs.f64(double %276)
  %cmp449 = fcmp oeq double %278, 0x400921FB5A7ED197
  br i1 %cmp449, label %if.then450, label %if.end545

if.then450:                                       ; preds = %if.else446
  %279 = load double, ptr %arrayidx423, align 8, !tbaa !12
  %mul453 = fmul double %279, 2.000000e+00
  %mul454 = fmul double %cond421, %cond421
  %div455 = fdiv double %mul454, 6.000000e+00
  %add456 = fadd double %div455, 1.000000e+00
  %mul457 = fmul double %add456, %mul453
  br label %if.end545

if.else460:                                       ; preds = %if.else432
  %cmp461 = fcmp ogt double %phi.0, 0.000000e+00
  %cmp464 = fcmp olt double %phi.0, 0x3FF921FB5A7ED197
  %or.cond = and i1 %cmp461, %cmp464
  br i1 %or.cond, label %if.then470, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %if.else460
  %cmp465 = fcmp olt double %phi.0, 0.000000e+00
  %cmp469 = fcmp ogt double %phi.0, 0xBFF921FB5A7ED197
  %or.cond527 = and i1 %cmp465, %cmp469
  br i1 %or.cond527, label %if.then470, label %if.else472

if.then470:                                       ; preds = %lor.lhs.false, %if.else460
  %mul471 = fmul double %mul424, 1.000000e+03
  br label %if.end545

if.else472:                                       ; preds = %lor.lhs.false
  %mul474 = fmul double %mul424, -1.000000e+03
  br label %if.end545

multi_term:                                       ; preds = %if.end361, %land.lhs.true, %if.then634
  %e_tors.1 = phi double [ %e_tors.2, %if.then634 ], [ %e_tors.0530, %land.lhs.true ], [ %e_tors.0530, %if.end361 ]
  %atyp.0 = phi i32 [ %inc, %if.then634 ], [ %sub, %land.lhs.true ], [ %sub, %if.end361 ]
  %co.0 = phi double [ %co.1, %if.then634 ], [ %mul153, %land.lhs.true ], [ %mul153, %if.end361 ]
  %idxprom479 = sext i32 %atyp.0 to i64
  %arrayidx480 = getelementptr inbounds double, ptr %Phase, i64 %idxprom479
  %280 = load double, ptr %arrayidx480, align 8, !tbaa !12
  %sub481 = fadd double %280, -3.142000e+00
  %281 = tail call double @llvm.fabs.f64(double %sub481)
  %cmp482 = fcmp olt double %281, 1.000000e-02
  %. = select i1 %cmp482, double -1.000000e+00, double 1.000000e+00
  %arrayidx487 = getelementptr inbounds double, ptr %Pk, i64 %idxprom479
  %282 = load double, ptr %arrayidx487, align 8, !tbaa !12
  %arrayidx489 = getelementptr inbounds double, ptr %Pn, i64 %idxprom479
  %283 = load double, ptr %arrayidx489, align 8, !tbaa !12
  %284 = tail call double @llvm.fabs.f64(double %283)
  %conv = fptosi double %284 to i32
  switch i32 %conv, label %sw.default [
    i32 1, label %sw.bb
    i32 2, label %sw.bb493
    i32 3, label %sw.bb501
    i32 4, label %sw.bb510
    i32 6, label %sw.bb521
  ]

sw.bb:                                            ; preds = %multi_term
  %285 = tail call double @llvm.fmuladd.f64(double %., double %co.0, double 1.000000e+00)
  %mul492 = fmul double %282, %.
  br label %sw.epilog

sw.bb493:                                         ; preds = %multi_term
  %mul494 = fmul double %co.0, 2.000000e+00
  %286 = tail call double @llvm.fmuladd.f64(double %mul494, double %co.0, double -1.000000e+00)
  %287 = tail call double @llvm.fmuladd.f64(double %., double %286, double 1.000000e+00)
  %mul498 = fmul double %282, %.
  %mul499 = fmul double %mul498, 4.000000e+00
  %mul500 = fmul double %co.0, %mul499
  br label %sw.epilog

sw.bb501:                                         ; preds = %multi_term
  %mul502 = fmul double %co.0, %co.0
  %mul503 = fmul double %co.0, %.
  %288 = tail call double @llvm.fmuladd.f64(double %mul502, double 4.000000e+00, double -3.000000e+00)
  %289 = tail call double @llvm.fmuladd.f64(double %mul503, double %288, double 1.000000e+00)
  %mul507 = fmul double %282, %.
  %290 = tail call double @llvm.fmuladd.f64(double %mul502, double 1.200000e+01, double -3.000000e+00)
  %mul509 = fmul double %290, %mul507
  br label %sw.epilog

sw.bb510:                                         ; preds = %multi_term
  %mul511 = fmul double %co.0, %co.0
  %mul512 = fmul double %mul511, 8.000000e+00
  %sub513 = fadd double %mul511, -1.000000e+00
  %291 = tail call double @llvm.fmuladd.f64(double %mul512, double %sub513, double 1.000000e+00)
  %292 = tail call double @llvm.fmuladd.f64(double %., double %291, double 1.000000e+00)
  %mul517 = fmul double %282, %.
  %mul518 = fmul double %co.0, %mul517
  %293 = tail call double @llvm.fmuladd.f64(double %mul511, double 3.200000e+01, double -1.600000e+01)
  %mul520 = fmul double %293, %mul518
  br label %sw.epilog

sw.bb521:                                         ; preds = %multi_term
  %mul522 = fmul double %co.0, %co.0
  %mul523 = fmul double %mul522, 3.200000e+01
  %mul524 = fmul double %mul522, %mul523
  %294 = fmul double %mul522, -4.800000e+01
  %neg528 = fmul double %mul522, %294
  %295 = tail call double @llvm.fmuladd.f64(double %mul524, double %mul522, double %neg528)
  %296 = tail call double @llvm.fmuladd.f64(double %mul522, double 1.800000e+01, double %295)
  %sub530 = fadd double %296, -1.000000e+00
  %297 = tail call double @llvm.fmuladd.f64(double %., double %sub530, double 1.000000e+00)
  %mul533 = fmul double %282, %.
  %mul534 = fmul double %co.0, %mul533
  %mul535 = fmul double %mul522, 1.920000e+02
  %neg538 = fneg double %mul535
  %298 = tail call double @llvm.fmuladd.f64(double %mul535, double %mul522, double %neg538)
  %add539 = fadd double %298, 3.600000e+01
  %mul540 = fmul double %add539, %mul534
  br label %sw.epilog

sw.default:                                       ; preds = %multi_term
  %299 = load ptr, ptr @stderr, align 8, !tbaa !9
  %call543 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %299, ptr noundef nonnull @.str.84, i32 noundef %div, i32 noundef %div4, i32 noundef %div8, i32 noundef %div13, double noundef %283) #25
  tail call void @exit(i32 noundef 1) #22
  unreachable

sw.epilog:                                        ; preds = %sw.bb521, %sw.bb510, %sw.bb501, %sw.bb493, %sw.bb
  %df.1 = phi double [ %mul540, %sw.bb521 ], [ %mul520, %sw.bb510 ], [ %mul509, %sw.bb501 ], [ %mul500, %sw.bb493 ], [ %mul492, %sw.bb ]
  %.pn = phi double [ %297, %sw.bb521 ], [ %292, %sw.bb510 ], [ %289, %sw.bb501 ], [ %287, %sw.bb493 ], [ %285, %sw.bb ]
  %e.0 = fmul double %282, %.pn
  %add544 = fadd double %e_tors.1, %e.0
  br label %if.end545

if.end545:                                        ; preds = %if.then429, %if.then470, %if.else472, %if.then438, %if.then450, %if.else446, %sw.epilog
  %e_tors.2 = phi double [ %add544, %sw.epilog ], [ %add426, %if.else446 ], [ %add426, %if.then450 ], [ %add426, %if.then438 ], [ %add426, %if.else472 ], [ %add426, %if.then470 ], [ %add426, %if.then429 ]
  %atyp.1 = phi i32 [ %atyp.0, %sw.epilog ], [ %sub, %if.else446 ], [ %sub, %if.then450 ], [ %sub, %if.then438 ], [ %sub, %if.else472 ], [ %sub, %if.then470 ], [ %sub, %if.then429 ]
  %df.2 = phi double [ %df.1, %sw.epilog ], [ %mul424, %if.else446 ], [ %mul457, %if.then450 ], [ %mul445, %if.then438 ], [ %mul474, %if.else472 ], [ %mul471, %if.then470 ], [ %div431, %if.then429 ]
  %co.1 = phi double [ %co.0, %sw.epilog ], [ %cond371, %if.else446 ], [ %cond371, %if.then450 ], [ %cond371, %if.then438 ], [ %cond371, %if.else472 ], [ %cond371, %if.then470 ], [ %cond371, %if.then429 ]
  %arrayidx550 = getelementptr inbounds double, ptr %f, i64 %idxprom19
  %300 = load <2 x double>, ptr %arrayidx550, align 8, !tbaa !12
  %301 = insertelement <2 x double> poison, double %df.2, i64 0
  %302 = shufflevector <2 x double> %301, <2 x double> poison, <2 x i32> zeroinitializer
  %303 = tail call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %302, <2 x double> %173, <2 x double> %300)
  store <2 x double> %303, ptr %arrayidx550, align 8, !tbaa !12
  %arrayidx560 = getelementptr inbounds double, ptr %f, i64 %idxprom33
  %304 = load double, ptr %arrayidx560, align 8, !tbaa !12
  %305 = tail call double @llvm.fmuladd.f64(double %df.2, double %mul256, double %304)
  store double %305, ptr %arrayidx560, align 8, !tbaa !12
  %arrayidx565 = getelementptr inbounds double, ptr %f, i64 %idxprom16
  %306 = load <2 x double>, ptr %arrayidx565, align 8, !tbaa !12
  %307 = tail call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %302, <2 x double> %186, <2 x double> %306)
  store <2 x double> %307, ptr %arrayidx565, align 8, !tbaa !12
  %arrayidx575 = getelementptr inbounds double, ptr %f, i64 %idxprom30
  %308 = load double, ptr %arrayidx575, align 8, !tbaa !12
  %309 = tail call double @llvm.fmuladd.f64(double %df.2, double %mul277, double %308)
  store double %309, ptr %arrayidx575, align 8, !tbaa !12
  %arrayidx580 = getelementptr inbounds double, ptr %f, i64 %idxprom37
  %310 = load double, ptr %arrayidx580, align 8, !tbaa !12
  %311 = tail call double @llvm.fmuladd.f64(double %df.2, double %mul284, double %310)
  store double %311, ptr %arrayidx580, align 8, !tbaa !12
  %arrayidx585 = getelementptr inbounds double, ptr %f, i64 %idxprom44
  %312 = load <2 x double>, ptr %arrayidx585, align 8, !tbaa !12
  %313 = tail call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %302, <2 x double> %197, <2 x double> %312)
  store <2 x double> %313, ptr %arrayidx585, align 8, !tbaa !12
  %arrayidx595 = getelementptr inbounds double, ptr %f, i64 %idxprom58
  %314 = load double, ptr %arrayidx595, align 8, !tbaa !12
  %315 = tail call double @llvm.fmuladd.f64(double %df.2, double %mul301, double %314)
  store double %315, ptr %arrayidx595, align 8, !tbaa !12
  %arrayidx600 = getelementptr inbounds double, ptr %f, i64 %idxprom65
  %316 = load double, ptr %arrayidx600, align 8, !tbaa !12
  %317 = tail call double @llvm.fmuladd.f64(double %df.2, double %mul304, double %316)
  store double %317, ptr %arrayidx600, align 8, !tbaa !12
  %arrayidx605 = getelementptr inbounds double, ptr %f, i64 %idxprom72
  %318 = load double, ptr %arrayidx605, align 8, !tbaa !12
  %319 = tail call double @llvm.fmuladd.f64(double %df.2, double %mul307, double %318)
  store double %319, ptr %arrayidx605, align 8, !tbaa !12
  %.b = load i1, ptr @dim, align 4
  br i1 %.b, label %if.then608, label %if.end629

if.then608:                                       ; preds = %if.end545
  %add611 = add nsw i32 %div, 3
  %idxprom612 = sext i32 %add611 to i64
  %arrayidx613 = getelementptr inbounds double, ptr %f, i64 %idxprom612
  %320 = load double, ptr %arrayidx613, align 8, !tbaa !12
  %321 = extractelement <4 x double> %246, i64 3
  %322 = tail call double @llvm.fmuladd.f64(double %df.2, double %321, double %320)
  store double %322, ptr %arrayidx613, align 8, !tbaa !12
  %add616 = add nsw i32 %div4, 3
  %idxprom617 = sext i32 %add616 to i64
  %arrayidx618 = getelementptr inbounds double, ptr %f, i64 %idxprom617
  %323 = load double, ptr %arrayidx618, align 8, !tbaa !12
  %324 = extractelement <4 x double> %246, i64 2
  %325 = tail call double @llvm.fmuladd.f64(double %df.2, double %324, double %323)
  store double %325, ptr %arrayidx618, align 8, !tbaa !12
  %add621 = add nuw nsw i32 %div8, 3
  %idxprom622 = zext i32 %add621 to i64
  %arrayidx623 = getelementptr inbounds double, ptr %f, i64 %idxprom622
  %326 = load double, ptr %arrayidx623, align 8, !tbaa !12
  %327 = extractelement <4 x double> %246, i64 1
  %328 = tail call double @llvm.fmuladd.f64(double %df.2, double %327, double %326)
  store double %328, ptr %arrayidx623, align 8, !tbaa !12
  %add626 = add nuw nsw i32 %div13, 3
  %idxprom627 = zext i32 %add626 to i64
  %arrayidx628 = getelementptr inbounds double, ptr %f, i64 %idxprom627
  %329 = load double, ptr %arrayidx628, align 8, !tbaa !12
  %330 = extractelement <4 x double> %246, i64 0
  %331 = tail call double @llvm.fmuladd.f64(double %df.2, double %330, double %329)
  store double %331, ptr %arrayidx628, align 8, !tbaa !12
  %.b524.pre = load i1, ptr @dim, align 4
  br label %if.end629

if.end629:                                        ; preds = %if.then608, %if.end545
  %.b524546 = phi i1 [ %.b524.pre, %if.then608 ], [ false, %if.end545 ]
  %idxprom630 = sext i32 %atyp.1 to i64
  %arrayidx631 = getelementptr inbounds double, ptr %Pn, i64 %idxprom630
  %332 = load double, ptr %arrayidx631, align 8, !tbaa !12
  %cmp632 = fcmp olt double %332, 0.000000e+00
  br i1 %cmp632, label %if.then634, label %for.inc

if.then634:                                       ; preds = %if.end629
  %inc = add nsw i32 %atyp.1, 1
  br label %multi_term

for.inc:                                          ; preds = %if.end629
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.not, label %for.end, label %for.body, !llvm.loop !160

for.end:                                          ; preds = %for.inc, %entry
  %e_tors.0.lcssa = phi double [ 0.000000e+00, %entry ], [ %e_tors.2, %for.inc ]
  ret double %e_tors.0.lcssa
}

; Function Attrs: nounwind uwtable
define internal fastcc void @nbond(ptr nocapture noundef readonly %lpears, ptr nocapture noundef readonly %upears, ptr nocapture noundef readonly %pearlist, i32 noundef %N14, ptr nocapture noundef readonly %x, ptr nocapture noundef %f, ptr nocapture noundef writeonly %enb, ptr nocapture noundef writeonly %eel, double noundef %enbfac, double noundef %eelfac) unnamed_addr #2 {
entry:
  %div = fdiv double 1.000000e+00, %enbfac
  %div1 = fdiv double 1.000000e+00, %eelfac
  %0 = load ptr, ptr @prm, align 8, !tbaa !9
  %Natom = getelementptr inbounds %struct.parm, ptr %0, i64 0, i32 4
  %1 = load i32, ptr %Natom, align 8, !tbaa !27
  %call = tail call ptr @ivector(i32 noundef -1, i32 noundef %1) #23
  %2 = load ptr, ptr @prm, align 8, !tbaa !9
  %Natom2269 = getelementptr inbounds %struct.parm, ptr %2, i64 0, i32 4
  %3 = load i32, ptr %Natom2269, align 8, !tbaa !27
  %cmp270 = icmp sgt i32 %3, -1
  br i1 %cmp270, label %for.body, label %for.cond3.preheader

for.cond3.preheader:                              ; preds = %for.body, %entry
  %4 = load ptr, ptr @prm, align 8, !tbaa !9
  %Natom4293 = getelementptr inbounds %struct.parm, ptr %4, i64 0, i32 4
  %5 = load i32, ptr %Natom4293, align 8, !tbaa !27
  %cmp5295 = icmp sgt i32 %5, 1
  br i1 %cmp5295, label %for.body6.lr.ph, label %for.end453

for.body6.lr.ph:                                  ; preds = %for.cond3.preheader
  %cmp46 = icmp eq i32 %N14, 0
  %cmp280 = fcmp une double %enbfac, 1.000000e+00
  %6 = insertelement <2 x double> <double 6.000000e+00, double poison>, double %div, i64 1
  %7 = insertelement <2 x double> <double 1.000000e+01, double poison>, double %div, i64 1
  br label %for.body6

for.body:                                         ; preds = %entry, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ -1, %entry ]
  %arrayidx = getelementptr inbounds i32, ptr %call, i64 %indvars.iv
  store i32 -1, ptr %arrayidx, align 4, !tbaa !5
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %8 = load ptr, ptr @prm, align 8, !tbaa !9
  %Natom2 = getelementptr inbounds %struct.parm, ptr %8, i64 0, i32 4
  %9 = load i32, ptr %Natom2, align 8, !tbaa !27
  %10 = sext i32 %9 to i64
  %cmp = icmp slt i64 %indvars.iv.next, %10
  br i1 %cmp, label %for.body, label %for.cond3.preheader, !llvm.loop !161

for.body6:                                        ; preds = %for.body6.lr.ph, %for.inc451
  %indvars.iv315 = phi i64 [ 0, %for.body6.lr.ph ], [ %indvars.iv.next316, %for.inc451 ]
  %11 = phi ptr [ %4, %for.body6.lr.ph ], [ %103, %for.inc451 ]
  %wij.0301 = phi double [ undef, %for.body6.lr.ph ], [ %wij.4, %for.inc451 ]
  %dumw.0300 = phi double [ 0.000000e+00, %for.body6.lr.ph ], [ %dumw.4, %for.inc451 ]
  %evdw.0298 = phi double [ 0.000000e+00, %for.body6.lr.ph ], [ %evdw.4, %for.inc451 ]
  %wi.0297 = phi double [ 0.000000e+00, %for.body6.lr.ph ], [ %wi.2, %for.inc451 ]
  %elec.0296 = phi double [ 0.000000e+00, %for.body6.lr.ph ], [ %elec.5, %for.inc451 ]
  %arrayidx8 = getelementptr inbounds i32, ptr %upears, i64 %indvars.iv315
  %12 = load i32, ptr %arrayidx8, align 4, !tbaa !5
  %cmp9 = icmp slt i32 %12, 1
  br i1 %cmp9, label %for.inc451, label %if.end

if.end:                                           ; preds = %for.body6
  %Ntypes = getelementptr inbounds %struct.parm, ptr %11, i64 0, i32 5
  %13 = load i32, ptr %Ntypes, align 4, !tbaa !93
  %Iac = getelementptr inbounds %struct.parm, ptr %11, i64 0, i32 59
  %14 = load ptr, ptr %Iac, align 8, !tbaa !94
  %arrayidx11 = getelementptr inbounds i32, ptr %14, i64 %indvars.iv315
  %15 = load i32, ptr %arrayidx11, align 4, !tbaa !5
  %sub12 = add nsw i32 %15, -1
  %mul = mul nsw i32 %sub12, %13
  %Charges = getelementptr inbounds %struct.parm, ptr %11, i64 0, i32 37
  %16 = load ptr, ptr %Charges, align 8, !tbaa !88
  %arrayidx14 = getelementptr inbounds double, ptr %16, i64 %indvars.iv315
  %17 = load double, ptr %arrayidx14, align 8, !tbaa !12
  %mul15 = fmul double %div1, %17
  %.b263 = load i1, ptr @dim, align 4
  %18 = select i1 %.b263, i32 4, i32 3
  %19 = trunc i64 %indvars.iv315 to i32
  %mul16 = mul nuw nsw i32 %18, %19
  %idxprom17 = zext i32 %mul16 to i64
  %arrayidx18 = getelementptr inbounds double, ptr %x, i64 %idxprom17
  %20 = load <2 x double>, ptr %arrayidx18, align 8, !tbaa !12
  %add22 = add nuw nsw i32 %mul16, 2
  %idxprom23 = zext i32 %add22 to i64
  %arrayidx24 = getelementptr inbounds double, ptr %x, i64 %idxprom23
  %21 = load double, ptr %arrayidx24, align 8, !tbaa !12
  br i1 %.b263, label %if.then26, label %if.end30

if.then26:                                        ; preds = %if.end
  %add27 = add nuw nsw i32 %mul16, 3
  %idxprom28 = zext i32 %add27 to i64
  %arrayidx29 = getelementptr inbounds double, ptr %x, i64 %idxprom28
  %22 = load double, ptr %arrayidx29, align 8, !tbaa !12
  br label %if.end30

if.end30:                                         ; preds = %if.then26, %if.end
  %wi.1 = phi double [ %22, %if.then26 ], [ %wi.0297, %if.end ]
  %dumw.1 = phi double [ 0.000000e+00, %if.then26 ], [ %dumw.0300, %if.end ]
  %23 = load ptr, ptr @prm, align 8, !tbaa !9
  %Iblo272 = getelementptr inbounds %struct.parm, ptr %23, i64 0, i32 60
  %24 = load ptr, ptr %Iblo272, align 8, !tbaa !41
  %arrayidx33273 = getelementptr inbounds i32, ptr %24, i64 %indvars.iv315
  %25 = load i32, ptr %arrayidx33273, align 4, !tbaa !5
  %cmp34274 = icmp sgt i32 %25, 0
  br i1 %cmp34274, label %for.body35, label %for.end45

for.body35:                                       ; preds = %if.end30, %for.body35
  %indvars.iv308 = phi i64 [ %indvars.iv.next309, %for.body35 ], [ 0, %if.end30 ]
  %26 = load ptr, ptr @IexclAt, align 8, !tbaa !9
  %arrayidx37 = getelementptr inbounds ptr, ptr %26, i64 %indvars.iv315
  %27 = load ptr, ptr %arrayidx37, align 8, !tbaa !9
  %arrayidx39 = getelementptr inbounds i32, ptr %27, i64 %indvars.iv308
  %28 = load i32, ptr %arrayidx39, align 4, !tbaa !5
  %sub40 = add nsw i32 %28, -1
  %idxprom41 = sext i32 %sub40 to i64
  %arrayidx42 = getelementptr inbounds i32, ptr %call, i64 %idxprom41
  store i32 %19, ptr %arrayidx42, align 4, !tbaa !5
  %indvars.iv.next309 = add nuw nsw i64 %indvars.iv308, 1
  %29 = load ptr, ptr @prm, align 8, !tbaa !9
  %Iblo = getelementptr inbounds %struct.parm, ptr %29, i64 0, i32 60
  %30 = load ptr, ptr %Iblo, align 8, !tbaa !41
  %arrayidx33 = getelementptr inbounds i32, ptr %30, i64 %indvars.iv315
  %31 = load i32, ptr %arrayidx33, align 4, !tbaa !5
  %32 = sext i32 %31 to i64
  %cmp34 = icmp slt i64 %indvars.iv.next309, %32
  br i1 %cmp34, label %for.body35, label %for.end45, !llvm.loop !162

for.end45:                                        ; preds = %for.body35, %if.end30
  br i1 %cmp46, label %if.then47, label %if.end50

if.then47:                                        ; preds = %for.end45
  %arrayidx49 = getelementptr inbounds i32, ptr %lpears, i64 %indvars.iv315
  %33 = load i32, ptr %arrayidx49, align 4, !tbaa !5
  br label %if.end50

if.end50:                                         ; preds = %for.end45, %if.then47
  %lpair.0 = phi i32 [ %33, %if.then47 ], [ 0, %for.end45 ]
  %cmp52276 = icmp sgt i32 %12, 0
  br i1 %cmp52276, label %for.body53.lr.ph, label %for.end427

for.body53.lr.ph:                                 ; preds = %if.end50
  %arrayidx55 = getelementptr inbounds ptr, ptr %pearlist, i64 %indvars.iv315
  %add274 = add i32 %mul, -1
  %34 = sext i32 %lpair.0 to i64
  %wide.trip.count = zext i32 %12 to i64
  br label %for.body53

for.body53:                                       ; preds = %for.body53.lr.ph, %for.inc425
  %.b262318 = phi i1 [ %.b263, %for.body53.lr.ph ], [ %.b262319, %for.inc425 ]
  %indvars.iv311 = phi i64 [ 0, %for.body53.lr.ph ], [ %indvars.iv.next312, %for.inc425 ]
  %dumz.0282 = phi double [ 0.000000e+00, %for.body53.lr.ph ], [ %dumz.1, %for.inc425 ]
  %wij.1281 = phi double [ %wij.0301, %for.body53.lr.ph ], [ %wij.3, %for.inc425 ]
  %dumw.2280 = phi double [ %dumw.1, %for.body53.lr.ph ], [ %dumw.3, %for.inc425 ]
  %evdw.1278 = phi double [ %evdw.0298, %for.body53.lr.ph ], [ %evdw.3, %for.inc425 ]
  %elec.1277 = phi double [ %elec.0296, %for.body53.lr.ph ], [ %elec.4, %for.inc425 ]
  %35 = phi <2 x double> [ zeroinitializer, %for.body53.lr.ph ], [ %97, %for.inc425 ]
  %36 = load ptr, ptr %arrayidx55, align 8, !tbaa !9
  %cmp56 = icmp eq ptr %36, null
  br i1 %cmp56, label %if.then57, label %if.end60

if.then57:                                        ; preds = %for.body53
  %37 = load ptr, ptr @nabout, align 8, !tbaa !9
  %call58 = tail call i32 (ptr, ptr, ...) @fprintf(ptr noundef %37, ptr noundef nonnull @.str.85, i32 noundef 0)
  %38 = load ptr, ptr @nabout, align 8, !tbaa !9
  %call59 = tail call i32 @fflush(ptr noundef %38)
  %.pre = load ptr, ptr %arrayidx55, align 8, !tbaa !9
  %.b262.pre = load i1, ptr @dim, align 4
  br label %if.end60

if.end60:                                         ; preds = %if.then57, %for.body53
  %.b262 = phi i1 [ %.b262.pre, %if.then57 ], [ %.b262318, %for.body53 ]
  %39 = phi ptr [ %.pre, %if.then57 ], [ %36, %for.body53 ]
  %40 = add nsw i64 %indvars.iv311, %34
  %arrayidx65 = getelementptr inbounds i32, ptr %39, i64 %40
  %41 = load i32, ptr %arrayidx65, align 4, !tbaa !5
  %42 = select i1 %.b262, i32 4, i32 3
  %mul66 = mul nsw i32 %42, %41
  br i1 %cmp46, label %lor.lhs.false, label %if.then71

lor.lhs.false:                                    ; preds = %if.end60
  %idxprom68 = sext i32 %41 to i64
  %arrayidx69 = getelementptr inbounds i32, ptr %call, i64 %idxprom68
  %43 = load i32, ptr %arrayidx69, align 4, !tbaa !5
  %44 = zext i32 %43 to i64
  %cmp70.not = icmp eq i64 %indvars.iv315, %44
  br i1 %cmp70.not, label %for.inc425, label %if.then71

if.then71:                                        ; preds = %lor.lhs.false, %if.end60
  %idxprom73 = sext i32 %mul66 to i64
  %arrayidx74 = getelementptr inbounds double, ptr %x, i64 %idxprom73
  %45 = load double, ptr %arrayidx74, align 8, !tbaa !12
  %add76 = add nsw i32 %mul66, 1
  %idxprom77 = sext i32 %add76 to i64
  %arrayidx78 = getelementptr inbounds double, ptr %x, i64 %idxprom77
  %46 = load double, ptr %arrayidx78, align 8, !tbaa !12
  %47 = insertelement <2 x double> poison, double %45, i64 0
  %48 = insertelement <2 x double> %47, double %46, i64 1
  %49 = fsub <2 x double> %20, %48
  %add80 = add nsw i32 %mul66, 2
  %idxprom81 = sext i32 %add80 to i64
  %arrayidx82 = getelementptr inbounds double, ptr %x, i64 %idxprom81
  %50 = load double, ptr %arrayidx82, align 8, !tbaa !12
  %sub83 = fsub double %21, %50
  %51 = fmul <2 x double> %49, %49
  %mul85 = extractelement <2 x double> %51, i64 1
  %52 = extractelement <2 x double> %49, i64 0
  %53 = tail call double @llvm.fmuladd.f64(double %52, double %52, double %mul85)
  %54 = tail call double @llvm.fmuladd.f64(double %sub83, double %sub83, double %53)
  br i1 %.b262, label %if.then88, label %if.end94

if.then88:                                        ; preds = %if.then71
  %add89 = add nsw i32 %mul66, 3
  %idxprom90 = sext i32 %add89 to i64
  %arrayidx91 = getelementptr inbounds double, ptr %x, i64 %idxprom90
  %55 = load double, ptr %arrayidx91, align 8, !tbaa !12
  %sub92 = fsub double %wi.1, %55
  %56 = tail call double @llvm.fmuladd.f64(double %sub92, double %sub92, double %54)
  br label %if.end94

if.end94:                                         ; preds = %if.then88, %if.then71
  %wij.2 = phi double [ %sub92, %if.then88 ], [ %wij.1281, %if.then71 ]
  %r2.0 = phi double [ %56, %if.then88 ], [ %54, %if.then71 ]
  %div95 = fdiv double 1.000000e+00, %r2.0
  %call96 = tail call double @sqrt(double noundef %r2.0) #23
  %mul97 = fmul double %call96, %div95
  %57 = load ptr, ptr @prm, align 8, !tbaa !9
  %Charges233 = getelementptr inbounds %struct.parm, ptr %57, i64 0, i32 37
  %58 = load ptr, ptr %Charges233, align 8, !tbaa !88
  %idxprom234 = sext i32 %41 to i64
  %arrayidx235 = getelementptr inbounds double, ptr %58, i64 %idxprom234
  %59 = load double, ptr %arrayidx235, align 8, !tbaa !12
  %mul236 = fmul double %mul15, %59
  %mul237 = fmul double %mul97, %mul236
  %fneg238 = fneg double %mul237
  %add239 = fadd double %elec.1277, %mul237
  %Cno270 = getelementptr inbounds %struct.parm, ptr %57, i64 0, i32 61
  %60 = load ptr, ptr %Cno270, align 8, !tbaa !96
  %Iac271 = getelementptr inbounds %struct.parm, ptr %57, i64 0, i32 59
  %61 = load ptr, ptr %Iac271, align 8, !tbaa !94
  %arrayidx273 = getelementptr inbounds i32, ptr %61, i64 %idxprom234
  %62 = load i32, ptr %arrayidx273, align 4, !tbaa !5
  %sub275 = add i32 %add274, %62
  %idxprom276 = sext i32 %sub275 to i64
  %arrayidx277 = getelementptr inbounds i32, ptr %60, i64 %idxprom276
  %63 = load i32, ptr %arrayidx277, align 4, !tbaa !5
  %cmp278 = icmp sgt i32 %63, 0
  %or.cond = or i1 %cmp280, %cmp278
  br i1 %or.cond, label %if.then281, label %if.else339

if.then281:                                       ; preds = %if.end94
  br i1 %cmp278, label %if.end320, label %if.else284

if.else284:                                       ; preds = %if.then281
  %arrayidx287 = getelementptr inbounds i32, ptr %61, i64 %indvars.iv315
  %64 = load i32, ptr %arrayidx287, align 4, !tbaa !5
  %. = tail call i32 @llvm.smax.i32(i32 %64, i32 %62)
  %cond314 = tail call i32 @llvm.smin.i32(i32 %64, i32 %62)
  %sub315 = add nsw i32 %., -1
  %mul316 = mul nsw i32 %sub315, %.
  %div317 = sdiv i32 %mul316, 2
  %add318 = add nsw i32 %div317, %cond314
  br label %if.end320

if.end320:                                        ; preds = %if.then281, %if.else284
  %ic.0.in = phi i32 [ %add318, %if.else284 ], [ %63, %if.then281 ]
  %ic.0 = add nsw i32 %ic.0.in, -1
  %mul321 = fmul double %div95, %div95
  %mul322 = fmul double %div95, %mul321
  %Cn2323 = getelementptr inbounds %struct.parm, ptr %57, i64 0, i32 48
  %65 = load ptr, ptr %Cn2323, align 8, !tbaa !97
  %idxprom324 = sext i32 %ic.0 to i64
  %arrayidx325 = getelementptr inbounds double, ptr %65, i64 %idxprom324
  %66 = load double, ptr %arrayidx325, align 8, !tbaa !12
  %Cn1327 = getelementptr inbounds %struct.parm, ptr %57, i64 0, i32 47
  %67 = load ptr, ptr %Cn1327, align 8, !tbaa !98
  %arrayidx329 = getelementptr inbounds double, ptr %67, i64 %idxprom324
  %68 = load double, ptr %arrayidx329, align 8, !tbaa !12
  %mul330 = fmul double %mul322, %68
  %mul331 = fmul double %mul322, %mul330
  %mul326 = fmul double %mul322, %66
  %sub332 = fsub double %mul331, %mul326
  %neg336 = fmul double %mul331, -1.200000e+01
  %69 = insertelement <2 x double> poison, double %mul326, i64 0
  %70 = insertelement <2 x double> %69, double %sub332, i64 1
  %71 = insertelement <2 x double> poison, double %neg336, i64 0
  %72 = insertelement <2 x double> %71, double %evdw.1278, i64 1
  %73 = tail call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %70, <2 x double> %6, <2 x double> %72)
  br label %if.end363

if.else339:                                       ; preds = %if.end94
  %sub341 = xor i32 %63, -1
  %mul342 = fmul double %div95, %div95
  %mul343 = fmul double %div95, %mul342
  %mul344 = fmul double %div95, %mul343
  %mul345 = fmul double %div95, %mul344
  %HB10 = getelementptr inbounds %struct.parm, ptr %57, i64 0, i32 50
  %74 = load ptr, ptr %HB10, align 8, !tbaa !163
  %idxprom346 = sext i32 %sub341 to i64
  %arrayidx347 = getelementptr inbounds double, ptr %74, i64 %idxprom346
  %75 = load double, ptr %arrayidx347, align 8, !tbaa !12
  %HB12 = getelementptr inbounds %struct.parm, ptr %57, i64 0, i32 49
  %76 = load ptr, ptr %HB12, align 8, !tbaa !164
  %arrayidx350 = getelementptr inbounds double, ptr %76, i64 %idxprom346
  %77 = load double, ptr %arrayidx350, align 8, !tbaa !12
  %mul351 = fmul double %mul345, %77
  %mul352 = fmul double %div95, %mul351
  %mul348 = fmul double %mul345, %75
  %sub353 = fsub double %mul352, %mul348
  %neg357 = fmul double %mul352, -1.200000e+01
  %78 = insertelement <2 x double> poison, double %mul348, i64 0
  %79 = insertelement <2 x double> %78, double %sub353, i64 1
  %80 = insertelement <2 x double> poison, double %neg357, i64 0
  %81 = insertelement <2 x double> %80, double %evdw.1278, i64 1
  %82 = tail call <2 x double> @llvm.fmuladd.v2f64(<2 x double> %79, <2 x double> %7, <2 x double> %81)
  br label %if.end363

if.end363:                                        ; preds = %if.end320, %if.else339
  %83 = phi <2 x double> [ %73, %if.end320 ], [ %82, %if.else339 ]
  %84 = extractelement <2 x double> %83, i64 0
  %85 = tail call double @llvm.fmuladd.f64(double %84, double %div, double %fneg238)
  %df.0 = fmul double %mul97, %85
  %mul364 = fmul double %mul97, %df.0
  %86 = insertelement <2 x double> poison, double %mul364, i64 0
  %87 = shufflevector <2 x double> %86, <2 x double> poison, <2 x i32> zeroinitializer
  %88 = fmul <2 x double> %49, %87
  %mul367 = fmul double %sub83, %mul364
  %89 = fadd <2 x double> %35, %88
  %add370 = fadd double %dumz.0282, %mul367
  %arrayidx392 = getelementptr inbounds double, ptr %f, i64 %idxprom73
  %90 = load double, ptr %arrayidx392, align 8, !tbaa !12
  %91 = extractelement <2 x double> %88, i64 0
  %sub393 = fsub double %90, %91
  store double %sub393, ptr %arrayidx392, align 8, !tbaa !12
  %arrayidx397 = getelementptr inbounds double, ptr %f, i64 %idxprom77
  %92 = load double, ptr %arrayidx397, align 8, !tbaa !12
  %93 = extractelement <2 x double> %88, i64 1
  %sub398 = fsub double %92, %93
  store double %sub398, ptr %arrayidx397, align 8, !tbaa !12
  %arrayidx402 = getelementptr inbounds double, ptr %f, i64 %idxprom81
  %94 = load double, ptr %arrayidx402, align 8, !tbaa !12
  %sub403 = fsub double %94, %mul367
  store double %sub403, ptr %arrayidx402, align 8, !tbaa !12
  %.b260 = load i1, ptr @dim, align 4
  %95 = extractelement <2 x double> %83, i64 1
  br i1 %.b260, label %for.inc425.sink.split, label %for.inc425

for.inc425.sink.split:                            ; preds = %if.end363
  %mul407.sink = fmul double %wij.2, %mul364
  %add408 = fadd double %dumw.2280, %mul407.sink
  %add418 = add nsw i32 %mul66, 3
  %idxprom419 = sext i32 %add418 to i64
  %arrayidx420 = getelementptr inbounds double, ptr %f, i64 %idxprom419
  %96 = load double, ptr %arrayidx420, align 8, !tbaa !12
  %sub415 = fsub double %96, %mul407.sink
  store double %sub415, ptr %arrayidx420, align 8, !tbaa !12
  br label %for.inc425

for.inc425:                                       ; preds = %if.end363, %for.inc425.sink.split, %lor.lhs.false
  %.b262319 = phi i1 [ %.b262, %lor.lhs.false ], [ true, %for.inc425.sink.split ], [ false, %if.end363 ]
  %elec.4 = phi double [ %elec.1277, %lor.lhs.false ], [ %add239, %for.inc425.sink.split ], [ %add239, %if.end363 ]
  %evdw.3 = phi double [ %evdw.1278, %lor.lhs.false ], [ %95, %for.inc425.sink.split ], [ %95, %if.end363 ]
  %dumw.3 = phi double [ %dumw.2280, %lor.lhs.false ], [ %add408, %for.inc425.sink.split ], [ %dumw.2280, %if.end363 ]
  %wij.3 = phi double [ %wij.1281, %lor.lhs.false ], [ %wij.2, %for.inc425.sink.split ], [ %wij.2, %if.end363 ]
  %dumz.1 = phi double [ %dumz.0282, %lor.lhs.false ], [ %add370, %for.inc425.sink.split ], [ %add370, %if.end363 ]
  %97 = phi <2 x double> [ %35, %lor.lhs.false ], [ %89, %for.inc425.sink.split ], [ %89, %if.end363 ]
  %indvars.iv.next312 = add nuw nsw i64 %indvars.iv311, 1
  %exitcond.not = icmp eq i64 %indvars.iv.next312, %wide.trip.count
  br i1 %exitcond.not, label %for.end427, label %for.body53, !llvm.loop !165

for.end427:                                       ; preds = %for.inc425, %if.end50
  %elec.1.lcssa = phi double [ %elec.0296, %if.end50 ], [ %elec.4, %for.inc425 ]
  %evdw.1.lcssa = phi double [ %evdw.0298, %if.end50 ], [ %evdw.3, %for.inc425 ]
  %dumw.2.lcssa = phi double [ %dumw.1, %if.end50 ], [ %dumw.3, %for.inc425 ]
  %wij.1.lcssa = phi double [ %wij.0301, %if.end50 ], [ %wij.3, %for.inc425 ]
  %dumz.0.lcssa = phi double [ 0.000000e+00, %if.end50 ], [ %dumz.1, %for.inc425 ]
  %98 = phi <2 x double> [ zeroinitializer, %if.end50 ], [ %97, %for.inc425 ]
  %arrayidx431 = getelementptr inbounds double, ptr %f, i64 %idxprom17
  %99 = load <2 x double>, ptr %arrayidx431, align 8, !tbaa !12
  %100 = fadd <2 x double> %98, %99
  store <2 x double> %100, ptr %arrayidx431, align 8, !tbaa !12
  %arrayidx441 = getelementptr inbounds double, ptr %f, i64 %idxprom23
  %101 = load double, ptr %arrayidx441, align 8, !tbaa !12
  %add442 = fadd double %dumz.0.lcssa, %101
  store double %add442, ptr %arrayidx441, align 8, !tbaa !12
  %.b = load i1, ptr @dim, align 4
  br i1 %.b, label %if.then444, label %for.inc451

if.then444:                                       ; preds = %for.end427
  %add446 = add nuw nsw i32 %mul16, 3
  %idxprom447 = zext i32 %add446 to i64
  %arrayidx448 = getelementptr inbounds double, ptr %f, i64 %idxprom447
  %102 = load double, ptr %arrayidx448, align 8, !tbaa !12
  %add449 = fadd double %dumw.2.lcssa, %102
  store double %add449, ptr %arrayidx448, align 8, !tbaa !12
  br label %for.inc451

for.inc451:                                       ; preds = %for.end427, %if.then444, %for.body6
  %elec.5 = phi double [ %elec.0296, %for.body6 ], [ %elec.1.lcssa, %if.then444 ], [ %elec.1.lcssa, %for.end427 ]
  %wi.2 = phi double [ %wi.0297, %for.body6 ], [ %wi.1, %if.then444 ], [ %wi.1, %for.end427 ]
  %evdw.4 = phi double [ %evdw.0298, %for.body6 ], [ %evdw.1.lcssa, %if.then444 ], [ %evdw.1.lcssa, %for.end427 ]
  %dumw.4 = phi double [ %dumw.0300, %for.body6 ], [ %dumw.2.lcssa, %if.then444 ], [ %dumw.2.lcssa, %for.end427 ]
  %wij.4 = phi double [ %wij.0301, %for.body6 ], [ %wij.1.lcssa, %if.then444 ], [ %wij.1.lcssa, %for.end427 ]
  %indvars.iv.next316 = add nuw nsw i64 %indvars.iv315, 1
  %103 = load ptr, ptr @prm, align 8, !tbaa !9
  %Natom4 = getelementptr inbounds %struct.parm, ptr %103, i64 0, i32 4
  %104 = load i32, ptr %Natom4, align 8, !tbaa !27
  %sub = add nsw i32 %104, -1
  %105 = sext i32 %sub to i64
  %cmp5 = icmp slt i64 %indvars.iv.next316, %105
  br i1 %cmp5, label %for.body6, label %for.end453, !llvm.loop !166

for.end453:                                       ; preds = %for.inc451, %for.cond3.preheader
  %elec.0.lcssa = phi double [ 0.000000e+00, %for.cond3.preheader ], [ %elec.5, %for.inc451 ]
  %evdw.0.lcssa = phi double [ 0.000000e+00, %for.cond3.preheader ], [ %evdw.4, %for.inc451 ]
  %.lcssa = phi i32 [ %5, %for.cond3.preheader ], [ %104, %for.inc451 ]
  tail call void @free_ivector(ptr noundef %call, i32 noundef -1, i32 noundef %.lcssa) #23
  store double %evdw.0.lcssa, ptr %enb, align 8, !tbaa !12
  store double %elec.0.lcssa, ptr %eel, align 8, !tbaa !12
  ret void
}

; Function Attrs: mustprogress nofree nounwind willreturn memory(write)
declare double @log(double noundef) local_unnamed_addr #14

; Function Attrs: mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fabs.f64(double) #16

; Function Attrs: mustprogress nofree nounwind willreturn memory(write)
declare double @tanh(double noundef) local_unnamed_addr #14

; Function Attrs: mustprogress nofree nounwind willreturn memory(write)
declare double @exp(double noundef) local_unnamed_addr #14

; Function Attrs: mustprogress nofree nounwind willreturn memory(write)
declare double @acos(double noundef) local_unnamed_addr #14

; Function Attrs: mustprogress nofree nounwind willreturn memory(write)
declare double @sin(double noundef) local_unnamed_addr #14

; Function Attrs: mustprogress nofree nounwind willreturn memory(argmem: readwrite)
declare ptr @strcpy(ptr noalias noundef returned writeonly, ptr noalias nocapture noundef readonly) local_unnamed_addr #10

; Function Attrs: nofree nounwind
declare noundef i64 @fwrite(ptr nocapture noundef, i64 noundef, i64 noundef, ptr nocapture noundef) local_unnamed_addr #19

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.abs.i32(i32, i1 immarg) #20

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smax.i32(i32, i32) #20

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i32 @llvm.smin.i32(i32, i32) #20

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #21

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <2 x double> @llvm.fmuladd.v2f64(<2 x double>, <2 x double>, <2 x double>) #20

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare <4 x double> @llvm.fmuladd.v4f64(<4 x double>, <4 x double>, <4 x double>) #20

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn memory(none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { mustprogress nofree norecurse nosync nounwind willreturn memory(read, argmem: none, inaccessiblemem: none) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { mustprogress nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { noreturn nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { mustprogress nofree norecurse nosync nounwind willreturn memory(argmem: write) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nofree norecurse nosync nounwind memory(argmem: read) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { mustprogress nofree nounwind willreturn memory(argmem: read) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nofree nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { mustprogress nofree nounwind willreturn memory(argmem: readwrite) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #11 = { mustprogress nofree nounwind willreturn allockind("alloc,uninitialized") allocsize(0) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #12 = { mustprogress nounwind willreturn allockind("free") memory(argmem: readwrite, inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #13 = { nofree nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #14 = { mustprogress nofree nounwind willreturn memory(write) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #15 = { mustprogress nofree nounwind willreturn allockind("alloc,zeroed") allocsize(0,1) memory(inaccessiblemem: readwrite) "alloc-family"="malloc" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #16 = { mustprogress nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #17 = { mustprogress nofree nounwind willreturn "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #18 = { nofree nounwind memory(readwrite, inaccessiblemem: write) uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #19 = { nofree nounwind }
attributes #20 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #21 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #22 = { noreturn nounwind }
attributes #23 = { nounwind }
attributes #24 = { nounwind willreturn memory(read) }
attributes #25 = { cold }
attributes #26 = { nounwind allocsize(0) }
attributes #27 = { nounwind allocsize(0,1) }

!llvm.module.flags = !{!0, !1, !2, !3}
!llvm.ident = !{!4}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{!"clang version 17.0.6 (git@github.com:webmiche/llvm-project.git 8c58c0dbb5787f8a0559e9fca1d1d76db79875bd)"}
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!10, !10, i64 0}
!10 = !{!"any pointer", !7, i64 0}
!11 = !{!7, !7, i64 0}
!12 = !{!13, !13, i64 0}
!13 = !{!"double", !7, i64 0}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.mustprogress"}
!16 = distinct !{!16, !15}
!17 = distinct !{!17, !15}
!18 = distinct !{!18, !15}
!19 = distinct !{!19, !15}
!20 = distinct !{!20, !15}
!21 = distinct !{!21, !15}
!22 = distinct !{!22, !15}
!23 = distinct !{!23, !15}
!24 = distinct !{!24, !15}
!25 = !{!26, !10, i64 128}
!26 = !{!"molecule_t", !7, i64 0, !6, i64 96, !10, i64 104, !6, i64 112, !6, i64 116, !6, i64 120, !10, i64 128}
!27 = !{!28, !6, i64 96}
!28 = !{!"parm", !7, i64 0, !6, i64 84, !6, i64 88, !6, i64 92, !6, i64 96, !6, i64 100, !6, i64 104, !6, i64 108, !6, i64 112, !6, i64 116, !6, i64 120, !6, i64 124, !6, i64 128, !6, i64 132, !6, i64 136, !6, i64 140, !6, i64 144, !6, i64 148, !6, i64 152, !6, i64 156, !6, i64 160, !6, i64 164, !6, i64 168, !6, i64 172, !6, i64 176, !6, i64 180, !6, i64 184, !6, i64 188, !6, i64 192, !6, i64 196, !6, i64 200, !6, i64 204, !6, i64 208, !10, i64 216, !10, i64 224, !10, i64 232, !10, i64 240, !10, i64 248, !10, i64 256, !10, i64 264, !10, i64 272, !10, i64 280, !10, i64 288, !10, i64 296, !10, i64 304, !10, i64 312, !10, i64 320, !10, i64 328, !10, i64 336, !10, i64 344, !10, i64 352, !10, i64 360, !10, i64 368, !7, i64 376, !13, i64 400, !13, i64 408, !13, i64 416, !13, i64 424, !13, i64 432, !10, i64 440, !10, i64 448, !10, i64 456, !10, i64 464, !10, i64 472, !10, i64 480, !10, i64 488, !10, i64 496, !10, i64 504, !10, i64 512, !10, i64 520, !10, i64 528, !10, i64 536, !10, i64 544, !10, i64 552, !10, i64 560, !10, i64 568, !10, i64 576, !10, i64 584, !10, i64 592, !10, i64 600, !10, i64 608, !10, i64 616, !10, i64 624, !10, i64 632, !10, i64 640, !10, i64 648, !10, i64 656, !10, i64 664, !10, i64 672, !10, i64 680, !10, i64 688, !10, i64 696, !10, i64 704, !10, i64 712}
!29 = distinct !{!29, !15}
!30 = distinct !{!30, !15}
!31 = distinct !{!31, !15}
!32 = distinct !{!32, !15}
!33 = distinct !{!33, !15}
!34 = distinct !{!34, !15}
!35 = distinct !{!35, !15}
!36 = !{!28, !10, i64 696}
!37 = !{!28, !10, i64 704}
!38 = distinct !{!38, !15}
!39 = distinct !{!39, !15}
!40 = distinct !{!40, !15}
!41 = !{!28, !10, i64 448}
!42 = !{!28, !10, i64 472}
!43 = distinct !{!43, !15}
!44 = distinct !{!44, !15}
!45 = distinct !{!45, !15}
!46 = distinct !{!46, !47}
!47 = !{!"llvm.loop.unroll.disable"}
!48 = !{!28, !6, i64 104}
!49 = !{!28, !10, i64 496}
!50 = !{!28, !10, i64 504}
!51 = !{!28, !10, i64 512}
!52 = !{!28, !10, i64 264}
!53 = !{!28, !10, i64 272}
!54 = !{!28, !6, i64 108}
!55 = !{!28, !10, i64 520}
!56 = !{!28, !10, i64 528}
!57 = !{!28, !10, i64 536}
!58 = !{!28, !6, i64 112}
!59 = !{!28, !10, i64 544}
!60 = !{!28, !10, i64 552}
!61 = !{!28, !10, i64 560}
!62 = !{!28, !10, i64 568}
!63 = !{!28, !10, i64 280}
!64 = !{!28, !10, i64 288}
!65 = !{!28, !6, i64 148}
!66 = !{!28, !10, i64 576}
!67 = !{!28, !10, i64 584}
!68 = !{!28, !10, i64 592}
!69 = !{!28, !10, i64 600}
!70 = !{!28, !6, i64 120}
!71 = !{!28, !10, i64 608}
!72 = !{!28, !10, i64 616}
!73 = !{!28, !10, i64 624}
!74 = !{!28, !10, i64 632}
!75 = !{!28, !10, i64 640}
!76 = !{!28, !10, i64 296}
!77 = !{!28, !10, i64 304}
!78 = !{!28, !10, i64 312}
!79 = !{!28, !6, i64 124}
!80 = !{!28, !10, i64 648}
!81 = !{!28, !10, i64 656}
!82 = !{!28, !10, i64 664}
!83 = !{!28, !10, i64 672}
!84 = !{!28, !10, i64 680}
!85 = distinct !{!85, !15}
!86 = !{!28, !10, i64 368}
!87 = !{!28, !10, i64 360}
!88 = !{!28, !10, i64 248}
!89 = !{!28, !13, i64 432}
!90 = distinct !{!90, !15}
!91 = distinct !{!91, !15}
!92 = distinct !{!92, !15}
!93 = !{!28, !6, i64 100}
!94 = !{!28, !10, i64 440}
!95 = distinct !{!95, !15}
!96 = !{!28, !10, i64 456}
!97 = !{!28, !10, i64 336}
!98 = !{!28, !10, i64 328}
!99 = distinct !{!99, !15}
!100 = distinct !{!100, !15}
!101 = distinct !{!101, !15}
!102 = distinct !{!102, !15}
!103 = distinct !{!103, !15, !104, !105}
!104 = !{!"llvm.loop.isvectorized", i32 1}
!105 = !{!"llvm.loop.unroll.runtime.disable"}
!106 = distinct !{!106, !47}
!107 = distinct !{!107, !15, !104}
!108 = distinct !{!108, !15}
!109 = distinct !{!109, !15}
!110 = distinct !{!110, !47}
!111 = !{!"branch_weights", i32 1, i32 2000}
!112 = distinct !{!112, !15, !104, !105}
!113 = !{!28, !10, i64 256}
!114 = !{!115}
!115 = distinct !{!115, !116}
!116 = distinct !{!116, !"LVerDomain"}
!117 = distinct !{!117, !15, !104, !105}
!118 = !{!119}
!119 = distinct !{!119, !120}
!120 = distinct !{!120, !"LVerDomain"}
!121 = distinct !{!121, !15, !104, !105}
!122 = distinct !{!122, !15, !104}
!123 = distinct !{!123, !15, !104}
!124 = distinct !{!124, !15, !105, !104}
!125 = distinct !{!125, !15}
!126 = distinct !{!126, !15, !104, !105}
!127 = distinct !{!127, !15, !104}
!128 = distinct !{!128, !15, !104, !105}
!129 = distinct !{!129, !47}
!130 = !{!131}
!131 = distinct !{!131, !132}
!132 = distinct !{!132, !"LVerDomain"}
!133 = !{!134, !135}
!134 = distinct !{!134, !132}
!135 = distinct !{!135, !132}
!136 = !{!135}
!137 = !{!134}
!138 = distinct !{!138, !15, !104, !105}
!139 = distinct !{!139, !15, !104}
!140 = distinct !{!140, !15, !104}
!141 = !{!142}
!142 = distinct !{!142, !143}
!143 = distinct !{!143, !"LVerDomain"}
!144 = !{!145}
!145 = distinct !{!145, !143}
!146 = !{!147}
!147 = distinct !{!147, !143}
!148 = !{!149, !142, !145}
!149 = distinct !{!149, !143}
!150 = !{!149}
!151 = !{!142, !145}
!152 = distinct !{!152, !15, !104, !105}
!153 = distinct !{!153, !15, !104}
!154 = distinct !{!154, !15}
!155 = distinct !{!155, !47}
!156 = distinct !{!156, !15}
!157 = distinct !{!157, !15}
!158 = distinct !{!158, !15}
!159 = !{!28, !6, i64 128}
!160 = distinct !{!160, !15}
!161 = distinct !{!161, !15}
!162 = distinct !{!162, !15}
!163 = !{!28, !10, i64 352}
!164 = !{!28, !10, i64 344}
!165 = distinct !{!165, !15}
!166 = distinct !{!166, !15}
