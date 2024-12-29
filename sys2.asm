;
;  DZ80 V3.4.1 Z80 Disassembly of sys2.bin
;  2024/12/29 13:34
;
	org	0x4d00
;
	cp	0x24
	jp	z,j1002
	cp	0x44
	jp	z,j0601
	cp	0x64
	jp	z,j1301
	cp	0x84
	jp	z,j2202
	cp	0xa4
	jr	z,j0501
	cp	0xc4
	jr	z,j0402
	cp	0xe4
	jr	nz,j0101
	dec	c
	jr	z,j0201
	dec	c
	jp	z,j1901
	dec	c
	jr	z,j0401
	dec	c
	jp	z,j0301
j0101:	ld	a,0x2a
j0102:	or	a
	ret
;
j0201:	push	de
	pop	ix
	inc	de
	ld	a,(de)
	and	0x7
	cp	0x3
	ld	a,0x25
	jr	nc,j0102
	ld	hl,j1006
	ld	(hl),0x3e
	ld	de,X51e0
	call	j1001
	ld	(hl),0x18
	jr	z,j0302
	cp	0x18
	call	z,0x494b
	ret	nz
	ld	a,l
	add	a,0x5
	ld	l,a
	ex	de,hl
	ld	hl,X51cd
	ld	bc,0x000b
	ldir
	call	0x491f
	ld	a,0x1
	call	z,0x490a
	ret	nz
	ld	l,(ix+0x7)
	ld	(hl),0x0
X4d6e	equ	$-1
	jp	0x491f
;
j0301:	call	j0601
	ret	nz
	ret	c
j0302:	ld	a,0x35
	or	a
	ret
;
j0401:	call	0x4cd5
	ret	c
	pop	af
j0402:	ex	(sp),hl
	call	j0501
	jp	nz,0x4409
	ex	(sp),hl
	ld	a,(0x4369)
	rlca
	jp	c,0x440d
	jp	0x4c20
;
j0501:	ld	hl,0x4200
	call	j1001
	jr	z,j0502
	cp	0x18
	ret	nz
	add	a,0x7
	ret
;
j0502:	ex	de,hl
	inc	hl
	ld	a,(hl)
	push	af
	push	hl
	and	0x7
	ld	b,a
	ld	a,0x6
	cp	b
	ld	a,0x25
	ld	(hl),0x2d
	dec	hl
	call	nc,0x4c28
	ld	(0x4403),hl
	ex	de,hl
	pop	hl
	pop	bc
	ld	(hl),b
	dec	hl
	ex	de,hl
	ret
;
j0601:	call	j1002
	ret	z
	cp	0x18
	ret	nz
	call	0x4986
	ld	bc,(X4e0a)
	ld	a,b
	cp	c
	jr	z,j0602
	ld	a,(0x43a1)
j0602:	ld	(X4e0e),a
	call	0x47ec
	jr	nz,j0603
	ld	hl,X4d6e
	ld	b,(hl)
	call	j1902
	jr	z,j0604
j0603:	ld	e,0x1a
	call	j0701
	jr	j0602
;
j0604:	ld	(X4f56),a
	ld	(hl),0x10
	call	j0901
	ld	a,(X4f5e)
	ld	(hl),a
	inc	hl
	ex	de,hl
	ld	hl,X51cd
	ld	bc,0x000f
	ldir
	call	0x491f
	ret	nz
	call	j1101
	scf
	ret
;
j0701:	ld	hl,0
X4e0a	equ	$-2
	ld	d,a
	ld	a,0x0
X4e0e	equ	$-1
	inc	a
	cp	l
	ret	c
	pop	hl
	jr	z,j0702
	ld	a,d
	or	a
	ret	nz
j0702:	ld	a,e
	or	a
	ret
;
j0801:	ld	a,0x20
	or	a
	ret
;
j0901:	inc	hl
	ld	a,(hl)
	ld	(X4f46),a
	inc	hl
	inc	hl
	ld	a,(hl)
	ld	(X4f58),a
	inc	hl
	ret
