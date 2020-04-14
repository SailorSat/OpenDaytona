0000: BF600010 brif alw #0x10
0001: BF600006 brif alw #0x6
0002: BF600006 brif alw #0x6
0003: BF600006 brif alw #0x6
0004: BF60000A brif alw #0xa
0005: BF600006 brif alw #0x6
0006: 3C02105C clr1 #0x105c
0007: 7C000002 ldi #0x2, mask
0008: 3C060800 set #0x0800
0009: BF6E0000 iret
000A: 3C02105C clr1 #0x105c
000B: 1C0CFC7E mov $0x7e, $0x27e
000C: 1C10FE7E mov $0x27e, $0x7f
000D: 1C1DC07F mov $0x7f, rf0
000E: 3C060800 set #0x0800
000F: BF6E0000 iret
0010: 3C060800 set #0x0800
0011: 7C000002 ldi #0x2, mask
0012: 360A0007 stmh fp rz
0013: 43000000 ldi #0x0, x1
0014: 3B000000 lid #0x0
0015: 1C1C33A1 mov d, (x1+1)
0016: 3B000001 lid #0x1
0017: 1C1C33A1 mov d, (x1+1)
0018: 3BFFFFFF lid #0xffffff
0019: 1C1C33A1 mov d, (x1+1)
001A: 3B000000 lid #0x0
001B: 1C1C33A1 mov d, (x1+1)
001C: 3C000010 clr0 d
001D: 5A00007F ldi #0x7f, dh
001E: 1C1C33A1 mov d, (x1+1)
001F: 3C000010 clr0 d
0020: 5A00007F ldi #0x7f, dh
0021: 5B800000 ldi #0x800000, dl
0022: 1C1C33A1 mov d, (x1+1)
0023: 3B00000F lid #0xf
0024: 1C1C33A1 mov d, (x1+1)
0025: 3B000130 lid #0x130
0026: 1C1C33A1 mov d, (x1+1)
0027: 1C1C33A1 mov d, (x1+1)
0028: 3B000000 lid #0x0
0029: 1C1C33A1 mov d, (x1+1)
002A: 3B000007 lid #0x7
002B: 1C1C33A1 mov d, (x1+1)
002C: 3B000008 lid #0x8
002D: 1C1C33A1 mov d, (x1+1)
002E: 3B000100 lid #0x100
002F: 1C1C33A1 mov d, (x1+1)
0030: 3B000200 lid #0x200
0031: 1C1C33A1 mov d, (x1+1)
0032: 1C0C0000 mov $0, $0x200
0033: 1C0C0201 mov $1, $0x201
0034: 1C0C0402 mov $2, $0x202
0035: 1C0C0603 mov $3, $0x203
0036: 1C0C0804 mov $4, $0x204
0037: 1C0C0A05 mov $5, $0x205
0038: 43000206 ldi #0x206, x1
0039: 3C000010 clr0 d
003A: 5A00007B ldi #0x7b, dh
003B: 5BCCCCCD ldi #0xcccccd, dl
003C: 1C1C33A1 mov d, (x1+1)
003D: 3C000044 clr0 a, ?6
003E: BF6407CB bsif alw #0x7cb
003F: 40000000 ldi #0x0, b0
0040: 41000200 ldi #0x200, b1
0041: 1C1DC000 mov $0, rf0
0042: 1C10FC01 mov $0x201, $0x7e
0043: 1C10FE01 mov $0x201, $0x7f
0044: 1C1F2621 mov rf1, b
0045: 1C1F3214 mov bh, d
0046: 3900003F lia #0x3f
0047: 1C3DA00B andd : mov $0xb, a
0048: 1F7F1E10 subd
0049: FE000044 brif !zrd #0x44
004A: 3B000008 lid #0x8
004B: BF600055 brif alw #0x55
--
004C: 1C1F2621 mov rf1, b			-- read rf1 to b		(13802727)
004D: 1C1DC07F mov $0x7f, rf0		-- rf0 = 0x7f?
004E: 3C000014 clr0 a, d			-- a = 0, d = 0
004F: 1C1F1815 mov bl, c0			-- c0 = bl (27)
0050: 1C1F320C mov c0, d			-- d = c0
0051: 1C1F2014 mov bh, a			-- a = bh (27)
0052: 1F7DB800 subd : mov $0, p		-- d -=?
0053: FE0000A1 brif !zrd #0xa1		-- if not zero d? goto 0xa1
0054: 1C1F3214 mov bh, d			-- d = bh (27)
0055: 39000058 lia #0x58			-- a = 0x58
0056: 1F5DB800 addd : mov $0, p		-- addd ? (7f)
0057: BF624019 brul alw d			-- branch to d (7f)
0058: BF6000B5 brif alw #0xb5		00
0059: BF6000BA brif alw #0xba		01
005A: BF6000BF brif alw #0xbf		02
005B: BF6000C4 brif alw #0xc4		03
005C: BF6000D2 brif alw #0xd2		04
005D: BF6000E3 brif alw #0xe3		05
005E: BF6000F7 brif alw #0xf7		06
005F: BF600106 brif alw #0x106		07
0060: BF60010A brif alw #0x10a		08
0061: BF60010E brif alw #0x10e		09
0062: BF600154 brif alw #0x154		0a
0063: BF60015D brif alw #0x15d		0b
0064: BF60019F brif alw #0x19f		0c
0065: BF6001B8 brif alw #0x1b8		0d
0066: BF6001BB brif alw #0x1bb		0e
0067: BF6001C1 brif alw #0x1c1		0f
0068: BF6001D2 brif alw #0x1d2		10
0069: BF6001D9 brif alw #0x1d9		11
006A: BF6001DD brif alw #0x1dd		12
006B: BF6001F3 brif alw #0x1f3		13
006C: BF60020A brif alw #0x20a		14
006D: BF600223 brif alw #0x223		15
006E: BF60023B brif alw #0x23b		16
006F: BF600253 brif alw #0x253		17
0070: BF6002AA brif alw #0x2aa		18
0071: BF6002B0 brif alw #0x2b0		19
0072: BF6002B2 brif alw #0x2b2		1a
0073: BF6002CB brif alw #0x2cb		1b
0074: BF6002CE brif alw #0x2ce		1c
0075: BF6002D1 brif alw #0x2d1		1d
0076: BF6002D7 brif alw #0x2d7		1e
0077: BF6002DD brif alw #0x2dd		1f
0078: BF6002FF brif alw #0x2ff		20
0079: BF6002FF brif alw #0x2ff		21
007A: BF600300 brif alw #0x300		22
007B: BF600304 brif alw #0x304		23
007C: BF600308 brif alw #0x308		24
007D: BF60030A brif alw #0x30a		25
007E: BF60030C brif alw #0x30c		26
007F: BF600311 brif alw #0x311		27 - 0x311
0080: BF600316 brif alw #0x316		28
0081: BF60031B brif alw #0x31b		29
0082: BF600329 brif alw #0x329		2a
0083: BF60036C brif alw #0x36c		2b
0084: BF6003C2 brif alw #0x3c2		2c
0085: BF6003C7 brif alw #0x3c7		2d
0086: BF6003CF brif alw #0x3cf		2e
0087: BF6003EF brif alw #0x3ef		2f
0088: BF600410 brif alw #0x410		30
0089: BF600413 brif alw #0x413		31
008A: BF600417 brif alw #0x417		32
008B: BF60043B brif alw #0x43b		33
008C: BF60044D brif alw #0x44d		34
008D: BF600452 brif alw #0x452		35
008E: BF600457 brif alw #0x457		36
008F: BF60051A brif alw #0x51a		37
0090: BF600521 brif alw #0x521		38
0091: BF60052F brif alw #0x52f		39
0092: BF60053D brif alw #0x53d		3a
0093: BF600545 brif alw #0x545		3b
0094: BF600558 brif alw #0x558		3c
0095: BF600559 brif alw #0x559		3d
0096: BF6005C6 brif alw #0x5c6		3e
0097: BF6005E9 brif alw #0x5e9		3f
0098: BF6005F3 brif alw #0x5f3		40
0099: BF6005FA brif alw #0x5fa		41
009A: BF600615 brif alw #0x615		42
009B: BF600631 brif alw #0x631		43
009C: BF60063F brif alw #0x63f		44
009D: BF600643 brif alw #0x643		45
009E: BF60064B brif alw #0x64b		46
009F: BF600661 brif alw #0x661		47
00A0: BF6007D9 brif alw #0x7d9		48
00A1: 39000002 lia #0x2
00A2: 1C1C207F mov a, $0x7f
00A3: 5F000008 ldi #0x8, sft
00A4: 390000FF lia #0xff
00A5: 1C1F3215 mov bl, d
00A6: 1EDF1E10 lsrd
00A7: 1C3F1E10 andd
00A8: 1C1F1A19 mov d, c1
00A9: 1C1F200C mov c0, a
00AA: 1F7F1E10 subd
00AB: FE0000AE brif !zrd #0xae
00AC: 1C1F320C mov c0, d
00AD: BF600055 brif alw #0x55
00AE: 1C1F2014 mov bh, a
00AF: 1C1F320D mov c1, d
00B0: 1F7F1E10 subd
00B1: FE0000B4 brif !zrd #0xb4
00B2: 1C1F3214 mov bh, d
00B3: BF600055 brif alw #0x55
00B4: BF60004C brif alw #0x4c

-- 00 add
00B5: 1C1F3221 mov rf1, d
00B6: 1C1F2021 mov rf1, a
00B7: 1CDF1E10 fadd				
00B8: 1C1F4419 mov d, rf2
00B9: BF60004C brif alw #0x4c

-- 01 sub
00BA: 1C1F3221 mov rf1, d
00BB: 1C1F2021 mov rf1, a
00BC: 1CFF1E10 fsbd
00BD: 1C1F4419 mov d, rf2
00BE: BF60004C brif alw #0x4c

-- 02 mul
00BF: 1C1F2021 mov rf1, a
00C0: 1C1F2621 mov rf1, b
00C1: 1D1F1E10 fml
00C2: 1C1F441C mov p, rf2
00C3: BF60004C brif alw #0x4c

-- 03 ??
00C4: 1C1C4270 mov rf1, $0x70				(0x70) = rf1
00C5: 1C1F2021 mov rf1, a					a= rf1
00C6: 1C1CA028 mov a, $0x28 (e)				(0x28) = a
00C7: 5100007F ldi #0x7f, ah
00C8: 1C1E3228 mov $0x28 (e), d
00C9: 1D7F1E10 fabd
00CA: 1C1F2619 mov d, b
00CB: 1D1E3229 fml : mov $0x29 (e), d
00CC: 1D5F1E10 fmrd
00CD: 1C1F2619 mov d, b
00CE: 1C1DA070 mov $0x70, a
00CF: 1D1F1E10 fml
00D0: 1C1F441C mov p, rf2
00D1: BF60004C brif alw #0x4c

-- 04 ??
00D2: 1C1C4270 mov rf1, $0x70
00D3: 1C1F2021 mov rf1, a
00D4: 1C1C2071 mov a, $0x71
00D5: 1C1CA028 mov a, $0x28 (e)
00D6: 5100007F ldi #0x7f, ah
00D7: 1C1E3228 mov $0x28 (e), d
00D8: 1D7F1E10 fabd
00D9: 1C1F2619 mov d, b
00DA: 1D1E3229 fml : mov $0x29 (e), d
00DB: 1D5DA070 fmrd : mov $0x70, a
00DC: 1C1F2619 mov d, b
00DD: 1D1DA671 fml : mov $0x71, b
00DE: 1C1F201C mov p, a
00DF: 1D1DB270 fml : mov $0x70, d
00E0: 1D5F1E10 fmrd
00E1: 1C1F4419 mov d, rf2
00E2: BF60004C brif alw #0x4c

-- 05 ??
00E3: 1C1DA00A mov $0xa, a					a = (0xa)		7
00E4: 1C1DB209 mov $9, d					d = (0x9)		0
00E5: 1F7DA001 subd : mov $1, a				d -= a; a = (0x1)
00E6: BE1000F3 brif ged #0xf3				00F3
00E7: 1C1D8407 mov $7, x0					x0 = (0x7)
00E8: 43000010 ldi #0x10, x1				x1 = 0x10
00E9: 3C04000C rep #0xc
00EA: 1C1343A1 mov (x0+1)+0x200, (x1+1)
00EB: 1C1DB209 mov $9, d
00EC: 1F5C0407 addd : mov x0, $7
00ED: 1C1C3209 mov d, $9
00EE: 42000010 ldi #0x10, x0
00EF: 1C1D8607 mov $7, x1
00F0: 3C04000C rep #0xc
00F1: 1C0F43A1 mov (x0+1), (x1+1)+0x200
00F2: BF60004C brif alw #0x4c

00F3: 1C1DB209 mov $9, d
00F4: 1F5F1E10 addd
00F5: 1C1C3209 mov d, $9
00F6: BF60004C brif alw #0x4c

-- 06 ??
00F7: 1C1DB209 mov $9, d
00F8: 1C1DA000 mov $0, a
00F9: 1F7DA00B subd : mov $0xb, a
00FA: BE20004C brif led #0x4c
00FB: 1C1DB209 mov $9, d
00FC: 1F7DA001 subd : mov $1, a
00FD: BE100102 brif ged #0x102
00FE: 1C1DB207 mov $7, d
00FF: 3900000C lia #0xc
0100: 1F7DA001 subd : mov $1, a
0101: 1C1C3207 mov d, $7
0102: 1C1DB209 mov $9, d
0103: 1F7F1E10 subd
0104: 1C1C3209 mov d, $9
0105: BF60004C brif alw #0x4c

-- 07
0106: 1C1D8607 mov $7, x1
0107: 3C04000C rep #0xc
0108: 1C1C4381 mov rf1, (bx1+1)
0109: BF60004C brif alw #0x4c

