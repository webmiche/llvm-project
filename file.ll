; ModuleID = 'examples/file.c'
source_filename = "examples/file.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.S1 = type <{ i8, i32, i8 }>
%union.U2 = type { ptr }

@.str = private unnamed_addr constant [2 x i8] c"1\00", align 1
@g_2 = internal global i32 7, align 4
@.str.1 = private unnamed_addr constant [4 x i8] c"g_2\00", align 1
@g_6 = internal global i32 -400916788, align 4
@.str.2 = private unnamed_addr constant [4 x i8] c"g_6\00", align 1
@.str.3 = private unnamed_addr constant [8 x i8] c"g_40.f0\00", align 1
@g_41 = internal global [1 x [2 x i32]] [[2 x i32] [i32 -1705372065, i32 -1705372065]], align 4
@.str.4 = private unnamed_addr constant [11 x i8] c"g_41[i][j]\00", align 1
@.str.5 = private unnamed_addr constant [18 x i8] c"index = [%d][%d]\0A\00", align 1
@g_42 = internal global i32 2, align 4
@.str.6 = private unnamed_addr constant [5 x i8] c"g_42\00", align 1
@g_45 = internal global i32 -2, align 4
@.str.7 = private unnamed_addr constant [5 x i8] c"g_45\00", align 1
@g_58 = internal global i8 0, align 1
@.str.8 = private unnamed_addr constant [5 x i8] c"g_58\00", align 1
@g_61 = internal global i32 1428916489, align 4
@.str.9 = private unnamed_addr constant [5 x i8] c"g_61\00", align 1
@g_66 = internal global i32 -2088898721, align 4
@.str.10 = private unnamed_addr constant [5 x i8] c"g_66\00", align 1
@g_85 = internal global i64 1, align 8
@.str.11 = private unnamed_addr constant [5 x i8] c"g_85\00", align 1
@g_86 = internal global i32 4, align 4
@.str.12 = private unnamed_addr constant [5 x i8] c"g_86\00", align 1
@g_97 = internal global [4 x [3 x [7 x i8]]] [[3 x [7 x i8]] [[7 x i8] c"K&|\D3\01\09<", [7 x i8] c"\FB\01\09|\09\01\FB", [7 x i8] c"\FF\FB:|\E0<\D3"], [3 x [7 x i8]] [[7 x i8] c"\D4\1C\F6\D3\FF\01\01", [7 x i8] c"\F6\FF:\FF\F6K&", [7 x i8] c"&\FF\09\FB|\05\FF"], [3 x [7 x i8]] [[7 x i8] c"\FF\1C\D4\05&&\05", [7 x i8] c"\FF\1C\FF&\00K\05", [7 x i8] c"\FF\09\FB|\05\FF\01"], [3 x [7 x i8]] [[7 x i8] c":\FFK\09\09K\FF", [7 x i8] c"\01\01\E0:\09&/", [7 x i8] c"\1C\FF\01\F6\05\FB\E0"]], align 16
@.str.13 = private unnamed_addr constant [14 x i8] c"g_97[i][j][k]\00", align 1
@.str.14 = private unnamed_addr constant [22 x i8] c"index = [%d][%d][%d]\0A\00", align 1
@.str.15 = private unnamed_addr constant [9 x i8] c"g_115.f0\00", align 1
@.str.16 = private unnamed_addr constant [9 x i8] c"g_116.f0\00", align 1
@.str.17 = private unnamed_addr constant [9 x i8] c"g_117.f0\00", align 1
@.str.18 = private unnamed_addr constant [9 x i8] c"g_118.f0\00", align 1
@.str.19 = private unnamed_addr constant [9 x i8] c"g_119.f0\00", align 1
@.str.20 = private unnamed_addr constant [12 x i8] c"g_120[i].f0\00", align 1
@.str.21 = private unnamed_addr constant [14 x i8] c"index = [%d]\0A\00", align 1
@.str.22 = private unnamed_addr constant [9 x i8] c"g_121.f0\00", align 1
@.str.23 = private unnamed_addr constant [9 x i8] c"g_122.f0\00", align 1
@g_130 = internal global i16 0, align 2
@.str.24 = private unnamed_addr constant [6 x i8] c"g_130\00", align 1
@g_131 = internal global i32 -2110996243, align 4
@.str.25 = private unnamed_addr constant [6 x i8] c"g_131\00", align 1
@.str.26 = private unnamed_addr constant [12 x i8] c"g_137[i].f0\00", align 1
@.str.27 = private unnamed_addr constant [9 x i8] c"g_139.f0\00", align 1
@g_146 = internal global %struct.S1 <{ i8 8, i32 -431533907, i8 0 }>, align 1
@.str.28 = private unnamed_addr constant [9 x i8] c"g_146.f0\00", align 1
@.str.29 = private unnamed_addr constant [9 x i8] c"g_146.f1\00", align 1
@.str.30 = private unnamed_addr constant [9 x i8] c"g_146.f2\00", align 1
@g_149 = internal global i32 739314553, align 4
@.str.31 = private unnamed_addr constant [6 x i8] c"g_149\00", align 1
@g_161 = internal global [10 x i64] [i64 -8, i64 -8, i64 9058368984273024103, i64 -8, i64 -8, i64 9058368984273024103, i64 -8, i64 -8, i64 9058368984273024103, i64 -8], align 16
@.str.32 = private unnamed_addr constant [9 x i8] c"g_161[i]\00", align 1
@g_164 = internal global i32 1356193481, align 4
@.str.33 = private unnamed_addr constant [6 x i8] c"g_164\00", align 1
@g_187 = internal global i64 6135271487640704255, align 8
@.str.34 = private unnamed_addr constant [6 x i8] c"g_187\00", align 1
@.str.35 = private unnamed_addr constant [6 x i8] c"g_192\00", align 1
@g_206 = internal global i8 -1, align 1
@.str.36 = private unnamed_addr constant [6 x i8] c"g_206\00", align 1
@g_213 = internal global i64 901703988078151244, align 8
@.str.37 = private unnamed_addr constant [6 x i8] c"g_213\00", align 1
@.str.38 = private unnamed_addr constant [9 x i8] c"g_220.f0\00", align 1
@crc32_context = internal global i32 -1, align 4
@crc32_tab = internal global [256 x i32] zeroinitializer, align 16
@__const.func_1.l_12 = private unnamed_addr constant [5 x i16] [i16 2, i16 2, i16 2, i16 2, i16 2], align 2
@__const.func_1.l_221 = private unnamed_addr constant [2 x [5 x i32]] [[5 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1], [5 x i32] [i32 1, i32 1, i32 1, i32 1, i32 1]], align 16
@g_136 = internal global [7 x ptr] zeroinitializer, align 16
@__const.func_15.l_226 = private unnamed_addr constant [1 x [5 x [7 x ptr]]] [[5 x [7 x ptr]] [[7 x ptr] [ptr null, ptr @g_121, ptr null, ptr getelementptr (i8, ptr @g_137, i64 16), ptr getelementptr (i8, ptr @g_137, i64 16), ptr null, ptr @g_121], [7 x ptr] [ptr @g_118, ptr null, ptr @g_118, ptr getelementptr (i8, ptr @g_137, i64 16), ptr null, ptr null, ptr null], [7 x ptr] [ptr getelementptr (i8, ptr @g_137, i64 16), ptr null, ptr @g_122, ptr null, ptr @g_118, ptr getelementptr (i8, ptr @g_137, i64 16), ptr @g_118], [7 x ptr] [ptr getelementptr (i8, ptr @g_137, i64 16), ptr @g_118, ptr @g_118, ptr getelementptr (i8, ptr @g_137, i64 16), ptr @g_220, ptr null, ptr null], [7 x ptr] [ptr null, ptr @g_118, ptr getelementptr (i8, ptr @g_137, i64 16), ptr getelementptr (i8, ptr @g_137, i64 16), ptr @g_118, ptr @g_220, ptr @g_120]]], align 16
@__const.func_21.l_225 = private unnamed_addr constant [4 x [5 x ptr]] [[5 x ptr] [ptr @g_206, ptr @g_206, ptr null, ptr @g_58, ptr null], [5 x ptr] [ptr null, ptr null, ptr @g_58, ptr null, ptr @g_58], [5 x ptr] [ptr @g_206, ptr @g_206, ptr null, ptr @g_58, ptr null], [5 x ptr] [ptr null, ptr null, ptr @g_58, ptr null, ptr @g_58]], align 16
@__const.func_37.l_218 = private unnamed_addr constant [7 x [6 x [5 x ptr]]] [[6 x [5 x ptr]] [[5 x ptr] [ptr @g_61, ptr @g_86, ptr @g_42, ptr @g_42, ptr @g_66], [5 x ptr] [ptr @g_42, ptr @g_42, ptr @g_61, ptr @g_86, ptr null], [5 x ptr] [ptr @g_61, ptr @g_6, ptr null, ptr @g_66, ptr @g_61], [5 x ptr] [ptr @g_45, ptr @g_61, ptr @g_86, ptr @g_86, ptr @g_2], [5 x ptr] [ptr @g_86, ptr @g_42, ptr @g_2, ptr null, ptr @g_66], [5 x ptr] [ptr @g_42, ptr @g_66, ptr @g_61, ptr null, ptr @g_45]], [6 x [5 x ptr]] [[5 x ptr] [ptr @g_61, ptr null, ptr @g_6, ptr @g_86, ptr @g_6], [5 x ptr] [ptr @g_45, ptr @g_45, ptr @g_6, ptr @g_61, ptr null], [5 x ptr] [ptr @g_61, ptr @g_2, ptr @g_42, ptr @g_42, ptr @g_42], [5 x ptr] [ptr @g_42, ptr @g_61, ptr @g_45, ptr @g_66, ptr @g_45], [5 x ptr] [ptr @g_45, ptr @g_2, ptr @g_45, ptr @g_61, ptr @g_42], [5 x ptr] [ptr @g_86, ptr @g_45, ptr @g_42, ptr @g_42, ptr @g_42]], [6 x [5 x ptr]] [[5 x ptr] [ptr @g_66, ptr null, ptr @g_6, ptr null, ptr @g_61], [5 x ptr] [ptr @g_86, ptr @g_66, ptr @g_42, ptr @g_86, ptr @g_61], [5 x ptr] [ptr @g_6, ptr @g_42, ptr @g_45, ptr @g_42, ptr @g_42], [5 x ptr] [ptr @g_61, ptr @g_42, ptr @g_61, ptr null, ptr @g_42], [5 x ptr] [ptr @g_42, ptr @g_45, ptr @g_42, ptr @g_61, ptr @g_45], [5 x ptr] [ptr @g_45, ptr null, ptr @g_61, ptr @g_86, ptr @g_42]], [6 x [5 x ptr]] [[5 x ptr] [ptr @g_61, ptr @g_42, ptr @g_42, ptr @g_45, ptr null], [5 x ptr] [ptr @g_45, ptr @g_86, ptr @g_61, ptr null, ptr @g_6], [5 x ptr] [ptr @g_2, ptr @g_6, ptr @g_45, ptr @g_42, ptr @g_45], [5 x ptr] [ptr @g_42, ptr @g_6, ptr @g_42, ptr @g_42, ptr @g_66], [5 x ptr] [ptr @g_42, ptr @g_45, ptr @g_6, ptr null, ptr @g_2], [5 x ptr] [ptr @g_2, ptr @g_42, ptr @g_42, ptr @g_2, ptr @g_6]], [6 x [5 x ptr]] [[5 x ptr] [ptr @g_45, ptr @g_86, ptr @g_45, ptr @g_6, ptr null], [5 x ptr] [ptr @g_61, ptr @g_66, ptr @g_45, ptr @g_42, ptr @g_61], [5 x ptr] [ptr @g_45, ptr null, ptr @g_42, ptr @g_6, ptr @g_61], [5 x ptr] [ptr @g_42, ptr @g_61, ptr @g_6, ptr @g_2, ptr @g_6], [5 x ptr] [ptr @g_61, ptr null, ptr @g_6, ptr null, ptr null], [5 x ptr] [ptr @g_6, ptr @g_42, ptr @g_61, ptr @g_42, ptr @g_45]], [6 x [5 x ptr]] [[5 x ptr] [ptr @g_86, ptr @g_42, ptr @g_2, ptr @g_42, ptr @g_42], [5 x ptr] [ptr @g_66, ptr null, ptr null, ptr null, ptr @g_66], [5 x ptr] [ptr @g_86, ptr @g_61, ptr @g_66, ptr @g_45, ptr @g_45], [5 x ptr] [ptr @g_45, ptr null, ptr null, ptr @g_86, ptr @g_45], [5 x ptr] [ptr @g_42, ptr @g_66, ptr @g_6, ptr @g_61, ptr @g_45], [5 x ptr] [ptr @g_61, ptr @g_86, ptr null, ptr null, ptr @g_66]], [6 x [5 x ptr]] [[5 x ptr] [ptr @g_45, ptr @g_42, ptr @g_42, ptr @g_42, ptr @g_42], [5 x ptr] [ptr @g_61, ptr @g_45, ptr @g_86, ptr @g_86, ptr @g_45], [5 x ptr] [ptr @g_42, ptr @g_6, ptr @g_86, ptr null, ptr null], [5 x ptr] [ptr @g_86, ptr @g_6, ptr @g_42, ptr @g_42, ptr @g_6], [5 x ptr] [ptr @g_42, ptr @g_86, ptr null, ptr @g_61, ptr @g_61], [5 x ptr] [ptr @g_66, ptr @g_42, ptr @g_6, ptr @g_66, ptr @g_42]]], align 16
@g_205 = internal global [7 x [10 x [3 x ptr]]] [[10 x [3 x ptr]] [[3 x ptr] [ptr @g_206, ptr @g_206, ptr null], [3 x ptr] [ptr @g_206, ptr @g_206, ptr @g_206], [3 x ptr] [ptr @g_206, ptr @g_206, ptr @g_206], [3 x ptr] [ptr @g_206, ptr @g_206, ptr @g_206], [3 x ptr] [ptr @g_206, ptr @g_206, ptr @g_206], [3 x ptr] [ptr @g_206, ptr @g_206, ptr @g_206], [3 x ptr] [ptr @g_206, ptr @g_206, ptr null], [3 x ptr] [ptr @g_206, ptr null, ptr @g_206], [3 x ptr] [ptr @g_206, ptr null, ptr @g_206], [3 x ptr] [ptr @g_206, ptr @g_206, ptr @g_206]], [10 x [3 x ptr]] [[3 x ptr] [ptr @g_206, ptr @g_206, ptr null], [3 x ptr] [ptr @g_206, ptr @g_206, ptr @g_206], [3 x ptr] [ptr @g_206, ptr @g_206, ptr @g_206], [3 x ptr] [ptr @g_206, ptr @g_206, ptr @g_206], [3 x ptr] [ptr @g_206, ptr @g_206, ptr @g_206], [3 x ptr] [ptr @g_206, ptr @g_206, ptr @g_206], [3 x ptr] [ptr null, ptr null, ptr @g_206], [3 x ptr] [ptr @g_206, ptr null, ptr null], [3 x ptr] [ptr @g_206, ptr @g_206, ptr @g_206], [3 x ptr] [ptr @g_206, ptr @g_206, ptr @g_206]], [10 x [3 x ptr]] [[3 x ptr] [ptr null, ptr @g_206, ptr @g_206], [3 x ptr] [ptr @g_206, ptr @g_206, ptr @g_206], [3 x ptr] [ptr @g_206, ptr @g_206, ptr null], [3 x ptr] [ptr @g_206, ptr @g_206, ptr @g_206], [3 x ptr] [ptr @g_206, ptr @g_206, ptr @g_206], [3 x ptr] [ptr @g_206, ptr null, ptr @g_206], [3 x ptr] [ptr @g_206, ptr null, ptr @g_206], [3 x ptr] [ptr @g_206, ptr @g_206, ptr null], [3 x ptr] [ptr @g_206, ptr @g_206, ptr @g_206], [3 x ptr] [ptr @g_206, ptr @g_206, ptr @g_206]], [10 x [3 x ptr]] [[3 x ptr] [ptr @g_206, ptr @g_206, ptr @g_206], [3 x ptr] [ptr @g_206, ptr @g_206, ptr @g_206], [3 x ptr] [ptr @g_206, ptr @g_206, ptr @g_206], [3 x ptr] [ptr @g_206, ptr @g_206, ptr null], [3 x ptr] [ptr @g_206, ptr null, ptr @g_206], [3 x ptr] [ptr @g_206, ptr null, ptr @g_206], [3 x ptr] [ptr @g_206, ptr @g_206, ptr @g_206], [3 x ptr] [ptr @g_206, ptr null, ptr @g_206], [3 x ptr] [ptr @g_206, ptr null, ptr @g_206], [3 x ptr] [ptr @g_206, ptr @g_206, ptr @g_206]], [10 x [3 x ptr]] [[3 x ptr] [ptr @g_206, ptr null, ptr @g_206], [3 x ptr] [ptr @g_206, ptr null, ptr null], [3 x ptr] [ptr @g_206, ptr @g_206, ptr null], [3 x ptr] [ptr @g_206, ptr null, ptr null], [3 x ptr] [ptr @g_206, ptr null, ptr null], [3 x ptr] [ptr @g_206, ptr @g_206, ptr @g_206], [3 x ptr] [ptr null, ptr null, ptr @g_206], [3 x ptr] [ptr @g_206, ptr null, ptr @g_206], [3 x ptr] [ptr @g_206, ptr @g_206, ptr @g_206], [3 x ptr] zeroinitializer], [10 x [3 x ptr]] [[3 x ptr] [ptr @g_206, ptr null, ptr @g_206], [3 x ptr] [ptr null, ptr @g_206, ptr @g_206], [3 x ptr] [ptr @g_206, ptr null, ptr @g_206], [3 x ptr] [ptr @g_206, ptr null, ptr null], [3 x ptr] [ptr @g_206, ptr @g_206, ptr null], [3 x ptr] [ptr @g_206, ptr null, ptr @g_206], [3 x ptr] [ptr @g_206, ptr null, ptr @g_206], [3 x ptr] [ptr null, ptr @g_206, ptr @g_206], [3 x ptr] [ptr @g_206, ptr null, ptr @g_206], [3 x ptr] [ptr null, ptr null, ptr @g_206]], [10 x [3 x ptr]] [[3 x ptr] [ptr @g_206, ptr @g_206, ptr @g_206], [3 x ptr] [ptr @g_206, ptr null, ptr @g_206], [3 x ptr] [ptr @g_206, ptr null, ptr null], [3 x ptr] [ptr @g_206, ptr @g_206, ptr @g_206], [3 x ptr] [ptr @g_206, ptr null, ptr @g_206], [3 x ptr] [ptr @g_206, ptr null, ptr @g_206], [3 x ptr] [ptr @g_206, ptr @g_206, ptr @g_206], [3 x ptr] [ptr @g_206, ptr null, ptr @g_206], [3 x ptr] [ptr @g_206, ptr null, ptr null], [3 x ptr] [ptr @g_206, ptr @g_206, ptr null]]], align 16
@g_211 = internal global [1 x ptr] [ptr @g_212], align 8
@__const.func_70.l_178 = private unnamed_addr constant %struct.S1 <{ i8 4, i32 0, i8 1 }>, align 1
@__const.func_70.l_84 = private unnamed_addr constant [8 x ptr] [ptr @g_85, ptr @g_85, ptr @g_85, ptr @g_85, ptr @g_85, ptr @g_85, ptr @g_85, ptr @g_85], align 16
@__const.func_70.l_96 = private unnamed_addr constant [7 x [4 x ptr]] [[4 x ptr] [ptr null, ptr getelementptr (i8, ptr @g_97, i64 79), ptr null, ptr null], [4 x ptr] [ptr getelementptr (i8, ptr @g_97, i64 79), ptr getelementptr (i8, ptr @g_97, i64 79), ptr null, ptr getelementptr (i8, ptr @g_97, i64 79)], [4 x ptr] [ptr getelementptr (i8, ptr @g_97, i64 79), ptr null, ptr null, ptr getelementptr (i8, ptr @g_97, i64 79)], [4 x ptr] [ptr null, ptr getelementptr (i8, ptr @g_97, i64 79), ptr null, ptr null], [4 x ptr] [ptr getelementptr (i8, ptr @g_97, i64 79), ptr getelementptr (i8, ptr @g_97, i64 79), ptr null, ptr getelementptr (i8, ptr @g_97, i64 79)], [4 x ptr] [ptr getelementptr (i8, ptr @g_97, i64 79), ptr null, ptr null, ptr getelementptr (i8, ptr @g_97, i64 79)], [4 x ptr] [ptr null, ptr getelementptr (i8, ptr @g_97, i64 79), ptr null, ptr null]], align 16
@__const.func_70.l_114 = private unnamed_addr constant [2 x [8 x [3 x ptr]]] [[8 x [3 x ptr]] [[3 x ptr] [ptr @g_122, ptr @g_119, ptr @g_118], [3 x ptr] [ptr null, ptr null, ptr @g_115], [3 x ptr] [ptr @g_122, ptr @g_119, ptr @g_118], [3 x ptr] [ptr null, ptr null, ptr @g_115], [3 x ptr] [ptr @g_122, ptr @g_119, ptr @g_118], [3 x ptr] [ptr null, ptr null, ptr @g_115], [3 x ptr] [ptr @g_122, ptr @g_119, ptr @g_118], [3 x ptr] [ptr null, ptr null, ptr @g_115]], [8 x [3 x ptr]] [[3 x ptr] [ptr @g_122, ptr @g_119, ptr @g_118], [3 x ptr] [ptr null, ptr null, ptr @g_115], [3 x ptr] [ptr @g_122, ptr @g_119, ptr @g_118], [3 x ptr] [ptr null, ptr null, ptr @g_115], [3 x ptr] [ptr @g_122, ptr @g_119, ptr @g_118], [3 x ptr] [ptr null, ptr null, ptr @g_115], [3 x ptr] [ptr @g_122, ptr @g_119, ptr @g_118], [3 x ptr] [ptr null, ptr null, ptr @g_115]]], align 16
@__const.func_70.l_124 = private unnamed_addr constant [3 x [3 x [7 x i32]]] [[3 x [7 x i32]] [[7 x i32] [i32 0, i32 -988562729, i32 0, i32 7, i32 7, i32 0, i32 -988562729], [7 x i32] [i32 0, i32 -988562729, i32 0, i32 7, i32 7, i32 0, i32 -988562729], [7 x i32] [i32 0, i32 -988562729, i32 0, i32 7, i32 7, i32 0, i32 -988562729]], [3 x [7 x i32]] [[7 x i32] [i32 0, i32 -988562729, i32 0, i32 7, i32 7, i32 0, i32 -988562729], [7 x i32] [i32 0, i32 -988562729, i32 0, i32 7, i32 7, i32 0, i32 -988562729], [7 x i32] [i32 0, i32 -988562729, i32 0, i32 7, i32 7, i32 0, i32 -988562729]], [3 x [7 x i32]] [[7 x i32] [i32 0, i32 -988562729, i32 0, i32 7, i32 7, i32 0, i32 -988562729], [7 x i32] [i32 0, i32 -988562729, i32 0, i32 7, i32 7, i32 0, i32 -988562729], [7 x i32] [i32 0, i32 -988562729, i32 0, i32 7, i32 7, i32 0, i32 -988562729]]], align 16
@g_160 = internal global ptr getelementptr (i8, ptr @g_161, i64 32), align 8
@__const.func_70.l_197 = private unnamed_addr constant [8 x [4 x [8 x i8]]] [[4 x [8 x i8]] [[8 x i8] c"\E1@\CA\00\0C<\08W", [8 x i8] c"\00\F9\09\05\00<\01\E2", [8 x i8] c"\9D@\03\96G\9D\00\08", [8 x i8] c"\E2]\FC\FFO@\C0\0F"], [4 x [8 x i8]] [[8 x i8] c"\08\C0\FF@\08+\04\FF", [8 x i8] c"\E1\08\EA\FF@\A6\F6\00", [8 x i8] c"\06\08\9D\C0\9D\08\06;", [8 x i8] c"\CA\FF\F9\0F<-;\F9"], [4 x [8 x i8]] [[8 x i8] c"+\83\00G<\F6\00\C0", [8 x i8] c"\CA\F9\FF\F9\9D5\83\FC", [8 x i8] c"\06\FF\00\C7@\09\FF\FF", [8 x i8] c"\08\03\08]+\E2\80;"], [4 x [8 x i8]] [[8 x i8] c"\FF\BB\C7\FCG\CA\08\08", [8 x i8] c"\08\E1\00\00\E1\08G\04", [8 x i8] c"\95<\01\96;5\F9-", [8 x i8] c"@\F9\FB\96\80\FD\F6\04"], [4 x [8 x i8]] [[8 x i8] c"\08\80+\00\C7\A6\FD\08", [8 x i8] c"\01\FF\9D\FC\01\EA\F9;", [8 x i8] c"\9D\0C\FF]<\FFG\FF", [8 x i8] c"\05\83\EA\C7\FF\FC\00\FC"], [4 x [8 x i8]] [[8 x i8] c"\E2\F9G\F9\E2\03+\C0", [8 x i8] c"\06\A6\08G\C7\09\A6\F9", [8 x i8] c"\EA\96\08\0F\83\CA+;", [8 x i8] c"\C7\04G\C0G\9D\00\00"], [4 x [8 x i8]] [[8 x i8] c"\95\E1\EA\FF\96\95G\05", [8 x i8] c"\09\FF\FF\96\00\03\F9\22", [8 x i8] c"@\06\9D\F0+\FD\FD+", [8 x i8] c"\EA++\EA\B8-\F6\08"], [4 x [8 x i8]] [[8 x i8] c"\F9\0C\FB\C0\01\FF\F9]", [8 x i8] c"\CA\0CO-\CA\FB\A6O", [8 x i8] c"\F6\FC\835\9D\F9\FF\F9", [8 x i8] c"\08\BB5\04\95\FF\F6\01"]], align 16
@__const.func_70.l_123 = private unnamed_addr constant %struct.S1 <{ i8 0, i32 1, i8 -1 }>, align 1
@__const.func_70.l_142 = private unnamed_addr constant %struct.S1 <{ i8 2, i32 9, i8 1 }>, align 1
@__const.func_70.l_163 = private unnamed_addr constant [3 x [10 x i64]] [[10 x i64] [i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3], [10 x i64] [i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3], [10 x i64] [i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3, i64 3]], align 16
@g_212 = internal global ptr @g_213, align 8
@.str.39 = private unnamed_addr constant [36 x i8] c"...checksum after hashing %s : %lX\0A\00", align 1
@g_40 = internal global { i8, [7 x i8] } { i8 10, [7 x i8] undef }, align 8
@g_115 = internal global { i8, [7 x i8] } { i8 7, [7 x i8] undef }, align 8
@g_116 = internal global { i8, [7 x i8] } { i8 13, [7 x i8] undef }, align 8
@g_117 = internal global { i8, [7 x i8] } { i8 15, [7 x i8] undef }, align 8
@g_118 = internal global { i8, [7 x i8] } { i8 2, [7 x i8] undef }, align 8
@g_119 = internal global { i8, [7 x i8] } { i8 1, [7 x i8] undef }, align 8
@g_120 = internal global [3 x { i8, [7 x i8] }] [{ i8, [7 x i8] } { i8 15, [7 x i8] undef }, { i8, [7 x i8] } { i8 15, [7 x i8] undef }, { i8, [7 x i8] } { i8 15, [7 x i8] undef }], align 16
@g_121 = internal global { i8, [7 x i8] } { i8 15, [7 x i8] undef }, align 8
@g_122 = internal global { i8, [7 x i8] } { i8 12, [7 x i8] undef }, align 8
@g_137 = internal global [4 x { i8, [7 x i8] }] [{ i8, [7 x i8] } { i8 9, [7 x i8] undef }, { i8, [7 x i8] } { i8 9, [7 x i8] undef }, { i8, [7 x i8] } { i8 9, [7 x i8] undef }, { i8, [7 x i8] } { i8 9, [7 x i8] undef }], align 16
@g_139 = internal global { i8, [7 x i8] } { i8 1, [7 x i8] undef }, align 8
@g_220 = internal global { i8, [7 x i8] } { i8 5, [7 x i8] undef }, align 8
@.str.52 = private unnamed_addr constant [15 x i8] c"checksum = %X\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %argc, ptr noundef %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca ptr, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %print_hash_value = alloca i32, align 4
  store i32 0, ptr %retval, align 4
  store i32 %argc, ptr %argc.addr, align 4
  store ptr %argv, ptr %argv.addr, align 8
  store i32 0, ptr %print_hash_value, align 4
  %0 = load i32, ptr %argc.addr, align 4
  %cmp = icmp eq i32 %0, 2
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load ptr, ptr %argv.addr, align 8
  %arrayidx = getelementptr inbounds ptr, ptr %1, i64 1
  %2 = load ptr, ptr %arrayidx, align 8
  %call = call i32 @strcmp(ptr noundef %2, ptr noundef @.str) #4
  %cmp1 = icmp eq i32 %call, 0
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  store i32 1, ptr %print_hash_value, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  call void @platform_main_begin()
  call void @crc32_gentab()
  %call2 = call i32 @func_1()
  %3 = load i32, ptr @g_2, align 4
  %conv = sext i32 %3 to i64
  %4 = load i32, ptr %print_hash_value, align 4
  call void @transparent_crc(i64 noundef %conv, ptr noundef @.str.1, i32 noundef %4)
  %5 = load i32, ptr @g_6, align 4
  %conv3 = sext i32 %5 to i64
  %6 = load i32, ptr %print_hash_value, align 4
  call void @transparent_crc(i64 noundef %conv3, ptr noundef @.str.2, i32 noundef %6)
  %bf.load = load i8, ptr @g_40, align 8
  %bf.clear = and i8 %bf.load, 15
  %bf.cast = zext i8 %bf.clear to i32
  %conv4 = zext i32 %bf.cast to i64
  %7 = load i32, ptr %print_hash_value, align 4
  call void @transparent_crc(i64 noundef %conv4, ptr noundef @.str.3, i32 noundef %7)
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc18, %if.end
  %8 = load i32, ptr %i, align 4
  %cmp5 = icmp slt i32 %8, 1
  br i1 %cmp5, label %for.body, label %for.end20

