# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
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
# 2 "game.c" 2
# 1 "game.h" 1

typedef struct {
    int col;
    int row;
    int cDel;
    int rDel;
    int width;
    int height;
    int bulletTimer;
    int aniState;

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
# 106 "game.h"
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
# 3 "game.c" 2
# 1 "skyBg.h" 1
# 22 "skyBg.h"
extern const unsigned short skyBgTiles[25536];


extern const unsigned short skyBgMap[6144];


extern const unsigned short skyBgPal[256];
# 4 "game.c" 2
# 1 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/stdlib.h" 1 3
# 10 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/stdlib.h" 3
# 1 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/machine/ieeefp.h" 1 3
# 11 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 1 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/_ansi.h" 1 3
# 15 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/_ansi.h" 3
# 1 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/newlib.h" 1 3
# 14 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/newlib.h" 3
# 1 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/_newlib_version.h" 1 3
# 15 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/newlib.h" 2 3
# 16 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/_ansi.h" 2 3
# 1 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/sys/config.h" 1 3



# 1 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/machine/ieeefp.h" 1 3
# 5 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/sys/config.h" 2 3
# 1 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/sys/features.h" 1 3
# 6 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/sys/config.h" 2 3
# 17 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/_ansi.h" 2 3
# 12 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/stdlib.h" 2 3




# 1 "/Users/fmoreno99/CS2261/devkitARM/lib/gcc/arm-none-eabi/7.1.0/include/stddef.h" 1 3 4
# 216 "/Users/fmoreno99/CS2261/devkitARM/lib/gcc/arm-none-eabi/7.1.0/include/stddef.h" 3 4

# 216 "/Users/fmoreno99/CS2261/devkitARM/lib/gcc/arm-none-eabi/7.1.0/include/stddef.h" 3 4
typedef unsigned int size_t;
# 328 "/Users/fmoreno99/CS2261/devkitARM/lib/gcc/arm-none-eabi/7.1.0/include/stddef.h" 3 4
typedef unsigned int wchar_t;
# 17 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/stdlib.h" 2 3

# 1 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/sys/reent.h" 1 3
# 13 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/sys/reent.h" 3
# 1 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/_ansi.h" 1 3
# 14 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3
# 1 "/Users/fmoreno99/CS2261/devkitARM/lib/gcc/arm-none-eabi/7.1.0/include/stddef.h" 1 3 4
# 149 "/Users/fmoreno99/CS2261/devkitARM/lib/gcc/arm-none-eabi/7.1.0/include/stddef.h" 3 4
typedef int ptrdiff_t;
# 15 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3
# 1 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/sys/_types.h" 1 3
# 24 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/sys/_types.h" 3
# 1 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/machine/_types.h" 1 3



# 1 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/machine/_default_types.h" 1 3
# 41 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 55 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 77 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 103 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 134 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 160 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 182 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 200 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 214 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long long int __intmax_t;







typedef long long unsigned int __uintmax_t;







typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 5 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/machine/_types.h" 2 3


typedef __int64_t _off_t;


typedef __int64_t _fpos_t;


typedef __uint32_t __ino_t;


typedef __uint32_t __dev_t;
# 25 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3
# 1 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/sys/lock.h" 1 3




# 1 "/Users/fmoreno99/CS2261/devkitARM/lib/gcc/arm-none-eabi/7.1.0/include/stdint.h" 1 3 4
# 9 "/Users/fmoreno99/CS2261/devkitARM/lib/gcc/arm-none-eabi/7.1.0/include/stdint.h" 3 4
# 1 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/stdint.h" 1 3 4
# 13 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/stdint.h" 3 4
# 1 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/sys/_intsup.h" 1 3 4
# 35 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 187 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/sys/_intsup.h" 3 4
       
       
       
       
       
       
       
# 14 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4
# 1 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/sys/_stdint.h" 1 3 4
# 20 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/sys/_stdint.h" 3 4
typedef __int8_t int8_t ;



typedef __uint8_t uint8_t ;







typedef __int16_t int16_t ;



typedef __uint16_t uint16_t ;







typedef __int32_t int32_t ;



typedef __uint32_t uint32_t ;







typedef __int64_t int64_t ;



typedef __uint64_t uint64_t ;






typedef __intmax_t intmax_t;




typedef __uintmax_t uintmax_t;




typedef __intptr_t intptr_t;




typedef __uintptr_t uintptr_t;
# 15 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4






typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 51 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 61 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 71 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 81 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 10 "/Users/fmoreno99/CS2261/devkitARM/lib/gcc/arm-none-eabi/7.1.0/include/stdint.h" 2 3 4
# 6 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/sys/lock.h" 2 3

typedef int32_t _LOCK_T;

struct __lock_t {
 _LOCK_T lock;
 uint32_t thread_tag;
 uint32_t counter;
};

typedef struct __lock_t _LOCK_RECURSIVE_T;

extern void __libc_lock_init(_LOCK_T *lock);
extern void __libc_lock_init_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_close(_LOCK_T *lock);
extern void __libc_lock_close_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_acquire(_LOCK_T *lock);
extern void __libc_lock_acquire_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_release(_LOCK_T *lock);
extern void __libc_lock_release_recursive(_LOCK_RECURSIVE_T *lock);


extern int __libc_lock_try_acquire(_LOCK_T *lock);
extern int __libc_lock_try_acquire_recursive(_LOCK_RECURSIVE_T *lock);
# 26 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3


typedef long __blkcnt_t;



typedef long __blksize_t;



typedef __uint64_t __fsblkcnt_t;



typedef __uint32_t __fsfilcnt_t;
# 50 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef int __pid_t;







typedef unsigned short __uid_t;


typedef unsigned short __gid_t;



typedef __uint32_t __id_t;
# 88 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef __uint32_t __mode_t;





__extension__ typedef long long _off64_t;





typedef _off_t __off_t;


typedef _off64_t __loff_t;


typedef long __key_t;
# 129 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef unsigned int __size_t;
# 145 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef signed int _ssize_t;
# 156 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef _ssize_t __ssize_t;


# 1 "/Users/fmoreno99/CS2261/devkitARM/lib/gcc/arm-none-eabi/7.1.0/include/stddef.h" 1 3 4
# 357 "/Users/fmoreno99/CS2261/devkitARM/lib/gcc/arm-none-eabi/7.1.0/include/stddef.h" 3 4
typedef unsigned int wint_t;
# 160 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3



typedef struct
{
  int __count;
  union
  {
    wint_t __wch;
    unsigned char __wchb[4];
  } __value;
} _mbstate_t;



typedef _LOCK_RECURSIVE_T _flock_t;




typedef void *_iconv_t;



typedef unsigned long __clock_t;


typedef long __time_t;


typedef unsigned long __clockid_t;


typedef unsigned long __timer_t;


typedef __uint8_t __sa_family_t;



typedef __uint32_t __socklen_t;


typedef unsigned short __nlink_t;
typedef long __suseconds_t;
typedef unsigned long __useconds_t;




typedef char * __va_list;
# 16 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3






typedef unsigned long __ULong;
# 38 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _reent;

struct __locale_t;






struct _Bigint
{
  struct _Bigint *_next;
  int _k, _maxwds, _sign, _wds;
  __ULong _x[1];
};


struct __tm
{
  int __tm_sec;
  int __tm_min;
  int __tm_hour;
  int __tm_mday;
  int __tm_mon;
  int __tm_year;
  int __tm_wday;
  int __tm_yday;
  int __tm_isdst;
};







struct _on_exit_args {
 void * _fnargs[32];
 void * _dso_handle[32];

 __ULong _fntypes;


 __ULong _is_cxa;
};
# 93 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _atexit {
 struct _atexit *_next;
 int _ind;

 void (*_fns[32])(void);
        struct _on_exit_args _on_exit_args;
};
# 117 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct __sbuf {
 unsigned char *_base;
 int _size;
};
# 181 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct __sFILE {
  unsigned char *_p;
  int _r;
  int _w;
  short _flags;
  short _file;
  struct __sbuf _bf;
  int _lbfsize;






  void * _cookie;

  int (* _read) (struct _reent *, void *, char *, int)
                                          ;
  int (* _write) (struct _reent *, void *, const char *, int)

                                   ;
  _fpos_t (* _seek) (struct _reent *, void *, _fpos_t, int);
  int (* _close) (struct _reent *, void *);


  struct __sbuf _ub;
  unsigned char *_up;
  int _ur;


  unsigned char _ubuf[3];
  unsigned char _nbuf[1];


  struct __sbuf _lb;


  int _blksize;
  _off_t _offset;


  struct _reent *_data;



  _flock_t _lock;

  _mbstate_t _mbstate;
  int _flags2;
};
# 287 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/sys/reent.h" 3
typedef struct __sFILE __FILE;