-- 08
010A: 1C1DB208 mov $8, d
010B: 1C1C3207 mov d, $7
010C: 1C101200 mov $0x200, $9
010D: BF60004C brif alw #0x4c

-- 09
010E: 1C1D8607 mov $7, x1
010F: 1C1C4210 mov rf1, $0x10
0110: 000F4610 lab $0x10, (x1+3)+0x200
0111: 1D1C4211 fml : mov rf1, $0x11
0112: 000F4611 lab $0x11, (x1+3)+0x200
0113: 1DBC4212 fspd : mov rf1, $0x12
0114: 000F7412 lab $0x12, (x1-6)+0x200
0115: 1D3C4213 fmsd : mov rf1, $0x13
0116: 000F4613 lab $0x13, (x1+3)+0x200
0117: 1D3C4214 fmsd : mov rf1, $0x14
0118: 000F4614 lab $0x14, (x1+3)+0x200
0119: 1C1C3228 mov d, $0x28
011A: 1DBC4215 fspd : mov rf1, $0x15
011B: 000F7415 lab $0x15, (x1-6)+0x200
011C: 1D3C4216 fmsd : mov rf1, $0x16
011D: 000F4616 lab $0x16, (x1+3)+0x200
011E: 1D3C4217 fmsd : mov rf1, $0x17
011F: 000F4617 lab $0x17, (x1+3)+0x200
0120: 1C1C322B mov d, $0x2b
0121: 1DBC4218 fspd : mov rf1, $0x18
0122: 000F7418 lab $0x18, (x1-6)+0x200
0123: 1D3C4219 fmsd : mov rf1, $0x19
0124: 000F4619 lab $0x19, (x1+3)+0x200
0125: 1D3C421A fmsd : mov rf1, $0x1a
0126: 000F461A lab $0x1a, (x1+3)+0x200
0127: 1C1C322E mov d, $0x2e
0128: 1DBC421B fspd : mov rf1, $0x1b
0129: 000F461B lab $0x1b, (x1+3)+0x200
012A: 1D3DA198 fmsd : mov (bx1-8), a
012B: 00CF4610 fadd : lab $0x10, (x1+3)+0x200
012C: 012F4611 fmsd : lab $0x11, (x1+3)+0x200
012D: 1C1C3231 mov d, $0x31
012E: 01AF7412 fspd : lab $0x12, (x1-6)+0x200
012F: 012F4613 fmsd : lab $0x13, (x1+3)+0x200
0130: 012F4614 fmsd : lab $0x14, (x1+3)+0x200
0131: 1C1C3229 mov d, $0x29
0132: 01AF7415 fspd : lab $0x15, (x1-6)+0x200
0133: 012F4616 fmsd : lab $0x16, (x1+3)+0x200
0134: 012F4617 fmsd : lab $0x17, (x1+3)+0x200
0135: 1C1C322C mov d, $0x2c
0136: 01AF7418 fspd : lab $0x18, (x1-6)+0x200
0137: 012F4619 fmsd : lab $0x19, (x1+3)+0x200
0138: 012F461A fmsd : lab $0x1a, (x1+3)+0x200
0139: 1C1C322F mov d, $0x2f
013A: 01AF461B fspd : lab $0x1b, (x1+3)+0x200
013B: 1D3DA198 fmsd : mov (bx1-8), a
013C: 00CF4610 fadd : lab $0x10, (x1+3)+0x200
013D: 012F4611 fmsd : lab $0x11, (x1+3)+0x200
013E: 1C1C3232 mov d, $0x32
013F: 01AF7412 fspd : lab $0x12, (x1-6)+0x200
0140: 012F4613 fmsd : lab $0x13, (x1+3)+0x200
0141: 012F4614 fmsd : lab $0x14, (x1+3)+0x200
0142: 1C1C322A mov d, $0x2a
0143: 01AF7415 fspd : lab $0x15, (x1-6)+0x200
0144: 012F4616 fmsd : lab $0x16, (x1+3)+0x200
0145: 012F4617 fmsd : lab $0x17, (x1+3)+0x200
0146: 1C1C322D mov d, $0x2d
0147: 01AF7418 fspd : lab $0x18, (x1-6)+0x200
0148: 012F4619 fmsd : lab $0x19, (x1+3)+0x200
0149: 012F461A fmsd : lab $0x1a, (x1+3)+0x200
014A: 1C1C3230 mov d, $0x30
014B: 01AF461B fspd : lab $0x1b, (x1+3)+0x200
014C: 1D3DA180 fmsd : mov (bx1), a
014D: 1D9D8607 fsmd : mov $7, x1
014E: 1CDF1E10 fadd
014F: 1C1C3233 mov d, $0x33
0150: 42000028 ldi #0x28, x0
0151: 3C04000C rep #0xc
0152: 1C0F43A1 mov (x0+1), (x1+1)+0x200
0153: BF60004C brif alw #0x4c

-- 0a
0154: 1C1F2021 mov rf1, a
0155: 1C1F2621 mov rf1, b
0156: BF640797 bsif alw #0x797
0157: 1C1E3227 mov $0x27 (e), d
0158: 5F000010 ldi #0x10, sft
0159: 1EFF1E10 lsld
015A: 1F1F1E10 asrd
015B: 1C1F4419 mov d, rf2
015C: BF60004C brif alw #0x4c

-- 0b
015D: 1C1C425C mov rf1, $0x5c
015E: 1C1C425D mov rf1, $0x5d
015F: 1C1C425E mov rf1, $0x5e
0160: 1C0CB85C mov $0x5c, $0x25c
0161: 1C0CBA5D mov $0x5d, $0x25d
0162: 1C0CBC5E mov $0x5e, $0x25e
0163: 1C1C4256 mov rf1, $0x56
0164: 1C1C4257 mov rf1, $0x57
0165: 1C1C4258 mov rf1, $0x58
0166: 1C1C4259 mov rf1, $0x59
0167: 1C1C425A mov rf1, $0x5a
0168: 1C1C425B mov rf1, $0x5b
0169: 1C0CB259 mov $0x59, $0x259
016A: 1C0CB45A mov $0x5a, $0x25a
016B: 1C0CB65B mov $0x5b, $0x25b
016C: 000CBA57 lab $0x57, $0x25d
016D: 036CB658 subd : lab $0x58, $0x25b
016E: 1F7F2019 subd : mov d, a
016F: 1C1F2619 mov d, b
0170: 010CBC58 fml : lab $0x58, $0x25e
0171: 036CB457 subd : lab $0x57, $0x25a
0172: 1F7F2019 subd : mov d, a
0173: 1C1F2619 mov d, b
0174: 01ACBC58 fspd : lab $0x58, $0x25e
0175: 1D5F1E10 fmrd
0176: 1C1C3262 mov d, $0x62
0177: 036CB256 subd : lab $0x56, $0x259
0178: 1F7F2019 subd : mov d, a
0179: 1C1F2619 mov d, b
017A: 010CB856 fml : lab $0x56, $0x25c
017B: 036CB658 subd : lab $0x58, $0x25b
017C: 1F7F2019 subd : mov d, a
017D: 1C1F2619 mov d, b
017E: 01ACB856 fspd : lab $0x56, $0x25c
017F: 1D4CC462 fmrd : mov $0x62, $0x262
0180: 1C1C3263 mov d, $0x63
0181: 036CB457 subd : lab $0x57, $0x25a
0182: 1F7F2019 subd : mov d, a
0183: 1C1F2619 mov d, b
0184: 010CBA57 fml : lab $0x57, $0x25d
0185: 036CB256 subd : lab $0x56, $0x259
0186: 1F7F2019 subd : mov d, a
0187: 1C1F2619 mov d, b
0188: 1DACC663 fspd : mov $0x63, $0x263
0189: 1D5F1E10 fmrd
018A: 1C1C3264 mov d, $0x64
018B: 000CC462 lab $0x62, $0x262
018C: 010CC663 fml : lab $0x63, $0x263
018D: 1DACC864 fspd : mov $0x64, $0x264
018E: 000CC864 lab $0x64, $0x264
018F: 1D3F1E10 fmsd
0190: 1D9F1E10 fsmd
0191: 1C1F2019 mov d, a
0192: 1C1CA02A mov a, $0x2a (e)
0193: 5100007F ldi #0x7f, ah
0194: 1C1E262A mov $0x2a (e), b
0195: 1D1E322B fml : mov $0x2b (e), d
0196: 1D5DA062 fmrd : mov $0x62, a
0197: 1C1F2619 mov d, b
0198: 1D1DA063 fml : mov $0x63, a
0199: 1C1F441C mov p, rf2
019A: 1D1DA064 fml : mov $0x64, a
019B: 1C1F441C mov p, rf2
019C: 1D1F1E10 fml
019D: 1C1F441C mov p, rf2
019E: BF60004C brif alw #0x4c

-- 0c
019F: 1C1C4270 mov rf1, $0x70
01A0: 1C0CE070 mov $0x70, $0x270
01A1: 000CE070 lab $0x70, $0x270
01A2: 1C1C4271 mov rf1, $0x71
01A3: 1C0CE271 mov $0x71, $0x271
01A4: 010CE271 fml : lab $0x71, $0x271
01A5: 1C1C4273 mov rf1, $0x73
01A6: 1C0CE673 mov $0x73, $0x273
01A7: 01ACE673 fspd : lab $0x73, $0x273
01A8: 1D3F1E10 fmsd
01A9: 1D9F1E10 fsmd
01AA: 1C1F2019 mov d, a
01AB: 1C1CA02A mov a, $0x2a (e)
01AC: 5100007F ldi #0x7f, ah
01AD: 1C1E262A mov $0x2a (e), b
01AE: 1D1E322B fml : mov $0x2b (e), d
01AF: 1D5DA070 fmrd : mov $0x70, a
01B0: 1C1F2619 mov d, b
01B1: 1D1DA071 fml : mov $0x71, a
01B2: 1C1F441C mov p, rf2
01B3: 1D1DA073 fml : mov $0x73, a
01B4: 1C1F441C mov p, rf2
01B5: 1D1F1E10 fml
01B6: 1C1F441C mov p, rf2
01B7: BF60004C brif alw #0x4c

-- 0d
01B8: 1C1F2021 mov rf1, a
01B9: BF6407CB bsif alw #0x7cb
01BA: BF60004C brif alw #0x4c

-- 0e
01BB: 43000040 ldi #0x40, x1
01BC: 1C1C4381 mov rf1, (bx1+1)
01BD: 1C1C4381 mov rf1, (bx1+1)
01BE: 1C1C4381 mov rf1, (bx1+1)
01BF: 1C1C4381 mov rf1, (bx1+1)
01C0: BF60004C brif alw #0x4c

-- 0f
01C1: 1C1F3221 mov rf1, d
01C2: 1C1F2621 mov rf1, b
01C3: 1C1F2021 mov rf1, a
01C4: 1CFF3821 fsbd : mov rf1, p
01C5: 1C1C3270 mov d, $0x70
01C6: 1C1F3213 mov b, d
01C7: 1C1F201C mov p, a
01C8: 1CFF1E10 fsbd
01C9: 1C1F2619 mov d, b
01CA: 1C1DA070 mov $0x70, a
01CB: BF640797 bsif alw #0x797
01CC: 1C1E3227 mov $0x27 (e), d
01CD: 5F000010 ldi #0x10, sft
01CE: 1EFF1E10 lsld
01CF: 1F1F1E10 asrd
01D0: 1C1F4419 mov d, rf2
01D1: BF60004C brif alw #0x4c

-- 10
01D2: 1C1D8607 mov $7, x1
01D3: 3C04000C rep #0xc
01D4: 1C0F4203 mov $3, (x1+1)+0x200
01D5: 1C1D8607 mov $7, x1
01D6: 3C040003 rep #3
01D7: 1C0F4804 mov $4, (x1+4)+0x200
01D8: BF60004C brif alw #0x4c

-- 11
01D9: 1C1D8607 mov $7, x1
01DA: 3C04000C rep #0xc
01DB: 1C1DC581 mov (bx1+1), rf2
01DC: BF60004C brif alw #0x4c

-- 12
01DD: 1C1D8607 mov $7, x1
01DE: 1C1C4253 mov rf1, $0x53
01DF: 000F4653 lab $0x53, (x1+3)+0x200
01E0: 1C1C4254 mov rf1, $0x54
01E1: 010F4C54 fml : lab $0x54, (x1+6)+0x200
01E2: 1C1DB39D mov (bx1-3), d
01E3: 1C1C4255 mov rf1, $0x55
01E4: 012F7655 fmsd : lab $0x55, (x1-5)+0x200
01E5: 012F4653 fmsd : lab $0x53, (x1+3)+0x200
01E6: 012F4A54 fmsd : lab $0x54, (x1+5)+0x200
01E7: 1C1C3381 mov d, (bx1+1)
01E8: 1C1DB39D mov (bx1-3), d
01E9: 012F7655 fmsd : lab $0x55, (x1-5)+0x200
01EA: 012F4653 fmsd : lab $0x53, (x1+3)+0x200
01EB: 012F4A54 fmsd : lab $0x54, (x1+5)+0x200
01EC: 1C1C3381 mov d, (bx1+1)
01ED: 1C1DB39D mov (bx1-3), d
01EE: 012F4655 fmsd : lab $0x55, (x1+3)+0x200
01EF: 1D3F1E10 fmsd
01F0: 1D3F1E10 fmsd
01F1: 1C1C3380 mov d, (bx1)
01F2: BF60004C brif alw #0x4c