for.body:                                         ; preds = %for.cond
  store i32 0, ptr %j, align 4
  br label %for.cond7

for.cond7:                                        ; preds = %for.inc, %for.body
  %9 = load i32, ptr %j, align 4
  %cmp8 = icmp slt i32 %9, 2
  br i1 %cmp8, label %for.body10, label %for.end

for.body10:                                       ; preds = %for.cond7
  %10 = load i32, ptr %i, align 4
  %idxprom = sext i32 %10 to i64
  %arrayidx11 = getelementptr inbounds [1 x [2 x i32]], ptr @g_41, i64 0, i64 %idxprom
  %11 = load i32, ptr %j, align 4
  %idxprom12 = sext i32 %11 to i64
  %arrayidx13 = getelementptr inbounds [2 x i32], ptr %arrayidx11, i64 0, i64 %idxprom12
  %12 = load volatile i32, ptr %arrayidx13, align 4
  %conv14 = sext i32 %12 to i64
  %13 = load i32, ptr %print_hash_value, align 4
  call void @transparent_crc(i64 noundef %conv14, ptr noundef @.str.4, i32 noundef %13)
  %14 = load i32, ptr %print_hash_value, align 4
  %tobool = icmp ne i32 %14, 0
  br i1 %tobool, label %if.then15, label %if.end17

