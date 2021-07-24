	.file "ex_01sum.pas"
# Begin asmlist al_begin

.section .debug_line
	.type	.Ldebug_linesection0,@object
.Ldebug_linesection0:
	.type	.Ldebug_line0,@object
.Ldebug_line0:

.section .debug_abbrev
	.type	.Ldebug_abbrevsection0,@object
.Ldebug_abbrevsection0:
	.type	.Ldebug_abbrev0,@object
.Ldebug_abbrev0:

.section .text.b_DEBUGSTART_$P$EXAMPLE01
.globl	DEBUGSTART_$P$EXAMPLE01
	.type	DEBUGSTART_$P$EXAMPLE01,@object
DEBUGSTART_$P$EXAMPLE01:
# End asmlist al_begin
# Begin asmlist al_procedures

.section .text.n_main
	.balign 16,0x90
.globl	PASCALMAIN
	.type	PASCALMAIN,@function
PASCALMAIN:
.globl	main
	.type	main,@function
main:
.Lc1:
# Temps allocated between rbp-8 and rbp+0
	# Register rbp allocated
.Ll1:
# [ex_01sum.pas]
# [4] begin
	pushq	%rbp
.Lc3:
.Lc4:
	movq	%rsp,%rbp
.Lc5:
	leaq	-16(%rsp),%rsp
# Temp -8,8 allocated
	movq	%rbx,-8(%rbp)
	call	mcount
	# Register rax,rcx,rdx,rsi,rdi,r8,r9,r10,r11 allocated
	call	FPC_INITIALIZEUNITS
	# Register rax,rcx,rdx,rsi,rdi,r8,r9,r10,r11 released
.Ll2:
# [5] sum1:=0;sum2:=0;
	movq	$0,U_$P$EXAMPLE01_$$_SUM1
	movq	$0,U_$P$EXAMPLE01_$$_SUM2
.Ll3:
# [6] for i:=1 to 10 do
	movq	$1,U_$P$EXAMPLE01_$$_I
	subq	$1,U_$P$EXAMPLE01_$$_I
.Lj9:
	addq	$1,U_$P$EXAMPLE01_$$_I
	# Register rdx allocated
.Ll4:
# [8] sum1:=sum1+i;
	movq	U_$P$EXAMPLE01_$$_SUM1,%rdx
	# Register rax allocated
	movq	U_$P$EXAMPLE01_$$_I,%rax
	# Register rdx released
	addq	%rdx,%rax
	jno	.Lj12
	call	FPC_OVERFLOW
.Lj12:
	# Register rax released
	movq	%rax,U_$P$EXAMPLE01_$$_SUM1
	# Register rdx allocated
.Ll5:
# [9] sum2:=sum2+i+10;
	movq	U_$P$EXAMPLE01_$$_SUM2,%rdx
	# Register rax allocated
	movq	U_$P$EXAMPLE01_$$_I,%rax
	# Register rdx released
	addq	%rdx,%rax
	jno	.Lj15
	call	FPC_OVERFLOW
.Lj15:
	addq	$10,%rax
	jno	.Lj16
	call	FPC_OVERFLOW
.Lj16:
	# Register rax released
	movq	%rax,U_$P$EXAMPLE01_$$_SUM2
.Ll6:
	cmpq	$10,U_$P$EXAMPLE01_$$_I
	jl	.Lj9
	# Register rax,rcx,rdx,rsi,rdi,r8,r9,r10,r11 allocated
