	.file "hello1.pas"
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

.section .text.b_DEBUGSTART_$P$HELLO
.globl	DEBUGSTART_$P$HELLO
	.type	DEBUGSTART_$P$HELLO,@object
DEBUGSTART_$P$HELLO:
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
# [hello1.pas]
# [2] begin
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
	# Register rax,rcx,rdx,rsi,rdi,r8,r9,r10,r11 allocated
.Ll2:
# [3] writeln ('Hello, World.')
	call	fpc_get_output
	# Register rcx,rdx,rsi,rdi,r8,r9,r10,r11,rax released
	# Register rbx allocated
	movq	%rax,%rbx
	# Register rdx allocated
	movq	$_$HELLO$_Ld1,%rdx
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
	# Register rdi allocated
	movq	%rbx,%rdi
	# Register rdi released
	# Register rax,rcx,rdx,rsi,rdi,r8,r9,r10,r11 allocated
	call	fpc_writeln_end
	# Register rax,rcx,rdx,rsi,rdi,r8,r9,r10,r11 released
	# Register rax,rcx,rdx,rsi,rdi,r8,r9,r10,r11 allocated
	call	FPC_IOCHECK
	# Register rax,rcx,rdx,rsi,rdi,r8,r9,r10,r11,rbx released
.Ll3:
# [4] end.
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
.Ll4:

.section .text

.section .fpc.n_links
	.quad	DEBUGSTART_$P$HELLO
	.quad	DEBUGEND_$P$HELLO
# End asmlist al_procedures
# Begin asmlist al_globals

.section .data.n_INITFINAL
	.balign 8
.globl	INITFINAL
	.type	INITFINAL,@object
INITFINAL:
	.quad	1,0
	.quad	INIT$_$SYSTEM
	.quad	0
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

.section .rodata.n__$HELLO$_Ld1
	.balign 8
.globl	_$HELLO$_Ld1
_$HELLO$_Ld1:
	.ascii	"\015Hello, World.\000"
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
	.ascii	"hello1.pas\000"
	.ascii	"Free Pascal 3.0.0 2015/11/20\000"
	.ascii	"/home/mymotif/prg/mypas/\000"
	.byte	9
	.byte	3
	.long	.Ldebug_line0
	.quad	DEBUGSTART_$P$HELLO
	.quad	DEBUGEND_$P$HELLO
# Syms - Begin Staticsymtable
# Symbol SYSTEM
# Symbol FPINTRES
# Symbol HELLO
# Symbol main
# Syms - End Staticsymtable
# Procdef $main; Register;
	.uleb128	2
	.ascii	"main\000"
	.byte	1
	.byte	65
	.byte	1
	.quad	main
	.quad	.Lt1
	.byte	0
# Defs - Begin unit SYSTEM has index 1
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
	.ascii	"hello1.pas\000"
	.uleb128	0
	.uleb128	0
	.uleb128	0
	.byte	0
	.type	.Lehdebug_line0,@object
.Lehdebug_line0:
# === header end ===
# function: PASCALMAIN
# function: main
# [2:6]
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll1
	.byte	5
	.uleb128	6
	.byte	13
# [3:3]
	.byte	2
	.uleb128	.Ll2-.Ll1
	.byte	5
	.uleb128	3
	.byte	13
# [4:1]
	.byte	2
	.uleb128	.Ll3-.Ll2
	.byte	5
	.uleb128	1
	.byte	13
	.byte	0
	.uleb128	9
	.byte	2
	.quad	.Ll4
	.byte	0
	.byte	1
	.byte	1
# ###################
	.type	.Ledebug_line0,@object
.Ledebug_line0:
# End asmlist al_dwarf_line
# Begin asmlist al_end

.section .text.z_DEBUGEND_$P$HELLO
.globl	DEBUGEND_$P$HELLO
	.type	DEBUGEND_$P$HELLO,@object
DEBUGEND_$P$HELLO:
# End asmlist al_end
.section .note.GNU-stack,"",%progbits