if.then15:                                        ; preds = %for.body10
  %15 = load i32, ptr %i, align 4
  %16 = load i32, ptr %j, align 4
  %call16 = call i32 (ptr, ...) @printf(ptr noundef @.str.5, i32 noundef %15, i32 noundef %16)
  br label %if.end17

if.end17:                                         ; preds = %if.then15, %for.body10
  br label %for.inc

for.inc:                                          ; preds = %if.end17
  %17 = load i32, ptr %j, align 4
  %inc = add nsw i32 %17, 1
  store i32 %inc, ptr %j, align 4
  br label %for.cond7, !llvm.loop !6

for.end:                                          ; preds = %for.cond7
  br label %for.inc18

for.inc18:                                        ; preds = %for.end
  %18 = load i32, ptr %i, align 4
  %inc19 = add nsw i32 %18, 1
  store i32 %inc19, ptr %i, align 4
  br label %for.cond, !llvm.loop !8

for.end20:                                        ; preds = %for.cond
  %19 = load i32, ptr @g_42, align 4
  %conv21 = sext i32 %19 to i64
  %20 = load i32, ptr %print_hash_value, align 4
  call void @transparent_crc(i64 noundef %conv21, ptr noundef @.str.6, i32 noundef %20)
  %21 = load i32, ptr @g_45, align 4
  %conv22 = sext i32 %21 to i64
  %22 = load i32, ptr %print_hash_value, align 4
  call void @transparent_crc(i64 noundef %conv22, ptr noundef @.str.7, i32 noundef %22)
  %23 = load i8, ptr @g_58, align 1
  %conv23 = sext i8 %23 to i64
  %24 = load i32, ptr %print_hash_value, align 4
  call void @transparent_crc(i64 noundef %conv23, ptr noundef @.str.8, i32 noundef %24)
  %25 = load i32, ptr @g_61, align 4
  %conv24 = sext i32 %25 to i64
  %26 = load i32, ptr %print_hash_value, align 4
  call void @transparent_crc(i64 noundef %conv24, ptr noundef @.str.9, i32 noundef %26)
  %27 = load i32, ptr @g_66, align 4
  %conv25 = sext i32 %27 to i64
  %28 = load i32, ptr %print_hash_value, align 4
  call void @transparent_crc(i64 noundef %conv25, ptr noundef @.str.10, i32 noundef %28)
  %29 = load i64, ptr @g_85, align 8
  %30 = load i32, ptr %print_hash_value, align 4
  call void @transparent_crc(i64 noundef %29, ptr noundef @.str.11, i32 noundef %30)
  %31 = load i32, ptr @g_86, align 4
  %conv26 = sext i32 %31 to i64
  %32 = load i32, ptr %print_hash_value, align 4
  call void @transparent_crc(i64 noundef %conv26, ptr noundef @.str.12, i32 noundef %32)
  store i32 0, ptr %i, align 4
  br label %for.cond27

for.cond27:                                       ; preds = %for.inc56, %for.end20
  %33 = load i32, ptr %i, align 4
  %cmp28 = icmp slt i32 %33, 4
  br i1 %cmp28, label %for.body30, label %for.end58

for.body30:                                       ; preds = %for.cond27
  store i32 0, ptr %j, align 4
  br label %for.cond31

for.cond31:                                       ; preds = %for.inc53, %for.body30
  %34 = load i32, ptr %j, align 4
  %cmp32 = icmp slt i32 %34, 3
  br i1 %cmp32, label %for.body34, label %for.end55

for.body34:                                       ; preds = %for.cond31
  store i32 0, ptr %k, align 4
  br label %for.cond35

for.cond35:                                       ; preds = %for.inc50, %for.body34
  %35 = load i32, ptr %k, align 4
  %cmp36 = icmp slt i32 %35, 7
  br i1 %cmp36, label %for.body38, label %for.end52

for.body38:                                       ; preds = %for.cond35
  %36 = load i32, ptr %i, align 4
  %idxprom39 = sext i32 %36 to i64
  %arrayidx40 = getelementptr inbounds [4 x [3 x [7 x i8]]], ptr @g_97, i64 0, i64 %idxprom39
  %37 = load i32, ptr %j, align 4
  %idxprom41 = sext i32 %37 to i64
  %arrayidx42 = getelementptr inbounds [3 x [7 x i8]], ptr %arrayidx40, i64 0, i64 %idxprom41
  %38 = load i32, ptr %k, align 4
  %idxprom43 = sext i32 %38 to i64
  %arrayidx44 = getelementptr inbounds [7 x i8], ptr %arrayidx42, i64 0, i64 %idxprom43
  %39 = load i8, ptr %arrayidx44, align 1
  %conv45 = zext i8 %39 to i64
  %40 = load i32, ptr %print_hash_value, align 4
  call void @transparent_crc(i64 noundef %conv45, ptr noundef @.str.13, i32 noundef %40)
  %41 = load i32, ptr %print_hash_value, align 4
  %tobool46 = icmp ne i32 %41, 0
  br i1 %tobool46, label %if.then47, label %if.end49

if.then47:                                        ; preds = %for.body38
  %42 = load i32, ptr %i, align 4
  %43 = load i32, ptr %j, align 4
  %44 = load i32, ptr %k, align 4
  %call48 = call i32 (ptr, ...) @printf(ptr noundef @.str.14, i32 noundef %42, i32 noundef %43, i32 noundef %44)
  br label %if.end49

if.end49:                                         ; preds = %if.then47, %for.body38
  br label %for.inc50

for.inc50:                                        ; preds = %if.end49
  %45 = load i32, ptr %k, align 4
  %inc51 = add nsw i32 %45, 1
  store i32 %inc51, ptr %k, align 4
  br label %for.cond35, !llvm.loop !9

for.end52:                                        ; preds = %for.cond35
  br label %for.inc53

for.inc53:                                        ; preds = %for.end52
  %46 = load i32, ptr %j, align 4
  %inc54 = add nsw i32 %46, 1
  store i32 %inc54, ptr %j, align 4
  br label %for.cond31, !llvm.loop !10

for.end55:                                        ; preds = %for.cond31
  br label %for.inc56

for.inc56:                                        ; preds = %for.end55
  %47 = load i32, ptr %i, align 4
  %inc57 = add nsw i32 %47, 1
  store i32 %inc57, ptr %i, align 4
  br label %for.cond27, !llvm.loop !11

for.end58:                                        ; preds = %for.cond27
  %bf.load59 = load i8, ptr @g_115, align 8
  %bf.clear60 = and i8 %bf.load59, 15
  %bf.cast61 = zext i8 %bf.clear60 to i32
  %conv62 = zext i32 %bf.cast61 to i64
  %48 = load i32, ptr %print_hash_value, align 4
  call void @transparent_crc(i64 noundef %conv62, ptr noundef @.str.15, i32 noundef %48)
  %bf.load63 = load i8, ptr @g_116, align 8
  %bf.clear64 = and i8 %bf.load63, 15
  %bf.cast65 = zext i8 %bf.clear64 to i32
  %conv66 = zext i32 %bf.cast65 to i64
  %49 = load i32, ptr %print_hash_value, align 4
  call void @transparent_crc(i64 noundef %conv66, ptr noundef @.str.16, i32 noundef %49)
  %bf.load67 = load i8, ptr @g_117, align 8
  %bf.clear68 = and i8 %bf.load67, 15
  %bf.cast69 = zext i8 %bf.clear68 to i32
  %conv70 = zext i32 %bf.cast69 to i64
  %50 = load i32, ptr %print_hash_value, align 4
  call void @transparent_crc(i64 noundef %conv70, ptr noundef @.str.17, i32 noundef %50)
  %bf.load71 = load i8, ptr @g_118, align 8
  %bf.clear72 = and i8 %bf.load71, 15
  %bf.cast73 = zext i8 %bf.clear72 to i32
  %conv74 = zext i32 %bf.cast73 to i64
  %51 = load i32, ptr %print_hash_value, align 4
  call void @transparent_crc(i64 noundef %conv74, ptr noundef @.str.18, i32 noundef %51)
  %bf.load75 = load i8, ptr @g_119, align 8
  %bf.clear76 = and i8 %bf.load75, 15
  %bf.cast77 = zext i8 %bf.clear76 to i32
  %conv78 = zext i32 %bf.cast77 to i64
  %52 = load i32, ptr %print_hash_value, align 4
  call void @transparent_crc(i64 noundef %conv78, ptr noundef @.str.19, i32 noundef %52)
  store i32 0, ptr %i, align 4
  br label %for.cond79

for.cond79:                                       ; preds = %for.inc93, %for.end58
  %53 = load i32, ptr %i, align 4
  %cmp80 = icmp slt i32 %53, 3
  br i1 %cmp80, label %for.body82, label %for.end95

for.body82:                                       ; preds = %for.cond79
  %54 = load i32, ptr %i, align 4
  %idxprom83 = sext i32 %54 to i64
  %arrayidx84 = getelementptr inbounds [3 x %union.U2], ptr @g_120, i64 0, i64 %idxprom83
  %bf.load85 = load i8, ptr %arrayidx84, align 8
  %bf.clear86 = and i8 %bf.load85, 15
  %bf.cast87 = zext i8 %bf.clear86 to i32
  %conv88 = zext i32 %bf.cast87 to i64
  %55 = load i32, ptr %print_hash_value, align 4
  call void @transparent_crc(i64 noundef %conv88, ptr noundef @.str.20, i32 noundef %55)
  %56 = load i32, ptr %print_hash_value, align 4
  %tobool89 = icmp ne i32 %56, 0
  br i1 %tobool89, label %if.then90, label %if.end92

if.then90:                                        ; preds = %for.body82
  %57 = load i32, ptr %i, align 4
  %call91 = call i32 (ptr, ...) @printf(ptr noundef @.str.21, i32 noundef %57)
  br label %if.end92

if.end92:                                         ; preds = %if.then90, %for.body82
  br label %for.inc93

for.inc93:                                        ; preds = %if.end92
  %58 = load i32, ptr %i, align 4
  %inc94 = add nsw i32 %58, 1
  store i32 %inc94, ptr %i, align 4
  br label %for.cond79, !llvm.loop !12