.Ll7:
# [11] WriteLn('sum1=',sum1);
	call	fpc_get_output
	# Register rcx,rdx,rsi,rdi,r8,r9,r10,r11,rax released
	# Register rbx allocated
	movq	%rax,%rbx
	# Register rdx allocated
	movq	$_$EXAMPLE01$_Ld1,%rdx
	# Register rsi allocated
	movq	%rbx,%rsi
	# Register edi allocated
	movl	$0,%edi
	# Register edi,rsi,rdx released
	# Register rax,rcx,rdx,rsi,rdi,r8,r9,r10,r11 allocated
	call	fpc_write_text_shortstr
	# Register rax,rcx,rdx,rsi,rdi,r8,r9,r10,r11 released
	# Register rax,rcx,rdx,rsi,rdi,r8,r9,r10,r11 allocated
	call	FPC_IOCHECK
	# Register rax,rcx,rdx,rsi,rdi,r8,r9,r10,r11 released
	# Register rdx allocated
	movq	U_$P$EXAMPLE01_$$_SUM1,%rdx
	# Register rsi allocated
	movq	%rbx,%rsi
	# Register edi allocated
	movl	$0,%edi
	# Register edi,rsi,rdx released
	# Register rax,rcx,rdx,rsi,rdi,r8,r9,r10,r11 allocated
	call	fpc_write_text_sint
	# Register rax,rcx,rdx,rsi,rdi,r8,r9,r10,r11 released
	# Register rax,rcx,rdx,rsi,rdi,r8,r9,r10,r11 allocated
	call	FPC_IOCHECK
	# Register rax,rcx,rdx,rsi,rdi,r8,r9,r10,r11 released
	# Register rdi allocated
	movq	%rbx,%rdi
	# Register rdi released
	# Register rax,rcx,rdx,rsi,rdi,r8,r9,r10,r11 allocated
	call	fpc_writeln_end
	# Register rax,rcx,rdx,rsi,rdi,r8,r9,r10,r11 released
	# Register rax,rcx,rdx,rsi,rdi,r8,r9,r10,r11 allocated
	call	FPC_IOCHECK
	# Register rax,rcx,rdx,rsi,rdi,r8,r9,r10,r11,rbx released
	# Register rax,rcx,rdx,rsi,rdi,r8,r9,r10,r11 allocated
.Ll8:
# [12] WriteLn('sum2=',sum2);
	call	fpc_get_output
	# Register rcx,rdx,rsi,rdi,r8,r9,r10,r11,rax released
	# Register rbx allocated
	movq	%rax,%rbx
	# Register rdx allocated
	movq	$_$EXAMPLE01$_Ld2,%rdx
	# Register rsi allocated
	movq	%rbx,%rsi
	# Register edi allocated
	movl	$0,%edi
	# Register edi,rsi,rdx released
	# Register rax,rcx,rdx,rsi,rdi,r8,r9,r10,r11 allocated
	call	fpc_write_text_shortstr
	# Register rax,rcx,rdx,rsi,rdi,r8,r9,r10,r11 released
	# Register rax,rcx,rdx,rsi,rdi,r8,r9,r10,r11 allocated
	call	FPC_IOCHECK
	# Register rax,rcx,rdx,rsi,rdi,r8,r9,r10,r11 released
	# Register rdx allocated
	movq	U_$P$EXAMPLE01_$$_SUM2,%rdx
	# Register rsi allocated
	movq	%rbx,%rsi
	# Register edi allocated
	movl	$0,%edi
	# Register edi,rsi,rdx released
	# Register rax,rcx,rdx,rsi,rdi,r8,r9,r10,r11 allocated
	call	fpc_write_text_sint
	# Register rax,rcx,rdx,rsi,rdi,r8,r9,r10,r11 released
	# Register rax,rcx,rdx,rsi,rdi,r8,r9,r10,r11 allocated
	call	FPC_IOCHECK
	# Register rax,rcx,rdx,rsi,rdi,r8,r9,r10,r11 released
	# Register rdi allocated
	movq	%rbx,%rdi
	# Register rdi released
	# Register rax,rcx,rdx,rsi,rdi,r8,r9,r10,r11 allocated
	call	fpc_writeln_end
	# Register rax,rcx,rdx,rsi,rdi,r8,r9,r10,r11 released
	# Register rax,rcx,rdx,rsi,rdi,r8,r9,r10,r11 allocated
	call	FPC_IOCHECK
	# Register rax,rcx,rdx,rsi,rdi,r8,r9,r10,r11,rbx released
.Ll9:
# [13] end.
	call	FPC_DO_EXIT
	# Register rbx allocated
	movq	-8(%rbp),%rbx
# Temp -8,8 released
	leave
	# Register rbp released
	ret
