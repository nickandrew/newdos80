;
;  DZ80 V3.4.1 Z80 Disassembly of sys2.bin
;  2024/12/29 13:34
;
	org	0x4d00
;
	cp	0x24
	jp	z,X4e2e
	cp	0x44
	jp	z,X4dbd
	cp	0x64
	jp	z,X4f82
	cp	0x84
	jp	z,X5155
	cp	0xa4
	jr	z,X4d92
	cp	0xc4
	jr	z,X4d80
	cp	0xe4
	jr	nz,X4d2e
	dec	c
	jr	z,X4d32
	dec	c
	jp	z,X50ca
	dec	c
	jr	z,X4d7b
	dec	c
	jp	z,X4d72
X4d2e:	ld	a,0x2a
X4d30:	or	a
	ret
;
X4d32:	push	de
	pop	ix
	inc	de
	ld	a,(de)
	and	0x7
	cp	0x3
	ld	a,0x25
	jr	nc,X4d30
	ld	hl,X4e75
	ld	(hl),0x3e
	ld	de,X51e0
	call	X4e2c
	ld	(hl),0x18
	jr	z,X4d77
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
X4d72:	call	X4dbd
	ret	nz
	ret	c
X4d77:	ld	a,0x35
	or	a
	ret
;
X4d7b:	call	0x4cd5
	ret	c
	pop	af
X4d80:	ex	(sp),hl
	call	X4d92
	jp	nz,0x4409
	ex	(sp),hl
	ld	a,(0x4369)
	rlca
	jp	c,0x440d
	jp	0x4c20
;
X4d92:	ld	hl,0x4200
	call	X4e2c
	jr	z,X4da0
	cp	0x18
	ret	nz
	add	a,0x7
	ret
;
X4da0:	ex	de,hl
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
X4dbd:	call	X4e2e
	ret	z
	cp	0x18
	ret	nz
	call	0x4986
	ld	bc,(X4e0a)
	ld	a,b
	cp	c
	jr	z,X4dd2
	ld	a,(0x43a1)
X4dd2:	ld	(X4e0e),a
	call	0x47ec
	jr	nz,X4de3
	ld	hl,X4d6e
	ld	b,(hl)
	call	X50cf
	jr	z,X4dea
X4de3:	ld	e,0x1a
	call	X4e09
	jr	X4dd2
;
X4dea:	ld	(X4f56),a
	ld	(hl),0x10
	call	X4e1f
	ld	a,(X4f5e)
	ld	(hl),a
	inc	hl
	ex	de,hl
	ld	hl,X51cd
	ld	bc,0x000f
	ldir
	call	0x491f
	ret	nz
	call	X4f2e
	scf
	ret
;
X4e09:	ld	hl,0
X4e0a	equ	$-2
	ld	d,a
	ld	a,0x0
X4e0e	equ	$-1
	inc	a
	cp	l
	ret	c
	pop	hl
	jr	z,X4e18
	ld	a,d
	or	a
	ret	nz
X4e18:	ld	a,e
	or	a
	ret
;
X4e1b:	ld	a,0x20
	or	a
	ret
;
X4e1f:	inc	hl
	ld	a,(hl)
	ld	(X4f46),a
	inc	hl
	inc	hl
	ld	a,(hl)
	ld	(X4f58),a
	inc	hl
	ret
;
X4e2c:	ld	b,0x0
X4e2e:	call	0x4986
	ld	(X4f48),hl
	ld	a,b
	ld	(X4f5e),a
	ld	hl,X51cd
	dec	de
	xor	a
	call	X5121
	cp	0x2f
	ld	b,0x3
	call	X5123
	cp	0x2e
	call	X5121
	ld	b,0x0
	ld	c,(iy+0x1f)
	cp	0x3a
	jr	nz,X4e75
	inc	de
	ld	a,(de)
	sub	0x30
	cp	0xa
	jr	nc,X4e1b
X4e5d:	ld	c,a
	inc	de
	ld	a,(de)
	sub	0x30
	cp	0xa
	jr	nc,X4e74
	ld	l,a
	ld	a,c
	ld	b,0x9
X4e6a:	add	a,c
	jr	c,X4e1b
	djnz	X4e6a
	add	a,l
	jr	nc,X4e5d
	jr	X4e1b
;
X4e74:	ld	b,c
X4e75:	jr	X4e7f		; This instruction is modified to "LD A,0x08"
;
	ld	a,c
	cp	b
	jr	z,X4e1b
	ld	b,(iy-0x78)
	ld	c,b