for.end95:                                        ; preds = %for.cond79
  %bf.load96 = load i8, ptr @g_121, align 8
  %bf.clear97 = and i8 %bf.load96, 15
  %bf.cast98 = zext i8 %bf.clear97 to i32
  %conv99 = zext i32 %bf.cast98 to i64
  %59 = load i32, ptr %print_hash_value, align 4
  call void @transparent_crc(i64 noundef %conv99, ptr noundef @.str.22, i32 noundef %59)
  %bf.load100 = load i8, ptr @g_122, align 8
  %bf.clear101 = and i8 %bf.load100, 15
  %bf.cast102 = zext i8 %bf.clear101 to i32
  %conv103 = zext i32 %bf.cast102 to i64
  %60 = load i32, ptr %print_hash_value, align 4
  call void @transparent_crc(i64 noundef %conv103, ptr noundef @.str.23, i32 noundef %60)
  %61 = load i16, ptr @g_130, align 2
  %conv104 = sext i16 %61 to i64
  %62 = load i32, ptr %print_hash_value, align 4
  call void @transparent_crc(i64 noundef %conv104, ptr noundef @.str.24, i32 noundef %62)
  %63 = load i32, ptr @g_131, align 4
  %conv105 = zext i32 %63 to i64
  %64 = load i32, ptr %print_hash_value, align 4
  call void @transparent_crc(i64 noundef %conv105, ptr noundef @.str.25, i32 noundef %64)
  store i32 0, ptr %i, align 4
  br label %for.cond106

for.cond106:                                      ; preds = %for.inc120, %for.end95
  %65 = load i32, ptr %i, align 4
  %cmp107 = icmp slt i32 %65, 4
  br i1 %cmp107, label %for.body109, label %for.end122

for.body109:                                      ; preds = %for.cond106
  %66 = load i32, ptr %i, align 4
  %idxprom110 = sext i32 %66 to i64
  %arrayidx111 = getelementptr inbounds [4 x %union.U2], ptr @g_137, i64 0, i64 %idxprom110
  %bf.load112 = load i8, ptr %arrayidx111, align 8
  %bf.clear113 = and i8 %bf.load112, 15
  %bf.cast114 = zext i8 %bf.clear113 to i32
  %conv115 = zext i32 %bf.cast114 to i64
  %67 = load i32, ptr %print_hash_value, align 4
  call void @transparent_crc(i64 noundef %conv115, ptr noundef @.str.26, i32 noundef %67)
  %68 = load i32, ptr %print_hash_value, align 4
  %tobool116 = icmp ne i32 %68, 0
  br i1 %tobool116, label %if.then117, label %if.end119

if.then117:                                       ; preds = %for.body109
  %69 = load i32, ptr %i, align 4
  %call118 = call i32 (ptr, ...) @printf(ptr noundef @.str.21, i32 noundef %69)
  br label %if.end119

if.end119:                                        ; preds = %if.then117, %for.body109
  br label %for.inc120

for.inc120:                                       ; preds = %if.end119
  %70 = load i32, ptr %i, align 4
  %inc121 = add nsw i32 %70, 1
  store i32 %inc121, ptr %i, align 4
  br label %for.cond106, !llvm.loop !13

for.end122:                                       ; preds = %for.cond106
  %bf.load123 = load i8, ptr @g_139, align 8
  %bf.clear124 = and i8 %bf.load123, 15
  %bf.cast125 = zext i8 %bf.clear124 to i32
  %conv126 = zext i32 %bf.cast125 to i64
  %71 = load i32, ptr %print_hash_value, align 4
  call void @transparent_crc(i64 noundef %conv126, ptr noundef @.str.27, i32 noundef %71)
  %bf.load127 = load i8, ptr @g_146, align 1
  %bf.clear128 = and i8 %bf.load127, 127
  %bf.cast129 = zext i8 %bf.clear128 to i32
  %conv130 = zext i32 %bf.cast129 to i64
  %72 = load i32, ptr %print_hash_value, align 4
  call void @transparent_crc(i64 noundef %conv130, ptr noundef @.str.28, i32 noundef %72)
  %73 = load i32, ptr getelementptr inbounds (%struct.S1, ptr @g_146, i32 0, i32 1), align 1
  %conv131 = zext i32 %73 to i64
  %74 = load i32, ptr %print_hash_value, align 4
  call void @transparent_crc(i64 noundef %conv131, ptr noundef @.str.29, i32 noundef %74)
  %75 = load i8, ptr getelementptr inbounds (%struct.S1, ptr @g_146, i32 0, i32 2), align 1
  %conv132 = zext i8 %75 to i64
  %76 = load i32, ptr %print_hash_value, align 4
  call void @transparent_crc(i64 noundef %conv132, ptr noundef @.str.30, i32 noundef %76)
  %77 = load i32, ptr @g_149, align 4
  %conv133 = zext i32 %77 to i64
  %78 = load i32, ptr %print_hash_value, align 4
  call void @transparent_crc(i64 noundef %conv133, ptr noundef @.str.31, i32 noundef %78)
  store i32 0, ptr %i, align 4
  br label %for.cond134

for.cond134:                                      ; preds = %for.inc144, %for.end122
  %79 = load i32, ptr %i, align 4
  %cmp135 = icmp slt i32 %79, 10
  br i1 %cmp135, label %for.body137, label %for.end146

for.body137:                                      ; preds = %for.cond134
  %80 = load i32, ptr %i, align 4
  %idxprom138 = sext i32 %80 to i64
  %arrayidx139 = getelementptr inbounds [10 x i64], ptr @g_161, i64 0, i64 %idxprom138
  %81 = load volatile i64, ptr %arrayidx139, align 8
  %82 = load i32, ptr %print_hash_value, align 4
  call void @transparent_crc(i64 noundef %81, ptr noundef @.str.32, i32 noundef %82)
  %83 = load i32, ptr %print_hash_value, align 4
  %tobool140 = icmp ne i32 %83, 0
  br i1 %tobool140, label %if.then141, label %if.end143

if.then141:                                       ; preds = %for.body137
  %84 = load i32, ptr %i, align 4
  %call142 = call i32 (ptr, ...) @printf(ptr noundef @.str.21, i32 noundef %84)
  br label %if.end143

if.end143:                                        ; preds = %if.then141, %for.body137
  br label %for.inc144

for.inc144:                                       ; preds = %if.end143
  %85 = load i32, ptr %i, align 4
  %inc145 = add nsw i32 %85, 1
  store i32 %inc145, ptr %i, align 4
  br label %for.cond134, !llvm.loop !14

for.end146:                                       ; preds = %for.cond134
  %86 = load i32, ptr @g_164, align 4
  %conv147 = zext i32 %86 to i64
  %87 = load i32, ptr %print_hash_value, align 4
  call void @transparent_crc(i64 noundef %conv147, ptr noundef @.str.33, i32 noundef %87)
  %88 = load i64, ptr @g_187, align 8
  %89 = load i32, ptr %print_hash_value, align 4
  call void @transparent_crc(i64 noundef %88, ptr noundef @.str.34, i32 noundef %89)
  %90 = load i32, ptr %print_hash_value, align 4
  call void @transparent_crc(i64 noundef -1, ptr noundef @.str.35, i32 noundef %90)
  %91 = load i8, ptr @g_206, align 1
  %conv148 = sext i8 %91 to i64
  %92 = load i32, ptr %print_hash_value, align 4
  call void @transparent_crc(i64 noundef %conv148, ptr noundef @.str.36, i32 noundef %92)
  %93 = load volatile i64, ptr @g_213, align 8
  %94 = load i32, ptr %print_hash_value, align 4
  call void @transparent_crc(i64 noundef %93, ptr noundef @.str.37, i32 noundef %94)
  %bf.load149 = load i8, ptr @g_220, align 8
  %bf.clear150 = and i8 %bf.load149, 15
  %bf.cast151 = zext i8 %bf.clear150 to i32
  %conv152 = zext i32 %bf.cast151 to i64
  %95 = load i32, ptr %print_hash_value, align 4
  call void @transparent_crc(i64 noundef %conv152, ptr noundef @.str.38, i32 noundef %95)
  %96 = load i32, ptr @crc32_context, align 4
  %conv153 = zext i32 %96 to i64
  %xor = xor i64 %conv153, 4294967295
  %conv154 = trunc i64 %xor to i32
  %97 = load i32, ptr %print_hash_value, align 4
  call void @platform_main_end(i32 noundef %conv154, i32 noundef %97)
  ret i32 0
}

; Function Attrs: nounwind willreturn memory(read)
declare i32 @strcmp(ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal void @platform_main_begin() #0 {
entry:
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @crc32_gentab() #0 {
entry:
  %crc = alloca i32, align 4
  %poly = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 -306674912, ptr %poly, align 4
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc5, %entry
  %0 = load i32, ptr %i, align 4
  %cmp = icmp slt i32 %0, 256
  br i1 %cmp, label %for.body, label %for.end6

for.body:                                         ; preds = %for.cond
  %1 = load i32, ptr %i, align 4
  store i32 %1, ptr %crc, align 4
  store i32 8, ptr %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32, ptr %j, align 4
  %cmp2 = icmp sgt i32 %2, 0
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %3 = load i32, ptr %crc, align 4
  %and = and i32 %3, 1
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %for.body3
  %4 = load i32, ptr %crc, align 4
  %shr = lshr i32 %4, 1
  %xor = xor i32 %shr, -306674912
  store i32 %xor, ptr %crc, align 4
  br label %if.end

if.else:                                          ; preds = %for.body3
  %5 = load i32, ptr %crc, align 4
  %shr4 = lshr i32 %5, 1
  store i32 %shr4, ptr %crc, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %6 = load i32, ptr %j, align 4
  %dec = add nsw i32 %6, -1
  store i32 %dec, ptr %j, align 4
  br label %for.cond1, !llvm.loop !15

for.end:                                          ; preds = %for.cond1
  %7 = load i32, ptr %crc, align 4
  %8 = load i32, ptr %i, align 4
  %idxprom = sext i32 %8 to i64
  %arrayidx = getelementptr inbounds [256 x i32], ptr @crc32_tab, i64 0, i64 %idxprom
  store i32 %7, ptr %arrayidx, align 4
  br label %for.inc5

for.inc5:                                         ; preds = %for.end
  %9 = load i32, ptr %i, align 4
  %inc = add nsw i32 %9, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !16

for.end6:                                         ; preds = %for.cond
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @func_1() #0 {
entry:
  %retval = alloca i32, align 4
  %l_12 = alloca [5 x i16], align 2
  %l_39 = alloca ptr, align 8
  %l_221 = alloca [2 x [5 x i32]], align 16
  %l_224 = alloca ptr, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %l_5 = alloca ptr, align 8
  %l_7 = alloca ptr, align 8
  %l_8 = alloca ptr, align 8
  %l_9 = alloca ptr, align 8
  %l_10 = alloca ptr, align 8
  %l_11 = alloca [2 x [6 x ptr]], align 16
  %i1 = alloca i32, align 4
  %j2 = alloca i32, align 4
  %l_219 = alloca ptr, align 8
  %l_222 = alloca ptr, align 8
  %l_223 = alloca ptr, align 8
  %i26 = alloca i32, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 2 %l_12, ptr align 2 @__const.func_1.l_12, i64 10, i1 false)
  store ptr @g_40, ptr %l_39, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %l_221, ptr align 16 @__const.func_1.l_221, i64 40, i1 false)
  store ptr @g_2, ptr %l_224, align 8
  store i32 3, ptr @g_2, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc15, %entry
  %0 = load i32, ptr @g_2, align 4
  %cmp = icmp sle i32 %0, 1
  br i1 %cmp, label %for.body, label %for.end17

for.body:                                         ; preds = %for.cond
  store ptr @g_6, ptr %l_5, align 8
  store ptr @g_6, ptr %l_7, align 8
  store ptr @g_6, ptr %l_8, align 8
  store ptr @g_6, ptr %l_9, align 8
  store ptr @g_6, ptr %l_10, align 8
  store i32 0, ptr %i1, align 4
  br label %for.cond3

for.cond3:                                        ; preds = %for.inc11, %for.body
  %1 = load i32, ptr %i1, align 4
  %cmp4 = icmp slt i32 %1, 2
  br i1 %cmp4, label %for.body5, label %for.end13

for.body5:                                        ; preds = %for.cond3
  store i32 0, ptr %j2, align 4
  br label %for.cond6

for.cond6:                                        ; preds = %for.inc, %for.body5
  %2 = load i32, ptr %j2, align 4
  %cmp7 = icmp slt i32 %2, 6
  br i1 %cmp7, label %for.body8, label %for.end

for.body8:                                        ; preds = %for.cond6
  %3 = load i32, ptr %i1, align 4
  %idxprom = sext i32 %3 to i64
  %arrayidx = getelementptr inbounds [2 x [6 x ptr]], ptr %l_11, i64 0, i64 %idxprom
  %4 = load i32, ptr %j2, align 4
  %idxprom9 = sext i32 %4 to i64
  %arrayidx10 = getelementptr inbounds [6 x ptr], ptr %arrayidx, i64 0, i64 %idxprom9
  store ptr @g_6, ptr %arrayidx10, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body8
  %5 = load i32, ptr %j2, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, ptr %j2, align 4
  br label %for.cond6, !llvm.loop !17

for.end:                                          ; preds = %for.cond6
  br label %for.inc11

for.inc11:                                        ; preds = %for.end
  %6 = load i32, ptr %i1, align 4
  %inc12 = add nsw i32 %6, 1
  store i32 %inc12, ptr %i1, align 4
  br label %for.cond3, !llvm.loop !18

for.end13:                                        ; preds = %for.cond3
  %arrayidx14 = getelementptr inbounds [5 x i16], ptr %l_12, i64 0, i64 1
  %7 = load i16, ptr %arrayidx14, align 2
  %dec = add i16 %7, -1
  store i16 %dec, ptr %arrayidx14, align 2
  br label %for.inc15

