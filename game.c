#include "myLib.h"
#include "game.h"
#include "skyBg.h"
#include "sound.h"
#include "shoot.h"
#include <stdlib.h>

// Game Structures
PLAYER player;

ENEMY depression;

ENEMY miniDep1[ENEMYCOUNT];

PLAYERBULLET b[PLAYERBULLETCOUNT];
BADBULLET bb[BADBULLETCOUNT];

MEMORYBALL memball1;
MEMORYBALL memball2;

LIVES life1;
LIVES life2;
LIVES life3;
LIVES life4;
LIVES life5;

ENEMYLIVES eLife1;
ENEMYLIVES eLife2;
ENEMYLIVES eLife3;
ENEMYLIVES eLife4;
ENEMYLIVES eLife5;
ENEMYLIVES eLife6;
ENEMYLIVES eLife7;
ENEMYLIVES eLife8;
ENEMYLIVES eLife9;
ENEMYLIVES eLife10;

OBJ_ATTR shadowOAM[128];

int frameCounter;

int memballCounter;

int depCounter;

// Horizontal Offset
unsigned short hOff;
unsigned short hOff1;

// Initialize the game
void initGame() {

    hideSprites();

    initPlayer();
	initDepression();
	initMiniDepressions();
	
    initPlayerBullets();
    initBadBullets();

	initMemoryBalls();

	initLives();
	initEnemyLives();

    buttons = BUTTONS;
	hOff = 0;
	hOff1 = 0;
	frameCounter = 0;
	memballCounter = 0;
	depCounter = 0;

}

// Update the game as each sprite moves and dies
void updateGame() {

	frameCounter++;
	// Scroll the background
	REG_BG0HOFF = hOff;
	hOff++;


    waitForVBlank();

    updatePlayer();

	updateDepression();

    for (int i = 0; i < ENEMYCOUNT; i++) {
        updateMiniDepressions();
    }

    for (int i = 0; i < PLAYERBULLETCOUNT; i++) {
		updatePlayerBullets(&b[i]);
	}
    for (int i = 0; i < BADBULLETCOUNT; i++) {
        updateBadBullets(&bb[i]);
    }

    if (depression.bulletTimer == 30) {
		fireBadBullets(&depression);
		depression.bulletTimer = 0;
	}
	depression.bulletTimer++;


	for (int i = 0; i < MEMBALLCOUNT; i++) {	
		updateMemoryBalls();

	}

	for(int i = 0; i < LIFECOUNT; i++) {
		updateLives();
	}

	for (int i = 0; i < ENEMYLIFECOUNT; i++) {
		updateEnemyLives();
	}
	

}

// Draw the game and all of its sprites
void drawGame() {
    drawPlayer();

	drawDepression();
	
	drawMiniDepressions();


	for (int i = 0; i < PLAYERBULLETCOUNT; i++) {
		drawPlayerBullets(&b[i]);
	}
    for (int i = 0; i < BADBULLETCOUNT; i++) {
        drawBadBullets(&bb[i]);
    }

	drawMemoryBalls();

	drawLives();
	drawEnemyLives();

    waitForVBlank();
    DMANow(3, shadowOAM, OAM, 128*4);


}

// Initialize the player
void initPlayer() {
    player.width = 16;
    player.height = 16;
    player.cDel = 2;
	player.rDel = 2;
	player.row = 80;
	player.col = 10;
    player.bulletTimer = 20;
	player.aniState = 1;
	player.curFrame = 0;
}

