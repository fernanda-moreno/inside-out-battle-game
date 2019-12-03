
//{{BLOCK(instructionsBg)

//======================================================================
//
//	instructionsBg, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 401 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 12832 + 2048 = 15392
//
//	Time-stamp: 2019-11-26, 12:30:30
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_INSTRUCTIONSBG_H
#define GRIT_INSTRUCTIONSBG_H

#define instructionsBgTilesLen 12832
extern const unsigned short instructionsBgTiles[6416];

#define instructionsBgMapLen 2048
extern const unsigned short instructionsBgMap[1024];

#define instructionsBgPalLen 512
extern const unsigned short instructionsBgPal[256];

#endif // GRIT_INSTRUCTIONSBG_H

//}}BLOCK(instructionsBg)
