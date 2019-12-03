
//{{BLOCK(pauseFear)

//======================================================================
//
//	pauseFear, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 265 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 8480 + 2048 = 11040
//
//	Time-stamp: 2019-12-02, 14:20:36
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_PAUSEFEAR_H
#define GRIT_PAUSEFEAR_H

#define pauseFearTilesLen 8480
extern const unsigned short pauseFearTiles[4240];

#define pauseFearMapLen 2048
extern const unsigned short pauseFearMap[1024];

#define pauseFearPalLen 512
extern const unsigned short pauseFearPal[256];

#endif // GRIT_PAUSEFEAR_H

//}}BLOCK(pauseFear)