// Update the player as she moves on the screen and shoots sunshine rays
void updatePlayer() {

	// Allow player movement while ensuring she stays within screen bounds
    if (BUTTON_HELD(BUTTON_LEFT) && (player.col > 10)) {
		player.col -= player.cDel;
	}

	// Player cannot move forward after a certain point on the screen (adds some difficulty to the game)
	if (BUTTON_HELD(BUTTON_RIGHT) && player.col < ((SCREENWIDTH/2) - player.width)) {
		player.col += player.cDel;
	}
	if (BUTTON_HELD(BUTTON_UP) && player.row > 10) {
		player.row -= player.rDel;
	}
	if (BUTTON_HELD(BUTTON_DOWN) && player.row < SCREENHEIGHT - 20) {
		player.row += player.rDel;
	}

    if (BUTTON_HELD(BUTTON_A) && player.bulletTimer >= 20) {
		firePlayerBullets();
		player.bulletTimer = 0;
	}
	player.bulletTimer++;

	

	// When lightning hits player, player loses a life and lightning disappears
	if (player.aniState == 1) {
		for (int i = 0; i < BADBULLETCOUNT; i++) {
			if (bb[i].active && collision(player.col, player.row, player.width, player.height,
			bb[i].col, bb[i].row, bb[i].width, bb[i].height)) {
				livesRemaining--;
				bb[i].active = 0;
			}
		}
	}

	// When player collides with enemy, player loses a life and bounces back 10 cols
	for (int i = 0; i < ENEMYCOUNT; i++) {
		if ((player.col > 10) && miniDep1[i].active && collision(player.col, player.row, player.width, player.height,
		miniDep1[i].col, miniDep1[i].row, miniDep1[i].width, miniDep1[i].height)) {

			livesRemaining--;
			player.col -= 10;
		}
	}



	if (memball1.active){
		
		if (collision(player.col, player.row, player.width, player.height,
		memball1.col, memball1.row, memball1.width, memball1.height)) {

			if (livesRemaining < 5) {
				
				livesRemaining++;
			}
			memball1.active = 0;
		} 

	}

	if (memball2.active) {
		
		if (collision(player.col, player.row, player.width, player.height,
		memball2.col, memball2.row, memball2.width, memball2.height)) {
			if (livesRemaining < 5){
				livesRemaining++;
			}
			memball2.active = 0;
								
		} 
			
	}

	player.curFrame = 0;
	if (player.curFrame == 0) {
		if (BUTTON_HELD(BUTTON_RIGHT))
			player.curFrame = 2;
	}

	if (player.aniState == 1) {
		if (BUTTON_PRESSED(BUTTON_L)) {
			player.aniState = 3;
				
		}
	} else {
		if (BUTTON_PRESSED(BUTTON_L)) {
			player.aniState = 1;
		}
	}



	// If player collides with big Depression enemy, player loses
	// This isn't possible anymore anyways since the player cannot move past col 90
	// I'm leaving this here in case I change my mind and decide to let player move anywhere on screen
	if (collision(player.col, player.row, player.width, player.height, depression.col, depression.row, depression.width,
	depression.height)) {

		livesRemaining = 0;
	}

}

// Draw the player
void drawPlayer() {

    shadowOAM[0].attr0 = (player.row) | ATTR0_4BPP | ATTR0_SQUARE | ATTR0_BLEND;
    shadowOAM[0].attr1 = (player.col) | ATTR1_SMALL;
    shadowOAM[0].attr2 = ATTR2_TILEID(player.curFrame, player.aniState) | ATTR2_PALROW(0);


}

// Initialize big Depression enemy
void initDepression() {
	depression.width = 64;
    depression.height = 64;
    depression.cDel = 2;
	depression.rDel = 1;
	depression.row = 80;
	depression.col = 200;
	depression.active = 1;
    depression.bulletTimer = 0;
	depression.numFrames = 5;
	depression.curFrame = 1;

}

// Update Depression enemy
void updateDepression() {

	// Depression constantly moves up and down and shoots lightning bolts 
	depression.row += depression.rDel;
	if (depression.row == 130) {
		depression.rDel = -(depression.rDel);
		depression.row += depression.rDel;
	} 

	if (depression.row <= 20) {
		depression.rDel = -(depression.rDel);
		depression.row += depression.rDel;
	}

	for (int i = 0; i < PLAYERBULLETCOUNT; i++) {
		if (depression.active && b[i].active && collision(depression.col, depression.row, depression.width, depression.height,
		b[i].col, b[i].row, b[i].width,b[i].height)) {
			depression.curFrame = 13;
			playSoundB(shoot, SHOOTLEN, SHOOTFREQ, 0);
			b[i].active = 0;
			depressionLivesRemaining--;
			if (depressionLivesRemaining == 0) {
				depression.active = 0;
			}
		}
	}

	depCounter++;
	if (depCounter == 20) {
			
		if(depression.curFrame <= (depression.numFrames)) {
			depression.curFrame += 4;
		} else {
			depression.curFrame = 1;
		}
		depCounter = 0;
	}

}