;
j1001:	ld	b,0x0
j1002:	call	0x4986
	ld	(X4f48),hl
	ld	a,b
	ld	(X4f5e),a
	ld	hl,X51cd
	dec	de
	xor	a
	call	j2001
	cp	0x2f
	ld	b,0x3
	call	j2002
	cp	0x2e
	call	j2001
	ld	b,0x0
	ld	c,(iy+0x1f)
	cp	0x3a
	jr	nz,j1006
	inc	de
	ld	a,(de)
	sub	0x30
	cp	0xa
	jr	nc,j0801
j1003:	ld	c,a
	inc	de
	ld	a,(de)
	sub	0x30
	cp	0xa
	jr	nc,j1005
	ld	l,a
	ld	a,c
	ld	b,0x9
j1004:	add	a,c
	jr	c,j0801
	djnz	j1004
	add	a,l
	jr	nc,j1003
	jr	j0801
;
j1005:	ld	b,c
j1006:	jr	j1007		; This instruction is modified to "LD A,0x08"
;
	ld	a,c
	cp	b
	jr	z,j0801
	ld	b,(iy-0x78)
	ld	c,b
j1007:	ld	(X4e0a),bc
	push	bc
	call	j2201
	ld	(X51d8),hl
	ld	(X51da),hl
	ld	hl,X51cd
	ld	b,0xb
	xor	a
j1008:	xor	(hl)
	inc	hl
	rlca
	djnz	j1008
	jr	nz,j1009
	inc	a
j1009:	ld	(X4d6e),a
	pop	af
j1010:	ld	(X4e0e),a
	call	0x47ec
	jr	z,j1012
j1011:	ld	e,0x18
	call	j0701
	jr	j1010
;
j1012:	ld	de,X51ad
	ld	bc,0x001f
j1013:	ld	a,b
	sub	c
	jr	z,j1011
	ld	a,0x1
	call	0x490a
	ret	nz
	ld	a,b
j1014:	ld	b,a
	ld	(de),a
	ld	l,a
	ld	a,e
	cp	0xcc
	jr	z,j1017
	ld	a,(X4d6e)
	cp	(hl)
	jr	nz,j1015
	inc	de
j1015:	ld	a,b
	add	a,0x20
	jr	nc,j1014
	inc	a
	cp	c
	ld	b,a
	jr	c,j1014
j1016:	ld	a,e
	cp	0xad
	jr	z,j1013
j1017:	dec	de
	ld	a,(de)
	ld	(X4f56),a
	call	0x492f
	ret	nz
	push	de
	push	bc
	ld	a,(hl)
	ld	(X4f24),a
	and	0x90
	cp	0x10
	jr	nz,j1019
	call	j0901
	ld	de,X51cd
	ld	b,0xb
j1018:	inc	hl
	ld	a,(de)
	cp	(hl)
	inc	de
	jr	z,j1020
j1019:	pop	bc
	pop	de
	jr	j1016
;
j1020:	djnz	j1018
	pop	bc
	pop	de
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	inc	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	inc	hl
	push	hl
	ld	hl,(X51d8)
	bit	7,(iy-0x14)
	jr	z,j1102
	or	a
	sbc	hl,de
	jr	z,j1102
	add	hl,de
	ld	a,0x7
	and	0x0
X4f24	equ	$-1
	sbc	hl,bc
	jr	z,j1103
	pop	hl
	ld	a,0x19
	or	a
	ret
;
j1101:	push	de
j1102:	xor	a
j1103:	push	ix
	pop	hl
	call	j1908
	ld	(hl),0x80
	inc	hl
	or	0x28
	ld	(hl),a
	ld	a,(X4f5e)
	or	a
	jr	z,j1104
	set	7,(hl)
j1104:	inc	hl
	ld	(hl),0x0
X4f46	equ	$-1
	ld	de,0
X4f48	equ	$-2
	inc	hl
	ld	(hl),e
	inc	hl
	ld	(hl),d
	inc	hl
	inc	hl
	ld	a,(iy-0x78)
	ld	(hl),a
	inc	hl
	ld	(hl),0x0
X4f56	equ	$-1
	ld	a,0x0
X4f58	equ	$-1
	inc	hl
	or	a
	ld	(hl),a
	inc	hl
	ld	(hl),0x0