struct _glue
{
  struct _glue *_next;
  int _niobs;
  __FILE *_iobs;
};
# 319 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _rand48 {
  unsigned short _seed[3];
  unsigned short _mult[3];
  unsigned short _add;




};
# 571 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _reent
{
  int _errno;




  __FILE *_stdin, *_stdout, *_stderr;

  int _inc;
  char _emergency[25];


  int _unspecified_locale_info;
  struct __locale_t *_locale;

  int __sdidinit;

  void (* __cleanup) (struct _reent *);


  struct _Bigint *_result;
  int _result_k;
  struct _Bigint *_p5s;
  struct _Bigint **_freelist;


  int _cvtlen;
  char *_cvtbuf;

  union
    {
      struct
        {
          unsigned int _unused_rand;
          char * _strtok_last;
          char _asctime_buf[26];
          struct __tm _localtime_buf;
          int _gamma_signgam;
          __extension__ unsigned long long _rand_next;
          struct _rand48 _r48;
          _mbstate_t _mblen_state;
          _mbstate_t _mbtowc_state;
          _mbstate_t _wctomb_state;
          char _l64a_buf[8];
          char _signal_buf[24];
          int _getdate_err;
          _mbstate_t _mbrlen_state;
          _mbstate_t _mbrtowc_state;
          _mbstate_t _mbsrtowcs_state;
          _mbstate_t _wcrtomb_state;
          _mbstate_t _wcsrtombs_state;
   int _h_errno;
        } _reent;



      struct
        {

          unsigned char * _nextf[30];
          unsigned int _nmalloc[30];
        } _unused;
    } _new;



  struct _atexit *_atexit;
  struct _atexit _atexit0;



  void (**(_sig_func))(int);




  struct _glue __sglue;
  __FILE __sf[3];
  void *deviceData;
};
# 769 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/sys/reent.h" 3
extern struct _reent *_impure_ptr ;
extern struct _reent *const _global_impure_ptr ;