// Draw Depression enemy
void drawDepression() {

	shadowOAM[25].attr0 = (depression.row) | ATTR0_4BPP | ATTR0_SQUARE;
    shadowOAM[25].attr1 = (depression.col) | ATTR1_MEDIUM;
	shadowOAM[25].attr2 = ATTR2_TILEID(26, depression.curFrame) | ATTR2_PALROW(0);

}

// Initialize mini depression enemies
void initMiniDepressions() {
	for (int i = 0; i < ENEMYCOUNT; i++) {
		miniDep1[i].width = 16;
		miniDep1[i].height = 16;
		miniDep1[i].row = (rand() % 110) + 10;
		miniDep1[i].col = (rand() % 170) + 40;
		miniDep1[i].rDel = 1;
		miniDep1[i].active = 1;
		miniDep1[i].index = i + 5;
	}

}

// Update mini depression enemies
void updateMiniDepressions() {
	for (int i = 0; i < PLAYERBULLETCOUNT; i++) {
		for (int j = 0; j < ENEMYCOUNT; j++) {
			if (miniDep1[j].active && b[i].active && collision(miniDep1[j].col, miniDep1[j].row, miniDep1[j].width, miniDep1[j].height,
			b[i].col, b[i].row, b[i].width, b[i].height)) {
				b[i].active = 0;
				miniDep1[j].active = 0;
				enemiesRemaining--;
			}
		}
	}

	// When all depression babies are killed, more will appear!
	if (enemiesRemaining == 0) {
		initMiniDepressions();
		enemiesRemaining = 8;
	}

}

// Draw mini depression enemies
void drawMiniDepressions() {

	for (int i = 0; i < ENEMYCOUNT; i ++) {

		if(miniDep1[i].active) {

			shadowOAM[miniDep1[i].index].attr0 = (miniDep1[i].row) | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[miniDep1[i].index].attr1 = (miniDep1[i].col) | ATTR1_SMALL;
			shadowOAM[miniDep1[i].index].attr2 = ATTR2_TILEID(8, 1) | ATTR2_PALROW(0);
		} else {
			shadowOAM[miniDep1[i].index].attr0 = ATTR0_HIDE;

		}
	}

}

// Initialize the player's lightning ray weapons/bullets
void initPlayerBullets() {
    for (int i = 0; i < PLAYERBULLETCOUNT; i++) {
		b[i].height = 16;
		b[i].width = 16;
		b[i].row = -(b[i].height);
		b[i].col = 0;
		b[i].oldRow = player.row;
		b[i].oldCol = player.col;
		b[i].rDel = -2;
        b[i].cDel = 2;
		b[i].active = 0;
        b[i].index = i + 30;
	}

}

// Move the player's bullets right towards the depression enemies once they are shot
void updatePlayerBullets(PLAYERBULLET* bullet) {

    if (bullet-> active) {
		bullet->oldCol = bullet->col;
		bullet->col += bullet->cDel;
	}

	if (bullet->col == SCREENWIDTH - 10) {
		bullet->active = 0;
	}

}

// Draw the player's bullets
void drawPlayerBullets(PLAYERBULLET* bullet) {
	if (player.aniState == 1) {
		if (bullet->active) {
			shadowOAM[bullet->index].attr0 = (bullet->row) | ATTR0_4BPP | ATTR0_SQUARE;	  	  	
			shadowOAM[bullet->index].attr1 = (bullet->col) | ATTR1_SMALL;
			shadowOAM[bullet->index].attr2 =  ATTR2_TILEID(22, 1) | ATTR2_PALROW(0);
		} else {
			shadowOAM[bullet->index].attr0 = ATTR0_HIDE;
		}
	}

	if (player.aniState == 3) {
		if (bullet->active) {
			shadowOAM[bullet->index].attr0 = (bullet->row) | ATTR0_4BPP | ATTR0_SQUARE;	  	  	
			shadowOAM[bullet->index].attr1 = (bullet->col) | ATTR1_SMALL;
			shadowOAM[bullet->index].attr2 =  ATTR2_TILEID(22, 3) | ATTR2_PALROW(0);
		} else {
			shadowOAM[bullet->index].attr0 = ATTR0_HIDE;
		}

	}

}

// Fire the player bullets when the player presses A (X on keyboard)
void firePlayerBullets() {
    for (int i = 0; i < PLAYERBULLETCOUNT; i++) {
		if (!b[i].active) {
			b[i].row = player.row;
			b[i].col = player.col;
			b[i].active = 1;
			break;
		}
	}
}