X4f5e	equ	$-1
	inc	hl
	inc	hl
	inc	hl
	pop	de
	ld	a,(de)
	inc	de
	jr	z,j1105
	sub	0x1
j1105:	ld	(hl),a
	inc	hl
	ld	a,(de)
	sbc	a,0x0
	ld	(hl),a
	inc	de
	inc	hl
	ld	a,0x2c
	ret	c
	call	j1201
	xor	a
	ret
;
j1201:	ex	de,hl
j1202:	ld	a,0x8
	ld	c,a
	ld	b,0x0
	ldir
	ret
;
j1301:	ld	a,0x3d
	bit	7,(ix+0x2)
	call	z,0x476e
	jr	nz,j1404
	ld	a,(0x486a)
	ld	(X505e),a
	push	af
	call	0x4936
	call	j1601
	inc	de
	push	de
	call	j1801
	ld	b,(iy-0x71)
	ld	c,0x1
	ld	e,(hl)
	inc	e
	jr	z,j1304
	dec	e
	dec	e
	inc	hl
	ld	a,(hl)
	and	0x1f
	ld	d,a
	inc	d
	ld	a,(hl)
	and	0xe0
	dec	hl
	rlca
	rlca
	rlca
	add	a,d
j1302:	inc	e
	sub	b
	jr	nc,j1302
	add	a,b
	jr	z,j1304
j1303:	rlc	c
	dec	b
	dec	a
	jr	nz,j1303
j1304:	push	hl
	xor	a
	call	0x490a
	jr	nz,j1404
	ld	l,e
	pop	de
	ld	a,0x1
j1305:	ex	af,af'
	jr	j1403
;
j1401:	ld	a,(hl)
	and	c
	ld	a,(de)
	jr	z,j1405
	inc	a
	jr	nz,j1604
j1402:	rlc	c
	djnz	j1401
	inc	l
	ld	b,(iy-0x71)
	ld	c,0x1
j1403:	ld	a,l
	cp	(iy-0x75)
	jr	c,j1401
	ex	af,af'
	dec	a
	ld	l,a
	jr	z,j1305
	bit	0,(iy-0x15)
	jr	nz,j1407
	call	j1701
	ld	a,0x1b
j1404:	jr	j1602
;
j1405:	inc	a
	jr	nz,j1603
	ld	a,l
	ld	(de),a
	inc	de
	ld	a,(iy-0x71)
	sub	b
	rrca
	rrca
	rrca
	dec	a
j1406:	inc	a
	ld	(de),a
	dec	de
	ld	a,(hl)
	or	c
	ld	(hl),a
	ex	(sp),hl
	dec	hl
	ld	a,h
	or	l
	ex	(sp),hl
	jr	nz,j1402
	ld	a,(iy-0x15)
	and	0x3
	jr	nz,j1407
	ex	(sp),hl
	inc	hl
	inc	hl
	inc	hl
	ex	(sp),hl
	set	0,(iy-0x15)
	jr	j1402
;
j1407:	res	0,(iy-0x15)
	call	j1701
	pop	af
	pop	af
j1501:	call	0x492f
j1601:	jr	nz,j1602
	bit	4,(hl)
	ret	nz
	ld	a,0x2c
j1602:	call	0x4c20
	jp	0x49cd
;
j1603:	inc	de
	ld	a,(de)
	inc	a
	and	0x1f
	ld	a,(de)
	jr	nz,j1406
	dec	de
j1604:	inc	de
	inc	de
	ld	a,(de)
	inc	a
	jr	z,j1401
	bit	0,(iy-0x15)
	jr	nz,j1407
	push	hl
	push	bc
	call	j1701
	ld	b,0x0
X505e	equ	$-1
	ld	l,b
	push	bc
	call	j1902
	jr	nz,j1602
	ld	c,a
	ld	(hl),0x90
	inc	hl
	pop	de
	ld	(hl),d
	call	j1702
	ld	a,d
	call	j1501
	add	a,0x1f
	ld	l,a
	ld	(hl),c
	dec	hl
	ld	(hl),0xfe
	call	j1702
	ld	a,c
	ld	(X505e),a
	call	j1501
	call	j1801
	pop	bc
	pop	de
	jp	j1304