.Lc2:
.Lt1:
.Le0:
	.size	main, .Le0 - main
.Ll10:

.section .text

.section .fpc.n_links
	.quad	DEBUGSTART_$P$EXAMPLE01
	.quad	DEBUGEND_$P$EXAMPLE01
# End asmlist al_procedures
# Begin asmlist al_globals

.section .bss
	.balign 8
# [3] sum1,sum2,i:int64;
	.type U_$P$EXAMPLE01_$$_SUM1,@object
	.size U_$P$EXAMPLE01_$$_SUM1,8
U_$P$EXAMPLE01_$$_SUM1:
	.zero 8

.section .bss
	.balign 8
	.type U_$P$EXAMPLE01_$$_SUM2,@object
	.size U_$P$EXAMPLE01_$$_SUM2,8
U_$P$EXAMPLE01_$$_SUM2:
	.zero 8

.section .bss
	.balign 8
	.type U_$P$EXAMPLE01_$$_I,@object
	.size U_$P$EXAMPLE01_$$_I,8
U_$P$EXAMPLE01_$$_I:
	.zero 8

.section .data.n_INITFINAL
	.balign 8
.globl	INITFINAL
	.type	INITFINAL,@object
INITFINAL:
	.quad	1,0
	.quad	INIT$_$SYSTEM
	.quad	0
# [14] 
.Le1:
	.size	INITFINAL, .Le1 - INITFINAL

.section .data.n_FPC_THREADVARTABLES
	.balign 8
.globl	FPC_THREADVARTABLES
	.type	FPC_THREADVARTABLES,@object
FPC_THREADVARTABLES:
	.long	1
	.quad	THREADVARLIST_$SYSTEM
.Le2:
	.size	FPC_THREADVARTABLES, .Le2 - FPC_THREADVARTABLES

.section .data.n_FPC_RESOURCESTRINGTABLES
	.balign 8
.globl	FPC_RESOURCESTRINGTABLES
	.type	FPC_RESOURCESTRINGTABLES,@object
FPC_RESOURCESTRINGTABLES:
	.quad	0
.Le3:
	.size	FPC_RESOURCESTRINGTABLES, .Le3 - FPC_RESOURCESTRINGTABLES

.section .data.n_FPC_WIDEINITTABLES
	.balign 8
.globl	FPC_WIDEINITTABLES
	.type	FPC_WIDEINITTABLES,@object
FPC_WIDEINITTABLES:
	.quad	0
.Le4:
	.size	FPC_WIDEINITTABLES, .Le4 - FPC_WIDEINITTABLES

.section .data.n_FPC_RESSTRINITTABLES
	.balign 8
.globl	FPC_RESSTRINITTABLES
	.type	FPC_RESSTRINITTABLES,@object
FPC_RESSTRINITTABLES:
	.quad	0
.Le5:
	.size	FPC_RESSTRINITTABLES, .Le5 - FPC_RESSTRINITTABLES

.section .fpc.n_version
	.balign 8
	.ascii	"FPC 3.0.0 [2015/11/20] for x86_64 - Linux"

.section .data.n___stklen
	.balign 8
.globl	__stklen
	.type	__stklen,@object
__stklen:
	.quad	8388608

.section .data.n___heapsize
	.balign 8
.globl	__heapsize
	.type	__heapsize,@object
__heapsize:
	.quad	0

.section .data.n___fpc_valgrind
.globl	__fpc_valgrind
	.type	__fpc_valgrind,@object
__fpc_valgrind:
	.byte	0

.section .data.n_FPC_RESLOCATION
	.balign 8
.globl	FPC_RESLOCATION
	.type	FPC_RESLOCATION,@object
FPC_RESLOCATION:
	.quad	0
# End asmlist al_globals
# Begin asmlist al_typedconsts

.section .rodata.n__$EXAMPLE01$_Ld1
	.balign 8
.globl	_$EXAMPLE01$_Ld1
_$EXAMPLE01$_Ld1:
	.ascii	"\005sum1=\000"

.section .rodata.n__$EXAMPLE01$_Ld2
	.balign 8
.globl	_$EXAMPLE01$_Ld2
_$EXAMPLE01$_Ld2:
	.ascii	"\005sum2=\000"