-- 13
01F3: 1C1D8607 mov $7, x1
01F4: 1C1C4253 mov rf1, $0x53
01F5: 000F4653 lab $0x53, (x1+3)+0x200
01F6: 1D1C4254 fml : mov rf1, $0x54
01F7: 000F7A54 lab $0x54, (x1-3)+0x200
01F8: 1DBC4255 fspd : mov rf1, $0x55
01F9: 1C1C3383 mov d, (bx1+3)
01FA: 1C1C3983 mov p, (bx1+3)
01FB: 000F7655 lab $0x55, (x1-5)+0x200
01FC: 010F4653 fml : lab $0x53, (x1+3)+0x200
01FD: 01AF4454 fspd : lab $0x54, (x1+2)+0x200
01FE: 1C1C339B mov d, (bx1-5)
01FF: 1C1C3986 mov p, (bx1+6)
0200: 010F7655 fml : lab $0x55, (x1-5)+0x200
0201: 01AF4453 fspd : lab $0x53, (x1+2)+0x200
0202: 1C1C3383 mov d, (bx1+3)
0203: 1C1C399E mov p, (bx1-2)
0204: 010F4654 fml : lab $0x54, (x1+3)+0x200
0205: 01AF7455 fspd : lab $0x55, (x1-6)+0x200
0206: 1C1C3383 mov d, (bx1+3)
0207: 1D1C3983 fml : mov p, (bx1+3)
0208: 1C1C3980 mov p, (bx1)
0209: BF60004C brif alw #0x4c

-- 14
020A: 1C1D8607 mov $7, x1
020B: 1C1CC220 mov rf1, $0x20 (e)
020C: 000F4674 lab $0x74, (x1+3)+0x200
020D: 1C08E021 mov $0x21 (e), $0x70
020E: 1C08E620 mov $0x20 (e), $0x73
020F: 000F4670 lab $0x70, (x1+3)+0x200
0210: 010F7A73 fml : lab $0x73, (x1-3)+0x200
0211: 01AF4673 fspd : lab $0x73, (x1+3)+0x200
0212: 014F7A70 fmrd : lab $0x70, (x1-3)+0x200
0213: 1C1C3381 mov d, (bx1+1)
0214: 01AF4670 fspd : lab $0x70, (x1+3)+0x200
0215: 012F7E73 fmsd : lab $0x73, (x1-1)+0x200
0216: 1C1C339E mov d, (bx1-2)
0217: 01AF4673 fspd : lab $0x73, (x1+3)+0x200
0218: 014F7A70 fmrd : lab $0x70, (x1-3)+0x200
0219: 1C1C3381 mov d, (bx1+1)
021A: 01AF4670 fspd : lab $0x70, (x1+3)+0x200
021B: 012F7E73 fmsd : lab $0x73, (x1-1)+0x200
021C: 1C1C339E mov d, (bx1-2)
021D: 01AF4673 fspd : lab $0x73, (x1+3)+0x200
021E: 014F7A70 fmrd : lab $0x70, (x1-3)+0x200
021F: 1DBC3383 fspd : mov d, (bx1+3)
0220: 1D9F1E10 fsmd
0221: 1C1C3380 mov d, (bx1)
0222: BF60004C brif alw #0x4c

-- 15
0223: 1C1D8607 mov $7, x1
0224: 1C1CC220 mov rf1, $0x20 (e)
0225: 1C08E021 mov $0x21 (e), $0x70
0226: 1C08E620 mov $0x20 (e), $0x73
0227: 000F4C70 lab $0x70, (x1+6)+0x200
0228: 010F4073 fml : lab $0x73, (x1)+0x200
0229: 01AF7470 fspd : lab $0x70, (x1-6)+0x200
022A: 012F4073 fmsd : lab $0x73, (x1)+0x200
022B: 1C1C3381 mov d, (bx1+1)
022C: 01AF4C70 fspd : lab $0x70, (x1+6)+0x200
022D: 014F7E73 fmrd : lab $0x73, (x1-1)+0x200
022E: 1C1C3381 mov d, (bx1+1)
022F: 01AF7470 fspd : lab $0x70, (x1-6)+0x200
0230: 012F4073 fmsd : lab $0x73, (x1)+0x200
0231: 1C1C3381 mov d, (bx1+1)
0232: 01AF4C70 fspd : lab $0x70, (x1+6)+0x200
0233: 014F7E73 fmrd : lab $0x73, (x1-1)+0x200
0234: 1C1C3381 mov d, (bx1+1)
0235: 01AF7470 fspd : lab $0x70, (x1-6)+0x200
0236: 012F4073 fmsd : lab $0x73, (x1)+0x200
0237: 1DBC3386 fspd : mov d, (bx1+6)
0238: 1D5F1E10 fmrd
0239: 1C1C3380 mov d, (bx1)
023A: BF60004C brif alw #0x4c

-- 16
023B: 1C1D8607 mov $7, x1
023C: 1C1CC220 mov rf1, $0x20 (e)
023D: 1C08E021 mov $0x21 (e), $0x70
023E: 1C08E620 mov $0x20 (e), $0x73
023F: 000F4670 lab $0x70, (x1+3)+0x200
0240: 010F7A73 fml : lab $0x73, (x1-3)+0x200
0241: 01AF4673 fspd : lab $0x73, (x1+3)+0x200
0242: 014F7A70 fmrd : lab $0x70, (x1-3)+0x200
0243: 1C1C3381 mov d, (bx1+1)
0244: 01AF4670 fspd : lab $0x70, (x1+3)+0x200
0245: 012F7E73 fmsd : lab $0x73, (x1-1)+0x200
0246: 1C1C339E mov d, (bx1-2)
0247: 01AF4673 fspd : lab $0x73, (x1+3)+0x200
0248: 014F7A70 fmrd : lab $0x70, (x1-3)+0x200
0249: 1C1C3381 mov d, (bx1+1)
024A: 01AF4670 fspd : lab $0x70, (x1+3)+0x200
024B: 012F7E73 fmsd : lab $0x73, (x1-1)+0x200
024C: 1C1C339E mov d, (bx1-2)
024D: 01AF4673 fspd : lab $0x73, (x1+3)+0x200
024E: 014F7A70 fmrd : lab $0x70, (x1-3)+0x200
024F: 1DBC3383 fspd : mov d, (bx1+3)
0250: 1D9F1E10 fsmd
0251: 1C1C3380 mov d, (bx1)
0252: BF60004C brif alw #0x4c

-- 17
0253: 1C109600 mov $0x200, $0x4b
0254: 39000110 lia #0x110
0255: 1C1C204D mov a, $0x4d
0256: 1C1F2021 mov rf1, a
0257: 1C1DB269 mov $0x69, d
0258: 1F5C4253 addd : mov rf1, $0x53
0259: 1C1C3238 mov d, $0x38
025A: 1C1C4255 mov rf1, $0x55
025B: 1C1F4619 mov d, rf3
025C: 3900FFFF lia #0xffff
025D: 1C2CAA55 andd : mov $0x55, $0x255
025E: 1C1F0419 mov d, x0
025F: 1C0895A1 mov (x0+1) (e), $0x4a
0260: 1C1DB24A mov $0x4a, d
0261: 1C1DA000 mov $0, a
0262: 1F7F1E10 subd
0263: BE00029A brif zrd #0x29a
0264: 1C1DC638 mov $0x38, rf3
0265: 1C089DA1 mov (x0+1) (e), $0x4e
0266: 1C1C0466 mov x0, $0x66
0267: 1C1DB24E mov $0x4e, d
0268: 5F000004 ldi #0x4, sft
0269: 1EECA653 lsld : mov $0x53, $0x253
026A: 1C1DA06A mov $0x6a, a
026B: 1F5F1E10 addd
026C: 1C1F4619 mov d, rf3
026D: 3900FFFF lia #0xffff
026E: 1C3F1E10 andd
026F: 1C1F0419 mov d, x0
0270: 43000100 ldi #0x100, x1
0271: 3C04000C rep #0xc
0272: 1C0B03A1 mov (x0+1) (e), (bx1+1)
0273: 42000100 ldi #0x100, x0
0274: 1C10ADA1 mov (x0+1)+0x200, $0x56
0275: 1C10AFA1 mov (x0+1)+0x200, $0x57
0276: 1C10B1A1 mov (x0+1)+0x200, $0x58
0277: 1C0F4256 mov $0x56, (x1+1)+0x200
0278: 1C0F4257 mov $0x57, (x1+1)+0x200
0279: 1C0F6458 mov $0x58, (x1-0xe)+0x200
027A: 1C0CAC56 mov $0x56, $0x256
027B: 1C0CB058 mov $0x58, $0x258
027C: 4C000004 ldi #0x4, c0
027D: 000F4455 lab $0x55, (x1+2)+0x200
027E: 010F4253 fml : lab $0x53, (x1+1)+0x200
027F: 01AF4455 fspd : lab $0x55, (x1+2)+0x200
0280: 1C1C2659 mov b, $0x59
0281: 014F7C53 fmrd : lab $0x53, (x1-2)+0x200
0282: 1C1C265B mov b, $0x5b
0283: 014CAC5B fmrd : lab $0x5b, $0x256
0284: 012CB059 fmsd : lab $0x59, $0x258
0285: 1D4CAC59 fmrd : mov $0x59, $0x256
0286: 1D2CB05B fmsd : mov $0x5b, $0x258
0287: FE100293 brif !ged #0x293
0288: BF00027D brif zc0 #0x27d
0289: 63000000 ldi #0x0, rf3
028A: BF640684 bsif alw #0x684
028B: 1C1D864D mov $0x4d, x1
028C: 1C0F4254 mov $0x54, (x1+1)+0x200
028D: 1C0F424E mov $0x4e, (x1+1)+0x200
028E: 1C1C064D mov x1, $0x4d
028F: 39000001 lia #0x1
0290: 1C1DB24B mov $0x4b, d
0291: 1F5F1E10 addd
0292: 1C1C324B mov d, $0x4b
0293: 1C1DB24A mov $0x4a, d
0294: 1C1DA001 mov $1, a
0295: 1F7D8466 subd : mov $0x66, x0
0296: 1C1C324A mov d, $0x4a
0297: BE000299 brif zrd #0x299
0298: BF600264 brif alw #0x264
0299: 43000110 ldi #0x110, x1
029A: 1C1DC44B mov $0x4b, rf2
029B: 1C1DA04B mov $0x4b, a
029C: 1C1DB200 mov $0, d
029D: 1F5C2070 addd : mov a, $0x70
029E: BE0002A5 brif zrd #0x2a5
029F: 1C1DC581 mov (bx1+1), rf2
02A0: 1C1DB270 mov $0x70, d
02A1: 39000001 lia #0x1
02A2: 1F7DC581 subd : mov (bx1+1), rf2
02A3: 1C1C3270 mov d, $0x70
02A4: FE00029F brif !zrd #0x29f
02A5: 39000000 lia #0x0
02A6: 1C1F4610 mov a, rf3
02A7: 40000000 ldi #0x0, b0
02A8: 41000200 ldi #0x200, b1
02A9: BF60004C brif alw #0x4c

-- 18
02AA: BF6407BE bsif alw #0x7be
02AB: 43000056 ldi #0x56, x1
02AC: 3C04000C rep #0xc
02AD: 1C1DC5A1 mov (x1+1), rf2
02AE: 40000000 ldi #0x0, b0
02AF: BF60004C brif alw #0x4c

-- 19
02B0: 1C1DC409 mov $9, rf2
02B1: BF60004C brif alw #0x4c

-- 1a
02B2: 1C1D8407 mov $7, x0
02B3: 1C103289 mov $0x209(x0), $0x19
02B4: 1C10348A mov $0x20a(x0), $0x1a
02B5: 1C10368B mov $0x20b(x0), $0x1b
02B6: 1C1DB219 mov $0x19, d
02B7: 1C1C4253 mov rf1, $0x53
02B8: 0010A680 lab $0x200(x0), $0x53
02B9: 1D1C4254 fml : mov rf1, $0x54
02BA: 0010A883 lab $0x203(x0), $0x54
02BB: 1D3C4255 fmsd : mov rf1, $0x55
02BC: 0010AA86 lab $0x206(x0), $0x55
02BD: 0130A681 fmsd : lab $0x201(x0), $0x53
02BE: 0130A884 fmsd : lab $0x204(x0), $0x54
02BF: 1C1F4419 mov d, rf2
02C0: 1C1DB21A mov $0x1a, d
02C1: 0130AA87 fmsd : lab $0x207(x0), $0x55
02C2: 0130A682 fmsd : lab $0x202(x0), $0x53
02C3: 0130A885 fmsd : lab $0x205(x0), $0x54
02C4: 1C1F4419 mov d, rf2
02C5: 1C1DB21B mov $0x1b, d
02C6: 0130AA88 fmsd : lab $0x208(x0), $0x55
02C7: 1D3F1E10 fmsd
02C8: 1D9F1E10 fsmd
02C9: 1C1F4419 mov d, rf2
02CA: BF60004C brif alw #0x4c

-- 1b
02CB: 1C1CC220 mov rf1, $0x20 (e)
02CC: 1C1E4420 mov $0x20 (e), rf2
02CD: BF60004C brif alw #0x4c

-- 1c
02CE: 1C1CC220 mov rf1, $0x20 (e)
02CF: 1C1E4421 mov $0x21 (e), rf2
02D0: BF60004C brif alw #0x4c

-- 1d
02D1: 1C1CC220 mov rf1, $0x20 (e)
02D2: 1C1E2020 mov $0x20 (e), a
02D3: 1C1F2621 mov rf1, b
02D4: 1D1F1E10 fml
02D5: 1C1F441C mov p, rf2
02D6: BF60004C brif alw #0x4c

-- 1e
02D7: 1C1CC220 mov rf1, $0x20 (e)
02D8: 1C1E2021 mov $0x21 (e), a
02D9: 1C1F2621 mov rf1, b
02DA: 1D1F1E10 fml
02DB: 1C1F441C mov p, rf2
02DC: BF60004C brif alw #0x4c

