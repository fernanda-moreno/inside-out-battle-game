/** 
 * TODO: 
 * Sprite animations for Depression enemy - every time it gets shot, it changes color
 *      like a thunderstorm cloud does when there's lightning
 * 
 * Add sound to the game (winning music, losing music, game music, sound when Joy gets hit by lightning)
 * 
 * Improve the art a bit, add more to the start background
 * 
 * DONE: 
 * (Milestone 02)
 * All states accessible (main menu, instructions, win, lose, pause)
 * All sprites shown on screen
 * Ability to win/lose game
 * Game logic implementation is pretty much done
 * 
 * (Milestone 03)
 * Added ability to see player lives (bottom left) AND enemy lives (top right) remaining on screen
 * Made updates to Instructions screen to be more clear in what goes on in the game
 * Parallax in the pause state (thanks for the help, Marie!!) - drew the moving background behind Fear's image
 * Implemented a cheat - by pressing A on keyboard, player turns into the character Sadness, who is immune to the lightning
 *      strikes shot by Depression. Sadness is not immune to the mini Depression clouds, though.
 *      Instead of shooting sunshine, Sadness shoots teardrops.
 *      Player can switch back to Joy by pressing S on keyboard.
 * 
 * (Milestone 04)
 * For the cheat - initially, I had it so that when you pressed A, the character turned to Sadness, and if you pressed S,
 * the character turned back to Joy. Your (Marie's) comment made me realize that it's not super intuitive so I fixed it so that
 * when you press A you can change back & forth between Joy and Sadness.
 * 
 * Added music for start state, game state, win state, and Sadness' crying sound for lose state
 * 
 * Recorded my girlfriend saying "pew" and used that sound for when the sunshine hits Depression
 * 
 * Added animations for memory balls and Depression. Whenever Depression gets hit with lightning,
 *      his mouth forms an "O" shape to make him look hurt
 * 
 * 
 *  
 * BUGS: 
 * (Fixed) Player can have 5 lives max. When the player collided with the memory ball while they had 5 lives,
 * the memory ball was adding lives 2 the player behind the scenes. So even though 5 lives were being displayed
 * on the screen, the memory balls allowed the player to have 7 lives (since 2 memory balls appear in the game)
 *      - Now, when the player catches a memory ball while they have 5 lives, that extra possibility for life
 *        through the memory ball just goes to waste. Player must be careful and only catch memory balls when they
 *        have less than 5 lives.
 * 
 * (Fixed) For the cheat, can't change players by just pressing A (had to press A for Sadness and S for Joy)
 * 
 * (Fixed) For animations, whenever the game paused then unpaused, the animations would stop. This was because
 *          I had been using the same frame counter for all animations as well as the background movement.
 *          When I created counters for memoryball (memballCounter) and Depression (depCounter) and updated them
 *          separately, problem was solved and animations would continue after game was unpaused. 
 * 
 * PLAY: (specified in the Instructions page but will also include here just in case)
 * Joy's main goal is to defeat Depression by shooting rays of sunshine at it and its mini clouds.
 * 
 * Depression has 10 lives, the mini clouds have 1 life, and Joy has 5 lives.
 * 
 * Joy loses a life when she gets shot by Depression's lightning bolts or touches a mini cloud.
 * 
 * When Joy shoots the mini clouds and ALL of them are killed, more of them will appear again.
 * 
 * Joy can also only move forward until about half of the screen (to add some difficulty to the game, otherwise it'd be
 * really easy to kill Depression if Joy gets really close to it)
 * 
 * Joy can regain lives if she collects the 2 memory balls on the screen (1 ball = 1 life). Though, note that Joy can 
 * only have 5 lives max. so these memory balls are there for when she has less than 5 lives. If she takes the memory 
 * balls while she has 5 lives, they basically go to waste.
 * 
 * While in the game state,
 * Press X to shoot sunshine rays at Depression and the mini clouds.
 * Press Enter to pause/unpause the game. While in the pause state, you can press Backspace to return to Main Menu.
 * 
 * Press A to switch between Joy and Sadness characters
 * 
 * 
 * **/

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
#include "bundleofjoy.h"
#include "chasingSadness.h"
#include "sadnessCrying.h"
#include "morethanafeeling.h"

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

    livesRemaining = 5;
    enemiesRemaining = 8;
    depressionLivesRemaining = 10;

    frameCounter = 0;

    setupInterrupts();
    setupSounds();

    goToStart();

}

void startState() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        stopSound();
        playSoundA(chasingSadness, CHASINGSADNESSLEN, CHASINGSADNESSFREQ, 1);
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

    stopSound();
	playSoundA(bundleofjoy, BUNDLEOFJOYLEN, BUNDLEOFJOYFREQ, 1);

    state = START;
} 

void instructionsState() {
    if (BUTTON_PRESSED(BUTTON_START)) {
        stopSound();
        playSoundA(chasingSadness, CHASINGSADNESSLEN, CHASINGSADNESSFREQ, 1);
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

    // stopSound();
    // playSoundA(chasingSadness, CHASINGSADNESSLEN, CHASINGSADNESSFREQ, 1);

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
        unpauseSound();
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

    pauseSound();

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

    stopSound();
    playSoundA(morethanafeeling, MORETHANAFEELINGLEN, MORETHANAFEELINGFREQ, 0);

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

    stopSound();
    playSoundA(sadnessCrying, SADNESSCRYINGLEN - 300, SADNESSCRYINGFREQ, 0);

    DMANow(3, shadowOAM, OAM, (4 * 128));
    DMANow(3, loseSadnessPal, PALETTE, loseSadnessPalLen / 2);
    DMANow(3, loseSadnessTiles, &CHARBLOCK[0], loseSadnessTilesLen / 2);
    DMANow(3, loseSadnessMap, &SCREENBLOCK[28], loseSadnessMapLen / 2);

    state = LOSE;
}