# End asmlist al_typedconsts
# Begin asmlist al_dwarf_frame

.section .debug_frame
.Lc6:
	.long	.Lc8-.Lc7
.Lc7:
	.long	-1
	.byte	1
	.byte	0
	.uleb128	1
	.sleb128	-4
	.byte	16
	.byte	12
	.uleb128	7
	.uleb128	8
	.byte	5
	.uleb128	16
	.uleb128	2
	.balign 4,0
.Lc8:
	.long	.Lc10-.Lc9
.Lc9:
	.quad	.Lc6
	.quad	.Lc1
	.quad	.Lc2-.Lc1
	.byte	4
	.long	.Lc3-.Lc1
	.byte	14
	.uleb128	16
	.byte	4
	.long	.Lc4-.Lc3
	.byte	5
	.uleb128	6
	.uleb128	4
	.byte	4
	.long	.Lc5-.Lc4
	.byte	13
	.uleb128	6
	.balign 4,0
.Lc10:
# End asmlist al_dwarf_frame
# Begin asmlist al_dwarf_info

.section .debug_info
	.type	.Ldebug_info0,@object
.Ldebug_info0:
	.long	.Ledebug_info0-.Lf1
.Lf1:
	.short	2
	.long	.Ldebug_abbrev0
	.byte	8
	.uleb128	1
	.ascii	"ex_01sum.pas\000"
	.ascii	"Free Pascal 3.0.0 2015/11/20\000"
	.ascii	"/home/mymotif/prg/mypas/\000"
	.byte	9
	.byte	3
	.long	.Ldebug_line0
	.quad	DEBUGSTART_$P$EXAMPLE01
	.quad	DEBUGEND_$P$EXAMPLE01
# Syms - Begin Staticsymtable
# Symbol SYSTEM
# Symbol FPINTRES
# Symbol EXAMPLE01
# Symbol main
# Symbol SUM1
	.uleb128	2
	.ascii	"SUM1\000"
	.byte	9
	.byte	3
	.quad	U_$P$EXAMPLE01_$$_SUM1
	.quad	_$EXAMPLE01$_Ld3
# Symbol SUM2
	.uleb128	2
	.ascii	"SUM2\000"
	.byte	9
	.byte	3
	.quad	U_$P$EXAMPLE01_$$_SUM2
	.quad	_$EXAMPLE01$_Ld3
# Symbol I
	.uleb128	2
	.ascii	"I\000"
	.byte	9
	.byte	3
	.quad	U_$P$EXAMPLE01_$$_I
	.quad	_$EXAMPLE01$_Ld3
# Syms - End Staticsymtable
# Procdef $main; Register;
	.uleb128	3
	.ascii	"main\000"
	.byte	1
	.byte	65
	.byte	1
	.quad	main
	.quad	.Lt1
	.byte	0
# Defs - Begin unit SYSTEM has index 1
# Definition Int64
.globl	_$EXAMPLE01$_Ld3
	.type	_$EXAMPLE01$_Ld3,@object
_$EXAMPLE01$_Ld3:
	.uleb128	4
	.ascii	"INT64\000"
	.quad	.La1
	.type	.La1,@object
.La1:
	.uleb128	5
	.ascii	"Int64\000"
	.byte	5
	.byte	8
.globl	_$EXAMPLE01$_Ld4
	.type	_$EXAMPLE01$_Ld4,@object
_$EXAMPLE01$_Ld4:
	.uleb128	6
	.quad	_$EXAMPLE01$_Ld3
# Defs - End unit SYSTEM has index 1
# Defs - Begin unit FPINTRES has index 2
# Defs - End unit FPINTRES has index 2
# Defs - Begin Staticsymtable
# Defs - End Staticsymtable
	.byte	0
	.type	.Ledebug_info0,@object
.Ledebug_info0:
# End asmlist al_dwarf_info
# Begin asmlist al_dwarf_abbrev