-- 1f
02DD: 1C1C427B mov rf1, $0x7b
02DE: 1C1C427C mov rf1, $0x7c
02DF: 1C1C427D mov rf1, $0x7d
02E0: 1C1C4270 mov rf1, $0x70
02E1: 1C0CF670 mov $0x70, $0x27b
02E2: 1C1C4270 mov rf1, $0x70
02E3: 1C0CF870 mov $0x70, $0x27c
02E4: 1C1C4270 mov rf1, $0x70
02E5: 1C0CFA70 mov $0x70, $0x27d
02E6: 0010F67B lab $0x27b, $0x7b
02E7: 0290F87C d=b-a : lab $0x27c, $0x7c
02E8: 1C1C327B mov d, $0x7b
02E9: 0290FA7D d=b-a : lab $0x27d, $0x7d
02EA: 1C1C327C mov d, $0x7c
02EB: 1E8CF67B d=b-a : mov $0x7b, $0x27b
02EC: 1C1C327D mov d, $0x7d
02ED: 000CF67B lab $0x7b, $0x27b
02EE: 1D0CF87C fml : mov $0x7c, $0x27c
02EF: 000CF87C lab $0x7c, $0x27c
02F0: 1DACFA7D fspd : mov $0x7d, $0x27d
02F1: 000CFA7D lab $0x7d, $0x27d
02F2: 1D3F1E10 fmsd
02F3: 1D9F1E10 fsmd
02F4: 1C1C3270 mov d, $0x70
02F5: 1C1F2019 mov d, a
02F6: 1C1CA02A mov a, $0x2a (e)
02F7: 5100007F ldi #0x7f, ah
02F8: 1C1E262A mov $0x2a (e), b
02F9: 1D1E322B fml : mov $0x2b (e), d
02FA: 1D5DA070 fmrd : mov $0x70, a
02FB: 1C1F2619 mov d, b
02FC: 1D1F1E10 fml
02FD: 1C1F441C mov p, rf2
02FE: BF60004C brif alw #0x4c

-- 20 & 21
02FF: BF60004C brif alw #0x4c

-- 22
0300: 1C1F3221 mov rf1, d
0301: 1DFF1E10 cfxd					unsigned 2 float
0302: 1C1F4419 mov d, rf2
0303: BF60004C brif alw #0x4c

-- 23
0304: 1C1F3221 mov rf1, d
0305: 1DDF1E10 cxfd					float 2 unsigned
0306: 1C1F4419 mov d, rf2
0307: BF60004C brif alw #0x4c

-- 24
0308: 1C1C4268 mov rf1, $0x68		 <0x68> = rf1
0309: BF60004C brif alw #0x4c

-- 25
030A: 1C1DC468 mov $0x68, rf2		rf2 =  <0x68>
030B: BF60004C brif alw #0x4c

-- 26
030C: 1C1F2021 mov rf1, a			a = rf1
030D: 1C1DB268 mov $0x68, d			d = <0x68>
030E: 1CDF1E10 fadd					d += a
030F: 1C1C3268 mov d, $0x68			<0x68> = d
0310: BF60004C brif alw #0x4c

-- 27
0311: 1C1F2021 mov rf1, a			a = rf1
0312: 1C1DB268 mov $0x68, d			d = <0x68>
0313: 1CFF1E10 fsbd					d -= a
0314: 1C1C3268 mov d, $0x68			<0x68> = d

0315: BF60004C brif alw #0x4c

-- 28
0316: 1C1F2021 mov rf1, a			a = rf1
0317: 1C1DA668 mov $0x68, b			d = <0x68>
0318: 1D1F1E10 fml					08		a * b
0319: 1C1C3868 mov p, $0x68			<0x68> = p

031A: BF60004C brif alw #0x4c

-- 29
031B: 1C1DB268 mov $0x68, d
031C: 1C1C3270 mov d, $0x70
031D: 1C1F2021 mov rf1, a
031E: 1C1CA028 mov a, $0x28 (e)
031F: 5100007F ldi #0x7f, ah
0320: 1C1E3228 mov $0x28 (e), d
0321: 1D7F1E10 fabd
0322: 1C1F2619 mov d, b
0323: 1D1E3229 fml : mov $0x29 (e), d
0324: 1D5DA070 fmrd : mov $0x70, a
0325: 1C1F2619 mov d, b
0326: 1D1F1E10 fml
0327: 1C1C3868 mov p, $0x68
0328: BF60004C brif alw #0x4c

-- 2a
0329: BF6407BE bsif alw #0x7be
032A: 1C1C4270 mov rf1, $0x70
032B: 1C0C6070 mov $0x70, $0x230
032C: 1C1C4270 mov rf1, $0x70
032D: 1C0C6470 mov $0x70, $0x232
032E: 1C044065 mov $0x65, $0x20 (e)
032F: 1C08EA20 mov $0x20 (e), $0x75
0330: 1C08EC21 mov $0x21 (e), $0x76
0331: 0010B032 lab $0x232, $0x58
0332: 1E9DA075 d=b-a : mov $0x75, a
0333: 1C1F2619 mov d, b
0334: 0110AC30 fml : lab $0x230, $0x56
0335: 1C1C3873 mov p, $0x73
0336: 1E9DA076 d=b-a : mov $0x76, a
0337: 1C1F2619 mov d, b
0338: 1D1DB273 fml : mov $0x73, d
0339: 0190B632 fsmd : lab $0x232, $0x5b
033A: 1C1C3244 mov d, $0x44
033B: 1C1DC444 mov $0x44, rf2
033C: 1E9DA075 d=b-a : mov $0x75, a
033D: 1C1F2619 mov d, b
033E: 0110B230 fml : lab $0x230, $0x59
033F: 1C1C3873 mov p, $0x73
0340: 1E9DA076 d=b-a : mov $0x76, a
0341: 1C1F2619 mov d, b
0342: 1D1DB273 fml : mov $0x73, d
0343: 1D9DA044 fsmd : mov $0x44, a
0344: 1C1F4419 mov d, rf2
0345: 1CDDA005 fadd : mov $5, a
0346: 1C1F2619 mov d, b
0347: 1D1DA600 fml : mov $0, b
0348: 5400007E ldi #0x7e, bh
0349: 1C1F201C mov p, a
034A: 1D1F1E10 fml
034B: 1C1F441C mov p, rf2
034C: 1C044065 mov $0x65, $0x20 (e)
034D: 1C08EA22 mov $0x22 (e), $0x75
034E: 1C08EC21 mov $0x21 (e), $0x76
034F: 0010B230 lab $0x230, $0x59
0350: 1E9DA075 d=b-a : mov $0x75, a
0351: 1C1F2619 mov d, b
0352: 0110B632 fml : lab $0x232, $0x5b
0353: 1C1C3873 mov p, $0x73
0354: 1E9DA076 d=b-a : mov $0x76, a
0355: 1C1F2619 mov d, b
0356: 1D1DB273 fml : mov $0x73, d
0357: 0190B830 fsmd : lab $0x230, $0x5c
0358: 1C1C3244 mov d, $0x44
0359: 1C1DC444 mov $0x44, rf2
035A: 1E9DA075 d=b-a : mov $0x75, a
035B: 1C1F2619 mov d, b
035C: 0110BC32 fml : lab $0x232, $0x5e
035D: 1C1C3873 mov p, $0x73
035E: 1E9DA076 d=b-a : mov $0x76, a
035F: 1C1F2619 mov d, b
0360: 1D1DB273 fml : mov $0x73, d
0361: 1D9DA044 fsmd : mov $0x44, a
0362: 1C1F4419 mov d, rf2
0363: 1CDDA005 fadd : mov $5, a
0364: 1C1F2619 mov d, b
0365: 1D1DA600 fml : mov $0, b
0366: 5400007E ldi #0x7e, bh
0367: 1C1F201C mov p, a
0368: 1D1F1E10 fml
0369: 1C1F441C mov p, rf2
036A: 40000000 ldi #0x0, b0
036B: BF60004C brif alw #0x4c

-- 2b
036C: BF6407BE bsif alw #0x7be
036D: 1C1C4270 mov rf1, $0x70
036E: 1C0C6070 mov $0x70, $0x230
036F: 1C1C4270 mov rf1, $0x70
0370: 1C0C6270 mov $0x70, $0x231
0371: 1C1C4270 mov rf1, $0x70
0372: 1C0C6470 mov $0x70, $0x232
0373: 1C1C4270 mov rf1, $0x70
0374: 1C0C6C70 mov $0x70, $0x236
0375: 1C1C4270 mov rf1, $0x70
0376: 1C0C6A70 mov $0x70, $0x235
0377: 1C10E235 mov $0x235, $0x71
0378: 1C1DB271 mov $0x71, d
0379: 1C1DB800 mov $0, p
037A: 01CC6C74 cxfd : lab $0x74, $0x236
037B: 1C1C3271 mov d, $0x71
037C: 1C1F3213 mov b, d
037D: 1DDF1E10 cxfd
037E: 1C1C3274 mov d, $0x74
037F: 1C0C6C74 mov $0x74, $0x236
0380: 3C000010 clr0 d
0381: 5A00007D ldi #0x7d, dh
0382: 1C1C3244 mov d, $0x44
0383: 43000056 ldi #0x56, x1
0384: 1C10C430 mov $0x230, $0x62
0385: BF6403AA bsif alw #0x3aa
0386: 43000057 ldi #0x57, x1
0387: 1C10C431 mov $0x231, $0x62
0388: BF6403AA bsif alw #0x3aa
0389: 43000058 ldi #0x58, x1
038A: 1C10C432 mov $0x232, $0x62
038B: BF6403AA bsif alw #0x3aa
038C: 1C1DB25B mov $0x5b, d
038D: 1C1DA058 mov $0x58, a
038E: 1CFDA056 fsbd : mov $0x56, a
038F: 1C1F2619 mov d, b
0390: 1C1DB259 mov $0x59, d
0391: 1CFF1E10 fsbd
0392: 1C1F2019 mov d, a
0393: BF640797 bsif alw #0x797
0394: 1C1E3227 mov $0x27 (e), d
0395: 5F000010 ldi #0x10, sft
0396: 1EFF1E10 lsld
0397: 1F1DB800 asrd : mov $0, p
0398: 01D0E036 cxfd : lab $0x236, $0x70
0399: 1CFDA071 fsbd : mov $0x71, a
039A: 1C1C3270 mov d, $0x70
039B: 1C1CA028 mov a, $0x28 (e)
039C: 5100007F ldi #0x7f, ah
039D: 1C1E3228 mov $0x28 (e), d
039E: 1D7F1E10 fabd
039F: 1C1F2619 mov d, b
03A0: 1D1E3229 fml : mov $0x29 (e), d
03A1: 1D5F1E10 fmrd
03A2: 1C1F2619 mov d, b
03A3: 1C1DA070 mov $0x70, a
03A4: 1D1F1E10 fml
03A5: 1C1F321C mov p, d
03A6: 1DFF1E10 cfxd
03A7: 1C1F4419 mov d, rf2
03A8: 40000000 ldi #0x0, b0
03A9: BF60004C brif alw #0x4c
03AA: 1C1DB3A3 mov (x1+3), d
03AB: 1C1DA1A3 mov (x1+3), a
03AC: 1CDDA1A3 fadd : mov (x1+3), a
03AD: 1CDDA1A0 fadd : mov (x1), a
03AE: 1CDF1E10 fadd
03AF: 1C1F2619 mov d, b
03B0: 1C1DA044 mov $0x44, a
03B1: 1D1DA062 fml : mov $0x62, a
03B2: 1C1F321C mov p, d
03B3: 1CFF1E10 fsbd
03B4: 1C1C3270 mov d, $0x70
03B5: 1C1DA071 mov $0x71, a
03B6: 1C1CA028 mov a, $0x28 (e)
03B7: 5100007F ldi #0x7f, ah
03B8: 1C1E3228 mov $0x28 (e), d
03B9: 1D7F1E10 fabd
03BA: 1C1F2619 mov d, b
03BB: 1D1E3229 fml : mov $0x29 (e), d
03BC: 1D5F1E10 fmrd
03BD: 1C1F2619 mov d, b
03BE: 1C1DA070 mov $0x70, a
03BF: 1D1F1E10 fml
03C0: 1C1F441C mov p, rf2
03C1: BF6A0000 rtif alw

-- 2c
03C2: BF6407BE bsif alw #0x7be
03C3: 1C1DC462 mov $0x62, rf2
03C4: 1C1DC463 mov $0x63, rf2
03C5: 1C1DC464 mov $0x64, rf2
03C6: BF60004C brif alw #0x4c

-- 2d
03C7: 1C1F2021 mov rf1, a
03C8: 1C1CA02A mov a, $0x2a (e)
03C9: 5100007F ldi #0x7f, ah
03CA: 1C1E262A mov $0x2a (e), b
03CB: 1D1E322B fml : mov $0x2b (e), d
03CC: 1D5F1E10 fmrd
03CD: 1C1F4419 mov d, rf2
03CE: BF60004C brif alw #0x4c