;
j1701:	call	j1702
	ld	a,(X505e)
	call	j1501
	add	a,0x16
	bit	7,(hl)
	ld	l,a
	push	hl
	push	ix
	pop	hl
	ld	bc,0x000e
	add	hl,bc
	ld	de,X51ad
	push	de
	call	z,j1201
	pop	hl
	pop	de
	call	j1202
j1702:	call	0x491f
	ret	z
	jr	j1602
;
j1801:	add	a,0x16
	ld	l,a
	ld	de,X51ad
	call	j1202
	ex	de,hl
	ld	(hl),0xfe
	rrca
	ld	b,a
j1802:	dec	hl
	dec	hl
	ld	a,(hl)
	inc	a
	ret	nz
	djnz	j1802
	ret
;
j1901:	ld	a,d
	call	0x4776
	ret	nz
j1902:	ex	de,hl
	ld	a,0x1
	call	0x490a
	ret	nz
	ld	a,(0x421f)
	add	a,0x8
	ld	c,a
	ld	a,b
	and	0x1f
j1903:	sub	c
	jr	nc,j1903
	add	a,c
j1904:	ld	b,a
	ld	l,a
	jr	j1906
;
j1905:	ld	a,(hl)
	or	a
	jr	z,j1907
	ld	a,l
	add	a,0x20
	ld	l,a
	jr	nc,j1905
	inc	l
j1906:	ld	a,l
	cp	c
	jr	c,j1905
	xor	a
	inc	b
	dec	b
	jr	nz,j1904
	or	0x1a
	ret
;
j1907:	ld	a,(de)
	ld	(hl),a
	ld	c,l
	call	0x491f
	ret	nz
	ld	a,c
	call	0x4936
	ret	nz
	bit	4,(hl)
	ld	a,0x2c
	ret	nz
	ld	a,c
j1908:	ld	bc,0x0a16
	push	hl
j1909:	ld	(hl),0x0
	inc	hl
	dec	c
	jr	nz,j1909
j1910:	ld	(hl),0xff
	inc	hl
	djnz	j1910
	pop	hl
	ret
;
j2001:	ld	b,0x8
j2002:	jr	nz,j2006
	call	j2101
	jr	c,j2005
j2003:	ld	(hl),a
	inc	hl
	call	j2101
	jr	nc,j2004
	cp	0x30
	jr	c,j2007
	cp	0x3a
	jr	nc,j2007
j2004:	djnz	j2003
j2005:	pop	af
	ld	a,0x30
	or	a
	ret
;
j2006:	ld	(hl),0x20
	inc	hl
j2007:	djnz	j2006
	ret
;
j2101:	inc	de
	ld	a,(de)
	call	0x45b5
	cp	0x41
	ret	c
	cp	0x5b
	ccf
	ret
;
j2201:	ld	hl,X51df
j2202:	push	de
	push	bc
	ld	de,0xffff
	ld	b,0x8
j2203:	push	bc
	ld	a,e
	and	0x7
	ld	c,a
	ld	a,e
	rlca
	rlca
	rlca
	xor	c
	rlca
	ld	c,a
	and	0xf0
	ld	b,a
	ld	a,c
	rlca
	and	0x1f
	xor	b
	xor	d
	ld	e,a
	ld	a,c
	and	0xf
	ld	b,a
	ld	a,c
	rlca
	rlca
	rlca
	rlca
	xor	b
	pop	bc
	xor	(hl)
	ld	d,a
	ld	(hl),0x20
	dec	hl
	djnz	j2203
	ex	de,hl
	pop	bc
	pop	de
	ret
;
	db	0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	db	0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	db	0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	db	0x0,0x0,0x0,0x0,0x0,0x0,0x0,0x0
	db	0x0,0x0,0x0,0x0,0x0

X51ad	ds	32
X51cd	ds	11
X51d8	ds	2
X51da	ds	2
	ds	3
X51df	ds	1
X51e0	ds	32
;
;
	end	0x4d00
;