X4e7f:	ld	(X4e0a),bc
	push	bc
	call	X5152
	ld	(X51d8),hl
	ld	(X51da),hl
	ld	hl,X51cd
	ld	b,0xb
	xor	a
X4e93:	xor	(hl)
	inc	hl
	rlca
	djnz	X4e93
	jr	nz,X4e9b
	inc	a
X4e9b:	ld	(X4d6e),a
	pop	af
X4e9f:	ld	(X4e0e),a
	call	0x47ec
	jr	z,X4eae
X4ea7:	ld	e,0x18
	call	X4e09
	jr	X4e9f
;
X4eae:	ld	de,X51ad
	ld	bc,0x001f
X4eb4:	ld	a,b
	sub	c
	jr	z,X4ea7
	ld	a,0x1
	call	0x490a
	ret	nz
	ld	a,b
X4ebf:	ld	b,a
	ld	(de),a
	ld	l,a
	ld	a,e
	cp	0xcc
	jr	z,X4edd
	ld	a,(X4d6e)
	cp	(hl)
	jr	nz,X4ece
	inc	de
X4ece:	ld	a,b
	add	a,0x20
	jr	nc,X4ebf
	inc	a
	cp	c
	ld	b,a
	jr	c,X4ebf
X4ed8:	ld	a,e
	cp	0xad
	jr	z,X4eb4
X4edd:	dec	de
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
	jr	nz,X4f00
	call	X4e1f
	ld	de,X51cd
	ld	b,0xb
X4efa:	inc	hl
	ld	a,(de)
	cp	(hl)
	inc	de
	jr	z,X4f04
X4f00:	pop	bc
	pop	de
	jr	X4ed8
;
X4f04:	djnz	X4efa
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
	jr	z,X4f2f
	or	a
	sbc	hl,de
	jr	z,X4f2f
	add	hl,de
	ld	a,0x7
	and	0x0
X4f24	equ	$-1
	sbc	hl,bc
	jr	z,X4f30
	pop	hl
	ld	a,0x19
	or	a
	ret
;
X4f2e:	push	de
X4f2f:	xor	a
X4f30:	push	ix
	pop	hl
	call	X5110
	ld	(hl),0x80
	inc	hl
	or	0x28
	ld	(hl),a
	ld	a,(X4f5e)
	or	a
	jr	z,X4f44
	set	7,(hl)
X4f44:	inc	hl
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
	jr	z,X4f69
	sub	0x1
X4f69:	ld	(hl),a
	inc	hl
	ld	a,(de)
	sbc	a,0x0
	ld	(hl),a
	inc	de
	inc	hl
	ld	a,0x2c
	ret	c
	call	X4f79
	xor	a
	ret
;
X4f79:	ex	de,hl
X4f7a:	ld	a,0x8
	ld	c,a
	ld	b,0x0
	ldir
	ret
;
X4f82:	ld	a,0x3d
	bit	7,(ix+0x2)
	call	z,0x476e
	jr	nz,X4ffb
	ld	a,(0x486a)
	ld	(X505e),a
	push	af
	call	0x4936
	call	X5036
	inc	de
	push	de
	call	X50b4
	ld	b,(iy-0x71)
	ld	c,0x1
	ld	e,(hl)
	inc	e
	jr	z,X4fc5
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
X4fb8:	inc	e
	sub	b
	jr	nc,X4fb8
	add	a,b
	jr	z,X4fc5
X4fbf:	rlc	c
	dec	b
	dec	a
	jr	nz,X4fbf
X4fc5:	push	hl
	xor	a
	call	0x490a
	jr	nz,X4ffb
	ld	l,e
	pop	de
	ld	a,0x1
X4fd0:	ex	af,af'
	jr	X4fe5
;
X4fd3:	ld	a,(hl)
	and	c
	ld	a,(de)
	jr	z,X4ffd
	inc	a
	jr	nz,X504c
X4fdb:	rlc	c
	djnz	X4fd3
	inc	l
	ld	b,(iy-0x71)
	ld	c,0x1
X4fe5:	ld	a,l
	cp	(iy-0x75)
	jr	c,X4fd3
	ex	af,af'
	dec	a
	ld	l,a
	jr	z,X4fd0
	bit	0,(iy-0x15)
	jr	nz,X502a
	call	X508c
	ld	a,0x1b
