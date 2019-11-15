# 1 "main.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "main.c"
# 1 "myLib.h" 1




typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
# 66 "myLib.h"
extern unsigned short *videoBuffer;
# 87 "myLib.h"
typedef struct {
 u16 tileimg[8192];
} charblock;


typedef struct {
 u16 tilemap[1024];
} screenblock;



void setPixel3(int col, int row, unsigned short color);
void drawRect3(int col, int row, int width, int height, volatile unsigned short color);
void fillScreen3(volatile unsigned short color);
void drawImage3(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage3(const unsigned short *image);


void setPixel4(int col, int row, unsigned char colorIndex);
void drawRect4(int col, int row, int width, int height, volatile unsigned char colorIndex);
void fillScreen4(volatile unsigned char colorIndex);
void drawImage4(int col, int row, int width, int height, const unsigned short *image);
void drawFullscreenImage4(const unsigned short *image);


void waitForVBlank();
void flipPage();




typedef struct {
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
} OBJ_ATTR;



extern OBJ_ATTR shadowOAM[];
# 158 "myLib.h"
void hideSprites();
# 178 "myLib.h"
extern unsigned short oldButtons;
extern unsigned short buttons;
# 189 "myLib.h"
typedef volatile struct {
    volatile const void *src;
    volatile void *dst;
    volatile unsigned int cnt;
} DMA;


extern DMA *dma;
# 229 "myLib.h"
void DMANow(int channel, volatile const void *src, volatile void *dst, unsigned int cnt);




int collision(int colA, int rowA, int widthA, int heightA, int colB, int rowB, int widthB, int heightB);
# 2 "main.c" 2
# 1 "game.h" 1

typedef struct {
    int col;
    int row;
    int cDel;
    int rDel;
    int width;
    int height;
    int bulletTimer;

} PLAYER;


typedef struct {
    int col;
    int row;
    int oldCol;
    int oldRow;
    int rDel;
    int cDel;
    int width;
    int height;
    int active;
    int index;

} PLAYERBULLET;


typedef struct {
    int col;
    int row;
    int cDel;
    int rDel;
    int width;
    int height;
    int bulletTimer;
    int active;
    int index;

} ENEMY;


typedef struct {
    int col;
    int row;
    int oldCol;
    int oldRow;
    int cDel;
    int rDel;
    int width;
    int height;
    int active;
    int index;

} BADBULLET;


typedef struct {
    int col;
    int row;
    int oldCol;
    int oldRow;
    int cDel;
    int rDel;
    int width;
    int height;
    int active;
    int index;

} MEMORYBALL;


typedef struct {
    int col;
    int row;
    int width;
    int height;
    int active;
} LIVES;


typedef struct {
    int col;
    int row;
    int width;
    int height;
    int active;
} ENEMYLIVES;



extern int livesRemaining;
extern int enemiesRemaining;
extern int depressionLivesRemaining;
# 105 "game.h"
void initGame();
void updateGame();
void drawGame();

void initPlayer();
void updatePlayer();
void drawPlayer();

void initDepression();
void updateDepression();
void drawDepression();

void initMiniDepressions();
void updateMiniDepressions();
void drawMiniDepressions();

void initEnemies();
void updateEnemies();
void drawEnemies();

void initPlayerBullets();
void updatePlayerBullets(PLAYERBULLET* bullet);
void drawPlayerBullets(PLAYERBULLET* bullet);
void firePlayerBullets();

void initBadBullets();
void updateBadBullets(BADBULLET* bullet);
void drawBadBullets(BADBULLET* bullet);
void fireBadBullets(ENEMY* e);

void initMemoryBalls();
void updateMemoryBalls();
void drawMemoryBalls();

void initLives();
void updateLives();
void drawLives();

void initEnemyLives();
void updateEnemyLives();
void drawEnemyLives();
# 3 "main.c" 2
# 1 "pauseFear.h" 1
# 22 "pauseFear.h"
extern const unsigned short pauseFearTiles[4720];


extern const unsigned short pauseFearMap[1024];


extern const unsigned short pauseFearPal[256];
# 4 "main.c" 2
# 1 "winJoy.h" 1
# 22 "winJoy.h"
extern const unsigned short winJoyTiles[5616];


extern const unsigned short winJoyMap[1024];


extern const unsigned short winJoyPal[256];
# 5 "main.c" 2
# 1 "loseSadness.h" 1
# 22 "loseSadness.h"
extern const unsigned short loseSadnessTiles[6080];


extern const unsigned short loseSadnessMap[1024];


extern const unsigned short loseSadnessPal[256];
# 6 "main.c" 2
# 1 "insideOutStartBg.h" 1
# 22 "insideOutStartBg.h"
extern const unsigned short insideOutStartBgTiles[3264];


extern const unsigned short insideOutStartBgMap[1024];


extern const unsigned short insideOutStartBgPal[256];
# 7 "main.c" 2
# 1 "instructionsBg.h" 1
# 22 "instructionsBg.h"
extern const unsigned short instructionsBgTiles[5840];


extern const unsigned short instructionsBgMap[1024];


extern const unsigned short instructionsBgPal[256];
# 8 "main.c" 2
# 1 "skyBg.h" 1
# 22 "skyBg.h"
extern const unsigned short skyBgTiles[25536];


extern const unsigned short skyBgMap[6144];


extern const unsigned short skyBgPal[256];
# 9 "main.c" 2
# 1 "spritesheet.h" 1
# 21 "spritesheet.h"
extern const unsigned short spritesheetTiles[16384];


extern const unsigned short spritesheetPal[256];
# 10 "main.c" 2
# 1 "pauseSky.h" 1
# 22 "pauseSky.h"
extern const unsigned short pauseSkyTiles[12768];


extern const unsigned short pauseSkyMap[2048];


extern const unsigned short pauseSkyPal[256];
# 11 "main.c" 2
# 1 "pauseSky-2.h" 1
# 22 "pauseSky-2.h"
extern const unsigned short pauseSky_2Tiles[736];


extern const unsigned short pauseSky_2Map[2048];


extern const unsigned short pauseSky_2Pal[256];
# 12 "main.c" 2


void initialize();


void startState();
void instructionsState();
void gameState();
void pauseState();
void winState();
void loseState();

void goToStart();
void goToInstructions();
void goToGame();
void goToPause();
void goToWin();
void goToLose();


enum {START, INSTRUCTIONS, GAME, PAUSE, WIN, LOSE};
int state;


int livesRemaining;
int depressionLivesRemaining;
int enemiesRemaining;

unsigned short buttons;
unsigned short oldButtons;

unsigned short hoff;
unsigned short hoff1;

int frameCounter;

int main() {
    initialize();
    while(1) {
        oldButtons = buttons;
        buttons = (*(volatile unsigned short *)0x04000130);

        switch (state)
        {
        case START:
            startState();
            break;
        case INSTRUCTIONS:
            instructionsState();
            break;
        case GAME:
            gameState();
            break;
        case PAUSE:
            pauseState();
            break;
        case WIN:
            winState();
            break;
        case LOSE:
            loseState();
            break;

        default:
            break;
        }
    }
}

void initialize() {
    (*(unsigned short *)0x4000000) = 0 | (1<<8) | (1<<12);
    (*(volatile unsigned short*)0x4000008) = (0<<7) | (3<<14) | ((0)<<2) | ((28)<<8);


    livesRemaining = 5;
    enemiesRemaining = 8;
    depressionLivesRemaining = 10;

    frameCounter = 0;

    goToStart();

}

void startState() {
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goToGame();
        initGame();
    }
    if ((!(~(oldButtons)&((1<<1))) && (~buttons & ((1<<1))))) {
        goToInstructions();
    }
}