void _reclaim_reent (struct _reent *);





  struct _reent * __getreent (void);
# 19 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 1 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/sys/cdefs.h" 1 3
# 45 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/sys/cdefs.h" 3
# 1 "/Users/fmoreno99/CS2261/devkitARM/lib/gcc/arm-none-eabi/7.1.0/include/stddef.h" 1 3 4
# 46 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/sys/cdefs.h" 2 3
# 20 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 1 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/machine/stdlib.h" 1 3
# 21 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/stdlib.h" 2 3
# 33 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/stdlib.h" 3


typedef struct
{
  int quot;
  int rem;
} div_t;

typedef struct
{
  long quot;
  long rem;
} ldiv_t;


typedef struct
{
  long long int quot;
  long long int rem;
} lldiv_t;




typedef int (*__compar_fn_t) (const void *, const void *);







int __locale_mb_cur_max (void);



void abort (void) __attribute__ ((__noreturn__));
int abs (int);





int atexit (void (*__func)(void));
double atof (const char *__nptr);



int atoi (const char *__nptr);
int _atoi_r (struct _reent *, const char *__nptr);
long atol (const char *__nptr);
long _atol_r (struct _reent *, const char *__nptr);
void * bsearch (const void * __key, const void * __base, size_t __nmemb, size_t __size, __compar_fn_t _compar)



                                ;