// Initialize the enemy's weapon (lightning rays), aka the bad bullets the player wants to avoid
void initBadBullets() {
    for (int i = 0; i < BADBULLETCOUNT; i++) {
		bb[i].height = 16;
		bb[i].width = 16;
		bb[i].row = -(bb[i].height);
		bb[i].col = 0;
		bb[i].oldRow = depression.row;
		bb[i].oldCol = depression.col;
		bb[i].rDel = 2;
        bb[i].cDel = -2;
		bb[i].active = 0;
        bb[i].index = i + 100;
	}

}

// Update the lightning rays as they moves towards the player
void updateBadBullets(BADBULLET* bullet) {

    if (bullet-> active) {
		bullet->oldCol = bullet->col;
		bullet->col += bullet->cDel;
	}

	if(bullet->col == 0) {
		bullet->active = 0;
	}

}

// Draw the lightning rays
void drawBadBullets(BADBULLET* bullet) {

    if(bullet-> active) {
        shadowOAM[bullet->index].attr0 = (bullet->row) | ATTR0_4BPP | ATTR0_SQUARE;	  	  	
		shadowOAM[bullet->index].attr1 = (bullet->col) | ATTR1_SMALL;
	   	shadowOAM[bullet->index].attr2 =  ATTR2_TILEID(24, 1) | ATTR2_PALROW(0);
	} else {
		shadowOAM[bullet->index].attr0 = ATTR0_HIDE;
	}

}

// Have lighting rays fire from Depression enemy
void fireBadBullets(ENEMY* e) {
    if (e->active) {
		for (int i = 0; i < BADBULLETCOUNT; i++) {
			if (!bb[i].active) {
				bb[i].row = e->row + 10;
				bb[i].col = e->col;
				bb[i].active = 1;
				break;
			}
		}
    }
}

// Initialize Memory Balls
void initMemoryBalls() {

	memball1.width = 16;
    memball1.height = 16;
	memball1.row = (rand() % 110) + 1;
	memball1.col = (rand() % 60) + 25;
	memball1.active = 1;
	memball1.index = 70;
	memball1.curFrame = 1;
	memball1.numFrames = 5;

	memball2.width = 16;
    memball2.height = 16;
	memball2.row = (rand() % 110) + 1;
	memball2.col = (rand() % 60) + 25;
	memball2.active = 1;
	memball2.index = 71;
	memball2.curFrame = 1;
	memball2.numFrames = 5;

}

// Update Memory Balls
void updateMemoryBalls() {

		// Memory ball animation
		memballCounter++;
		if (memballCounter == 30) {
			
			if(memball1.curFrame < memball1.numFrames) {
				memball1.curFrame += memball1.curFrame + 1;
			} else {
				memball1.curFrame = 1;
			}

			if (memball2.curFrame < memball2.numFrames) {
				memball2.curFrame += memball2.curFrame + 1;
			} else {
				memball2.curFrame = 1;
			}
			memballCounter = 0;
		}

}

// Draw Memory Balls 
void drawMemoryBalls() {

	if (memball1.active) {
			shadowOAM[memball1.index].attr0 = (memball1.row) | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[memball1.index].attr1 = (memball1.col) | ATTR1_SMALL;
			shadowOAM[memball1.index].attr2 = ATTR2_TILEID(14, memball1.curFrame) | ATTR2_PALROW(0);

	} else {
		shadowOAM[memball1.index].attr0 = ATTR0_HIDE;
	}

	if (memball2.active) {
			shadowOAM[memball2.index].attr0 = (memball2.row) | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[memball2.index].attr1 = (memball2.col) | ATTR1_SMALL;
			shadowOAM[memball2.index].attr2 = ATTR2_TILEID(12, memball2.curFrame) | ATTR2_PALROW(0);

	} else {
		shadowOAM[memball2.index].attr0 = ATTR0_HIDE;
	}
}

// Draw the player lives for each number of lives they currently have
void initLives() {
	life1.width = 16;
    life1.height = 16;
	life1.row = 130;
	life1.col = 10;
    life1.active = 1;

	life2.width = 16;
    life2.height = 16;
	life2.row = 130;
	life2.col = 30;
    life2.active = 1;

	life3.width = 16;
    life3.height = 16;
	life3.row = 130;
	life3.col = 50;
    life3.active = 1;

	life4.width = 16;
    life4.height = 16;
	life4.row = 130;
	life4.col = 70;
    life4.active = 1;

	life5.width = 16;
    life5.height = 16;
	life5.row = 130;
	life5.col = 90;
    life5.active = 1;
}