for.inc15:                                        ; preds = %for.end13
  %8 = load i32, ptr @g_2, align 4
  %conv = trunc i32 %8 to i16
  %call = call zeroext i16 @safe_sub_func_uint16_t_u_u(i16 noundef zeroext %conv, i16 noundef zeroext 1)
  %conv16 = zext i16 %call to i32
  store i32 %conv16, ptr @g_2, align 4
  br label %for.cond, !llvm.loop !19

for.end17:                                        ; preds = %for.cond
  store i32 4, ptr @g_2, align 4
  br label %for.cond18

for.cond18:                                       ; preds = %for.inc43, %for.end17
  %9 = load i32, ptr @g_2, align 4
  %cmp19 = icmp sge i32 %9, 1
  br i1 %cmp19, label %for.body21, label %for.end44

for.body21:                                       ; preds = %for.cond18
  store i32 0, ptr @g_6, align 4
  br label %for.cond22

for.cond22:                                       ; preds = %for.inc41, %for.body21
  %10 = load i32, ptr @g_6, align 4
  %cmp23 = icmp sle i32 %10, 4
  br i1 %cmp23, label %for.body25, label %for.end42

for.body25:                                       ; preds = %for.cond22
  store ptr @g_220, ptr %l_219, align 8
  store ptr @g_206, ptr %l_222, align 8
  store ptr null, ptr %l_223, align 8
  %11 = load i32, ptr @g_6, align 4
  %idxprom27 = sext i32 %11 to i64
  %arrayidx28 = getelementptr inbounds [5 x i16], ptr %l_12, i64 0, i64 %idxprom27
  %12 = load i16, ptr %arrayidx28, align 2
  %conv29 = zext i16 %12 to i64
  %13 = load i32, ptr @g_2, align 4
  %conv30 = sext i32 %13 to i64
  %14 = load ptr, ptr %l_39, align 8
  %call31 = call zeroext i16 @func_37(ptr noundef %14)
  %15 = load ptr, ptr %l_219, align 8
  %arrayidx32 = getelementptr inbounds [2 x [5 x i32]], ptr %l_221, i64 0, i64 1
  %arrayidx33 = getelementptr inbounds [5 x i32], ptr %arrayidx32, i64 0, i64 3
  %16 = load i32, ptr %arrayidx33, align 4
  %conv34 = trunc i32 %16 to i16
  %call35 = call zeroext i16 @func_33(i16 noundef zeroext %call31, ptr noundef %15, i16 noundef zeroext %conv34)
  %17 = load ptr, ptr %l_222, align 8
  %18 = load ptr, ptr %l_223, align 8
  %call36 = call ptr @func_27(i64 noundef %conv30, i16 noundef zeroext %call35, ptr noundef @g_6, ptr noundef %17, ptr noundef %18)
  %bf.load = load i8, ptr @g_139, align 8
  %bf.clear = and i8 %bf.load, 15
  %bf.cast = zext i8 %bf.clear to i32
  %19 = load i32, ptr @g_164, align 4
  %conv37 = zext i32 %19 to i64
  %20 = load ptr, ptr %l_224, align 8
  %21 = load ptr, ptr getelementptr inbounds ([7 x ptr], ptr @g_136, i64 0, i64 5), align 8
  %call38 = call ptr @func_21(ptr noundef %call36, i32 noundef %bf.cast, i64 noundef %conv37, ptr noundef %20, ptr noundef %21)
  %call39 = call ptr @func_17(i64 noundef %conv29, ptr noundef %call38, i8 noundef zeroext -1)
  %call40 = call ptr @func_15(ptr noundef %call39)
  store ptr %call40, ptr @g_136, align 16
  br label %for.inc41

for.inc41:                                        ; preds = %for.body25
  %22 = load i32, ptr @g_6, align 4
  %add = add nsw i32 %22, 1
  store i32 %add, ptr @g_6, align 4
  br label %for.cond22, !llvm.loop !20

for.end42:                                        ; preds = %for.cond22
  %23 = load ptr, ptr %l_224, align 8
  %24 = load i32, ptr %23, align 4
  store i32 %24, ptr %retval, align 4
  br label %return

for.inc43:                                        ; No predecessors!
  %25 = load i32, ptr @g_2, align 4
  %sub = sub nsw i32 %25, 1
  store i32 %sub, ptr @g_2, align 4
  br label %for.cond18, !llvm.loop !21

for.end44:                                        ; preds = %for.cond18
  %26 = load i32, ptr @g_164, align 4
  store i32 %26, ptr %retval, align 4
  br label %return

return:                                           ; preds = %for.end44, %for.end42
  %27 = load i32, ptr %retval, align 4
  ret i32 %27
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @transparent_crc(i64 noundef %val, ptr noundef %vname, i32 noundef %flag) #0 {
entry:
  %val.addr = alloca i64, align 8
  %vname.addr = alloca ptr, align 8
  %flag.addr = alloca i32, align 4
  store i64 %val, ptr %val.addr, align 8
  store ptr %vname, ptr %vname.addr, align 8
  store i32 %flag, ptr %flag.addr, align 4
  %0 = load i64, ptr %val.addr, align 8
  call void @crc32_8bytes(i64 noundef %0)
  %1 = load i32, ptr %flag.addr, align 4
  %tobool = icmp ne i32 %1, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %2 = load ptr, ptr %vname.addr, align 8
  %3 = load i32, ptr @crc32_context, align 4
  %conv = zext i32 %3 to i64
  %xor = xor i64 %conv, 4294967295
  %call = call i32 (ptr, ...) @printf(ptr noundef @.str.39, ptr noundef %2, i64 noundef %xor)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

declare i32 @printf(ptr noundef, ...) #2

; Function Attrs: noinline nounwind optnone uwtable
define internal void @platform_main_end(i32 noundef %crc, i32 noundef %flag) #0 {
entry:
  %crc.addr = alloca i32, align 4
  %flag.addr = alloca i32, align 4
  store i32 %crc, ptr %crc.addr, align 4
  store i32 %flag, ptr %flag.addr, align 4
  %0 = load i32, ptr %crc.addr, align 4
  %call = call i32 (ptr, ...) @printf(ptr noundef @.str.52, i32 noundef %0)
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: noinline nounwind optnone uwtable
define internal zeroext i16 @safe_sub_func_uint16_t_u_u(i16 noundef zeroext %ui1, i16 noundef zeroext %ui2) #0 {
entry:
  %ui1.addr = alloca i16, align 2
  %ui2.addr = alloca i16, align 2
  store i16 %ui1, ptr %ui1.addr, align 2
  store i16 %ui2, ptr %ui2.addr, align 2
  %0 = load i16, ptr %ui1.addr, align 2
  %conv = zext i16 %0 to i32
  %1 = load i16, ptr %ui2.addr, align 2
  %conv1 = zext i16 %1 to i32
  %sub = sub nsw i32 %conv, %conv1
  %conv2 = trunc i32 %sub to i16
  ret i16 %conv2
}

; Function Attrs: noinline nounwind optnone uwtable
define internal ptr @func_15(ptr noundef %p_16) #0 {
entry:
  %p_16.addr = alloca ptr, align 8
  %l_226 = alloca [1 x [5 x [7 x ptr]]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store ptr %p_16, ptr %p_16.addr, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %l_226, ptr align 16 @__const.func_15.l_226, i64 280, i1 false)
  %arrayidx = getelementptr inbounds [1 x [5 x [7 x ptr]]], ptr %l_226, i64 0, i64 0
  %arrayidx1 = getelementptr inbounds [5 x [7 x ptr]], ptr %arrayidx, i64 0, i64 1
  %arrayidx2 = getelementptr inbounds [7 x ptr], ptr %arrayidx1, i64 0, i64 5
  %0 = load ptr, ptr %arrayidx2, align 8
  ret ptr %0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal ptr @func_17(i64 noundef %p_18, ptr noundef %p_19, i8 noundef zeroext %p_20) #0 {
entry:
  %p_18.addr = alloca i64, align 8
  %p_19.addr = alloca ptr, align 8
  %p_20.addr = alloca i8, align 1
  store i64 %p_18, ptr %p_18.addr, align 8
  store ptr %p_19, ptr %p_19.addr, align 8
  store i8 %p_20, ptr %p_20.addr, align 1
  ret ptr @g_117
}

; Function Attrs: noinline nounwind optnone uwtable
define internal ptr @func_21(ptr noundef %p_22, i32 noundef %p_23, i64 noundef %p_24, ptr noundef %p_25, ptr noundef %p_26) #0 {
entry:
  %p_22.addr = alloca ptr, align 8
  %p_23.addr = alloca i32, align 4
  %p_24.addr = alloca i64, align 8
  %p_25.addr = alloca ptr, align 8
  %p_26.addr = alloca ptr, align 8
  %l_225 = alloca [4 x [5 x ptr]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store ptr %p_22, ptr %p_22.addr, align 8
  store i32 %p_23, ptr %p_23.addr, align 4
  store i64 %p_24, ptr %p_24.addr, align 8
  store ptr %p_25, ptr %p_25.addr, align 8
  store ptr %p_26, ptr %p_26.addr, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %l_225, ptr align 16 @__const.func_21.l_225, i64 160, i1 false)
  %arrayidx = getelementptr inbounds [4 x [5 x ptr]], ptr %l_225, i64 0, i64 3
  %arrayidx1 = getelementptr inbounds [5 x ptr], ptr %arrayidx, i64 0, i64 2
  %0 = load ptr, ptr %arrayidx1, align 8
  ret ptr %0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal ptr @func_27(i64 noundef %p_28, i16 noundef zeroext %p_29, ptr noundef %p_30, ptr noundef %p_31, ptr noundef %p_32) #0 {
entry:
  %p_28.addr = alloca i64, align 8
  %p_29.addr = alloca i16, align 2
  %p_30.addr = alloca ptr, align 8
  %p_31.addr = alloca ptr, align 8
  %p_32.addr = alloca ptr, align 8
  store i64 %p_28, ptr %p_28.addr, align 8
  store i16 %p_29, ptr %p_29.addr, align 2
  store ptr %p_30, ptr %p_30.addr, align 8
  store ptr %p_31, ptr %p_31.addr, align 8
  store ptr %p_32, ptr %p_32.addr, align 8
  ret ptr @g_116
}

; Function Attrs: noinline nounwind optnone uwtable
define internal zeroext i16 @func_33(i16 noundef zeroext %p_34, ptr noundef %p_35, i16 noundef zeroext %p_36) #0 {
entry:
  %p_34.addr = alloca i16, align 2
  %p_35.addr = alloca ptr, align 8
  %p_36.addr = alloca i16, align 2
  store i16 %p_34, ptr %p_34.addr, align 2
  store ptr %p_35, ptr %p_35.addr, align 8
  store i16 %p_36, ptr %p_36.addr, align 2
  %0 = load i32, ptr @g_149, align 4
  %conv = trunc i32 %0 to i16
  ret i16 %conv
}

; Function Attrs: noinline nounwind optnone uwtable
define internal zeroext i16 @func_37(ptr noundef %p_38) #0 {
entry:
  %retval = alloca i16, align 2
  %p_38.addr = alloca ptr, align 8
  %l_49 = alloca [1 x i32], align 4
  %l_218 = alloca [7 x [6 x [5 x ptr]]], align 16
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %l_216 = alloca ptr, align 8
  %l_217 = alloca i32, align 4
  %l_57 = alloca ptr, align 8
  %l_214 = alloca [3 x i32], align 4
  %l_215 = alloca ptr, align 8
  %i7 = alloca i32, align 4
  %j8 = alloca i32, align 4
  store ptr %p_38, ptr %p_38.addr, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %l_218, ptr align 16 @__const.func_37.l_218, i64 1680, i1 false)
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4
  %cmp = icmp slt i32 %0, 1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32, ptr %i, align 4
  %idxprom = sext i32 %1 to i64
  %arrayidx = getelementptr inbounds [1 x i32], ptr %l_49, i64 0, i64 %idxprom
  store i32 4, ptr %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %2 = load i32, ptr %i, align 4
  %inc = add nsw i32 %2, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !22

for.end:                                          ; preds = %for.cond
  store i32 0, ptr @g_42, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc76, %for.end
  %3 = load i32, ptr @g_42, align 4
  %cmp2 = icmp eq i32 %3, 17
  br i1 %cmp2, label %for.body3, label %for.end78

for.body3:                                        ; preds = %for.cond1
  store ptr @g_206, ptr %l_216, align 8
  store i32 1, ptr %l_217, align 4
  store i32 0, ptr @g_45, align 4
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc73, %for.body3
  %4 = load i32, ptr @g_45, align 4
  %cmp5 = icmp sge i32 %4, 0
  br i1 %cmp5, label %for.body6, label %for.end74

for.body6:                                        ; preds = %for.cond4
  store ptr @g_58, ptr %l_57, align 8
  store ptr %l_57, ptr %l_215, align 8
  store i32 0, ptr %i7, align 4
  br label %for.cond9

for.cond9:                                        ; preds = %for.inc14, %for.body6
  %5 = load i32, ptr %i7, align 4
  %cmp10 = icmp slt i32 %5, 3
  br i1 %cmp10, label %for.body11, label %for.end16

for.body11:                                       ; preds = %for.cond9
  %6 = load i32, ptr %i7, align 4
  %idxprom12 = sext i32 %6 to i64
  %arrayidx13 = getelementptr inbounds [3 x i32], ptr %l_214, i64 0, i64 %idxprom12
  store i32 1780471898, ptr %arrayidx13, align 4
  br label %for.inc14

for.inc14:                                        ; preds = %for.body11
  %7 = load i32, ptr %i7, align 4
  %inc15 = add nsw i32 %7, 1
  store i32 %inc15, ptr %i7, align 4
  br label %for.cond9, !llvm.loop !23