void * calloc (size_t __nmemb, size_t __size) ;
div_t div (int __numer, int __denom);
void exit (int __status) __attribute__ ((__noreturn__));
void free (void *) ;
char * getenv (const char *__string);
char * _getenv_r (struct _reent *, const char *__string);
char * _findenv (const char *, int *);
char * _findenv_r (struct _reent *, const char *, int *);




long labs (long);
ldiv_t ldiv (long __numer, long __denom);
void * malloc (size_t __size) ;
int mblen (const char *, size_t);
int _mblen_r (struct _reent *, const char *, size_t, _mbstate_t *);
int mbtowc (wchar_t *restrict, const char *restrict, size_t);
int _mbtowc_r (struct _reent *, wchar_t *restrict, const char *restrict, size_t, _mbstate_t *);
int wctomb (char *, wchar_t);
int _wctomb_r (struct _reent *, char *, wchar_t, _mbstate_t *);
size_t mbstowcs (wchar_t *restrict, const char *restrict, size_t);
size_t _mbstowcs_r (struct _reent *, wchar_t *restrict, const char *restrict, size_t, _mbstate_t *);
size_t wcstombs (char *restrict, const wchar_t *restrict, size_t);
size_t _wcstombs_r (struct _reent *, char *restrict, const wchar_t *restrict, size_t, _mbstate_t *);
# 133 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/stdlib.h" 3
char * _mkdtemp_r (struct _reent *, char *);
int _mkostemp_r (struct _reent *, char *, int);
int _mkostemps_r (struct _reent *, char *, int, int);
int _mkstemp_r (struct _reent *, char *);
int _mkstemps_r (struct _reent *, char *, int);
char * _mktemp_r (struct _reent *, char *) __attribute__ ((__deprecated__("the use of `mktemp' is dangerous; use `mkstemp' instead")));
void qsort (void * __base, size_t __nmemb, size_t __size, __compar_fn_t _compar);
int rand (void);
void * realloc (void * __r, size_t __size) ;
# 154 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/stdlib.h" 3
void srand (unsigned __seed);
double strtod (const char *restrict __n, char **restrict __end_PTR);
double _strtod_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR);

float strtof (const char *restrict __n, char **restrict __end_PTR);







long strtol (const char *restrict __n, char **restrict __end_PTR, int __base);
long _strtol_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR, int __base);
unsigned long strtoul (const char *restrict __n, char **restrict __end_PTR, int __base);
unsigned long _strtoul_r (struct _reent *,const char *restrict __n, char **restrict __end_PTR, int __base);
# 186 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/stdlib.h" 3
int system (const char *__string);
# 197 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/stdlib.h" 3
void _Exit (int __status) __attribute__ ((__noreturn__));




int _putenv_r (struct _reent *, char *__string);
void * _reallocf_r (struct _reent *, void *, size_t);



int _setenv_r (struct _reent *, const char *__string, const char *__value, int __overwrite);
# 219 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/stdlib.h" 3
char * __itoa (int, char *, int);
char * __utoa (unsigned, char *, int);
# 258 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/stdlib.h" 3
long long atoll (const char *__nptr);

long long _atoll_r (struct _reent *, const char *__nptr);

long long llabs (long long);
lldiv_t lldiv (long long __numer, long long __denom);
long long strtoll (const char *restrict __n, char **restrict __end_PTR, int __base);

long long _strtoll_r (struct _reent *, const char *restrict __n, char **restrict __end_PTR, int __base);

unsigned long long strtoull (const char *restrict __n, char **restrict __end_PTR, int __base);

unsigned long long _strtoull_r (struct _reent *, const char *restrict __n, char **restrict __end_PTR, int __base);
# 279 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/stdlib.h" 3
int _unsetenv_r (struct _reent *, const char *__string);






char * _dtoa_r (struct _reent *, double, int, int, int *, int*, char**);

void * _malloc_r (struct _reent *, size_t) ;
void * _calloc_r (struct _reent *, size_t, size_t) ;
void _free_r (struct _reent *, void *) ;
void * _realloc_r (struct _reent *, void *, size_t) ;
void _mstats_r (struct _reent *, char *);

int _system_r (struct _reent *, const char *);

