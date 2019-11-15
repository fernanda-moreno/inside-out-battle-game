
//{{BLOCK(pauseSky)

//======================================================================
//
//	pauseSky, 512x256@4, 
//	+ palette 256 entries, not compressed
//	+ 798 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 64x32 
//	Total size: 512 + 25536 + 4096 = 30144
//
//	Time-stamp: 2019-11-14, 13:24:07
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_PAUSESKY_H
#define GRIT_PAUSESKY_H

#define pauseSkyTilesLen 25536
extern const unsigned short pauseSkyTiles[12768];

#define pauseSkyMapLen 4096
extern const unsigned short pauseSkyMap[2048];

#define pauseSkyPalLen 512
extern const unsigned short pauseSkyPal[256];

#endif // GRIT_PAUSESKY_H

//}}BLOCK(pauseSky)