for.end16:                                        ; preds = %for.cond9
  %8 = load i32, ptr @g_45, align 4
  %idxprom17 = sext i32 %8 to i64
  %arrayidx18 = getelementptr inbounds [1 x [2 x i32]], ptr @g_41, i64 0, i64 %idxprom17
  %9 = load i32, ptr @g_45, align 4
  %add = add nsw i32 %9, 1
  %idxprom19 = sext i32 %add to i64
  %arrayidx20 = getelementptr inbounds [2 x i32], ptr %arrayidx18, i64 0, i64 %idxprom19
  %10 = load i32, ptr @g_45, align 4
  %cmp21 = icmp eq ptr %arrayidx20, @g_42
  %conv = zext i1 %cmp21 to i32
  %11 = load i32, ptr @g_45, align 4
  %idxprom22 = sext i32 %11 to i64
  %arrayidx23 = getelementptr inbounds [1 x [2 x i32]], ptr @g_41, i64 0, i64 %idxprom22
  %12 = load i32, ptr @g_45, align 4
  %add24 = add nsw i32 %12, 1
  %idxprom25 = sext i32 %add24 to i64
  %arrayidx26 = getelementptr inbounds [2 x i32], ptr %arrayidx23, i64 0, i64 %idxprom25
  store volatile i32 %conv, ptr %arrayidx26, align 4
  %arrayidx27 = getelementptr inbounds [1 x i32], ptr %l_49, i64 0, i64 0
  %13 = load i32, ptr %arrayidx27, align 4
  %14 = load i32, ptr @g_45, align 4
  %idxprom28 = sext i32 %14 to i64
  %arrayidx29 = getelementptr inbounds [1 x [2 x i32]], ptr @g_41, i64 0, i64 %idxprom28
  %15 = load i32, ptr @g_45, align 4
  %add30 = add nsw i32 %15, 1
  %idxprom31 = sext i32 %add30 to i64
  %arrayidx32 = getelementptr inbounds [2 x i32], ptr %arrayidx29, i64 0, i64 %idxprom31
  %16 = load volatile i32, ptr %arrayidx32, align 4
  %17 = load ptr, ptr %l_57, align 8
  %call = call signext i8 @func_55(ptr noundef %17)
  %conv33 = sext i8 %call to i32
  %18 = load ptr, ptr getelementptr inbounds ([10 x [3 x ptr]], ptr getelementptr inbounds ([7 x [10 x [3 x ptr]]], ptr @g_205, i64 0, i64 4), i64 0, i64 8), align 16
  %19 = load ptr, ptr @g_211, align 8
  %cmp34 = icmp ne ptr null, %19
  %conv35 = zext i1 %cmp34 to i32
  %bf.load = load i8, ptr @g_121, align 8
  %bf.clear = and i8 %bf.load, 15
  %bf.cast = zext i8 %bf.clear to i32
  %conv36 = zext i32 %bf.cast to i64
  %cmp37 = icmp ne i64 %conv36, 0
  %conv38 = zext i1 %cmp37 to i32
  %conv39 = sext i32 %conv38 to i64
  %cmp40 = icmp eq i64 %conv39, 223
  %conv41 = zext i1 %cmp40 to i32
  %cmp42 = icmp slt i32 %conv35, %conv41
  %conv43 = zext i1 %cmp42 to i32
  %arrayidx44 = getelementptr inbounds [1 x i32], ptr %l_49, i64 0, i64 0
  %20 = load i32, ptr %arrayidx44, align 4
  %call45 = call i32 @safe_div_func_int32_t_s_s(i32 noundef %conv43, i32 noundef %20)
  %21 = load i32, ptr @g_6, align 4
  %cmp46 = icmp sge i32 %call45, %21
  %conv47 = zext i1 %cmp46 to i32
  %22 = load ptr, ptr %l_57, align 8
  %cmp48 = icmp ne ptr %18, %22
  %conv49 = zext i1 %cmp48 to i32
  %cmp50 = icmp sge i32 %conv33, %conv49
  %conv51 = zext i1 %cmp50 to i32
  %arrayidx52 = getelementptr inbounds [3 x i32], ptr %l_214, i64 0, i64 2
  %23 = load i32, ptr %arrayidx52, align 4
  %cmp53 = icmp ne i32 %conv51, %23
  %conv54 = zext i1 %cmp53 to i32
  %24 = load ptr, ptr %l_215, align 8
  store ptr null, ptr %24, align 8
  %25 = load ptr, ptr %l_216, align 8
  %cmp55 = icmp eq ptr null, %25
  %conv56 = zext i1 %cmp55 to i32
  %call57 = call i32 @safe_unary_minus_func_uint32_t_u(i32 noundef %conv56)
  %26 = load i32, ptr %l_217, align 4
  %conv58 = trunc i32 %26 to i16
  %call59 = call signext i16 @safe_add_func_int16_t_s_s(i16 noundef signext %conv58, i16 noundef signext -1)
  %conv60 = sext i16 %call59 to i32
  %arrayidx61 = getelementptr inbounds [1 x i32], ptr %l_49, i64 0, i64 0
  %27 = load i32, ptr %arrayidx61, align 4
  %cmp62 = icmp eq i32 %conv60, %27
  %conv63 = zext i1 %cmp62 to i32
  %call64 = call i32 @safe_add_func_int32_t_s_s(i32 noundef %16, i32 noundef %conv63)
  %cmp65 = icmp sge i32 %13, %call64
  %conv66 = zext i1 %cmp65 to i32
  br i1 true, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %for.end16
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %for.end16
  %28 = phi i1 [ true, %for.end16 ], [ true, %lor.rhs ]
  %lor.ext = zext i1 %28 to i32
  %conv67 = trunc i32 %lor.ext to i8
  %29 = load i32, ptr @g_164, align 4
  %conv68 = zext i32 %29 to i64
  %call69 = call ptr @func_46(i8 noundef signext %conv67, i64 noundef %conv68)
  %arrayidx70 = getelementptr inbounds [7 x [6 x [5 x ptr]]], ptr %l_218, i64 0, i64 1
  %arrayidx71 = getelementptr inbounds [6 x [5 x ptr]], ptr %arrayidx70, i64 0, i64 1
  %arrayidx72 = getelementptr inbounds [5 x ptr], ptr %arrayidx71, i64 0, i64 1
  store ptr %call69, ptr %arrayidx72, align 8
  br label %for.inc73

for.inc73:                                        ; preds = %lor.end
  %30 = load i32, ptr @g_45, align 4
  %sub = sub nsw i32 %30, 1
  store i32 %sub, ptr @g_45, align 4
  br label %for.cond4, !llvm.loop !24

for.end74:                                        ; preds = %for.cond4
  %31 = load i32, ptr %l_217, align 4
  %conv75 = trunc i32 %31 to i16
  store i16 %conv75, ptr %retval, align 2
  br label %return

for.inc76:                                        ; No predecessors!
  %32 = load i32, ptr @g_42, align 4
  %inc77 = add nsw i32 %32, 1
  store i32 %inc77, ptr @g_42, align 4
  br label %for.cond1, !llvm.loop !25

for.end78:                                        ; preds = %for.cond1
  %bf.load79 = load i8, ptr @g_116, align 8
  %bf.clear80 = and i8 %bf.load79, 15
  %bf.cast81 = zext i8 %bf.clear80 to i32
  %conv82 = trunc i32 %bf.cast81 to i16
  store i16 %conv82, ptr %retval, align 2
  br label %return

return:                                           ; preds = %for.end78, %for.end74
  %33 = load i16, ptr %retval, align 2
  ret i16 %33
}

; Function Attrs: noinline nounwind optnone uwtable
define internal ptr @func_46(i8 noundef signext %p_47, i64 noundef %p_48) #0 {
entry:
  %p_47.addr = alloca i8, align 1
  %p_48.addr = alloca i64, align 8
  store i8 %p_47, ptr %p_47.addr, align 1
  store i64 %p_48, ptr %p_48.addr, align 8
  ret ptr @g_45
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @safe_add_func_int32_t_s_s(i32 noundef %si1, i32 noundef %si2) #0 {
entry:
  %si1.addr = alloca i32, align 4
  %si2.addr = alloca i32, align 4
  store i32 %si1, ptr %si1.addr, align 4
  store i32 %si2, ptr %si2.addr, align 4
  %0 = load i32, ptr %si1.addr, align 4
  %cmp = icmp sgt i32 %0, 0
  br i1 %cmp, label %land.lhs.true, label %lor.lhs.false

land.lhs.true:                                    ; preds = %entry
  %1 = load i32, ptr %si2.addr, align 4
  %cmp1 = icmp sgt i32 %1, 0
  br i1 %cmp1, label %land.lhs.true2, label %lor.lhs.false

land.lhs.true2:                                   ; preds = %land.lhs.true
  %2 = load i32, ptr %si1.addr, align 4
  %3 = load i32, ptr %si2.addr, align 4
  %sub = sub nsw i32 2147483647, %3
  %cmp3 = icmp sgt i32 %2, %sub
  br i1 %cmp3, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %land.lhs.true2, %land.lhs.true, %entry
  %4 = load i32, ptr %si1.addr, align 4
  %cmp4 = icmp slt i32 %4, 0
  br i1 %cmp4, label %land.lhs.true5, label %cond.false

land.lhs.true5:                                   ; preds = %lor.lhs.false
  %5 = load i32, ptr %si2.addr, align 4
  %cmp6 = icmp slt i32 %5, 0
  br i1 %cmp6, label %land.lhs.true7, label %cond.false

land.lhs.true7:                                   ; preds = %land.lhs.true5
  %6 = load i32, ptr %si1.addr, align 4
  %7 = load i32, ptr %si2.addr, align 4
  %sub8 = sub nsw i32 -2147483648, %7
  %cmp9 = icmp slt i32 %6, %sub8
  br i1 %cmp9, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true7, %land.lhs.true2
  %8 = load i32, ptr %si1.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true7, %land.lhs.true5, %lor.lhs.false
  %9 = load i32, ptr %si1.addr, align 4
  %10 = load i32, ptr %si2.addr, align 4
  %add = add nsw i32 %9, %10
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %8, %cond.true ], [ %add, %cond.false ]
  ret i32 %cond
}

; Function Attrs: noinline nounwind optnone uwtable
define internal signext i16 @safe_add_func_int16_t_s_s(i16 noundef signext %si1, i16 noundef signext %si2) #0 {
entry:
  %si1.addr = alloca i16, align 2
  %si2.addr = alloca i16, align 2
  store i16 %si1, ptr %si1.addr, align 2
  store i16 %si2, ptr %si2.addr, align 2
  %0 = load i16, ptr %si1.addr, align 2
  %conv = sext i16 %0 to i32
  %1 = load i16, ptr %si2.addr, align 2
  %conv1 = sext i16 %1 to i32
  %add = add nsw i32 %conv, %conv1
  %conv2 = trunc i32 %add to i16
  ret i16 %conv2
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @safe_unary_minus_func_uint32_t_u(i32 noundef %ui) #0 {
entry:
  %ui.addr = alloca i32, align 4
  store i32 %ui, ptr %ui.addr, align 4
  %0 = load i32, ptr %ui.addr, align 4
  %sub = sub i32 0, %0
  ret i32 %sub
}

; Function Attrs: noinline nounwind optnone uwtable
define internal signext i8 @func_55(ptr noundef %p_56) #0 {
entry:
  %retval = alloca i8, align 1
  %p_56.addr = alloca ptr, align 8
  %l_64 = alloca ptr, align 8
  %l_67 = alloca i32, align 4
  %l_75 = alloca ptr, align 8
  %l_204 = alloca i32, align 4
  %l_65 = alloca ptr, align 8
  %l_200 = alloca ptr, align 8
  %l_203 = alloca i32, align 4
  store ptr %p_56, ptr %p_56.addr, align 8
  store ptr @g_42, ptr %l_64, align 8
  %0 = load i32, ptr @g_2, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.else43

if.then:                                          ; preds = %entry
  store i32 -2098556553, ptr %l_67, align 4
  store ptr null, ptr %l_75, align 8
  store i32 3, ptr %l_204, align 4
  store i8 0, ptr @g_58, align 1
  br label %for.cond

for.cond:                                         ; preds = %for.inc40, %if.then
  %1 = load i8, ptr @g_58, align 1
  %conv = sext i8 %1 to i32
  %cmp = icmp sge i32 %conv, -7
  br i1 %cmp, label %for.body, label %for.end41

for.body:                                         ; preds = %for.cond
  store ptr @g_66, ptr %l_65, align 8
  store i32 -23, ptr @g_61, align 4
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc, %for.body
  %2 = load i32, ptr @g_61, align 4
  %cmp3 = icmp slt i32 %2, -30
  br i1 %cmp3, label %for.body5, label %for.end

for.body5:                                        ; preds = %for.cond2
  %3 = load ptr, ptr %l_64, align 8
  store ptr %3, ptr %l_65, align 8
  %4 = load i32, ptr @g_66, align 4
  %5 = load i32, ptr %l_67, align 4
  %or = or i32 %5, %4
  store i32 %or, ptr %l_67, align 4
  %tobool6 = icmp ne i32 %or, 0
  br i1 %tobool6, label %if.then7, label %if.else