void __eprintf (const char *, const char *, unsigned int, const char *);
# 316 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/stdlib.h" 3
extern long double _strtold_r (struct _reent *, const char *restrict, char **restrict);

extern long double strtold (const char *restrict, char **restrict);
# 333 "/Users/fmoreno99/CS2261/devkitARM/arm-none-eabi/include/stdlib.h" 3

# 5 "game.c" 2



# 7 "game.c"
PLAYER player;

ENEMY depression;

ENEMY miniDep1[8];

PLAYERBULLET b[30];
BADBULLET bb[20];

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


unsigned short hOff;
unsigned short hOff1;


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

    buttons = (*(volatile unsigned short *)0x04000130);
 hOff = 0;
 hOff1 = 0;
 frameCounter = 0;

}


void updateGame() {

 frameCounter++;

 (*(volatile unsigned short *)0x04000010) = hOff;

 hOff++;



    waitForVBlank();

    updatePlayer();

 updateDepression();

    for (int i = 0; i < 8; i++) {
        updateMiniDepressions();
    }

    for (int i = 0; i < 30; i++) {
  updatePlayerBullets(&b[i]);
 }
    for (int i = 0; i < 20; i++) {
        updateBadBullets(&bb[i]);
    }

    if (depression.bulletTimer % 30 == 0) {
  fireBadBullets(&depression);
  depression.bulletTimer = 0;
 }
 depression.bulletTimer++;


 for (int i = 0; i < 2; i++) {
  updateMemoryBalls();

 }


 for(int i = 0; i < 5; i++) {
  updateLives();
 }

 for (int i = 0; i < 10; i++) {
  updateEnemyLives();
 }


}


void drawGame() {
    drawPlayer();

 drawDepression();

 drawMiniDepressions();


 for (int i = 0; i < 30; i++) {
  drawPlayerBullets(&b[i]);
 }
    for (int i = 0; i < 20; i++) {
        drawBadBullets(&bb[i]);
    }

 drawMemoryBalls();

 drawLives();
 drawEnemyLives();

    waitForVBlank();
    DMANow(3, shadowOAM, ((OBJ_ATTR*)(0x7000000)), 128*4);


}


void initPlayer() {
    player.width = 16;
    player.height = 16;
    player.cDel = 2;
 player.rDel = 2;
 player.row = 80;
 player.col = 10;
    player.bulletTimer = 20;
 player.aniState = 1;
}


void updatePlayer() {


    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<5))) && (player.col > 10)) {
  player.col -= player.cDel;
 }


 if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<4))) && player.col < 90) {
  player.col += player.cDel;
 }
 if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<6))) && player.row > 10) {
  player.row -= player.rDel;
 }
 if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<7))) && player.row < 160 - 20) {
  player.row += player.rDel;
 }

    if ((~((*(volatile unsigned short *)0x04000130)) & ((1<<0))) && player.bulletTimer >= 20) {
  firePlayerBullets();
  player.bulletTimer = 0;
 }
 player.bulletTimer++;




 if (player.aniState == 1) {
  for (int i = 0; i < 20; i++) {
   if (bb[i].active && collision(player.col, player.row, player.width, player.height,
   bb[i].col, bb[i].row, bb[i].width, bb[i].height)) {
    livesRemaining--;
    bb[i].active = 0;
   }
  }
 }


 for (int i = 0; i < 8; i++) {
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

 if ((!(~(oldButtons)&((1<<9))) && (~buttons & ((1<<9))))) {
  player.aniState = 3;
 }

 if ((!(~(oldButtons)&((1<<8))) && (~buttons & ((1<<8))))) {
  player.aniState = 1;
 }




 if (collision(player.col, player.row, player.width, player.height, depression.col, depression.row, depression.width,
 depression.height)) {

  livesRemaining = 0;
 }

}


void drawPlayer() {

    shadowOAM[0].attr0 = (player.row) | (0<<13) | (0<<14) | (1<<10);
    shadowOAM[0].attr1 = (player.col) | (1<<14);
    shadowOAM[0].attr2 = ((player.aniState)*32+(0)) | ((0)<<12);


}


