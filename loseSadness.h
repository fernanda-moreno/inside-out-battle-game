
//{{BLOCK(loseSadness)

//======================================================================
//
//	loseSadness, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 380 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 12160 + 2048 = 14720
//
//	Time-stamp: 2019-11-05, 15:05:52
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_LOSESADNESS_H
#define GRIT_LOSESADNESS_H

#define loseSadnessTilesLen 12160
extern const unsigned short loseSadnessTiles[6080];

#define loseSadnessMapLen 2048
extern const unsigned short loseSadnessMap[1024];

#define loseSadnessPalLen 512
extern const unsigned short loseSadnessPal[256];

#endif // GRIT_LOSESADNESS_H

//}}BLOCK(loseSadness)