-- 2e
03CF: 000C8074 lab $0x74, $0x240
03D0: 1C1F2021 mov rf1, a
03D1: 028C8274 d=b-a : lab $0x74, $0x241
03D2: 1C1C3270 mov d, $0x70
03D3: 1C1F2021 mov rf1, a
03D4: 028C8474 d=b-a : lab $0x74, $0x242
03D5: 1C1C3271 mov d, $0x71
03D6: 1C1F2021 mov rf1, a
03D7: 1E8CE070 d=b-a : mov $0x70, $0x270
03D8: 1C1C3273 mov d, $0x73
03D9: 000CE070 lab $0x70, $0x270
03DA: 1D0CE271 fml : mov $0x71, $0x271
03DB: 000CE271 lab $0x71, $0x271
03DC: 1DACE673 fspd : mov $0x73, $0x273
03DD: 000CE673 lab $0x73, $0x273
03DE: 1D30E243 fmsd : mov $0x243, $0x71
03DF: 1D9F1E10 fsmd
03E0: 1C1C3270 mov d, $0x70
03E1: 1C1F2019 mov d, a
03E2: 1C1CA02A mov a, $0x2a (e)
03E3: 5100007F ldi #0x7f, ah
03E4: 1C1E262A mov $0x2a (e), b
03E5: 1D1E322B fml : mov $0x2b (e), d
03E6: 1D5DA070 fmrd : mov $0x70, a
03E7: 1C1F2619 mov d, b
03E8: 1D1DB200 fml : mov $0, d
03E9: 1D9C386B fsmd : mov p, $0x6b
03EA: 1C1DA071 mov $0x71, a
03EB: 1CFF1E10 fsbd
03EC: 1C1C326C mov d, $0x6c
03ED: 1C1DC46C mov $0x6c, rf2
03EE: BF60004C brif alw #0x4c

-- 2f
03EF: 000C8074 lab $0x74, $0x240
03F0: 1C1F2021 mov rf1, a
03F1: 028C8274 d=b-a : lab $0x74, $0x241
03F2: 1C1C3270 mov d, $0x70
03F3: 1C1F2021 mov rf1, a
03F4: 028C8474 d=b-a : lab $0x74, $0x242
03F5: 1C1C3271 mov d, $0x71
03F6: 1C1F2021 mov rf1, a
03F7: 1E8CE070 d=b-a : mov $0x70, $0x270
03F8: 1C1C3273 mov d, $0x73
03F9: 000CE070 lab $0x70, $0x270
03FA: 1D0CE271 fml : mov $0x71, $0x271
03FB: 000CE271 lab $0x71, $0x271
03FC: 1DACE673 fspd : mov $0x73, $0x273
03FD: 000CE673 lab $0x73, $0x273
03FE: 1D30E243 fmsd : mov $0x243, $0x71
03FF: 1D9F1E10 fsmd
0400: 1C1C3270 mov d, $0x70
0401: 1C1F2019 mov d, a
0402: 1C1CA02A mov a, $0x2a (e)
0403: 5100007F ldi #0x7f, ah
0404: 1C1E262A mov $0x2a (e), b
0405: 1D1E322B fml : mov $0x2b (e), d
0406: 1D5DA070 fmrd : mov $0x70, a
0407: 1C1F2619 mov d, b
0408: 1D1DB200 fml : mov $0, d
0409: 1D9C386B fsmd : mov p, $0x6b
040A: 1C1DA071 mov $0x71, a
040B: 1CFF1E10 fsbd
040C: 1C1C326C mov d, $0x6c
040D: 1C1DC46C mov $0x6c, rf2
040E: 1C1DC46B mov $0x6b, rf2
040F: BF60004C brif alw #0x4c