void goToStart() {
    (*(unsigned short *)0x4000000) = 0 | (1<<8);

    DMANow(3, insideOutStartBgPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, insideOutStartBgTiles, &((charblock *)0x6000000)[0], 6528 / 2);
    DMANow(3, insideOutStartBgMap, &((screenblock *)0x6000000)[28], 2048 / 2);
    state = START;
}

void instructionsState() {
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        goToGame();
        initGame();
    }
    if ((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {
        goToStart();
    }
}


void goToInstructions() {

    DMANow(3, instructionsBgPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, instructionsBgTiles, &((charblock *)0x6000000)[0], 11680 / 2);
    DMANow(3, instructionsBgMap, &((screenblock *)0x6000000)[28], 2048 / 2);
    state = INSTRUCTIONS;

}

void gameState() {
    updateGame();
    waitForVBlank();
    drawGame();

    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {





        goToPause();
    }

    if (depressionLivesRemaining == 0) {
        goToWin();
    }

    if (livesRemaining == 0) {
        goToLose();
    }
}


void goToGame() {
    (*(volatile unsigned short*)0x4000008) = (0<<7) | (3<<14) | ((0)<<2) | ((28)<<8);
    (*(unsigned short *)0x4000000) = 0 | (1<<8) | (1<<12);

    DMANow(3, skyBgPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, skyBgTiles, &((charblock *)0x6000000)[0], 51072 / 2);
    DMANow(3, skyBgMap, &((screenblock *)0x6000000)[28], 12288 / 2);

    DMANow(3, spritesheetPal, ((unsigned short *)0x5000200), 512 / 2);
    DMANow(3, spritesheetTiles, &((charblock *)0x6000000)[4], 32768 / 2);


    state = GAME;
}


void pauseState() {


    (*(volatile unsigned short *)0x04000014) = hoff1;

    frameCounter++;

    if (frameCounter % 10 == 0) {

        hoff1++;
    }


    waitForVBlank();


    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {





        goToGame();
    }
    if ((!(~(oldButtons)&((1<<2))) && (~buttons & ((1<<2))))) {
        initialize();
    }
}



void goToPause() {

    (*(volatile unsigned short*)0x4000008) = (0<<7) | (0<<14) | ((0)<<2) | ((28)<<8);
    (*(volatile unsigned short*)0x400000A) = (0<<7) | (1<<14) | ((1)<<2) | ((30)<<8);

    (*(unsigned short *)0x4000000) = 0 | (1<<8) | (1<<9);



    (*(volatile unsigned short *)0x04000010) = hoff;
    hoff = 0;


    DMANow(3, pauseFearPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, pauseFearTiles, &((charblock *)0x6000000)[0], 9440 / 2);
    DMANow(3, pauseFearMap, &((screenblock *)0x6000000)[28], 2048 / 2);

    DMANow(3, pauseSky_2Tiles, &((charblock *)0x6000000)[1], 1472 / 2);
    DMANow(3, pauseSky_2Map, &((screenblock *)0x6000000)[30], 4096 / 2);


    state = PAUSE;
}

void winState() {
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        initialize();
    }
}


void goToWin() {
    hideSprites();

    (*(volatile unsigned short *)0x04000010) = hoff;
    hoff = 0;

    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), (4 * 128));
    DMANow(3, winJoyPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, winJoyTiles, &((charblock *)0x6000000)[0], 11232 / 2);
    DMANow(3, winJoyMap, &((screenblock *)0x6000000)[28], 2048 / 2);

    state = WIN;
}

void loseState() {
    if ((!(~(oldButtons)&((1<<3))) && (~buttons & ((1<<3))))) {
        initialize();
    }
}


void goToLose() {
    hideSprites();

    (*(volatile unsigned short *)0x04000010) = hoff;
    hoff = 0;

    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), (4 * 128));
    DMANow(3, loseSadnessPal, ((unsigned short *)0x5000000), 512 / 2);
    DMANow(3, loseSadnessTiles, &((charblock *)0x6000000)[0], 12160 / 2);
    DMANow(3, loseSadnessMap, &((screenblock *)0x6000000)[28], 2048 / 2);

    state = LOSE;
}