if.then7:                                         ; preds = %for.body5
  store ptr @g_130, ptr %l_200, align 8
  store i32 -10, ptr %l_203, align 4
  %6 = load ptr, ptr %p_56.addr, align 8
  %7 = load ptr, ptr %l_75, align 8
  %cmp8 = icmp eq ptr null, %7
  %conv9 = zext i1 %cmp8 to i32
  %conv10 = trunc i32 %conv9 to i16
  %call = call signext i16 @safe_mod_func_int16_t_s_s(i16 noundef signext %conv10, i16 noundef signext 10770)
  %8 = load i32, ptr @g_6, align 4
  %conv11 = sext i32 %8 to i64
  %cmp12 = icmp sle i64 %conv11, 0
  %conv13 = zext i1 %cmp12 to i32
  %call14 = call signext i16 @func_70(ptr noundef %6, i32 noundef %conv13)
  %9 = load ptr, ptr %l_200, align 8
  store i16 %call14, ptr %9, align 2
  %10 = load ptr, ptr %p_56.addr, align 8
  %11 = load i8, ptr %10, align 1
  %conv15 = sext i8 %11 to i32
  %12 = load i32, ptr %l_203, align 4
  %conv16 = trunc i32 %12 to i8
  %call17 = call signext i8 @safe_mul_func_int8_t_s_s(i8 noundef signext -35, i8 noundef signext %conv16)
  %conv18 = sext i8 %call17 to i32
  %cmp19 = icmp slt i32 %conv15, %conv18
  %conv20 = zext i1 %cmp19 to i32
  %13 = load i32, ptr %l_67, align 4
  %cmp21 = icmp ule i32 %conv20, %13
  %conv22 = zext i1 %cmp21 to i32
  %conv23 = sext i32 %conv22 to i64
  %cmp24 = icmp ule i64 %conv23, -1
  %conv25 = zext i1 %cmp24 to i32
  %14 = load ptr, ptr %p_56.addr, align 8
  %15 = load i8, ptr %14, align 1
  %conv26 = sext i8 %15 to i32
  %cmp27 = icmp slt i32 %conv25, %conv26
  %conv28 = zext i1 %cmp27 to i32
  %conv29 = sext i32 %conv28 to i64
  %or30 = or i64 %conv29, -1
  %conv31 = trunc i64 %or30 to i32
  %16 = load i32, ptr %l_67, align 4
  %call32 = call i32 @safe_add_func_int32_t_s_s(i32 noundef %conv31, i32 noundef %16)
  %conv33 = sext i32 %call32 to i64
  %cmp34 = icmp slt i64 %conv33, 62594
  %conv35 = zext i1 %cmp34 to i32
  %17 = load i32, ptr %l_204, align 4
  %and = and i32 %17, %conv35
  store i32 %and, ptr %l_204, align 4
  br label %if.end

if.else:                                          ; preds = %for.body5
  %18 = load ptr, ptr %p_56.addr, align 8
  %19 = load i8, ptr %18, align 1
  store i8 %19, ptr %retval, align 1
  br label %return

if.end:                                           ; preds = %if.then7
  store i8 -1, ptr %retval, align 1
  br label %return

for.inc:                                          ; No predecessors!
  %20 = load i32, ptr @g_61, align 4
  %conv36 = sext i32 %20 to i64
  %call37 = call i64 @safe_sub_func_int64_t_s_s(i64 noundef %conv36, i64 noundef 1)
  %conv38 = trunc i64 %call37 to i32
  store i32 %conv38, ptr @g_61, align 4
  br label %for.cond2, !llvm.loop !26

for.end:                                          ; preds = %for.cond2
  %21 = load i16, ptr @g_130, align 2
  %conv39 = trunc i16 %21 to i8
  store i8 %conv39, ptr %retval, align 1
  br label %return

for.inc40:                                        ; No predecessors!
  %22 = load i8, ptr @g_58, align 1
  %dec = add i8 %22, -1
  store i8 %dec, ptr @g_58, align 1
  br label %for.cond, !llvm.loop !27

for.end41:                                        ; preds = %for.cond
  %bf.load = load i8, ptr @g_139, align 8
  %bf.clear = and i8 %bf.load, 15
  %bf.cast = zext i8 %bf.clear to i32
  %conv42 = trunc i32 %bf.cast to i8
  store i8 %conv42, ptr %retval, align 1
  br label %return

if.else43:                                        ; preds = %entry
  %bf.load44 = load i8, ptr @g_40, align 8
  %bf.clear45 = and i8 %bf.load44, 15
  %bf.cast46 = zext i8 %bf.clear45 to i32
  %conv47 = trunc i32 %bf.cast46 to i8
  store i8 %conv47, ptr %retval, align 1
  br label %return

return:                                           ; preds = %if.else43, %for.end41, %for.end, %if.end, %if.else
  %23 = load i8, ptr %retval, align 1
  ret i8 %23
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @safe_div_func_int32_t_s_s(i32 noundef %si1, i32 noundef %si2) #0 {
entry:
  %si1.addr = alloca i32, align 4
  %si2.addr = alloca i32, align 4
  store i32 %si1, ptr %si1.addr, align 4
  store i32 %si2, ptr %si2.addr, align 4
  %0 = load i32, ptr %si2.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32, ptr %si1.addr, align 4
  %cmp1 = icmp eq i32 %1, -2147483648
  br i1 %cmp1, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %lor.lhs.false
  %2 = load i32, ptr %si2.addr, align 4
  %cmp2 = icmp eq i32 %2, -1
  br i1 %cmp2, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true, %entry
  %3 = load i32, ptr %si1.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %lor.lhs.false
  %4 = load i32, ptr %si1.addr, align 4
  %5 = load i32, ptr %si2.addr, align 4
  %div = sdiv i32 %4, %5
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %3, %cond.true ], [ %div, %cond.false ]
  ret i32 %cond
}

; Function Attrs: noinline nounwind optnone uwtable
define internal signext i16 @func_70(ptr noundef %p_71, i32 noundef %p_72) #0 {
entry:
  %retval = alloca i16, align 2
  %p_71.addr = alloca ptr, align 8
  %p_72.addr = alloca i32, align 4
  %l_78 = alloca [3 x ptr], align 16
  %l_138 = alloca ptr, align 8
  %l_178 = alloca %struct.S1, align 1
  %l_186 = alloca ptr, align 8
  %i = alloca i32, align 4
  %l_79 = alloca ptr, align 8
  %l_99 = alloca i64, align 8
  %l_129 = alloca i32, align 4
  %l_84 = alloca [8 x ptr], align 16
  %l_94 = alloca i32, align 4
  %l_95 = alloca ptr, align 8
  %l_96 = alloca [7 x [4 x ptr]], align 16
  %l_98 = alloca [5 x i32], align 16
  %l_100 = alloca i32, align 4
  %i6 = alloca i32, align 4
  %j = alloca i32, align 4
  %l_114 = alloca [2 x [8 x [3 x ptr]]], align 16
  %l_124 = alloca [3 x [3 x [7 x i32]]], align 16
  %l_162 = alloca ptr, align 8
  %l_185 = alloca i32, align 4
  %l_197 = alloca [8 x [4 x [8 x i8]]], align 16
  %i59 = alloca i32, align 4
  %j60 = alloca i32, align 4
  %k = alloca i32, align 4
  %l_123 = alloca %struct.S1, align 1
  %l_127 = alloca i32, align 4
  %l_142 = alloca %struct.S1, align 1
  %l_163 = alloca [3 x [10 x i64]], align 16
  %l_189 = alloca ptr, align 8
  %i65 = alloca i32, align 4
  %j66 = alloca i32, align 4
  store ptr %p_71, ptr %p_71.addr, align 8
  store i32 %p_72, ptr %p_72.addr, align 4
  store ptr @g_139, ptr %l_138, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %l_178, ptr align 1 @__const.func_70.l_178, i64 6, i1 false)
  store ptr @g_187, ptr %l_186, align 8
  store i32 0, ptr %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, ptr %i, align 4
  %cmp = icmp slt i32 %0, 3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32, ptr %i, align 4
  %idxprom = sext i32 %1 to i64
  %arrayidx = getelementptr inbounds [3 x ptr], ptr %l_78, i64 0, i64 %idxprom
  store ptr @g_6, ptr %arrayidx, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %2 = load i32, ptr %i, align 4
  %inc = add nsw i32 %2, 1
  store i32 %inc, ptr %i, align 4
  br label %for.cond, !llvm.loop !28

for.end:                                          ; preds = %for.cond
  store i32 5, ptr @g_66, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc70, %for.end
  %3 = load i32, ptr @g_66, align 4
  %cmp2 = icmp sgt i32 %3, -6
  br i1 %cmp2, label %for.body3, label %for.end74

for.body3:                                        ; preds = %for.cond1
  %arrayidx4 = getelementptr inbounds [3 x ptr], ptr %l_78, i64 0, i64 2
  store ptr %arrayidx4, ptr %l_79, align 8
  store i64 -7, ptr %l_99, align 8
  store i32 -530822332, ptr %l_129, align 4
  %arrayidx5 = getelementptr inbounds [3 x ptr], ptr %l_78, i64 0, i64 2
  %4 = load ptr, ptr %arrayidx5, align 16
  %5 = load ptr, ptr %l_79, align 8
  store ptr %4, ptr %5, align 8
  %6 = load i8, ptr @g_58, align 1
  %tobool = icmp ne i8 %6, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %for.body3
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %l_84, ptr align 16 @__const.func_70.l_84, i64 64, i1 false)
  store i32 7, ptr %l_94, align 4
  store ptr @g_40, ptr %l_95, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %l_96, ptr align 16 @__const.func_70.l_96, i64 224, i1 false)
  store i32 1, ptr %l_100, align 4
  store i32 0, ptr %i6, align 4
  br label %for.cond7

for.cond7:                                        ; preds = %for.inc12, %if.then
  %7 = load i32, ptr %i6, align 4
  %cmp8 = icmp slt i32 %7, 5
  br i1 %cmp8, label %for.body9, label %for.end14

for.body9:                                        ; preds = %for.cond7
  %8 = load i32, ptr %i6, align 4
  %idxprom10 = sext i32 %8 to i64
  %arrayidx11 = getelementptr inbounds [5 x i32], ptr %l_98, i64 0, i64 %idxprom10
  store i32 518177111, ptr %arrayidx11, align 4
  br label %for.inc12

for.inc12:                                        ; preds = %for.body9
  %9 = load i32, ptr %i6, align 4
  %inc13 = add nsw i32 %9, 1
  store i32 %inc13, ptr %i6, align 4
  br label %for.cond7, !llvm.loop !29

for.end14:                                        ; preds = %for.cond7
  store i64 -1, ptr @g_85, align 8
  %10 = load i32, ptr @g_86, align 4
  %conv = sext i32 %10 to i64
  %or = or i64 %conv, -1
  %conv15 = trunc i64 %or to i32
  store i32 %conv15, ptr @g_86, align 4
  %conv16 = sext i32 %conv15 to i64
  %11 = load ptr, ptr %p_71.addr, align 8
  %12 = load i8, ptr %11, align 1
  %conv17 = sext i8 %12 to i32
  %13 = load ptr, ptr %l_79, align 8
  %14 = load ptr, ptr %13, align 8
  %15 = load i32, ptr %14, align 4
  %16 = load i32, ptr %l_94, align 4
  %arrayidx18 = getelementptr inbounds [5 x i32], ptr %l_98, i64 0, i64 2
  %17 = load i32, ptr %arrayidx18, align 8
  %conv19 = sext i32 %17 to i64
  %xor = xor i64 %conv19, 0
  %conv20 = trunc i64 %xor to i32
  store i32 %conv20, ptr %arrayidx18, align 8
  %18 = load i32, ptr @g_66, align 4
  %cmp21 = icmp ne i32 %conv20, %18
  %conv22 = zext i1 %cmp21 to i32
  %cmp23 = icmp slt i32 %16, %conv22
  %conv24 = zext i1 %cmp23 to i32
  %19 = load i32, ptr @g_61, align 4
  %cmp25 = icmp ne i32 %conv24, %19
  %conv26 = zext i1 %cmp25 to i32
  %conv27 = sext i32 %conv26 to i64
  %cmp28 = icmp ult i64 1, %conv27
  %conv29 = zext i1 %cmp28 to i32
  %or30 = or i32 %15, %conv29
  %20 = load i32, ptr @g_6, align 4
  %21 = load i32, ptr @g_2, align 4
  %call = call i32 @safe_div_func_uint32_t_u_u(i32 noundef %20, i32 noundef %21)
  %bf.load = load i8, ptr @g_40, align 8
  %bf.clear = and i8 %bf.load, 15
  %bf.cast = zext i8 %bf.clear to i32
  %or31 = or i32 %call, %bf.cast
  %conv32 = zext i32 %or31 to i64
  %cmp33 = icmp ne i64 %conv32, 49219
  %conv34 = zext i1 %cmp33 to i32
  %conv35 = sext i32 %conv34 to i64
  %cmp36 = icmp slt i64 %conv35, 202
  %conv37 = zext i1 %cmp36 to i32
  %conv38 = trunc i32 %conv37 to i16
  %22 = load i8, ptr getelementptr inbounds ([7 x i8], ptr getelementptr inbounds ([3 x [7 x i8]], ptr getelementptr inbounds ([4 x [3 x [7 x i8]]], ptr @g_97, i64 0, i64 3), i64 0, i64 2), i64 0, i64 2), align 1
  %conv39 = zext i8 %22 to i16
  %call40 = call zeroext i16 @safe_sub_func_uint16_t_u_u(i16 noundef zeroext %conv38, i16 noundef zeroext %conv39)
  %conv41 = zext i16 %call40 to i32
  %cmp42 = icmp slt i32 %conv17, %conv41
  %conv43 = zext i1 %cmp42 to i32
  %conv44 = trunc i32 %conv43 to i8
  %call45 = call zeroext i8 @safe_unary_minus_func_uint8_t_u(i8 noundef zeroext %conv44)
  %conv46 = zext i8 %call45 to i64
  %23 = load i32, ptr @g_66, align 4
  %conv47 = sext i32 %23 to i64
  %call48 = call i64 @safe_add_func_uint64_t_u_u(i64 noundef %conv46, i64 noundef %conv47)
  %cmp49 = icmp uge i64 %call48, 3
  br i1 %cmp49, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %for.end14
  %24 = load i64, ptr %l_99, align 8
  %tobool51 = icmp ne i64 %24, 0
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %for.end14
  %25 = phi i1 [ true, %for.end14 ], [ %tobool51, %lor.rhs ]
  %lor.ext = zext i1 %25 to i32
  %conv52 = sext i32 %lor.ext to i64
  %call53 = call i64 @safe_add_func_uint64_t_u_u(i64 noundef %conv16, i64 noundef %conv52)
  %26 = load ptr, ptr %l_79, align 8
  %27 = load ptr, ptr %26, align 8
  %28 = load i32, ptr %27, align 4
  %conv54 = sext i32 %28 to i64
  %xor55 = xor i64 -1, %conv54
  %tobool56 = icmp ne i64 %xor55, 0
  br i1 %tobool56, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %lor.end
  br label %land.end