// Update the player's lives remaining
void updateLives() {

	if (livesRemaining == 5) {
		life5.active = 1;
	}

	if (livesRemaining == 4) {
		life5.active = 0;
		life4.active = 1;
	}

	if (livesRemaining == 3) {
		life4.active = 0;
		life3.active = 1;
	}
	if (livesRemaining == 2) {
		life3.active = 0;
		life2.active = 1;
	}
	if (livesRemaining == 1) {
		life2.active = 0;
		life1.active = 1;
	}
	
}

// Draw the player lives at the bottom left corner
void drawLives() {
	if (life1.active) {
        shadowOAM[20].attr0 = (life1.row) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[20].attr1 = (life1.col) | ATTR1_SMALL;
        shadowOAM[20].attr2 = ATTR2_TILEID(4, 1) | ATTR2_PALROW(0);
    } else {
        shadowOAM[20].attr0 = ATTR0_HIDE;
    }

	if (life2.active) {
        shadowOAM[19].attr0 = (life2.row) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[19].attr1 = (life2.col) | ATTR1_SMALL;
        shadowOAM[19].attr2 = ATTR2_TILEID(4, 1) | ATTR2_PALROW(0);
    } else {
        shadowOAM[19].attr0 = ATTR0_HIDE;
    }

	if (life3.active) {
        shadowOAM[18].attr0 = (life3.row) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[18].attr1 = (life3.col) | ATTR1_SMALL;
        shadowOAM[18].attr2 = ATTR2_TILEID(4, 1) | ATTR2_PALROW(0);
    } else {
        shadowOAM[18].attr0 = ATTR0_HIDE;
    }

	if (life4.active) {
        shadowOAM[17].attr0 = (life4.row) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[17].attr1 = (life4.col) | ATTR1_SMALL;
        shadowOAM[17].attr2 = ATTR2_TILEID(4, 1) | ATTR2_PALROW(0);
    } else {
        shadowOAM[17].attr0 = ATTR0_HIDE;
    }

	if (life5.active) {
        shadowOAM[16].attr0 = (life5.row) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[16].attr1 = (life5.col) | ATTR1_SMALL;
        shadowOAM[16].attr2 = ATTR2_TILEID(4, 1) | ATTR2_PALROW(0);
    } else {
        shadowOAM[16].attr0 = ATTR0_HIDE;
    }
}

// Initialize Enemy lives
void initEnemyLives() {
	eLife1.width = 16;
    eLife1.height = 16;
	eLife1.row = 4;
	eLife1.col = 120;
    eLife1.active = 1;

	eLife2.width = 16;
    eLife2.height = 16;
	eLife2.row = 4;
	eLife2.col = 130;
    eLife2.active = 1;

	eLife3.width = 16;
    eLife3.height = 16;
	eLife3.row = 4;
	eLife3.col = 140;
    eLife3.active = 1;

	eLife4.width = 16;
    eLife4.height = 16;
	eLife4.row = 4;
	eLife4.col = 150;
    eLife4.active = 1;

	eLife5.width = 16;
    eLife5.height = 16;
	eLife5.row = 4;
	eLife5.col = 160;
    eLife5.active = 1;

	eLife6.width = 16;
    eLife6.height = 16;
	eLife6.row = 4;
	eLife6.col = 170;
    eLife6.active = 1;

	eLife7.width = 16;
    eLife7.height = 16;
	eLife7.row = 4;
	eLife7.col = 180;
    eLife7.active = 1;

	eLife8.width = 16;
    eLife8.height = 16;
	eLife8.row = 4;
	eLife8.col = 190;
    eLife8.active = 1;

	eLife9.width = 16;
    eLife9.height = 16;
	eLife9.row = 4;
	eLife9.col = 200;
    eLife9.active = 1;

	eLife10.width = 16;
    eLife10.height = 16;
	eLife10.row = 4;
	eLife10.col = 210;
    eLife10.active = 1;

}

