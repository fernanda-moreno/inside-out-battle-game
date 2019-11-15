#include "myLib.h"
#include "game.h"
#include "pauseFear.h"
#include "winJoy.h"
#include "loseSadness.h"
#include "insideOutStartBg.h"
#include "instructionsBg.h"
#include "skyBg.h"
#include "spritesheet.h"
#include "pauseSky.h"
#include "pauseSky-2.h"

// Prototypes
void initialize();

// State Prototypes
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

// States
enum {START, INSTRUCTIONS, GAME, PAUSE, WIN, LOSE};
int state;

// Variables
int livesRemaining;
int depressionLivesRemaining;
int enemiesRemaining;

unsigned short buttons;
unsigned short oldButtons;

unsigned short hoff;
unsigned short hoff1;
// unsigned short hoffCurrent;
int frameCounter;

int main() {
    initialize();
    while(1) {
        oldButtons = buttons;
        buttons = BUTTONS;

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
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
    REG_BG0CNT = BG_4BPP | BG_SIZE_LARGE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    // REG_BG1CNT = BG_4BPP | BG_SIZE_LARGE | BG_CHARBLOCK(2) | BG_SCREENBLOCK(26);

    livesRemaining = 5;
    enemiesRemaining = 8;
    depressionLivesRemaining = 10;

    frameCounter = 0;

    goToStart();

}

void startState() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
        initGame();
    }
    if (BUTTON_PRESSED(BUTTON_B)) {
        goToInstructions();
    }
}

// Inside Out background with game name as start screen 
void goToStart() {
    REG_DISPCTL = MODE0 | BG0_ENABLE;

    DMANow(3, insideOutStartBgPal, PALETTE, insideOutStartBgPalLen / 2);
    DMANow(3, insideOutStartBgTiles, &CHARBLOCK[0], insideOutStartBgTilesLen / 2);
    DMANow(3, insideOutStartBgMap, &SCREENBLOCK[28], insideOutStartBgMapLen / 2);
    state = START;
} 

void instructionsState() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        goToGame();
        initGame();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        goToStart();
    }
}

// Show page displaying the game/control instructions
void goToInstructions() {

    DMANow(3, instructionsBgPal, PALETTE, instructionsBgPalLen / 2);
    DMANow(3, instructionsBgTiles, &CHARBLOCK[0], instructionsBgTilesLen / 2);
    DMANow(3, instructionsBgMap, &SCREENBLOCK[28], instructionsBgMapLen / 2);
    state = INSTRUCTIONS;

}

void gameState() {
    updateGame();
    waitForVBlank();
    drawGame();

    if (BUTTON_PRESSED(BUTTON_START)) {
        // add some variable to keep track of current hoff
 
        // hoffCurrent = REG_BG0HOFF;


        goToPause();
    }

    if (depressionLivesRemaining == 0) {
        goToWin();
    }

    if (livesRemaining == 0) {
        goToLose();
    }
}

// Purple sky image as game background
void goToGame() {
    REG_BG0CNT = BG_4BPP | BG_SIZE_LARGE | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;

    DMANow(3, skyBgPal, PALETTE, skyBgPalLen / 2);
    DMANow(3, skyBgTiles, &CHARBLOCK[0], skyBgTilesLen / 2);
    DMANow(3, skyBgMap, &SCREENBLOCK[28], skyBgMapLen / 2);

    DMANow(3, spritesheetPal, SPRITEPALETTE, spritesheetPalLen / 2);
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen / 2);


    state = GAME;
} 


void pauseState() {

    // waitForVBlank();
    REG_BG1HOFF = hoff1;

    frameCounter++;

    if (frameCounter % 10 == 0) {

        hoff1++;
    }


    waitForVBlank();


    if (BUTTON_PRESSED(BUTTON_START)) {
        // set hoff back to the saved hoff in game state
        // hoff = hoffCurrent;

        // it seems that the game is already keeping track of current hoff? 

        goToGame();
    } 
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        initialize();
    } 
}

// Image of Fear as pause state
// TODO: Implement an additional moving background in pause state
void goToPause() {

    REG_BG0CNT = BG_4BPP | BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(28);
    REG_BG1CNT = BG_4BPP | BG_SIZE_WIDE | BG_CHARBLOCK(1) | BG_SCREENBLOCK(30);

    REG_DISPCTL = MODE0 | BG0_ENABLE | BG1_ENABLE;


    // set hoff to zero
    REG_BG0HOFF = hoff;
    hoff = 0;


    DMANow(3, pauseFearPal, PALETTE, pauseFearPalLen / 2);
    DMANow(3, pauseFearTiles, &CHARBLOCK[0], pauseFearTilesLen / 2);
    DMANow(3, pauseFearMap, &SCREENBLOCK[28], pauseFearMapLen / 2);

    DMANow(3, pauseSky_2Tiles, &CHARBLOCK[1], pauseSky_2TilesLen / 2);
    DMANow(3, pauseSky_2Map, &SCREENBLOCK[30], pauseSky_2MapLen / 2);


    state = PAUSE;
} 

void winState() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        initialize();
    } 
}

// Image of Joy as win screen
void goToWin() {
    hideSprites();

    REG_BG0HOFF = hoff;
    hoff = 0;

    DMANow(3, shadowOAM, OAM, (4 * 128));
    DMANow(3, winJoyPal, PALETTE, winJoyPalLen / 2);
    DMANow(3, winJoyTiles, &CHARBLOCK[0], winJoyTilesLen / 2);
    DMANow(3, winJoyMap, &SCREENBLOCK[28], winJoyMapLen / 2);

    state = WIN;
}

void loseState() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        initialize();
    } 
}

// Image of Sadness as lose screen
void goToLose() {
    hideSprites();

    REG_BG0HOFF = hoff;
    hoff = 0;

    DMANow(3, shadowOAM, OAM, (4 * 128));
    DMANow(3, loseSadnessPal, PALETTE, loseSadnessPalLen / 2);
    DMANow(3, loseSadnessTiles, &CHARBLOCK[0], loseSadnessTilesLen / 2);
    DMANow(3, loseSadnessMap, &SCREENBLOCK[28], loseSadnessMapLen / 2);

    state = LOSE;
}