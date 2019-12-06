
//{{BLOCK(instructionsBg)

//======================================================================
//
//	instructionsBg, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 400 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 12800 + 2048 = 15360
//
//	Time-stamp: 2019-12-05, 21:33:43
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_INSTRUCTIONSBG_H
#define GRIT_INSTRUCTIONSBG_H

#define instructionsBgTilesLen 12800
extern const unsigned short instructionsBgTiles[6400];

#define instructionsBgMapLen 2048
extern const unsigned short instructionsBgMap[1024];

#define instructionsBgPalLen 512
extern const unsigned short instructionsBgPal[256];

#endif // GRIT_INSTRUCTIONSBG_H

//}}BLOCK(instructionsBg)