void initDepression() {
 depression.width = 64;
    depression.height = 64;
    depression.cDel = 2;
 depression.rDel = 1;
 depression.row = 80;
 depression.col = 200;
 depression.active = 1;
    depression.bulletTimer = 0;

}


void updateDepression() {


 depression.row += depression.rDel;
 if (depression.row == 130) {
  depression.rDel = -(depression.rDel);
  depression.row += depression.rDel;
 }

 if (depression.row <= 20) {
  depression.rDel = -(depression.rDel);
  depression.row += depression.rDel;
 }

 for (int i = 0; i < 30; i++) {
  if (depression.active && b[i].active && collision(depression.col, depression.row, depression.width, depression.height,
  b[i].col, b[i].row, b[i].width,b[i].height)) {
   b[i].active = 0;
   depressionLivesRemaining--;
   if (depressionLivesRemaining == 0) {
    depression.active = 0;
   }
  }
 }

}


void drawDepression() {

 shadowOAM[25].attr0 = (depression.row) | (0<<13) | (0<<14);
    shadowOAM[25].attr1 = (depression.col) | (2<<14);
 shadowOAM[25].attr2 = ((3)*32+(26)) | ((0)<<12);

}


void initMiniDepressions() {
 for (int i = 0; i < 8; i++) {
  miniDep1[i].width = 16;
  miniDep1[i].height = 16;
  miniDep1[i].cDel = 1;
  miniDep1[i].row = (rand() % 110) + 10;
  miniDep1[i].col = (rand() % 170) + 40;
  miniDep1[i].active = 1;
  miniDep1[i].index = i + 5;
 }

}


void updateMiniDepressions() {
 for (int i = 0; i < 30; i++) {
  for (int j = 0; j < 8; j++) {
   if (miniDep1[j].active && b[i].active && collision(miniDep1[j].col, miniDep1[j].row, miniDep1[j].width, miniDep1[j].height,
   b[i].col, b[i].row, b[i].width, b[i].height)) {
    b[i].active = 0;
    miniDep1[j].active = 0;
    enemiesRemaining--;
   }
  }
 }


 if (enemiesRemaining == 0) {
  initMiniDepressions();
  enemiesRemaining = 8;
 }

}


void drawMiniDepressions() {

 for (int i = 0; i < 8; i ++) {

  if(miniDep1[i].active) {

   shadowOAM[miniDep1[i].index].attr0 = (miniDep1[i].row) | (0<<13) | (0<<14);
   shadowOAM[miniDep1[i].index].attr1 = (miniDep1[i].col) | (1<<14);
   shadowOAM[miniDep1[i].index].attr2 = ((1)*32+(28)) | ((0)<<12);
  } else {
   shadowOAM[miniDep1[i].index].attr0 = (2<<8);

  }
 }

}