// Update Enemy lives
void updateEnemyLives() {

	if (depressionLivesRemaining == 9) {
		eLife10.active = 0;
	}

	if (depressionLivesRemaining == 8) {
		eLife9.active = 0;
	}

	if (depressionLivesRemaining == 7) {
		eLife8.active = 0;
	}

	if (depressionLivesRemaining == 6) {
		eLife7.active = 0;
	}

	if (depressionLivesRemaining == 5) {
		eLife6.active = 0;
	}

	if (depressionLivesRemaining == 4) {
		eLife5.active = 0;
	}

	if (depressionLivesRemaining == 3) {
		eLife4.active = 0;
	}

	if (depressionLivesRemaining == 2) {
		eLife3.active = 0;
	}

	if (depressionLivesRemaining == 1) {
		eLife2.active = 0;
	}

	if (depressionLivesRemaining == 0) {
		eLife1.active = 0;
	}

}

// Draw Enemy lives
void drawEnemyLives() {

	if (eLife1.active) {
        shadowOAM[60].attr0 = (eLife1.row) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[60].attr1 = (eLife1.col) | ATTR1_SMALL;
        shadowOAM[60].attr2 = ATTR2_TILEID(6, 1) | ATTR2_PALROW(0);
    } else {
        shadowOAM[60].attr0 = ATTR0_HIDE;
    }

	if (eLife2.active) {
        shadowOAM[61].attr0 = (eLife2.row) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[61].attr1 = (eLife2.col) | ATTR1_SMALL;
        shadowOAM[61].attr2 = ATTR2_TILEID(6, 1) | ATTR2_PALROW(0);
    } else {
        shadowOAM[61].attr0 = ATTR0_HIDE;
    }

	if (eLife3.active) {
        shadowOAM[62].attr0 = (eLife3.row) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[62].attr1 = (eLife3.col) | ATTR1_SMALL;
        shadowOAM[62].attr2 = ATTR2_TILEID(6, 1) | ATTR2_PALROW(0);
    } else {
        shadowOAM[62].attr0 = ATTR0_HIDE;
    }

	if (eLife4.active) {
        shadowOAM[63].attr0 = (eLife4.row) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[63].attr1 = (eLife4.col) | ATTR1_SMALL;
        shadowOAM[63].attr2 = ATTR2_TILEID(6, 1) | ATTR2_PALROW(0);
    } else {
        shadowOAM[63].attr0 = ATTR0_HIDE;
    }

	if (eLife5.active) {
        shadowOAM[64].attr0 = (eLife5.row) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[64].attr1 = (eLife5.col) | ATTR1_SMALL;
        shadowOAM[64].attr2 = ATTR2_TILEID(6, 1) | ATTR2_PALROW(0);
    } else {
        shadowOAM[64].attr0 = ATTR0_HIDE;
    }

	if (eLife6.active) {
        shadowOAM[65].attr0 = (eLife6.row) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[65].attr1 = (eLife6.col) | ATTR1_SMALL;
        shadowOAM[65].attr2 = ATTR2_TILEID(6, 1) | ATTR2_PALROW(0);
    } else {
        shadowOAM[65].attr0 = ATTR0_HIDE;
    }

	if (eLife7.active) {
        shadowOAM[66].attr0 = (eLife7.row) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[66].attr1 = (eLife7.col) | ATTR1_SMALL;
        shadowOAM[66].attr2 = ATTR2_TILEID(6, 1) | ATTR2_PALROW(0);
    } else {
        shadowOAM[66].attr0 = ATTR0_HIDE;
    }

	if (eLife8.active) {
        shadowOAM[67].attr0 = (eLife8.row) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[67].attr1 = (eLife8.col) | ATTR1_SMALL;
        shadowOAM[67].attr2 = ATTR2_TILEID(6, 1) | ATTR2_PALROW(0);
    } else {
        shadowOAM[67].attr0 = ATTR0_HIDE;
    }

	if (eLife9.active) {
        shadowOAM[68].attr0 = (eLife9.row) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[68].attr1 = (eLife9.col) | ATTR1_SMALL;
        shadowOAM[68].attr2 = ATTR2_TILEID(6, 1) | ATTR2_PALROW(0);
    } else {
        shadowOAM[68].attr0 = ATTR0_HIDE;
    }

	if (eLife10.active) {
        shadowOAM[69].attr0 = (eLife10.row) | ATTR0_4BPP | ATTR0_SQUARE;
        shadowOAM[69].attr1 = (eLife10.col) | ATTR1_SMALL;
        shadowOAM[69].attr2 = ATTR2_TILEID(6, 1) | ATTR2_PALROW(0);
    } else {
        shadowOAM[69].attr0 = ATTR0_HIDE;
    }

}