land.end:                                         ; preds = %land.rhs, %lor.end
  %29 = phi i1 [ false, %lor.end ], [ true, %land.rhs ]
  %land.ext = zext i1 %29 to i32
  %call57 = call i32 @safe_mod_func_int32_t_s_s(i32 noundef %land.ext, i32 noundef -1001263674)
  %30 = load i32, ptr %l_100, align 4
  %xor58 = xor i32 %30, %call57
  store i32 %xor58, ptr %l_100, align 4
  br label %if.end

if.else:                                          ; preds = %for.body3
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %l_114, ptr align 16 @__const.func_70.l_114, i64 384, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %l_124, ptr align 16 @__const.func_70.l_124, i64 252, i1 false)
  store ptr @g_160, ptr %l_162, align 8
  store i32 -726972110, ptr %l_185, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %l_197, ptr align 16 @__const.func_70.l_197, i64 256, i1 false)
  store i32 0, ptr %p_72.addr, align 4
  br label %for.cond61

for.cond61:                                       ; preds = %for.inc67, %if.else
  %31 = load i32, ptr %p_72.addr, align 4
  %cmp62 = icmp ule i32 %31, 2
  br i1 %cmp62, label %for.body64, label %for.end68

for.body64:                                       ; preds = %for.cond61
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %l_123, ptr align 1 @__const.func_70.l_123, i64 6, i1 false)
  store i32 -5, ptr %l_127, align 4
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %l_142, ptr align 1 @__const.func_70.l_142, i64 6, i1 false)
  call void @llvm.memcpy.p0.p0.i64(ptr align 16 %l_163, ptr align 16 @__const.func_70.l_163, i64 240, i1 false)
  store ptr null, ptr %l_189, align 8
  br label %for.inc67

for.inc67:                                        ; preds = %for.body64
  %32 = load i32, ptr %p_72.addr, align 4
  %add = add i32 %32, 1
  store i32 %add, ptr %p_72.addr, align 4
  br label %for.cond61, !llvm.loop !30

for.end68:                                        ; preds = %for.cond61
  %33 = load i32, ptr %p_72.addr, align 4
  %conv69 = trunc i32 %33 to i16
  store i16 %conv69, ptr %retval, align 2
  br label %return

if.end:                                           ; preds = %land.end
  br label %for.inc70

for.inc70:                                        ; preds = %if.end
  %34 = load i32, ptr @g_66, align 4
  %conv71 = sext i32 %34 to i64
  %call72 = call i64 @safe_sub_func_int64_t_s_s(i64 noundef %conv71, i64 noundef 3)
  %conv73 = trunc i64 %call72 to i32
  store i32 %conv73, ptr @g_66, align 4
  br label %for.cond1, !llvm.loop !31

for.end74:                                        ; preds = %for.cond1
  %35 = load i8, ptr getelementptr inbounds ([7 x i8], ptr getelementptr inbounds ([3 x [7 x i8]], ptr getelementptr inbounds ([4 x [3 x [7 x i8]]], ptr @g_97, i64 0, i64 3), i64 0, i64 2), i64 0, i64 2), align 1
  %conv75 = zext i8 %35 to i16
  store i16 %conv75, ptr %retval, align 2
  br label %return

return:                                           ; preds = %for.end74, %for.end68
  %36 = load i16, ptr %retval, align 2
  ret i16 %36
}

; Function Attrs: noinline nounwind optnone uwtable
define internal signext i16 @safe_mod_func_int16_t_s_s(i16 noundef signext %si1, i16 noundef signext %si2) #0 {
entry:
  %si1.addr = alloca i16, align 2
  %si2.addr = alloca i16, align 2
  store i16 %si1, ptr %si1.addr, align 2
  store i16 %si2, ptr %si2.addr, align 2
  %0 = load i16, ptr %si2.addr, align 2
  %conv = sext i16 %0 to i32
  %cmp = icmp eq i32 %conv, 0
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i16, ptr %si1.addr, align 2
  %conv2 = sext i16 %1 to i32
  %cmp3 = icmp eq i32 %conv2, -32768
  br i1 %cmp3, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %lor.lhs.false
  %2 = load i16, ptr %si2.addr, align 2
  %conv5 = sext i16 %2 to i32
  %cmp6 = icmp eq i32 %conv5, -1
  br i1 %cmp6, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true, %entry
  %3 = load i16, ptr %si1.addr, align 2
  %conv8 = sext i16 %3 to i32
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %lor.lhs.false
  %4 = load i16, ptr %si1.addr, align 2
  %conv9 = sext i16 %4 to i32
  %5 = load i16, ptr %si2.addr, align 2
  %conv10 = sext i16 %5 to i32
  %rem = srem i32 %conv9, %conv10
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %conv8, %cond.true ], [ %rem, %cond.false ]
  %conv11 = trunc i32 %cond to i16
  ret i16 %conv11
}

; Function Attrs: noinline nounwind optnone uwtable
define internal signext i8 @safe_mul_func_int8_t_s_s(i8 noundef signext %si1, i8 noundef signext %si2) #0 {
entry:
  %si1.addr = alloca i8, align 1
  %si2.addr = alloca i8, align 1
  store i8 %si1, ptr %si1.addr, align 1
  store i8 %si2, ptr %si2.addr, align 1
  %0 = load i8, ptr %si1.addr, align 1
  %conv = sext i8 %0 to i32
  %1 = load i8, ptr %si2.addr, align 1
  %conv1 = sext i8 %1 to i32
  %mul = mul nsw i32 %conv, %conv1
  %conv2 = trunc i32 %mul to i8
  ret i8 %conv2
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i64 @safe_sub_func_int64_t_s_s(i64 noundef %si1, i64 noundef %si2) #0 {
entry:
  %si1.addr = alloca i64, align 8
  %si2.addr = alloca i64, align 8
  store i64 %si1, ptr %si1.addr, align 8
  store i64 %si2, ptr %si2.addr, align 8
  %0 = load i64, ptr %si1.addr, align 8
  %1 = load i64, ptr %si2.addr, align 8
  %xor = xor i64 %0, %1
  %2 = load i64, ptr %si1.addr, align 8
  %3 = load i64, ptr %si1.addr, align 8
  %4 = load i64, ptr %si2.addr, align 8
  %xor1 = xor i64 %3, %4
  %and = and i64 %xor1, -9223372036854775808
  %xor2 = xor i64 %2, %and
  %5 = load i64, ptr %si2.addr, align 8
  %sub = sub nsw i64 %xor2, %5
  %6 = load i64, ptr %si2.addr, align 8
  %xor3 = xor i64 %sub, %6
  %and4 = and i64 %xor, %xor3
  %cmp = icmp slt i64 %and4, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %7 = load i64, ptr %si1.addr, align 8
  br label %cond.end

cond.false:                                       ; preds = %entry
  %8 = load i64, ptr %si1.addr, align 8
  %9 = load i64, ptr %si2.addr, align 8
  %sub5 = sub nsw i64 %8, %9
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %7, %cond.true ], [ %sub5, %cond.false ]
  ret i64 %cond
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @safe_mod_func_int32_t_s_s(i32 noundef %si1, i32 noundef %si2) #0 {
entry:
  %si1.addr = alloca i32, align 4
  %si2.addr = alloca i32, align 4
  store i32 %si1, ptr %si1.addr, align 4
  store i32 %si2, ptr %si2.addr, align 4
  %0 = load i32, ptr %si2.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %cond.true, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32, ptr %si1.addr, align 4
  %cmp1 = icmp eq i32 %1, -2147483648
  br i1 %cmp1, label %land.lhs.true, label %cond.false

land.lhs.true:                                    ; preds = %lor.lhs.false
  %2 = load i32, ptr %si2.addr, align 4
  %cmp2 = icmp eq i32 %2, -1
  br i1 %cmp2, label %cond.true, label %cond.false

cond.true:                                        ; preds = %land.lhs.true, %entry
  %3 = load i32, ptr %si1.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %land.lhs.true, %lor.lhs.false
  %4 = load i32, ptr %si1.addr, align 4
  %5 = load i32, ptr %si2.addr, align 4
  %rem = srem i32 %4, %5
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %3, %cond.true ], [ %rem, %cond.false ]
  ret i32 %cond
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i64 @safe_add_func_uint64_t_u_u(i64 noundef %ui1, i64 noundef %ui2) #0 {
entry:
  %ui1.addr = alloca i64, align 8
  %ui2.addr = alloca i64, align 8
  store i64 %ui1, ptr %ui1.addr, align 8
  store i64 %ui2, ptr %ui2.addr, align 8
  %0 = load i64, ptr %ui1.addr, align 8
  %1 = load i64, ptr %ui2.addr, align 8
  %add = add i64 %0, %1
  ret i64 %add
}

; Function Attrs: noinline nounwind optnone uwtable
define internal zeroext i8 @safe_unary_minus_func_uint8_t_u(i8 noundef zeroext %ui) #0 {
entry:
  %ui.addr = alloca i8, align 1
  store i8 %ui, ptr %ui.addr, align 1
  %0 = load i8, ptr %ui.addr, align 1
  %conv = zext i8 %0 to i32
  %sub = sub nsw i32 0, %conv
  %conv1 = trunc i32 %sub to i8
  ret i8 %conv1
}

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @safe_div_func_uint32_t_u_u(i32 noundef %ui1, i32 noundef %ui2) #0 {
entry:
  %ui1.addr = alloca i32, align 4
  %ui2.addr = alloca i32, align 4
  store i32 %ui1, ptr %ui1.addr, align 4
  store i32 %ui2, ptr %ui2.addr, align 4
  %0 = load i32, ptr %ui2.addr, align 4
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load i32, ptr %ui1.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %entry
  %2 = load i32, ptr %ui1.addr, align 4
  %3 = load i32, ptr %ui2.addr, align 4
  %div = udiv i32 %2, %3
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %1, %cond.true ], [ %div, %cond.false ]
  ret i32 %cond
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @crc32_8bytes(i64 noundef %val) #0 {
entry:
  %val.addr = alloca i64, align 8
  store i64 %val, ptr %val.addr, align 8
  %0 = load i64, ptr %val.addr, align 8
  %shr = lshr i64 %0, 0
  %and = and i64 %shr, 255
  %conv = trunc i64 %and to i8
  call void @crc32_byte(i8 noundef zeroext %conv)
  %1 = load i64, ptr %val.addr, align 8
  %shr1 = lshr i64 %1, 8
  %and2 = and i64 %shr1, 255
  %conv3 = trunc i64 %and2 to i8
  call void @crc32_byte(i8 noundef zeroext %conv3)
  %2 = load i64, ptr %val.addr, align 8
  %shr4 = lshr i64 %2, 16
  %and5 = and i64 %shr4, 255
  %conv6 = trunc i64 %and5 to i8
  call void @crc32_byte(i8 noundef zeroext %conv6)
  %3 = load i64, ptr %val.addr, align 8
  %shr7 = lshr i64 %3, 24
  %and8 = and i64 %shr7, 255
  %conv9 = trunc i64 %and8 to i8
  call void @crc32_byte(i8 noundef zeroext %conv9)
  %4 = load i64, ptr %val.addr, align 8
  %shr10 = lshr i64 %4, 32
  %and11 = and i64 %shr10, 255
  %conv12 = trunc i64 %and11 to i8
  call void @crc32_byte(i8 noundef zeroext %conv12)
  %5 = load i64, ptr %val.addr, align 8
  %shr13 = lshr i64 %5, 40
  %and14 = and i64 %shr13, 255
  %conv15 = trunc i64 %and14 to i8
  call void @crc32_byte(i8 noundef zeroext %conv15)
  %6 = load i64, ptr %val.addr, align 8
  %shr16 = lshr i64 %6, 48
  %and17 = and i64 %shr16, 255
  %conv18 = trunc i64 %and17 to i8
  call void @crc32_byte(i8 noundef zeroext %conv18)
  %7 = load i64, ptr %val.addr, align 8
  %shr19 = lshr i64 %7, 56
  %and20 = and i64 %shr19, 255
  %conv21 = trunc i64 %and20 to i8
  call void @crc32_byte(i8 noundef zeroext %conv21)
  ret void
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @crc32_byte(i8 noundef zeroext %b) #0 {
entry:
  %b.addr = alloca i8, align 1
  store i8 %b, ptr %b.addr, align 1
  %0 = load i32, ptr @crc32_context, align 4
  %shr = lshr i32 %0, 8
  %and = and i32 %shr, 16777215
  %1 = load i32, ptr @crc32_context, align 4
  %2 = load i8, ptr %b.addr, align 1
  %conv = zext i8 %2 to i32
  %xor = xor i32 %1, %conv
  %and1 = and i32 %xor, 255
  %idxprom = zext i32 %and1 to i64
  %arrayidx = getelementptr inbounds [256 x i32], ptr @crc32_tab, i64 0, i64 %idxprom
  %3 = load i32, ptr %arrayidx, align 4
  %xor2 = xor i32 %and, %3
  store i32 %xor2, ptr @crc32_context, align 4
  ret void
}

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #4 = { nounwind willreturn memory(read) }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"clang version 19.1.7 (git@github.com:webmiche/llvm-project.git cd708029e0b2869e80abe31ddb175f7c35361f90)"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
!14 = distinct !{!14, !7}
!15 = distinct !{!15, !7}
!16 = distinct !{!16, !7}
!17 = distinct !{!17, !7}
!18 = distinct !{!18, !7}
!19 = distinct !{!19, !7}
!20 = distinct !{!20, !7}
!21 = distinct !{!21, !7}
!22 = distinct !{!22, !7}
!23 = distinct !{!23, !7}
!24 = distinct !{!24, !7}
!25 = distinct !{!25, !7}
!26 = distinct !{!26, !7}
!27 = distinct !{!27, !7}
!28 = distinct !{!28, !7}
!29 = distinct !{!29, !7}
!30 = distinct !{!30, !7}
!31 = distinct !{!31, !7}
