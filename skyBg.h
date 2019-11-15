
//{{BLOCK(skyBg)

//======================================================================
//
//	skyBg, 768x512@4, 
//	+ palette 256 entries, not compressed
//	+ 1596 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 96x64 
//	Total size: 512 + 51072 + 12288 = 63872
//
//	Time-stamp: 2019-11-07, 13:38:16
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_SKYBG_H
#define GRIT_SKYBG_H

#define skyBgTilesLen 51072
extern const unsigned short skyBgTiles[25536];

#define skyBgMapLen 12288
extern const unsigned short skyBgMap[6144];

#define skyBgPalLen 512
extern const unsigned short skyBgPal[256];

#endif // GRIT_SKYBG_H

//}}BLOCK(skyBg)