// All Sound stuff below

void setupSounds() {
    REG_SOUNDCNT_X = SND_ENABLED;

	REG_SOUNDCNT_H = SND_OUTPUT_RATIO_100 | 
                     DSA_OUTPUT_RATIO_100 | 
                     DSA_OUTPUT_TO_BOTH | 
                     DSA_TIMER0 | 
                     DSA_FIFO_RESET |
                     DSB_OUTPUT_RATIO_100 | 
                     DSB_OUTPUT_TO_BOTH | 
                     DSB_TIMER1 | 
                     DSB_FIFO_RESET;

	REG_SOUNDCNT_L = 0;
}

void playSoundA( const unsigned char* sound, int length, int frequency, int loops) {
        dma[1].cnt = 0;
	
        int ticks = PROCESSOR_CYCLES_PER_SECOND/frequency;
	
        DMANow(1, sound, REG_FIFO_A, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);
	
        REG_TM0CNT = 0;
	
        REG_TM0D = -ticks;
        REG_TM0CNT = TIMER_ON;

        soundA.isPlaying = 1;
        soundA.duration = ((VBLANK_FREQ*length)/frequency);
        soundA.vBlankCount = 0;
        soundA.data = sound;
        soundA.length = length;
        soundA.frequency = frequency;
        soundA.loops = loops;
        
}


void playSoundB( const unsigned char* sound, int length, int frequency, int loops) {

        dma[2].cnt = 0;

        int ticks = PROCESSOR_CYCLES_PER_SECOND/frequency;

        DMANow(2, sound, REG_FIFO_B, DMA_DESTINATION_FIXED | DMA_AT_REFRESH | DMA_REPEAT | DMA_32);

        REG_TM1CNT = 0;
	
        REG_TM1D = -ticks;
        REG_TM1CNT = TIMER_ON;
	
        soundB.isPlaying = 1;
        soundB.duration = ((VBLANK_FREQ*length)/frequency);
        soundB.vBlankCount = 0;
        soundB.data = sound;
        soundB.length = length;
        soundB.frequency = frequency;
        soundB.loops = loops;


}

void setupInterrupts() {
	REG_IME = 0;
	
    REG_INTERRUPT = (unsigned int) interruptHandler;

	REG_IE |= INT_VBLANK;
	REG_DISPSTAT |= INT_VBLANK_ENABLE;
	REG_IME = 1;
}

void interruptHandler() {

	REG_IME = 0;

	if(REG_IF & INT_VBLANK) {
		if (soundA.isPlaying) {

            soundA.vBlankCount++;
            if ((soundA.vBlankCount >= soundA.duration)) {
                if(soundA.loops) {
                    playSoundA(soundA.data, soundA.length, soundA.frequency, soundA.loops);
                    
                } else {
                    soundA.isPlaying = 0;
                    dma[1].cnt = 0;
                    REG_TM0CNT = TIMER_OFF;

                }

            }

		}

		if (soundB.isPlaying) {

            soundB.vBlankCount++;
            if ((soundB.vBlankCount >= soundB.duration)) {
                if(soundB.loops) {
                    playSoundB(soundB.data, soundB.length, soundB.frequency, soundB.loops);
                    
                } else {
                    soundB.isPlaying = 0;
                    dma[2].cnt = 0;
                    REG_TM1CNT = TIMER_OFF;

                }

            }

		}

		REG_IF = INT_VBLANK; 
	}

	REG_IME = 1;
}

void pauseSound() {

    soundA.isPlaying = 0;
    REG_TM0CNT = 0;

    soundB.isPlaying = 0;
    REG_TM1CNT = 0;

}

void unpauseSound() {

    soundA.isPlaying = 1;
    REG_TM0CNT = TIMER_ON;

    soundB.isPlaying = 1;
    REG_TM1CNT = TIMER_ON;
	
}

void stopSound() {

    soundA.isPlaying = 0;
    dma[1].cnt = 0;
    REG_TM0CNT = 0;

    soundB.isPlaying = 0;
    dma[2].cnt = 0;
    REG_TM1CNT = 0;

}