BITS    64
ALIGN	8, nop

; description
; minimal AMX tile example

GLOBAL _amx_minimal_example			; make label available to linker 
SECTION .text						; code section
_amx_minimal_example:				; standard  gcc  entry point
		
    VPADDQ  XMM0,XMM1,XMM8
	;MOVQ tc+72(FP),DX
    LDTILECFG [RDX]

	;MOVQ dst_base+0(FP),DX
    TILELOADD TMM1, [RDX]

	;MOVQ src1_base+24(FP),DX
    TILELOADD TMM2, [RDX]

	;MOVQ src2_base+48(FP),DX
    TILELOADD TMM3, [RDX]

	;// Compute dot-product of bytes in tiles
    TDPBSSD TMM1, TMM2, TMM3

    ;// Store the tile data to memory
	;MOVQ dst_base+0(FP),DX
	TILESTORED [RDX], TMM1
	TILERELEASE