void initPlayerBullets() {
    for (int i = 0; i < 30; i++) {
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


void updatePlayerBullets(PLAYERBULLET* bullet) {

    if (bullet-> active) {
  bullet->oldCol = bullet->col;
  bullet->col += bullet->cDel;
 }

 if (bullet->col == 240 - 10) {
  bullet->active = 0;
 }

}


void drawPlayerBullets(PLAYERBULLET* bullet) {
 if (player.aniState == 1) {
  if (bullet->active) {
   shadowOAM[bullet->index].attr0 = (bullet->row) | (0<<13) | (0<<14);
   shadowOAM[bullet->index].attr1 = (bullet->col) | (1<<14);
   shadowOAM[bullet->index].attr2 = ((1)*32+(22)) | ((0)<<12);
  } else {
   shadowOAM[bullet->index].attr0 = (2<<8);
  }
 }

 if (player.aniState == 3) {
  if (bullet->active) {
   shadowOAM[bullet->index].attr0 = (bullet->row) | (0<<13) | (0<<14);
   shadowOAM[bullet->index].attr1 = (bullet->col) | (1<<14);
   shadowOAM[bullet->index].attr2 = ((3)*32+(22)) | ((0)<<12);
  } else {
   shadowOAM[bullet->index].attr0 = (2<<8);
  }

 }

}


void firePlayerBullets() {
    for (int i = 0; i < 30; i++) {
  if (!b[i].active) {
   b[i].row = player.row;
   b[i].col = player.col;
   b[i].active = 1;
   break;
  }
 }
}


void initBadBullets() {
    for (int i = 0; i < 20; i++) {
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


void updateBadBullets(BADBULLET* bullet) {

    if (bullet-> active) {
  bullet->oldCol = bullet->col;
  bullet->col += bullet->cDel;
 }

 if(bullet->col == 0) {
  bullet->active = 0;
 }

}


void drawBadBullets(BADBULLET* bullet) {

    if(bullet-> active) {
        shadowOAM[bullet->index].attr0 = (bullet->row) | (0<<13) | (0<<14);
  shadowOAM[bullet->index].attr1 = (bullet->col) | (1<<14);
     shadowOAM[bullet->index].attr2 = ((1)*32+(24)) | ((0)<<12);
 } else {
  shadowOAM[bullet->index].attr0 = (2<<8);
 }

}


void fireBadBullets(ENEMY* e) {
    if (e->active) {
  for (int i = 0; i < 20; i++) {
   if (!bb[i].active) {
    bb[i].row = e->row + 10;
    bb[i].col = e->col;
    bb[i].active = 1;
    break;
   }
  }
    }
}


void initMemoryBalls() {

 memball1.width = 16;
    memball1.height = 16;
 memball1.row = (rand() % 110) + 1;
 memball1.col = (rand() % 60) + 25;
 memball1.active = 1;
 memball1.index = 70;

 memball2.width = 16;
    memball2.height = 16;
 memball2.row = (rand() % 110) + 1;
 memball2.col = (rand() % 60) + 25;
 memball2.active = 1;
 memball2.index = 71;


}



void updateMemoryBalls() {
# 546 "game.c"
}


void drawMemoryBalls() {

 if (memball1.active) {
   shadowOAM[memball1.index].attr0 = (memball1.row) | (0<<13) | (0<<14);
   shadowOAM[memball1.index].attr1 = (memball1.col) | (1<<14);
   shadowOAM[memball1.index].attr2 = ((1)*32+(14)) | ((0)<<12);

 } else {
  shadowOAM[memball1.index].attr0 = (2<<8);
 }

 if (memball2.active) {
   shadowOAM[memball2.index].attr0 = (memball2.row) | (0<<13) | (0<<14);
   shadowOAM[memball2.index].attr1 = (memball2.col) | (1<<14);
   shadowOAM[memball2.index].attr2 = ((1)*32+(12)) | ((0)<<12);

 } else {
  shadowOAM[memball2.index].attr0 = (2<<8);
 }
}


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


void drawLives() {
 if (life1.active) {
        shadowOAM[20].attr0 = (life1.row) | (0<<13) | (0<<14);
        shadowOAM[20].attr1 = (life1.col) | (1<<14);
        shadowOAM[20].attr2 = ((1)*32+(2)) | ((0)<<12);
    } else {
        shadowOAM[20].attr0 = (2<<8);
    }

 if (life2.active) {
        shadowOAM[19].attr0 = (life2.row) | (0<<13) | (0<<14);
        shadowOAM[19].attr1 = (life2.col) | (1<<14);
        shadowOAM[19].attr2 = ((1)*32+(2)) | ((0)<<12);
    } else {
        shadowOAM[19].attr0 = (2<<8);
    }

 if (life3.active) {
        shadowOAM[18].attr0 = (life3.row) | (0<<13) | (0<<14);
        shadowOAM[18].attr1 = (life3.col) | (1<<14);
        shadowOAM[18].attr2 = ((1)*32+(2)) | ((0)<<12);
    } else {
        shadowOAM[18].attr0 = (2<<8);
    }

 if (life4.active) {
        shadowOAM[17].attr0 = (life4.row) | (0<<13) | (0<<14);
        shadowOAM[17].attr1 = (life4.col) | (1<<14);
        shadowOAM[17].attr2 = ((1)*32+(2)) | ((0)<<12);
    } else {
        shadowOAM[17].attr0 = (2<<8);
    }

 if (life5.active) {
        shadowOAM[16].attr0 = (life5.row) | (0<<13) | (0<<14);
        shadowOAM[16].attr1 = (life5.col) | (1<<14);
        shadowOAM[16].attr2 = ((1)*32+(2)) | ((0)<<12);
    } else {
        shadowOAM[16].attr0 = (2<<8);
    }
}


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


void drawEnemyLives() {

 if (eLife1.active) {
        shadowOAM[60].attr0 = (eLife1.row) | (0<<13) | (0<<14);
        shadowOAM[60].attr1 = (eLife1.col) | (1<<14);
        shadowOAM[60].attr2 = ((1)*32+(4)) | ((0)<<12);
    } else {
        shadowOAM[60].attr0 = (2<<8);
    }

 if (eLife2.active) {
        shadowOAM[61].attr0 = (eLife2.row) | (0<<13) | (0<<14);
        shadowOAM[61].attr1 = (eLife2.col) | (1<<14);
        shadowOAM[61].attr2 = ((1)*32+(4)) | ((0)<<12);
    } else {
        shadowOAM[61].attr0 = (2<<8);
    }

 if (eLife3.active) {
        shadowOAM[62].attr0 = (eLife3.row) | (0<<13) | (0<<14);
        shadowOAM[62].attr1 = (eLife3.col) | (1<<14);
        shadowOAM[62].attr2 = ((1)*32+(4)) | ((0)<<12);
    } else {
        shadowOAM[62].attr0 = (2<<8);
    }

 if (eLife4.active) {
        shadowOAM[63].attr0 = (eLife4.row) | (0<<13) | (0<<14);
        shadowOAM[63].attr1 = (eLife4.col) | (1<<14);
        shadowOAM[63].attr2 = ((1)*32+(4)) | ((0)<<12);
    } else {
        shadowOAM[63].attr0 = (2<<8);
    }

 if (eLife5.active) {
        shadowOAM[64].attr0 = (eLife5.row) | (0<<13) | (0<<14);
        shadowOAM[64].attr1 = (eLife5.col) | (1<<14);
        shadowOAM[64].attr2 = ((1)*32+(4)) | ((0)<<12);
    } else {
        shadowOAM[64].attr0 = (2<<8);
    }

 if (eLife6.active) {
        shadowOAM[65].attr0 = (eLife6.row) | (0<<13) | (0<<14);
        shadowOAM[65].attr1 = (eLife6.col) | (1<<14);
        shadowOAM[65].attr2 = ((1)*32+(4)) | ((0)<<12);
    } else {
        shadowOAM[65].attr0 = (2<<8);
    }

 if (eLife7.active) {
        shadowOAM[66].attr0 = (eLife7.row) | (0<<13) | (0<<14);
        shadowOAM[66].attr1 = (eLife7.col) | (1<<14);
        shadowOAM[66].attr2 = ((1)*32+(4)) | ((0)<<12);
    } else {
        shadowOAM[66].attr0 = (2<<8);
    }

 if (eLife8.active) {
        shadowOAM[67].attr0 = (eLife8.row) | (0<<13) | (0<<14);
        shadowOAM[67].attr1 = (eLife8.col) | (1<<14);
        shadowOAM[67].attr2 = ((1)*32+(4)) | ((0)<<12);
    } else {
        shadowOAM[67].attr0 = (2<<8);
    }

 if (eLife9.active) {
        shadowOAM[68].attr0 = (eLife9.row) | (0<<13) | (0<<14);
        shadowOAM[68].attr1 = (eLife9.col) | (1<<14);
        shadowOAM[68].attr2 = ((1)*32+(4)) | ((0)<<12);
    } else {
        shadowOAM[68].attr0 = (2<<8);
    }

 if (eLife10.active) {
        shadowOAM[69].attr0 = (eLife10.row) | (0<<13) | (0<<14);
        shadowOAM[69].attr1 = (eLife10.col) | (1<<14);
        shadowOAM[69].attr2 = ((1)*32+(4)) | ((0)<<12);
    } else {
        shadowOAM[69].attr0 = (2<<8);
    }

}