-- 30
0410: BF6407BE bsif alw #0x7be
0411: 1C1DC465 mov $0x65, rf2
0412: BF60004C brif alw #0x4c
0413: 43000120 ldi #0x120, x1
0414: 3C04000C rep #0xc
0415: 1C1C4381 mov rf1, (bx1+1)
0416: BF60004C brif alw #0x4c
0417: 1C1C4253 mov rf1, $0x53
0418: 1C1C4254 mov rf1, $0x54
0419: 1C1C4255 mov rf1, $0x55
041A: 1C0CA653 mov $0x53, $0x253
041B: 1C0CA854 mov $0x54, $0x254
041C: 1C0CAA55 mov $0x55, $0x255
041D: 42000120 ldi #0x120, x0
041E: 1C10ADA1 mov (x0+1)+0x200, $0x56
041F: 1C10AFA1 mov (x0+1)+0x200, $0x57
0420: 1C10B1A0 mov (x0)+0x200, $0x58
0421: 4300012C ldi #0x12c, x1
0422: 1C0F4256 mov $0x56, (x1+1)+0x200
0423: 1C0F4257 mov $0x57, (x1+1)+0x200
0424: 1C0F4058 mov $0x58, (x1)+0x200
0425: 1C0CAC56 mov $0x56, $0x256
0426: 1C0CB058 mov $0x58, $0x258
0427: 43000120 ldi #0x120, x1
0428: 4C000004 ldi #0x4, c0
0429: 000F4455 lab $0x55, (x1+2)+0x200
042A: 010F4253 fml : lab $0x53, (x1+1)+0x200
042B: 01AF4455 fspd : lab $0x55, (x1+2)+0x200
042C: 1C1C2659 mov b, $0x59
042D: 014F7C53 fmrd : lab $0x53, (x1-2)+0x200
042E: 1C1C265B mov b, $0x5b
042F: 014CAC5B fmrd : lab $0x5b, $0x256
0430: 012CB059 fmsd : lab $0x59, $0x258
0431: 1D4CAC59 fmrd : mov $0x59, $0x256
0432: 1D2CB05B fmsd : mov $0x5b, $0x258
0433: FE100438 brif !ged #0x438
0434: BF000429 brif zc0 #0x429
0435: 39FFFFFF lia #0xffffff
0436: 1C1F4410 mov a, rf2
0437: BF60004C brif alw #0x4c
0438: 39000000 lia #0x0
0439: 1C1F4410 mov a, rf2
043A: BF60004C brif alw #0x4c
043B: BF6407BE bsif alw #0x7be
043C: 1C1C4270 mov rf1, $0x70
043D: 1C0CE070 mov $0x70, $0x270
043E: 1C1DB265 mov $0x65, d
043F: 1E2CE203 fned : mov $3, $0x271
0440: 1C1CB220 mov d, $0x20 (e)
0441: 1C08EA20 mov $0x20 (e), $0x75
0442: 1C08EC21 mov $0x21 (e), $0x76
0443: 000CE275 lab $0x75, $0x271
0444: 010CE076 fml : lab $0x76, $0x270
0445: 01ACE276 fspd : lab $0x76, $0x271
0446: 1D9DB862 fsmd : mov $0x62, p
0447: 012CE075 fmsd : lab $0x75, $0x270
0448: 1DBF4419 fspd : mov d, rf2
0449: 1D5DB864 fmrd : mov $0x64, p
044A: 1D9F1E10 fsmd
044B: 1C1F4419 mov d, rf2
044C: BF60004C brif alw #0x4c
044D: 39000684 lia #0x684
044E: 1C1C2035 mov a, $0x35
044F: 390004CA lia #0x4ca
0450: 1C1C2036 mov a, $0x36
0451: BF60045E brif alw #0x45e
0452: 39000518 lia #0x518
0453: 1C1C2035 mov a, $0x35
0454: 390004DB lia #0x4db
0455: 1C1C2036 mov a, $0x36
0456: BF60045E brif alw #0x45e
0457: 1C1F2621 mov rf1, b
0458: 39000684 lia #0x684
0459: 1C1C2035 mov a, $0x35
045A: 390004E9 lia #0x4e9
045B: 1C1C2036 mov a, $0x36
045C: 1C1F3221 mov rf1, d
045D: 1C1C3237 mov d, $0x37
045E: 1C1F3215 mov bl, d
045F: 5F000009 ldi #0x9, sft
0460: 1EFF1E10 lsld
0461: 5F000019 ldi #0x19, sft
0462: 1F1F1E10 asrd
0463: 1C1C323B mov d, $0x3b
0464: 1C1F3215 mov bl, d
0465: 3900FFFF lia #0xffff
0466: 1C3F1E10 andd
0467: 39400000 lia #0x400000
0468: 1F5F1E10 addd
0469: 1C1C323A mov d, $0x3a
046A: 1C1C326E mov d, $0x6e
046B: 1C1DA03B mov $0x3b, a
046C: 1C1F4619 mov d, rf3
046D: 1F5F0619 addd : mov d, x1
046E: 1C1C323A mov d, $0x3a
046F: 1C034002 mov {0} $2, (x1) (e)
0470: 1C109600 mov $0x200, $0x4b
0471: 39000110 lia #0x110
0472: 1C1C204D mov a, $0x4d
0473: 1C1F2021 mov rf1, a
0474: 1C1DB269 mov $0x69, d
0475: 1F5C4253 addd : mov rf1, $0x53
0476: 1C1C3238 mov d, $0x38
0477: 1C1C4255 mov rf1, $0x55
0478: 1C1F4619 mov d, rf3
0479: 3900FFFF lia #0xffff
047A: 1C2CAA55 andd : mov $0x55, $0x255
047B: 1C1F0419 mov d, x0
047C: 1C0895A1 mov (x0+1) (e), $0x4a
047D: 1C1DB24A mov $0x4a, d
047E: 1C1DA000 mov $0, a
047F: 1F7D860D subd : mov $0xd, x1
0480: BE0004B7 brif zrd #0x4b7
0481: 1C1DC638 mov $0x38, rf3
0482: 1C089DA1 mov (x0+1) (e), $0x4e
0483: 1C1C0466 mov x0, $0x66
0484: 1C1DB24E mov $0x4e, d
0485: 5F000004 ldi #0x4, sft
0486: 1EECA653 lsld : mov $0x53, $0x253
0487: 1C1DA06A mov $0x6a, a
0488: 1F5F1E10 addd
0489: 1C1F4619 mov d, rf3
048A: 3900FFFF lia #0xffff
048B: 1C3F1E10 andd
048C: 1C1F0419 mov d, x0
048D: 43000100 ldi #0x100, x1
048E: 3C04000C rep #0xc
048F: 1C0B03A1 mov (x0+1) (e), (bx1+1)
0490: 42000100 ldi #0x100, x0
0491: 1C10ADA1 mov (x0+1)+0x200, $0x56
0492: 1C10AFA1 mov (x0+1)+0x200, $0x57
0493: 1C10B1A1 mov (x0+1)+0x200, $0x58
0494: 1C0F4256 mov $0x56, (x1+1)+0x200
0495: 1C0F4257 mov $0x57, (x1+1)+0x200
0496: 1C0F6458 mov $0x58, (x1-0xe)+0x200
0497: 1C0CAC56 mov $0x56, $0x256
0498: 1C0CB058 mov $0x58, $0x258
0499: 4C000004 ldi #0x4, c0
049A: 000F4455 lab $0x55, (x1+2)+0x200
049B: 010F4253 fml : lab $0x53, (x1+1)+0x200
049C: 01AF4455 fspd : lab $0x55, (x1+2)+0x200
049D: 1C1C2659 mov b, $0x59
049E: 014F7C53 fmrd : lab $0x53, (x1-2)+0x200
049F: 1C1C265B mov b, $0x5b
04A0: 014CAC5B fmrd : lab $0x5b, $0x256
04A1: 012CB059 fmsd : lab $0x59, $0x258
04A2: 1D4CAC59 fmrd : mov $0x59, $0x256
04A3: 1D2CB05B fmsd : mov $0x5b, $0x258
04A4: FE1004B0 brif !ged #0x4b0
04A5: BF00049A brif zc0 #0x49a
04A6: 63000000 ldi #0x0, rf3
04A7: BF660035 bsul alw ($0x35)
04A8: 1C1D864D mov $0x4d, x1
04A9: 1C0F4254 mov $0x54, (x1+1)+0x200
04AA: 1C0F424E mov $0x4e, (x1+1)+0x200
04AB: 1C1C064D mov x1, $0x4d
04AC: 39000001 lia #0x1
04AD: 1C1DB24B mov $0x4b, d
04AE: 1F5F1E10 addd
04AF: 1C1C324B mov d, $0x4b
04B0: 1C1DB24A mov $0x4a, d
04B1: 1C1DA001 mov $1, a
04B2: 1F7D8466 subd : mov $0x66, x0
04B3: 1C1C324A mov d, $0x4a
04B4: BE0004B6 brif zrd #0x4b6
04B5: BF600481 brif alw #0x481
04B6: 42000110 ldi #0x110, x0
04B7: 1C1DA03B mov $0x3b, a
04B8: 1C1DB23A mov $0x3a, d
04B9: 1C1F4619 mov d, rf3
04BA: 1F5F0619 addd : mov d, x1
04BB: 1C1C323A mov d, $0x3a
04BC: 1C03404B mov {0} $0x4b, (x1) (e)
04BD: 1C1DA04B mov $0x4b, a
04BE: 1C1DB200 mov $0, d
04BF: 1F5C2070 addd : mov a, $0x70
04C0: BE0004C2 brif zrd #0x4c2
04C1: BF660036 bsul alw ($0x36)
04C2: 1C1DC66E mov $0x6e, rf3
04C3: 1C1D866E mov $0x6e, x1
04C4: 1C034000 mov {0} $0, (x1) (e)
04C5: 39000000 lia #0x0
04C6: 1C1F4610 mov a, rf3
04C7: 40000000 ldi #0x0, b0
04C8: 41000200 ldi #0x200, b1
04C9: BF60004C brif alw #0x4c
04CA: 1C10E3A1 mov (x0+1)+0x200, $0x71
04CB: 1C10E7A1 mov (x0+1)+0x200, $0x73
04CC: 1C1DA03B mov $0x3b, a
04CD: 1C1DB23A mov $0x3a, d
04CE: 1C1F4619 mov d, rf3
04CF: 1F5F0619 addd : mov d, x1
04D0: 1C034071 mov {0} $0x71, (x1) (e)
04D1: 1C1F4619 mov d, rf3
04D2: 1F5F0619 addd : mov d, x1
04D3: 1C1C323A mov d, $0x3a
04D4: 1C034073 mov {0} $0x73, (x1) (e)
04D5: 1C1DB270 mov $0x70, d
04D6: 39000001 lia #0x1
04D7: 1F7F1E10 subd
04D8: 1C1C3270 mov d, $0x70
04D9: FE0004CA brif !zrd #0x4ca
04DA: BF6A0000 rtif alw
04DB: 1C10E3A1 mov (x0+1)+0x200, $0x71
04DC: 1C10E7A1 mov (x0+1)+0x200, $0x73
04DD: 1C1DA03B mov $0x3b, a
04DE: 1C1DB23A mov $0x3a, d
04DF: 1C1F4619 mov d, rf3
04E0: 1F5F0619 addd : mov d, x1
04E1: 1C1C323A mov d, $0x3a
04E2: 1C034073 mov {0} $0x73, (x1) (e)
04E3: 1C1DB270 mov $0x70, d
04E4: 39000001 lia #0x1
04E5: 1F7F1E10 subd
04E6: 1C1C3270 mov d, $0x70
04E7: FE0004DB brif !zrd #0x4db
04E8: BF6A0000 rtif alw
04E9: 1C10E3A1 mov (x0+1)+0x200, $0x71
04EA: 1C10E7A1 mov (x0+1)+0x200, $0x73
04EB: 1C1DB270 mov $0x70, d
04EC: 39000001 lia #0x1
04ED: 1F7F1E10 subd
04EE: BE00050D brif zrd #0x50d
04EF: 1C1DB271 mov $0x71, d
04F0: 1D7F1E10 fabd
04F1: 1C1F2019 mov d, a
04F2: 1C1DB237 mov $0x37, d
04F3: 1CFF1E10 fsbd
04F4: 1D7F1E10 fabd
04F5: 1C1C3262 mov d, $0x62
04F6: 1C1DB270 mov $0x70, d
04F7: 39000001 lia #0x1
04F8: 1F7F1E10 subd
04F9: 1C1C3270 mov d, $0x70
04FA: BE00050D brif zrd #0x50d
04FB: 1C10C7A1 mov (x0+1)+0x200, $0x63
04FC: 1C10C9A1 mov (x0+1)+0x200, $0x64
04FD: 1C1DB263 mov $0x63, d
04FE: 1D7F1E10 fabd
04FF: 1C1F2019 mov d, a
0500: 1C1DB237 mov $0x37, d
0501: 1CFF1E10 fsbd
0502: 1D7DA062 fabd : mov $0x62, a
0503: 1C1C3242 mov d, $0x42
0504: 1CFF1E10 fsbd
0505: FE2004F6 brif !led #0x4f6
0506: 1C1DA042 mov $0x42, a
0507: 1C1C2062 mov a, $0x62
0508: 1C1DA063 mov $0x63, a
0509: 1C1C2071 mov a, $0x71
050A: 1C1DA064 mov $0x64, a
050B: 1C1C2073 mov a, $0x73
050C: BF6004F6 brif alw #0x4f6
050D: 1C1DA03B mov $0x3b, a
050E: 1C1DB23A mov $0x3a, d
050F: 1F7F1E10 subd
0510: 1C1F4619 mov d, rf3
0511: 1F5F0619 addd : mov d, x1
0512: 1C034071 mov {0} $0x71, (x1) (e)
0513: 1C1F4619 mov d, rf3
0514: 1F5F0619 addd : mov d, x1
0515: 1C1C323A mov d, $0x3a
0516: 1C034073 mov {0} $0x73, (x1) (e)
0517: BF6A0000 rtif alw
0518: 1C10A803 mov $0x203, $0x54
0519: BF6A0000 rtif alw
051A: 1C1C4270 mov rf1, $0x70
051B: 1C0C5070 mov $0x70, $0x228
051C: 1C1C4270 mov rf1, $0x70
051D: 1C0C5270 mov $0x70, $0x229
051E: 1C1C4270 mov rf1, $0x70
051F: 1C0C5470 mov $0x70, $0x22a
0520: BF60004C brif alw #0x4c
0521: 1C1C4270 mov rf1, $0x70
0522: 000C5270 lab $0x70, $0x229
0523: 1D1C4254 fml : mov rf1, $0x54
0524: 1C1F321C mov p, d
0525: 01F0E828 cfxd : lab $0x228, $0x74
0526: 1F5F1E10 addd
0527: 3900FFFF lia #0xffff
0528: 002C5474 andd : lab $0x74, $0x22a
0529: 1C1CB220 mov d, $0x20 (e)
052A: 1C1E2020 mov $0x20 (e), a
052B: 1D1DB254 fml : mov $0x54, d
052C: 1D3F1E10 fmsd
052D: 1C1F4419 mov d, rf2
052E: BF60004C brif alw #0x4c
052F: 1C1C4270 mov rf1, $0x70
0530: 000C5270 lab $0x70, $0x229
0531: 1D1C4254 fml : mov rf1, $0x54
0532: 1C1F321C mov p, d
0533: 01F0E828 cfxd : lab $0x228, $0x74
0534: 1F5F1E10 addd
0535: 3900FFFF lia #0xffff
0536: 002C5454 andd : lab $0x54, $0x22a
0537: 1D1CB220 fml : mov d, $0x20 (e)
0538: 1C1F261C mov p, b
0539: 1C1E2020 mov $0x20 (e), a
053A: 1D1F1E10 fml
053B: 1C1F441C mov p, rf2
053C: BF60004C brif alw #0x4c
053D: 1C1F3221 mov rf1, d
053E: 1C1DB800 mov $0, p
053F: 1DDF2621 cxfd : mov rf1, b
0540: 1C1F2019 mov d, a
0541: 1D1F1E10 fml
0542: 1C1C3870 mov p, $0x70
0543: 1C0C5670 mov $0x70, $0x22b
0544: BF60004C brif alw #0x4c
0545: 1C1C4270 mov rf1, $0x70
0546: 000C5670 lab $0x70, $0x22b
0547: 1D1C4270 fml : mov rf1, $0x70
0548: 1C0CA870 mov $0x70, $0x254
0549: 1C1F321C mov p, d
054A: 1DFC4270 cfxd : mov rf1, $0x70
054B: 1C0CAA70 mov $0x70, $0x255
054C: 1C1CB220 mov d, $0x20 (e)
054D: 1C08E020 mov $0x20 (e), $0x70
054E: 1C08E221 mov $0x21 (e), $0x71
054F: 000CAA70 lab $0x70, $0x255
0550: 010CA871 fml : lab $0x71, $0x254
0551: 01ACAA71 fspd : lab $0x71, $0x255
0552: 012CA870 fmsd : lab $0x70, $0x254
0553: 1C1F4419 mov d, rf2
0554: 1DBF1E10 fspd
0555: 1D5F1E10 fmrd
0556: 1C1F4419 mov d, rf2
0557: BF60004C brif alw #0x4c
0558: BF60004C brif alw #0x4c
0559: 39003FFF lia #0x3fff
055A: 1C1C2070 mov a, $0x70
055B: 39000010 lia #0x10
055C: 1C1C2064 mov a, $0x64
055D: 1C1DBE64 mov $0x64, sft
055E: 39001375 lia #0x1375
055F: 1C1C2062 mov a, $0x62
0560: 39007FC4 lia #0x7fc4
0561: 1C1C2063 mov a, $0x63
0562: 38000000 lipl #0x0
0563: 1C1F321C mov p, d
0564: 1C1DA063 mov $0x63, a
0565: 1C1CB220 mov d, $0x20 (e)
0566: 1C1E3220 mov $0x20 (e), d
0567: 1EDF2619 lsrd : mov d, b
0568: 1F5DA062 addd : mov $0x62, a
0569: 1C1C3263 mov d, $0x63
056A: 1C1F3213 mov b, d
056B: 1F5DA001 addd : mov $1, a
056C: 1C1C3262 mov d, $0x62
056D: 1C1F321C mov p, d
056E: 1F5DA070 addd : mov $0x70, a
056F: 1C3F3819 andd : mov d, p
0570: FE000564 brif !zrd #0x564
0571: 38000000 lipl #0x0
0572: 1C1CB824 mov p, $0x24 (e)
0573: 1C1CB825 mov p, $0x25 (e)
0574: 1C1CB826 mov p, $0x26 (e)
0575: 1C1F321C mov p, d
0576: 1C1DA062 mov $0x62, a
0577: 1C1CB227 mov d, $0x27 (e)
0578: 1C1E3227 mov $0x27 (e), d
0579: 1F5DA001 addd : mov $1, a
057A: 1C1C3262 mov d, $0x62
057B: 1C1F321C mov p, d
057C: 1F5DA070 addd : mov $0x70, a
057D: 1C3F3819 andd : mov d, p
057E: FE000576 brif !zrd #0x576
057F: 38000000 lipl #0x0
0580: 39800000 lia #0x800000
0581: 1C1CA025 mov a, $0x25 (e)
0582: 1C1F321C mov p, d
0583: 1C1DA063 mov $0x63, a
0584: 1C1CB227 mov d, $0x27 (e)
0585: 1C1E3227 mov $0x27 (e), d
0586: 1F5DA001 addd : mov $1, a
0587: 1C1C3263 mov d, $0x63
0588: 1C1F321C mov p, d
0589: 1F5DA070 addd : mov $0x70, a
058A: 1C3F3819 andd : mov d, p
058B: FE000583 brif !zrd #0x583
058C: 39001FFF lia #0x1fff
058D: 1C1C2070 mov a, $0x70
058E: 38000000 lipl #0x0
058F: 1C1F321C mov p, d
0590: 1C1DA063 mov $0x63, a
0591: 5F00000A ldi #0xa, sft
0592: 1EFDBE64 lsld : mov $0x64, sft
0593: 5A00007F ldi #0x7f, dh
0594: 1C1CB228 mov d, $0x28 (e)
0595: 1C1E3228 mov $0x28 (e), d
0596: 1EDF2619 lsrd : mov d, b
0597: 1F5DA062 addd : mov $0x62, a
0598: 1C1C3263 mov d, $0x63
0599: 1C1F3213 mov b, d
059A: 1F5DA063 addd : mov $0x63, a
059B: 1C1C3262 mov d, $0x62
059C: 1C1E3229 mov $0x29 (e), d
059D: 1EDF2619 lsrd : mov d, b
059E: 1F5DA062 addd : mov $0x62, a
059F: 1C1C3263 mov d, $0x63
05A0: 1C1F3213 mov b, d
05A1: 1F5DA001 addd : mov $1, a
05A2: 1C1C3262 mov d, $0x62
05A3: 1C1F321C mov p, d
05A4: 1F5DA070 addd : mov $0x70, a
05A5: 1C3F3819 andd : mov d, p
05A6: FE000590 brif !zrd #0x590
05A7: 38000000 lipl #0x0
05A8: 1C1F321C mov p, d
05A9: 1C1DA063 mov $0x63, a
05AA: 5F00000A ldi #0xa, sft
05AB: 1EFDBE01 lsld : mov $1, sft
05AC: 5A00003F ldi #0x3f, dh
05AD: 1EFDBE64 lsld : mov $0x64, sft
05AE: 1C1CB22A mov d, $0x2a (e)
05AF: 1C1E322A mov $0x2a (e), d
05B0: 1EDF2619 lsrd : mov d, b
05B1: 1F5DA062 addd : mov $0x62, a
05B2: 1C1C3263 mov d, $0x63
05B3: 1C1F3213 mov b, d
05B4: 1F5DA063 addd : mov $0x63, a
05B5: 1C1C3262 mov d, $0x62
05B6: 1C1E322B mov $0x2b (e), d
05B7: 1EDF2619 lsrd : mov d, b
05B8: 1F5DA062 addd : mov $0x62, a
05B9: 1C1C3263 mov d, $0x63
05BA: 1C1F3213 mov b, d
05BB: 1F5DA001 addd : mov $1, a
05BC: 1C1C3262 mov d, $0x62
05BD: 1C1F321C mov p, d
05BE: 1F5DA070 addd : mov $0x70, a
05BF: 1C3F3819 andd : mov d, p
05C0: FE0005A9 brif !zrd #0x5a9
05C1: 1C1DB262 mov $0x62, d
05C2: 1C1DA063 mov $0x63, a
05C3: 1C1F4419 mov d, rf2
05C4: 1C1F4410 mov a, rf2
05C5: BF60004C brif alw #0x4c
05C6: 1C1C4270 mov rf1, $0x70
05C7: 1C1F3221 mov rf1, d
05C8: 5F000007 ldi #0x7, sft
05C9: 1EFF1E10 lsld
05CA: 1C1F181A mov dh, c0
05CB: 5F000010 ldi #0x10, sft
05CC: 1C1F3221 mov rf1, d
05CD: 1EDC3262 lsrd : mov d, $0x62
05CE: 1C1C3263 mov d, $0x63
05CF: 1C1DA070 mov $0x70, a
05D0: 3B00FFFF lid #0xffff
05D1: 1C3C3271 andd : mov d, $0x71
05D2: 1C1DA063 mov $0x63, a
05D3: 1C1DC670 mov $0x70, rf3
05D4: 1C1F0619 mov d, x1
05D5: 1C1E33A1 mov (x1+1) (e), d
05D6: 1EDF2619 lsrd : mov d, b
05D7: 1F5DA062 addd : mov $0x62, a
05D8: 1C1C3263 mov d, $0x63
05D9: 1C1F3213 mov b, d
05DA: 1F5DA001 addd : mov $1, a
05DB: 1C1C3262 mov d, $0x62
05DC: 1C1DB270 mov $0x70, d
05DD: 1F5DA071 addd : mov $0x71, a
05DE: 1C3C3270 andd : mov d, $0x70
05DF: 1C1DA063 mov $0x63, a
05E0: FE0005D5 brif !zrd #0x5d5
05E1: BF0005D3 brif zc0 #0x5d3
05E2: 41000200 ldi #0x200, b1
05E3: 1C1DB262 mov $0x62, d
05E4: 1C1F4419 mov d, rf2
05E5: 1C1F4410 mov a, rf2
05E6: 39000000 lia #0x0
05E7: 1C1F4610 mov a, rf3
05E8: BF60004C brif alw #0x4c
05E9: 3C020800 clr1 #0x0800
05EA: 39FFFFFC lia #0xfffffc
05EB: 1C1DB27F mov $0x7f, d
05EC: 1C3F2013 andd : mov b, a
05ED: 1C5DA001 orad : mov $1, a
05EE: 1C5C327F orad : mov d, $0x7f
05EF: 1C1C327E mov d, $0x7e
05F0: 1C1DC07F mov $0x7f, rf0
05F1: 3C060800 set #0x0800
05F2: BF60004C brif alw #0x4c
05F3: 1C1C4270 mov rf1, $0x70
05F4: 1C0C4070 mov $0x70, $0x220
05F5: 1C1C4270 mov rf1, $0x70
05F6: 1C0C4270 mov $0x70, $0x221
05F7: 1C1C4270 mov rf1, $0x70
05F8: 1C0C4670 mov $0x70, $0x223
05F9: BF60004C brif alw #0x4c
05FA: 1C1C4270 mov rf1, $0x70
05FB: 000C4070 lab $0x70, $0x220
05FC: 1E9C4270 d=b-a : mov rf1, $0x70
05FD: 000C4270 lab $0x70, $0x221
05FE: 1C1C3270 mov d, $0x70
05FF: 1E8CE070 d=b-a : mov $0x70, $0x270
0600: 1C1C3271 mov d, $0x71
0601: 000CE070 lab $0x70, $0x270
0602: 1D0CE271 fml : mov $0x71, $0x271
0603: 000CE271 lab $0x71, $0x271
0604: 1DBF1E10 fspd
0605: 1D30E223 fmsd : mov $0x223, $0x71
0606: 1C1C3270 mov d, $0x70
0607: 1C1F2019 mov d, a
0608: 1C1CA02A mov a, $0x2a (e)
0609: 5100007F ldi #0x7f, ah
060A: 1C1E262A mov $0x2a (e), b
060B: 1D1E322B fml : mov $0x2b (e), d
060C: 1D5DA070 fmrd : mov $0x70, a
060D: 1C1F2619 mov d, b
060E: 1D1DB200 fml : mov $0, d
060F: 1D9C386B fsmd : mov p, $0x6b
0610: 1C1DA071 mov $0x71, a
0611: 1CFF1E10 fsbd
0612: 1C1C326C mov d, $0x6c
0613: 1C1DC46C mov $0x6c, rf2
0614: BF60004C brif alw #0x4c
0615: 1C1C4270 mov rf1, $0x70
0616: 000C4070 lab $0x70, $0x220
0617: 1E9C4270 d=b-a : mov rf1, $0x70
0618: 000C4270 lab $0x70, $0x221
0619: 1C1C3270 mov d, $0x70
061A: 1E8CE070 d=b-a : mov $0x70, $0x270
061B: 1C1C3271 mov d, $0x71
061C: 000CE070 lab $0x70, $0x270
061D: 1D0CE271 fml : mov $0x71, $0x271
061E: 000CE271 lab $0x71, $0x271
061F: 1DBF1E10 fspd
0620: 1D30E223 fmsd : mov $0x223, $0x71
0621: 1C1C3270 mov d, $0x70
0622: 1C1F2019 mov d, a
0623: 1C1CA02A mov a, $0x2a (e)
0624: 5100007F ldi #0x7f, ah
0625: 1C1E262A mov $0x2a (e), b
0626: 1D1E322B fml : mov $0x2b (e), d
0627: 1D5DA070 fmrd : mov $0x70, a
0628: 1C1F2619 mov d, b
0629: 1D1DB200 fml : mov $0, d
062A: 1D9C386B fsmd : mov p, $0x6b
062B: 1C1DA071 mov $0x71, a
062C: 1CFF1E10 fsbd
062D: 1C1C326C mov d, $0x6c
062E: 1C1DC46C mov $0x6c, rf2
062F: 1C1DC46B mov $0x6b, rf2
0630: BF60004C brif alw #0x4c
0631: 1C1C427B mov rf1, $0x7b
0632: 1C1C427C mov rf1, $0x7c
0633: 1C1C4270 mov rf1, $0x70
0634: 1C0CF670 mov $0x70, $0x27b
0635: 1C1C4270 mov rf1, $0x70
0636: 1C0CF870 mov $0x70, $0x27c
0637: 0010F67B lab $0x27b, $0x7b
0638: 0290F87C d=b-a : lab $0x27c, $0x7c
0639: 1C1C327B mov d, $0x7b
063A: 1E9F1E10 d=b-a
063B: 1C1C327C mov d, $0x7c
063C: BF640674 bsif alw #0x674
063D: 1C1F441C mov p, rf2
063E: BF60004C brif alw #0x4c
063F: BF64066B bsif alw #0x66b
0640: 1C1F4419 mov d, rf2
0641: 1C1F441C mov p, rf2
0642: BF60004C brif alw #0x4c
0643: BF64066B bsif alw #0x66b
0644: 1C1F2021 mov rf1, a
0645: 1CDF2021 fadd : mov rf1, a
0646: 1C1F4419 mov d, rf2
0647: 1C1F321C mov p, d
0648: 1CDF1E10 fadd
0649: 1C1F4419 mov d, rf2
064A: BF60004C brif alw #0x4c
064B: BF64066B bsif alw #0x66b
064C: 1C1C3870 mov p, $0x70
064D: 1C1C3271 mov d, $0x71
064E: BF64066B bsif alw #0x66b
064F: 1C1DA071 mov $0x71, a
0650: 1CDDA070 fadd : mov $0x70, a
0651: 1DBC3254 fspd : mov d, $0x54
0652: 1CDDA654 fadd : mov $0x54, b
0653: 1C1C3253 mov d, $0x53
0654: 1C1DA053 mov $0x53, a
0655: BF640797 bsif alw #0x797
0656: 1C1E3227 mov $0x27 (e), d
0657: 5F000010 ldi #0x10, sft
0658: 1EFD860D lsld : mov $0xd, x1
0659: 1F0CF653 asrd : mov $0x53, $0x27b
065A: 1C1F4419 mov d, rf2
065B: 1C0CF854 mov $0x54, $0x27c
065C: 1C10F67B mov $0x27b, $0x7b
065D: 1C10F87C mov $0x27c, $0x7c
065E: BF640674 bsif alw #0x674
065F: 1C1F441C mov p, rf2
0660: BF60004C brif alw #0x4c
0661: BF64066B bsif alw #0x66b
0662: 1C1F4419 mov d, rf2
0663: 1C1F441C mov p, rf2
0664: 1C1F2021 mov rf1, a
0665: 1CDF2021 fadd : mov rf1, a
0666: 1C1F4419 mov d, rf2
0667: 1C1F321C mov p, d
0668: 1CDF1E10 fadd
0669: 1C1F4419 mov d, rf2
066A: BF60004C brif alw #0x4c
066B: 1C1CC220 mov rf1, $0x20 (e)
066C: 1C08F620 mov $0x20 (e), $0x7b
066D: 1C08F821 mov $0x21 (e), $0x7c
066E: 1C1C427D mov rf1, $0x7d
066F: 1C0CF67D mov $0x7d, $0x27b
0670: 000CF67B lab $0x7b, $0x27b
0671: 010CF67C fml : lab $0x7c, $0x27b
0672: 1DBF1E10 fspd
0673: BF6A0000 rtif alw
0674: 1C0CF67B mov $0x7b, $0x27b
0675: 000CF67B lab $0x7b, $0x27b
0676: 1D0CF87C fml : mov $0x7c, $0x27c
0677: 000CF87C lab $0x7c, $0x27c
0678: 1DBF1E10 fspd
0679: 1D3F1E10 fmsd
067A: 1C1C327D mov d, $0x7d
067B: 1C1F2019 mov d, a
067C: 1C1CA02A mov a, $0x2a (e)
067D: 5100007F ldi #0x7f, ah
067E: 1C1E262A mov $0x2a (e), b
067F: 1D1E322B fml : mov $0x2b (e), d
0680: 1D5DA07D fmrd : mov $0x7d, a
0681: 1C1F2619 mov d, b
0682: 1D1F1E10 fml
0683: BF6A0000 rtif alw
0684: 42000100 ldi #0x100, x0
0685: 1C10ADA1 mov (x0+1)+0x200, $0x56
0686: 1C10AFA1 mov (x0+1)+0x200, $0x57
0687: 1C10B1A1 mov (x0+1)+0x200, $0x58
0688: 1C10B3A1 mov (x0+1)+0x200, $0x59
0689: 1C10B5A1 mov (x0+1)+0x200, $0x5a
068A: 1C10B7A1 mov (x0+1)+0x200, $0x5b
068B: 1C10B9A1 mov (x0+1)+0x200, $0x5c
068C: 1C10BBA1 mov (x0+1)+0x200, $0x5d
068D: 1C10BDA1 mov (x0+1)+0x200, $0x5e
068E: 1C1DB259 mov $0x59, d
068F: 1C1DA05C mov $0x5c, a
0690: 1CFDA05E fsbd : mov $0x5e, a
0691: 1C1C3244 mov d, $0x44
0692: 1C1DB25B mov $0x5b, d
0693: 1CFDA05C fsbd : mov $0x5c, a
0694: 1C1C3246 mov d, $0x46
0695: 1C1DB256 mov $0x56, d
0696: 1CFDA05E fsbd : mov $0x5e, a
0697: 1C1C3245 mov d, $0x45
0698: 1C1DB258 mov $0x58, d
0699: 1CFDA05C fsbd : mov $0x5c, a
069A: 1C1C3247 mov d, $0x47
069B: 1C1DB253 mov $0x53, d
069C: 1CFDA05E fsbd : mov $0x5e, a
069D: 1C1C3248 mov d, $0x48
069E: 1C1DB255 mov $0x55, d
069F: 1CFDA047 fsbd : mov $0x47, a
06A0: 1C1C3249 mov d, $0x49
06A1: 1C1DB203 mov $3, d
06A2: 1CDF1E10 fadd
06A3: BE0006C7 brif zrd #0x6c7
06A4: 1C1DA047 mov $0x47, a
06A5: 1C1DA644 mov $0x44, b
06A6: 1D1DA046 fml : mov $0x46, a
06A7: 1C1DA645 mov $0x45, b
06A8: 1DBDA047 fspd : mov $0x47, a
06A9: 1C1DA648 mov $0x48, b
06AA: 1D5DA049 fmrd : mov $0x49, a
06AB: 1C1C3270 mov d, $0x70
06AC: 1C1DA645 mov $0x45, b
06AD: 1DBF1E10 fspd
06AE: 1D5F1E10 fmrd
06AF: 1C1C3271 mov d, $0x71
06B0: 1C1C2077 mov a, $0x77
06B1: 1C1C2678 mov b, $0x78
06B2: 1C1C3279 mov d, $0x79
06B3: 1C1C387A mov p, $0x7a
06B4: 1C1DA070 mov $0x70, a
06B5: 1C1CA028 mov a, $0x28 (e)
06B6: 5100007F ldi #0x7f, ah
06B7: 1C1E3228 mov $0x28 (e), d
06B8: 1D7F1E10 fabd
06B9: 1C1F2619 mov d, b
06BA: 1D1E3229 fml : mov $0x29 (e), d
06BB: 1D5F1E10 fmrd
06BC: 1C1F2619 mov d, b
06BD: 1C1DA071 mov $0x71, a
06BE: 1D1F1E10 fml
06BF: 1C1C3873 mov p, $0x73
06C0: 1C1DA077 mov $0x77, a
06C1: 1C1DA678 mov $0x78, b
06C2: 1C1DB279 mov $0x79, d
06C3: 1C1DB87A mov $0x7a, p
06C4: 1C1DB273 mov $0x73, d
06C5: 1C1C3243 mov d, $0x43
06C6: BF6006DF brif alw #0x6df
06C7: 1C1DB249 mov $0x49, d
06C8: 1C1DA046 mov $0x46, a
06C9: 1C1C2077 mov a, $0x77
06CA: 1C1C2678 mov b, $0x78
06CB: 1C1C3279 mov d, $0x79
06CC: 1C1C387A mov p, $0x7a
06CD: 1C1DA046 mov $0x46, a
06CE: 1C1CA028 mov a, $0x28 (e)
06CF: 5100007F ldi #0x7f, ah
06D0: 1C1E3228 mov $0x28 (e), d
06D1: 1D7F1E10 fabd
06D2: 1C1F2619 mov d, b
06D3: 1D1E3229 fml : mov $0x29 (e), d
06D4: 1D5F1E10 fmrd
06D5: 1C1F2619 mov d, b
06D6: 1C1DA049 mov $0x49, a
06D7: 1D1F1E10 fml
06D8: 1C1C3873 mov p, $0x73
06D9: 1C1DA077 mov $0x77, a
06DA: 1C1DA678 mov $0x78, b
06DB: 1C1DB279 mov $0x79, d
06DC: 1C1DB87A mov $0x7a, p
06DD: 1C1DB273 mov $0x73, d
06DE: 1C1C3243 mov d, $0x43
06DF: 1C1DB245 mov $0x45, d
06E0: 1C1DA003 mov $3, a
06E1: 1CDF1E10 fadd
06E2: BE0006FF brif zrd #0x6ff
06E3: 1C1DA044 mov $0x44, a
06E4: 1C1DA643 mov $0x43, b
06E5: 1D1DB248 fml : mov $0x48, d
06E6: 1D5DA045 fmrd : mov $0x45, a
06E7: 1C1C3270 mov d, $0x70
06E8: 1C1C2077 mov a, $0x77
06E9: 1C1C2678 mov b, $0x78
06EA: 1C1C3279 mov d, $0x79
06EB: 1C1C387A mov p, $0x7a
06EC: 1C1DA045 mov $0x45, a
06ED: 1C1CA028 mov a, $0x28 (e)
06EE: 5100007F ldi #0x7f, ah
06EF: 1C1E3228 mov $0x28 (e), d
06F0: 1D7F1E10 fabd
06F1: 1C1F2619 mov d, b
06F2: 1D1E3229 fml : mov $0x29 (e), d
06F3: 1D5F1E10 fmrd
06F4: 1C1F2619 mov d, b
06F5: 1C1DA070 mov $0x70, a
06F6: 1D1F1E10 fml
06F7: 1C1C3873 mov p, $0x73
06F8: 1C1DA077 mov $0x77, a
06F9: 1C1DA678 mov $0x78, b
06FA: 1C1DB279 mov $0x79, d
06FB: 1C1DB87A mov $0x7a, p
06FC: 1C1DB273 mov $0x73, d
06FD: 1C1C3242 mov d, $0x42
06FE: BF60071E brif alw #0x71e
06FF: 1C1DA049 mov $0x49, a
0700: 1C1DA644 mov $0x44, b
0701: 1D1DA048 fml : mov $0x48, a
0702: 1C1DA646 mov $0x46, b
0703: 1DBDA047 fspd : mov $0x47, a
0704: 1C1DA644 mov $0x44, b
0705: 1D5F1E10 fmrd
0706: 1C1C3871 mov p, $0x71
0707: 1C1C3270 mov d, $0x70
0708: 1C1C2077 mov a, $0x77
0709: 1C1C2678 mov b, $0x78
070A: 1C1C3279 mov d, $0x79
070B: 1C1C387A mov p, $0x7a
070C: 1C1DA071 mov $0x71, a
070D: 1C1CA028 mov a, $0x28 (e)
070E: 5100007F ldi #0x7f, ah
070F: 1C1E3228 mov $0x28 (e), d
0710: 1D7F1E10 fabd
0711: 1C1F2619 mov d, b
0712: 1D1E3229 fml : mov $0x29 (e), d
0713: 1D5F1E10 fmrd
0714: 1C1F2619 mov d, b
0715: 1C1DA070 mov $0x70, a
0716: 1D1F1E10 fml
0717: 1C1C3873 mov p, $0x73
0718: 1C1DA077 mov $0x77, a
0719: 1C1DA678 mov $0x78, b
071A: 1C1DB279 mov $0x79, d
071B: 1C1DB87A mov $0x7a, p
071C: 1C1DB273 mov $0x73, d
071D: 1C1C3242 mov d, $0x42
071E: 1C1DB243 mov $0x43, d
071F: 1C1DA042 mov $0x42, a
0720: 1C5DA003 orad : mov $3, a
0721: 1CDF1E10 fadd
0722: BE10072B brif ged #0x72b
0723: 42000100 ldi #0x100, x0
0724: 0010E9A6 lab (x0+6)+0x200, $0x74
0725: 1C10B3A1 mov (x0+1)+0x200, $0x59
0726: 1C10B5A1 mov (x0+1)+0x200, $0x5a
0727: 1C10B7A1 mov (x0+1)+0x200, $0x5b
0728: 1C10B9A1 mov (x0+1)+0x200, $0x5c
0729: 1C10BBA1 mov (x0+1)+0x200, $0x5d
072A: 1C10BDA1 mov (x0+1)+0x200, $0x5e
072B: 1C1DB25D mov $0x5d, d
072C: 1C1DA057 mov $0x57, a
072D: 1CFDA058 fsbd : mov $0x58, a
072E: 1C1F2619 mov d, b
072F: 1C1DB25B mov $0x5b, d
0730: 1CFF1E10 fsbd
0731: 1C1F2019 mov d, a
0732: 1D1F1E10 fml
0733: 1C1C3870 mov p, $0x70
0734: 1C1DB25E mov $0x5e, d
0735: 1C1DA058 mov $0x58, a
0736: 1CFDA057 fsbd : mov $0x57, a
0737: 1C1F2619 mov d, b
0738: 1C1DB25A mov $0x5a, d
0739: 1CFF1E10 fsbd
073A: 1C1F2019 mov d, a
073B: 1D1F1E10 fml
073C: 1C1F321C mov p, d
073D: 1C1DA070 mov $0x70, a
073E: 1CFF1E10 fsbd
073F: 1C1C3262 mov d, $0x62
0740: 1C1DB25E mov $0x5e, d
0741: 1C1DA058 mov $0x58, a
0742: 1CFDA056 fsbd : mov $0x56, a
0743: 1C1F2619 mov d, b
0744: 1C1DB259 mov $0x59, d
0745: 1CFF1E10 fsbd
0746: 1C1F2019 mov d, a
0747: 1D1F1E10 fml
0748: 1C1C3870 mov p, $0x70
0749: 1C1DB25C mov $0x5c, d
074A: 1C1DA056 mov $0x56, a
074B: 1CFDA058 fsbd : mov $0x58, a
074C: 1C1F2619 mov d, b
074D: 1C1DB25B mov $0x5b, d
074E: 1CFF1E10 fsbd
074F: 1C1F2019 mov d, a
0750: 1D1F1E10 fml
0751: 1C1F321C mov p, d
0752: 1C1DA070 mov $0x70, a
0753: 1CFF1E10 fsbd
0754: 1C1C3263 mov d, $0x63
0755: 1C1DB25C mov $0x5c, d
0756: 1C1DA056 mov $0x56, a
0757: 1CFDA057 fsbd : mov $0x57, a
0758: 1C1F2619 mov d, b
0759: 1C1DB25A mov $0x5a, d
075A: 1CFF1E10 fsbd
075B: 1C1F2019 mov d, a
075C: 1D1F1E10 fml
075D: 1C1C3870 mov p, $0x70
075E: 1C1DB25D mov $0x5d, d
075F: 1C1DA057 mov $0x57, a
0760: 1CFDA056 fsbd : mov $0x56, a
0761: 1C1F2619 mov d, b
0762: 1C1DB259 mov $0x59, d
0763: 1CFF1E10 fsbd
0764: 1C1F2019 mov d, a
0765: 1D1F1E10 fml
0766: 1C1F321C mov p, d
0767: 1C1DA070 mov $0x70, a
0768: 1CFF1E10 fsbd
0769: 1C1C3264 mov d, $0x64
076A: 1C1DB263 mov $0x63, d
076B: 1C1DA003 mov $3, a
076C: 1CDF1E10 fadd
076D: BE000795 brif zrd #0x795
076E: 1C1DA062 mov $0x62, a
076F: 1C1DA653 mov $0x53, b
0770: 1D1DA064 fml : mov $0x64, a
0771: 1C1DA655 mov $0x55, b
0772: 1DBDA062 fspd : mov $0x62, a
0773: 1D9DA656 fsmd : mov $0x56, b
0774: 1D1DA063 fml : mov $0x63, a
0775: 1C1DA657 mov $0x57, b
0776: 1D5DA064 fmrd : mov $0x64, a
0777: 1C1DA658 mov $0x58, b
0778: 1D5F1E10 fmrd
0779: 1C1F201C mov p, a
077A: 1CFDA063 fsbd : mov $0x63, a
077B: 1C1C3270 mov d, $0x70
077C: 1C1C2077 mov a, $0x77
077D: 1C1C2678 mov b, $0x78
077E: 1C1C3279 mov d, $0x79
077F: 1C1C387A mov p, $0x7a
0780: 1C1DA063 mov $0x63, a
0781: 1C1CA028 mov a, $0x28 (e)
0782: 5100007F ldi #0x7f, ah
0783: 1C1E3228 mov $0x28 (e), d
0784: 1D7F1E10 fabd
0785: 1C1F2619 mov d, b
0786: 1D1E3229 fml : mov $0x29 (e), d
0787: 1D5F1E10 fmrd
0788: 1C1F2619 mov d, b
0789: 1C1DA070 mov $0x70, a
078A: 1D1F1E10 fml
078B: 1C1C3873 mov p, $0x73
078C: 1C1DA077 mov $0x77, a
078D: 1C1DA678 mov $0x78, b
078E: 1C1DB279 mov $0x79, d
078F: 1C1DB87A mov $0x7a, p
0790: 1C1DA005 mov $5, a
0791: 1C1DA673 mov $0x73, b
0792: 1D1F1E10 fml
0793: 1C1C3854 mov p, $0x54
0794: BF600796 brif alw #0x796
0795: 1C10A806 mov $0x206, $0x54
0796: BF6A0000 rtif alw
0797: 1C1CA024 mov a, $0x24 (e)
0798: 1C1CA625 mov b, $0x25 (e)
0799: BEA007AC brif gpio0 #0x7ac
079A: 1C1CA028 mov a, $0x28 (e)
079B: 5100007F ldi #0x7f, ah
079C: 1C1E3228 mov $0x28 (e), d
079D: 1D7F3813 fabd : mov b, p
079E: 1C1F2619 mov d, b
079F: 1D1F261C fml : mov p, b
07A0: 1C1E3229 mov $0x29 (e), d
07A1: 1D5F1E10 fmrd
07A2: 1C1F2019 mov d, a
07A3: 1D1F1E10 fml
07A4: 1C1F321C mov p, d
07A5: 1D7F1E10 fabd
07A6: 5100006F ldi #0x6f, ah
07A7: 527FFFFF ldi #0x7fffff, al
07A8: 1CBF1E10 fcpd
07A9: BE2C3800 ldif led $0, p
07AA: 1C1CB827 mov p, $0x27 (e)
07AB: BF6A0000 rtif alw
07AC: 1C1CA628 mov b, $0x28 (e)
07AD: 5400007F ldi #0x7f, bh
07AE: 1C1E3228 mov $0x28 (e), d
07AF: 1D7F3810 fabd : mov a, p
07B0: 1C1F2019 mov d, a
07B1: 1D1F201C fml : mov p, a
07B2: 1C1E3229 mov $0x29 (e), d
07B3: 1D5F1E10 fmrd
07B4: 1C1F2619 mov d, b
07B5: 1D1F1E10 fml
07B6: 1C1F321C mov p, d
07B7: 1D7F1E10 fabd
07B8: 5100006F ldi #0x6f, ah
07B9: 527FFFFF ldi #0x7fffff, al
07BA: 1CBF1E10 fcpd
07BB: BE2C3800 ldif led $0, p
07BC: 1C1CB827 mov p, $0x27 (e)
07BD: BF6A0000 rtif alw
07BE: 1C1F3221 mov rf1, d
07BF: 5F000004 ldi #0x4, sft
07C0: 1EFDA06A lsld : mov $0x6a, a
07C1: 1F5F1E10 addd
07C2: 1C1F4619 mov d, rf3
07C3: 3900FFFF lia #0xffff
07C4: 1C3F1E10 andd
07C5: 1C1F0419 mov d, x0
07C6: 43000056 ldi #0x56, x1
07C7: 3C040010 rep #0x10
07C8: 1C0B43A1 mov (x0+1) (e), (x1+1)
07C9: 63000000 ldi #0x0, rf3
07CA: BF6A0000 rtif alw
07CB: 1C1F0610 mov a, x1
07CC: 39800000 lia #0x800000
07CD: 1C1F4610 mov a, rf3
07CE: 41000010 ldi #0x10, b1
07CF: 1C1E3380 mov (bx1) (e), d
07D0: 1F5F1E10 addd
07D1: 1C1C3269 mov d, $0x69
07D2: 41000020 ldi #0x20, b1
07D3: 1C1E3380 mov (bx1) (e), d
07D4: 1F5F1E10 addd
07D5: 1C1C326A mov d, $0x6a
07D6: 63000000 ldi #0x0, rf3
07D7: 41000200 ldi #0x200, b1
07D8: BF6A0000 rtif alw
07D9: 1C1F3221 mov rf1, d
07DA: 5F000002 ldi #0x2, sft
07DB: 1F1F1E10 asrd
07DC: 1C1F0619 mov d, x1
07DD: 39400000 lia #0x400000
07DE: 1C1F4610 mov a, rf3
07DF: 40000200 ldi #0x200, b0
07E0: 1C1D8407 mov $7, x0
07E1: 3C04000C rep #0xc
07E2: 1C074381 mov (bx0+1), (x1+1) (e)
07E3: 40000000 ldi #0x0, b0
07E4: 39000000 lia #0x0
07E5: 1C1F4610 mov a, rf3
07E6: BF60004C brif alw #0x4c
07E7: 000007E7 lab [x0+7], $3 (e)
07E8: 00000000 lab $0, $0 (e)
07E9: 00000000 lab $0, $0 (e)
07EA: 00000000 lab $0, $0 (e)
07EB: 00000000 lab $0, $0 (e)
07EC: 00000000 lab $0, $0 (e)
07ED: 00000000 lab $0, $0 (e)
07EE: 00000000 lab $0, $0 (e)
07EF: 00000000 lab $0, $0 (e)
07F0: 00000000 lab $0, $0 (e)
07F1: 00000000 lab $0, $0 (e)
07F2: 00000000 lab $0, $0 (e)
07F3: 00000000 lab $0, $0 (e)
07F4: 00000000 lab $0, $0 (e)
07F5: 00000000 lab $0, $0 (e)
07F6: 00000000 lab $0, $0 (e)
07F7: 00000000 lab $0, $0 (e)
07F8: 00000000 lab $0, $0 (e)
07F9: 00000000 lab $0, $0 (e)
07FA: 00000000 lab $0, $0 (e)
07FB: 00000000 lab $0, $0 (e)
07FC: 00000000 lab $0, $0 (e)
07FD: 00000000 lab $0, $0 (e)
07FE: 00000000 lab $0, $0 (e)
07FF: 00000000 lab $0, $0 (e)