.section .debug_abbrev
# Abbrev 1
	.uleb128	1
	.uleb128	17
	.byte	1
	.uleb128	3
	.uleb128	8
	.uleb128	37
	.uleb128	8
	.uleb128	27
	.uleb128	8
	.uleb128	19
	.uleb128	11
	.uleb128	66
	.uleb128	11
	.uleb128	16
	.uleb128	6
	.uleb128	17
	.uleb128	1
	.uleb128	18
	.uleb128	1
	.byte	0
	.byte	0
# Abbrev 2
	.uleb128	2
	.uleb128	52
	.byte	0
	.uleb128	3
	.uleb128	8
	.uleb128	2
	.uleb128	10
	.uleb128	73
	.uleb128	16
	.byte	0
	.byte	0
# Abbrev 3
	.uleb128	3
	.uleb128	46
	.byte	1
	.uleb128	3
	.uleb128	8
	.uleb128	39
	.uleb128	12
	.uleb128	54
	.uleb128	11
	.uleb128	63
	.uleb128	12
	.uleb128	17
	.uleb128	1
	.uleb128	18
	.uleb128	1
	.byte	0
	.byte	0
# Abbrev 4
	.uleb128	4
	.uleb128	22
	.byte	0
	.uleb128	3
	.uleb128	8
	.uleb128	73
	.uleb128	16
	.byte	0
	.byte	0
# Abbrev 5
	.uleb128	5
	.uleb128	36
	.byte	0
	.uleb128	3
	.uleb128	8
	.uleb128	62
	.uleb128	11
	.uleb128	11
	.uleb128	11
	.byte	0
	.byte	0
# Abbrev 6
	.uleb128	6
	.uleb128	16
	.byte	0
	.uleb128	73
	.uleb128	16
	.byte	0
	.byte	0
	.byte	0
# End asmlist al_dwarf_abbrev
# Begin asmlist al_dwarf_line

.section .debug_line
# === header start ===
	.long	.Ledebug_line0-.Lf2
.Lf2:
	.short	2
	.long	.Lehdebug_line0-.Lf3
.Lf3:
	.byte	1
	.byte	1
	.byte	1
	.byte	255
	.byte	13
	.byte	0
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	0
	.byte	0
	.byte	0
	.byte	1
	.byte	0
	.byte	0
	.byte	1
# include_directories
	.byte	0
# file_names
	.ascii	"ex_01sum.pas\000"
	.uleb128	0
	.uleb128	0
	.uleb128	0
	.byte	0
	.type	.Lehdebug_line0,@object
.Lehdebug_line0:
# === header end ===
# function: PASCALMAIN
# function: main
# [4:1]
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll1
	.byte	5
	.uleb128	1
	.byte	15
# [5:2]
	.byte	2
	.uleb128	.Ll2-.Ll1
	.byte	5
	.uleb128	2
	.byte	13
# [6:2]
	.byte	2
	.uleb128	.Ll3-.Ll2
	.byte	13
# [8:13]
	.byte	2
	.uleb128	.Ll4-.Ll3
	.byte	5
	.uleb128	13
	.byte	14
# [9:13]
	.byte	2
	.uleb128	.Ll5-.Ll4
	.byte	13
# [6:2]
	.byte	2
	.uleb128	.Ll6-.Ll5
	.byte	5
	.uleb128	2
	.byte	3
	.sleb128	-3
	.byte	1
# [11:2]
	.byte	2
	.uleb128	.Ll7-.Ll6
	.byte	17
# [12:2]
	.byte	2
	.uleb128	.Ll8-.Ll7
	.byte	13
# [13:1]
	.byte	2
	.uleb128	.Ll9-.Ll8
	.byte	5
	.uleb128	1
	.byte	13
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll10
	.byte	0
	.byte	1
	.byte	1
# ###################
	.type	.Ledebug_line0,@object
.Ledebug_line0:
# End asmlist al_dwarf_line
# Begin asmlist al_end

.section .text.z_DEBUGEND_$P$EXAMPLE01
.globl	DEBUGEND_$P$EXAMPLE01
	.type	DEBUGEND_$P$EXAMPLE01,@object
DEBUGEND_$P$EXAMPLE01:
# End asmlist al_end
.section .note.GNU-stack,"",%progbits