X4ffb:	jr	X503d
;
X4ffd:	inc	a
	jr	nz,X5043
	ld	a,l
	ld	(de),a
	inc	de
	ld	a,(iy-0x71)
	sub	b
	rrca
	rrca
	rrca
	dec	a
X500b:	inc	a
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
	jr	nz,X4fdb
	ld	a,(iy-0x15)
	and	0x3
	jr	nz,X502a
	ex	(sp),hl
	inc	hl
	inc	hl
	inc	hl
	ex	(sp),hl
	set	0,(iy-0x15)
	jr	X4fdb
;
X502a:	res	0,(iy-0x15)
	call	X508c
	pop	af
	pop	af
X5033:	call	0x492f
X5036:	jr	nz,X503d
	bit	4,(hl)
	ret	nz
	ld	a,0x2c
X503d:	call	0x4c20
	jp	0x49cd
;
X5043:	inc	de
	ld	a,(de)
	inc	a
	and	0x1f
	ld	a,(de)
	jr	nz,X500b
	dec	de
X504c:	inc	de
	inc	de
	ld	a,(de)
	inc	a
	jr	z,X4fd3
	bit	0,(iy-0x15)
	jr	nz,X502a
	push	hl
	push	bc
	call	X508c
	ld	b,0x0
X505e	equ	$-1
	ld	l,b
	push	bc
	call	X50cf
	jr	nz,X503d
	ld	c,a
	ld	(hl),0x90
	inc	hl
	pop	de
	ld	(hl),d
	call	X50ae
	ld	a,d
	call	X5033
	add	a,0x1f
	ld	l,a
	ld	(hl),c
	dec	hl
	ld	(hl),0xfe
	call	X50ae
	ld	a,c
	ld	(X505e),a
	call	X5033
	call	X50b4
	pop	bc
	pop	de
	jp	X4fc5
;
X508c:	call	X50ae
	ld	a,(X505e)
	call	X5033
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
	call	z,X4f79
	pop	hl
	pop	de
	call	X4f7a
X50ae:	call	0x491f
	ret	z
	jr	X503d
;
X50b4:	add	a,0x16
	ld	l,a
	ld	de,X51ad
	call	X4f7a
	ex	de,hl
	ld	(hl),0xfe
	rrca
	ld	b,a
X50c2:	dec	hl
	dec	hl
	ld	a,(hl)
	inc	a
	ret	nz
	djnz	X50c2
	ret
;
X50ca:	ld	a,d
	call	0x4776
	ret	nz
X50cf:	ex	de,hl
	ld	a,0x1
	call	0x490a
	ret	nz
	ld	a,(0x421f)
	add	a,0x8
	ld	c,a
	ld	a,b
	and	0x1f
X50df:	sub	c
	jr	nc,X50df
	add	a,c
X50e3:	ld	b,a
	ld	l,a
	jr	X50f2
;
X50e7:	ld	a,(hl)
	or	a
	jr	z,X50fe
	ld	a,l
	add	a,0x20
	ld	l,a
	jr	nc,X50e7
	inc	l
X50f2:	ld	a,l
	cp	c
	jr	c,X50e7
	xor	a
	inc	b
	dec	b
	jr	nz,X50e3
	or	0x1a
	ret
;
X50fe:	ld	a,(de)
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
X5110:	ld	bc,0x0a16
	push	hl
X5114:	ld	(hl),0x0
	inc	hl
	dec	c
	jr	nz,X5114
X511a:	ld	(hl),0xff
	inc	hl
	djnz	X511a
	pop	hl
	ret
;
X5121:	ld	b,0x8
X5123:	jr	nz,X5140
	call	X5146
	jr	c,X513b
X512a:	ld	(hl),a
	inc	hl
	call	X5146
	jr	nc,X5139
	cp	0x30
	jr	c,X5143
	cp	0x3a
	jr	nc,X5143
X5139:	djnz	X512a
X513b:	pop	af
	ld	a,0x30
	or	a
	ret
;
X5140:	ld	(hl),0x20
	inc	hl
X5143:	djnz	X5140
	ret
;
X5146:	inc	de
	ld	a,(de)
	call	0x45b5
	cp	0x41
	ret	c
	cp	0x5b
	ccf
	ret
;
X5152:	ld	hl,X51df
X5155:	push	de
	push	bc
	ld	de,0xffff
	ld	b,0x8
X515c:	push	bc
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
	djnz	X515c
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
