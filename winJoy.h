
//{{BLOCK(winJoy)

//======================================================================
//
//	winJoy, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 351 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 11232 + 2048 = 13792
//
//	Time-stamp: 2019-11-05, 14:58:28
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_WINJOY_H
#define GRIT_WINJOY_H

#define winJoyTilesLen 11232
extern const unsigned short winJoyTiles[5616];

#define winJoyMapLen 2048
extern const unsigned short winJoyMap[1024];

#define winJoyPalLen 512
extern const unsigned short winJoyPal[256];

#endif // GRIT_WINJOY_H

//}}BLOCK(winJoy)
