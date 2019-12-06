// Player struct
typedef struct {
    int col;
    int row;
    int cDel;
    int rDel;
    int width;
    int height;
    int bulletTimer;
    int aniState;
    int curFrame;

} PLAYER;

// Player bullet struct
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

// Enemy Struct 
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
    int numFrames;
    int curFrame;

} ENEMY;

// Enemy/Bad bullet struct 
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

// Memory Ball Struct
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
    int numFrames;
    int curFrame;

} MEMORYBALL;

// Player Life Struct
typedef struct {
    int col;
    int row;
    int width;
    int height;
    int active;
} LIVES;

// Enemy Life Struct
typedef struct {
    int col;
    int row;
    int width;
    int height;
    int active;
} ENEMYLIVES;


// Variables
extern int livesRemaining;
extern int enemiesRemaining;
extern int depressionLivesRemaining;

// Constants
#define PLAYERBULLETCOUNT 30
#define BADBULLETCOUNT 20
#define ENEMYCOUNT 9
#define MEMBALLCOUNT 2
#define LIFECOUNT 5
#define ENEMYLIFECOUNT 10

// Prototypes
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

void setupInterrupts();
void setupSounds();
void stopSound();
void playSoundA();
void pauseSound();
void unpauseSound();