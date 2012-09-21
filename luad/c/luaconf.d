/* Converted to D from luaconf.h by htod */
module luad.c.luaconf;
/*
** Configuration file for Lua
** See Copyright Notice in lua.h
*/


//C	 #ifndef lconfig_h
//C	 #define lconfig_h

//C	 #include <limits.h>
//import std.c.limits;
//C	 #include <stddef.h>
//import std.c.stddef;

extern (C) {

	/*
	** ==================================================================
	** Search for "@@" to find all configurable definitions.
	** ===================================================================
	*/


	/*
	@@ LUA_ANSI controls the use of non-ansi features.
	** CHANGE it (define it) if you want Lua to avoid the use of any
	** non-ansi feature or library.
	*/
	//C	 #if defined(__STRICT_ANSI__)
	//C	 #define LUA_ANSI
	//C	 #endif


	//C	 #if !defined(LUA_ANSI) && defined(_WIN32)
	//C	 #define LUA_WIN
	//C	 #endif

	//C	 #if defined(LUA_USE_LINUX)
	//C	 #define LUA_USE_POSIX
	//C	 #define LUA_USE_DLOPEN		/* needs an extra library: -ldl */
	//C	 #define LUA_USE_READLINE	/* needs some extra libraries */
	//C	 #endif

	//C	 #if defined(LUA_USE_MACOSX)
	//C	 #define LUA_USE_POSIX
	//C	 #define LUA_DL_DYLD		/* does not need extra library */
	//C	 #endif



	/*
	@@ LUA_USE_POSIX includes all functionallity listed as X/Open System
	@* Interfaces Extension (XSI).
	** CHANGE it (define it) if your system is XSI compatible.
	*/
	//C	 #if defined(LUA_USE_POSIX)
	//C	 #define LUA_USE_MKSTEMP
	//C	 #define LUA_USE_ISATTY
	//C	 #define LUA_USE_POPEN
	//C	 #define LUA_USE_ULONGJMP
	//C	 #endif


	/*
	@@ LUA_PATH and LUA_CPATH are the names of the environment variables that
	@* Lua check to set its paths.
	@@ LUA_INIT is the name of the environment variable that Lua
	@* checks for initialization code.
	** CHANGE them if you want different names.
	*/
	//C	 #define LUA_PATH		"LUA_PATH"
	//C	 #define LUA_CPATH	   "LUA_CPATH"
	//C	 #define LUA_INIT	"LUA_INIT"


	/*
	@@ LUA_PATH_DEFAULT is the default path that Lua uses to look for
	@* Lua libraries.
	@@ LUA_CPATH_DEFAULT is the default path that Lua uses to look for
	@* C libraries.
	** CHANGE them if your machine has a non-conventional directory
	** hierarchy or if you want to install your libraries in
	** non-conventional directories.
	*/
	//C	 #if defined(_WIN32)
	/*
	** In Windows, any exclamation mark ('!') in the path is replaced by the
	** path of the directory of the executable file of the current process.
	*/
	//C	 #define LUA_LDIR	"!\\lua\\"
	//C	 #define LUA_CDIR	"!\\"
	//C	 #define LUA_PATH_DEFAULT  		".\\?.lua;"  LUA_LDIR"?.lua;"  LUA_LDIR"?\\init.lua;" 					 LUA_CDIR"?.lua;"  LUA_CDIR"?\\init.lua"
	//C	 #define LUA_CPATH_DEFAULT 	".\\?.dll;"  LUA_CDIR"?.dll;" LUA_CDIR"loadall.dll"

	//C	 #else
	//C	 #define LUA_ROOT	"/usr/local/"
	//C	 #define LUA_LDIR	LUA_ROOT "share/lua/5.1/"
	//C	 #define LUA_CDIR	LUA_ROOT "lib/lua/5.1/"
	//C	 #define LUA_PATH_DEFAULT  		"./?.lua;"  LUA_LDIR"?.lua;"  LUA_LDIR"?/init.lua;" 					LUA_CDIR"?.lua;"  LUA_CDIR"?/init.lua"
	//C	 #define LUA_CPATH_DEFAULT 	"./?.so;"  LUA_CDIR"?.so;" LUA_CDIR"loadall.so"
	//C	 #endif


	/*
	@@ LUA_DIRSEP is the directory separator (for submodules).
	** CHANGE it if your machine does not use "/" as the directory separator
	** and is not Windows. (On Windows Lua automatically uses "\".)
	*/
	//C	 #if defined(_WIN32)
	//C	 #define LUA_DIRSEP	"\\"
	//C	 #else
	//C	 #define LUA_DIRSEP	"/"
	//C	 #endif


	/*
	@@ LUA_PATHSEP is the character that separates templates in a path.
	@@ LUA_PATH_MARK is the string that marks the substitution points in a
	@* template.
	@@ LUA_EXECDIR in a Windows path is replaced by the executable's
	@* directory.
	@@ LUA_IGMARK is a mark to ignore all before it when bulding the
	@* luaopen_ function name.
	** CHANGE them if for some reason your system cannot use those
	** characters. (E.g., if one of those characters is a common character
	** in file/directory names.) Probably you do not need to change them.
	*/
	//C	 #define LUA_PATHSEP	";"
	//C	 #define LUA_PATH_MARK	"?"
	//C	 #define LUA_EXECDIR	"!"
	//C	 #define LUA_IGMARK	"-"


	/*
	@@ LUA_INTEGER is the integral type used by lua_pushinteger/lua_tointeger.
	** CHANGE that if ptrdiff_t is not adequate on your machine. (On most
	** machines, ptrdiff_t gives a good choice between int or long.)
	*/
	//C	 #define LUA_INTEGER	ptrdiff_t

	alias ptrdiff_t LUA_INTEGER;

	/*
	@@ LUA_API is a mark for all core API functions.
	@@ LUALIB_API is a mark for all standard library functions.
	** CHANGE them if you need to define those functions in some special way.
	** For instance, if you want to create one Windows DLL with the core and
	** the libraries, you may want to use the following definition (define
	** LUA_BUILD_AS_DLL to get it).
	*/
	//C	 #if defined(LUA_BUILD_AS_DLL)

	//C	 #if defined(LUA_CORE) || defined(LUA_LIB)
	//C	 #define LUA_API __declspec(dllexport)
	//C	 #else
	//C	 #define LUA_API __declspec(dllimport)
	//C	 #endif

	//C	 #else

	//C	 #define LUA_API		extern

	// alias extern LUA_API;
	//C	 #endif

	/* more often than not the libs go together with the core */
	//C	 #define LUALIB_API	LUA_API

	//alias LUA_API LUALIB_API;

	/*
	@@ LUAI_FUNC is a mark for all extern functions that are not to be
	@* exported to outside modules.
	@@ LUAI_DATA is a mark for all extern (const) variables that are not to
	@* be exported to outside modules.
	** CHANGE them if you need to mark them in some special way. Elf/gcc
	** (versions 3.2 and later) mark them as "hidden" to optimize access
	** when Lua is compiled as a shared library.
	*/
	//C	 #if defined(luaall_c)
	//C	 #define LUAI_FUNC	static
	//C	 #define LUAI_DATA	/* empty */

	//C	 #elif defined(__GNUC__) && ((__GNUC__*100 + __GNUC_MINOR__) >= 302) &&	   defined(__ELF__)
	//C	 #define LUAI_FUNC	__attribute__((visibility("hidden"))) extern
	//C	 #define LUAI_DATA	LUAI_FUNC

	//C	 #else
	//C	 #define LUAI_FUNC	extern
	//C	 #define LUAI_DATA	extern
	//alias extern LUAI_FUNC;
	//C	 #endif
	//alias extern LUAI_DATA;



	/*
	@@ LUA_QL describes how error messages quote program elements.
	** CHANGE it if you want a different appearance.
	*/
	//C	 #define LUA_QL(x)	"'" x "'"
	//C	 #define LUA_QS		LUA_QL("%s")
	enum LUA_QS = "'%s'";

	/*
	@@ LUA_IDSIZE gives the maximum size for the description of the source
	@* of a function in debug information.
	** CHANGE it if you want a different size.
	*/
	//C	 #define LUA_IDSIZE	60

	const LUA_IDSIZE = 60;

	/*
	** {==================================================================
	** Stand-alone configuration
	** ===================================================================
	*/

	//C	 #if defined(lua_c) || defined(luaall_c)

	/*
	@@ lua_stdin_is_tty detects whether the standard input is a 'tty' (that
	@* is, whether we're running lua interactively).
	** CHANGE it if you have a better definition for non-POSIX/non-Windows
	** systems.
	*/
	//C	 #if defined(LUA_USE_ISATTY)
	//C	 #include <unistd.h>
	//C	 #define lua_stdin_is_tty()	isatty(0)
	//C	 #elif defined(LUA_WIN)
	//C	 #include <io.h>
	//C	 #include <stdio.h>
	//C	 #define lua_stdin_is_tty()	_isatty(_fileno(stdin))
	//C	 #else
	//C	 #define lua_stdin_is_tty()	1  /* assume stdin is a tty */
	//C	 #endif


	/*
	@@ LUA_PROMPT is the default prompt used by stand-alone Lua.
	@@ LUA_PROMPT2 is the default continuation prompt used by stand-alone Lua.
	** CHANGE them if you want different prompts. (You can also change the
	** prompts dynamically, assigning to globals _PROMPT/_PROMPT2.)
	*/
	//C	 #define LUA_PROMPT		"> "
	//C	 #define LUA_PROMPT2		">> "


	/*
	@@ LUA_PROGNAME is the default name for the stand-alone Lua program.
	** CHANGE it if your stand-alone interpreter has a different name and
	** your system is not able to detect that name automatically.
	*/
	//C	 #define LUA_PROGNAME		"lua"


	/*
	@@ LUA_MAXINPUT is the maximum length for an input line in the
	@* stand-alone interpreter.
	** CHANGE it if you need longer lines.
	*/
	//C	 #define LUA_MAXINPUT	512


	/*
	@@ lua_readline defines how to show a prompt and then read a line from
	@* the standard input.
	@@ lua_saveline defines how to "save" a read line in a "history".
	@@ lua_freeline defines how to free a line read by lua_readline.
	** CHANGE them if you want to improve this functionality (e.g., by using
	** GNU readline and history facilities).
	*/
	//C	 #if defined(LUA_USE_READLINE)
	//C	 #include <stdio.h>
	//C	 #include <readline/readline.h>
	//C	 #include <readline/history.h>
	//C	 #define lua_readline(L,b,p)	((void)L, ((b)=readline(p)) != NULL)
	//C	 #define lua_saveline(L,idx) 	if (lua_strlen(L,idx) > 0)  /* non-empty line? */ 	  add_history(lua_tostring(L, idx));  /* add it to history */
	//C	 #define lua_freeline(L,b)	((void)L, free(b))
	//C	 #else
	//C	 #define lua_readline(L,b,p)		((void)L, fputs(p, stdout), fflush(stdout),  /* show prompt */ 	fgets(b, LUA_MAXINPUT, stdin) != NULL)  /* get line */
	//C	 #define lua_saveline(L,idx)	{ (void)L; (void)idx; }
	//C	 #define lua_freeline(L,b)	{ (void)L; (void)b; }
	//C	 #endif

	//C	 #endif

	/* }================================================================== */


	/*
	@@ LUAI_GCPAUSE defines the default pause between garbage-collector cycles
	@* as a percentage.
	** CHANGE it if you want the GC to run faster or slower (higher values
	** mean larger pauses which mean slower collection.) You can also change
	** this value dynamically.
	*/
	//C	 #define LUAI_GCPAUSE	200  /* 200% (wait memory to double before next GC) */

	const LUAI_GCPAUSE = 200;

	/*
	@@ LUAI_GCMUL defines the default speed of garbage collection relative to
	@* memory allocation as a percentage.
	** CHANGE it if you want to change the granularity of the garbage
	** collection. (Higher values mean coarser collections. 0 represents
	** infinity, where each step performs a full collection.) You can also
	** change this value dynamically.
	*/
	//C	 #define LUAI_GCMUL	200 /* GC runs 'twice the speed' of memory allocation */

	const LUAI_GCMUL = 200;


	/*
	@@ LUA_COMPAT_GETN controls compatibility with old getn behavior.
	** CHANGE it (define it) if you want exact compatibility with the
	** behavior of setn/getn in Lua 5.0.
	*/
	//C	 #undef LUA_COMPAT_GETN

	/*
	@@ LUA_COMPAT_LOADLIB controls compatibility about global loadlib.
	** CHANGE it to undefined as soon as you do not need a global 'loadlib'
	** function (the function is still available as 'package.loadlib').
	*/
	//C	 #undef LUA_COMPAT_LOADLIB

	/*
	@@ LUA_COMPAT_VARARG controls compatibility with old vararg feature.
	** CHANGE it to undefined as soon as your programs use only '...' to
	** access vararg parameters (instead of the old 'arg' table).
	*/
	//C	 #define LUA_COMPAT_VARARG

	/*
	@@ LUA_COMPAT_MOD controls compatibility with old math.mod function.
	** CHANGE it to undefined as soon as your programs use 'math.fmod' or
	** the new '%' operator instead of 'math.mod'.
	*/
	//C	 #define LUA_COMPAT_MOD

	/*
	@@ LUA_COMPAT_LSTR controls compatibility with old long string nesting
	@* facility.
	** CHANGE it to 2 if you want the old behaviour, or undefine it to turn
	** off the advisory error when nesting [[...]].
	*/
	//C	 #define LUA_COMPAT_LSTR		1

	const LUA_COMPAT_LSTR = 1;
	/*
	@@ LUA_COMPAT_GFIND controls compatibility with old 'string.gfind' name.
	** CHANGE it to undefined as soon as you rename 'string.gfind' to
	** 'string.gmatch'.
	*/
	//C	 #define LUA_COMPAT_GFIND

	/*
	@@ LUA_COMPAT_OPENLIB controls compatibility with old 'luaL_openlib'
	@* behavior.
	** CHANGE it to undefined as soon as you replace to 'luaL_register'
	** your uses of 'luaL_openlib'
	*/
	//C	 #define LUA_COMPAT_OPENLIB



	/*
	@@ luai_apicheck is the assert macro used by the Lua-C API.
	** CHANGE luai_apicheck if you want Lua to perform some checks in the
	** parameters it gets from API calls. This may slow down the interpreter
	** a bit, but may be quite useful when debugging C code that interfaces
	** with Lua. A useful redefinition is to use assert.h.
	*/
	//C	 #if defined(LUA_USE_APICHECK)
	//C	 #include <assert.h>
	//C	 #define luai_apicheck(L,o)	{ (void)L; assert(o); }
	//C	 #else
	//C	 #define luai_apicheck(L,o)	{ (void)L; }
	//C	 #endif


	/*
	@@ LUAI_BITSINT defines the number of bits in an int.
	** CHANGE here if Lua cannot automatically detect the number of bits of
	** your machine. Probably you do not need to change this.
	*/
	/* avoid overflows in comparison */
	//C	 #if INT_MAX-20 < 32760
	//C	 #define LUAI_BITSINT	16
	//C	 #elif INT_MAX > 2147483640L
	/* int has at least 32 bits */
	//C	 #define LUAI_BITSINT	32
	//C	 #else
	const LUAI_BITSINT = 32;
	//C	 #error "you must define LUA_BITSINT with number of bits in an integer"
	//C	 #endif


	/*
	@@ LUAI_UINT32 is an unsigned integer with at least 32 bits.
	@@ LUAI_INT32 is an signed integer with at least 32 bits.
	@@ LUAI_UMEM is an unsigned integer big enough to count the total
	@* memory used by Lua.
	@@ LUAI_MEM is a signed integer big enough to count the total memory
	@* used by Lua.
	** CHANGE here if for some weird reason the default definitions are not
	** good enough for your machine. (The definitions in the 'else'
	** part always works, but may waste space on machines with 64-bit
	** longs.) Probably you do not need to change this.
	*/
	//C	 #if LUAI_BITSINT >= 32
	//C	 #define LUAI_UINT32	unsigned int
	//C	 #define LUAI_INT32	int
	//C	 #define LUAI_MAXINT32	INT_MAX
	alias int LUAI_INT32;
	//C	 #define LUAI_UMEM	size_t
	//alias INT_MAX LUAI_MAXINT32;
	//C	 #define LUAI_MEM	ptrdiff_t
	alias size_t LUAI_UMEM;
	//C	 #else
	alias ptrdiff_t LUAI_MEM;
	/* 16-bit ints */
	//C	 #define LUAI_UINT32	unsigned long
	//C	 #define LUAI_INT32	long
	//C	 #define LUAI_MAXINT32	LONG_MAX
	//C	 #define LUAI_UMEM	unsigned long
	//C	 #define LUAI_MEM	long
	//C	 #endif


	/*
	@@ LUAI_MAXCALLS limits the number of nested calls.
	** CHANGE it if you need really deep recursive calls. This limit is
	** arbitrary; its only purpose is to stop infinite recursion before
	** exhausting memory.
	*/
	//C	 #define LUAI_MAXCALLS	20000

	const LUAI_MAXCALLS = 20000;

	/*
	@@ LUAI_MAXCSTACK limits the number of Lua stack slots that a C function
	@* can use.
	** CHANGE it if you need lots of (Lua) stack space for your C
	** functions. This limit is arbitrary; its only purpose is to stop C
	** functions to consume unlimited stack space.
	*/
	//C	 #define LUAI_MAXCSTACK	2048

	const LUAI_MAXCSTACK = 2048;


	/*
	** {==================================================================
	** CHANGE (to smaller values) the following definitions if your system
	** has a small C stack. (Or you may want to change them to larger
	** values if your system has a large C stack and these limits are
	** too rigid for you.) Some of these constants control the size of
	** stack-allocated arrays used by the compiler or the interpreter, while
	** others limit the maximum number of recursive calls that the compiler
	** or the interpreter can perform. Values too large may cause a C stack
	** overflow for some forms of deep constructs.
	** ===================================================================
	*/


	/*
	@@ LUAI_MAXCCALLS is the maximum depth for nested C calls (short) and
	@* syntactical nested non-terminals in a program.
	*/
	//C	 #define LUAI_MAXCCALLS		200

	const LUAI_MAXCCALLS = 200;

	/*
	@@ LUAI_MAXVARS is the maximum number of local variables per function
	@* (must be smaller than 250).
	*/
	//C	 #define LUAI_MAXVARS		200

	const LUAI_MAXVARS = 200;

	/*
	@@ LUAI_MAXUPVALUES is the maximum number of upvalues per function
	@* (must be smaller than 250).
	*/
	//C	 #define LUAI_MAXUPVALUES	60

	const LUAI_MAXUPVALUES = 60;

	/*
	@@ LUAL_BUFFERSIZE is the buffer size used by the lauxlib buffer system.
	*/
	//C	 #define LUAL_BUFFERSIZE		BUFSIZ

	//alias BUFSIZ LUAL_BUFFERSIZE;
	const LUAL_BUFFERSIZE = 16384; // htod suggested this
	/* }================================================================== */




	/*
	** {==================================================================
	@@ LUA_NUMBER is the type of numbers in Lua.
	** CHANGE the following definitions only if you want to build Lua
	** with a number type different from double. You may also need to
	** change lua_number2int & lua_number2integer.
	** ===================================================================
	*/

	//C	 #define LUA_NUMBER_DOUBLE
	//C	 #define LUA_NUMBER	double

	alias double LUA_NUMBER;
	/*
	@@ LUAI_UACNUMBER is the result of an 'usual argument conversion'
	@* over a number.
	*/
	//C	 #define LUAI_UACNUMBER	double

	alias double LUAI_UACNUMBER;

	/*
	@@ LUA_NUMBER_SCAN is the format for reading numbers.
	@@ LUA_NUMBER_FMT is the format for writing numbers.
	@@ lua_number2str converts a number to a string.
	@@ LUAI_MAXNUMBER2STR is maximum size of previous conversion.
	@@ lua_str2number converts a string to a number.
	*/
	//C	 #define LUA_NUMBER_SCAN		"%lf"
	//C	 #define LUA_NUMBER_FMT		"%.14g"
	//C	 #define lua_number2str(s,n)	sprintf((s), LUA_NUMBER_FMT, (n))
	//C	 #define LUAI_MAXNUMBER2STR	32 /* 16 digits, sign, point, and \0 */
	//C	 #define lua_str2number(s,p)	strtod((s), (p))
	const LUAI_MAXNUMBER2STR = 32;


	/*
	@@ The luai_num* macros define the primitive operations over numbers.
	*/
	//C	 #if defined(LUA_CORE)
	//C	 #include <math.h>
	//C	 #define luai_numadd(a,b)	((a)+(b))
	//C	 #define luai_numsub(a,b)	((a)-(b))
	//C	 #define luai_nummul(a,b)	((a)*(b))
	//C	 #define luai_numdiv(a,b)	((a)/(b))
	//C	 #define luai_nummod(a,b)	((a) - floor((a)/(b))*(b))
	//C	 #define luai_numpow(a,b)	(pow(a,b))
	//C	 #define luai_numunm(a)		(-(a))
	//C	 #define luai_numeq(a,b)		((a)==(b))
	//C	 #define luai_numlt(a,b)		((a)<(b))
	//C	 #define luai_numle(a,b)		((a)<=(b))
	//C	 #define luai_numisnan(a)	(!luai_numeq((a), (a)))
	//C	 #endif


	/*
	@@ lua_number2int is a macro to convert lua_Number to int.
	@@ lua_number2integer is a macro to convert lua_Number to lua_Integer.
	** CHANGE them if you know a faster way to convert a lua_Number to
	** int (with any rounding method and without throwing errors) in your
	** system. In Pentium machines, a naive typecast from double to int
	** in C is extremely slow, so any alternative is worth trying.
	*/

	/* On a Pentium, resort to a trick */
	//C	 #if defined(LUA_NUMBER_DOUBLE) && !defined(LUA_ANSI) && !defined(__SSE2__) &&	 (defined(__i386) || defined (_M_IX86) || defined(__i386__))

	/* On a Microsoft compiler, use assembler */
	//C	 #if defined(_MSC_VER)

	//C	 #define lua_number2int(i,d)   __asm fld d   __asm fistp i
	//C	 #define lua_number2integer(i,n)		lua_number2int(i, n)

	/* the next trick should work on any Pentium, but sometimes clashes
	   with a DirectX idiosyncrasy */
	//C	 #else

	//C	 union luai_Cast { double l_d; long l_l; };
	union luai_Cast
	{
		double l_d;
		int l_l;
	}
	//C	 #define lua_number2int(i,d)   { volatile union luai_Cast u; u.l_d = (d) + 6755399441055744.0; (i) = u.l_l; }
	//C	 #define lua_number2integer(i,n)		lua_number2int(i, n)

	//C	 #endif


	/* this option always works, but may be slow */
	//C	 #else
	//C	 #define lua_number2int(i,d)	((i)=(int)(d))
	//C	 #define lua_number2integer(i,d)	((i)=(lua_Integer)(d))

	//C	 #endif

	/* }================================================================== */


	/*
	@@ LUAI_USER_ALIGNMENT_T is a type that requires maximum alignment.
	** CHANGE it if your system requires alignments larger than double. (For
	** instance, if your system supports long doubles and they must be
	** aligned in 16-byte boundaries, then you should add long double in the
	** union.) Probably you do not need to change this.
	*/
	//C	 #define LUAI_USER_ALIGNMENT_T	union { double u; void *s; long l; }


	/*
	@@ LUAI_THROW/LUAI_TRY define how Lua does exception handling.
	** CHANGE them if you prefer to use longjmp/setjmp even with C++
	** or if want/don't to use _longjmp/_setjmp instead of regular
	** longjmp/setjmp. By default, Lua handles errors with exceptions when
	** compiling as C++ code, with _longjmp/_setjmp when asked to use them,
	** and with longjmp/setjmp otherwise.
	*/
	//C	 #if defined(__cplusplus)
	/* C++ exceptions */
	//C	 #define LUAI_THROW(L,c)	throw(c)
	//C	 #define LUAI_TRY(L,c,a)	try { a } catch(...) 	{ if ((c)->status == 0) (c)->status = -1; }
	//C	 #define luai_jmpbuf	int  /* dummy variable */

	//C	 #elif defined(LUA_USE_ULONGJMP)
	/* in Unix, try _longjmp/_setjmp (more efficient) */
	//C	 #define LUAI_THROW(L,c)	_longjmp((c)->b, 1)
	//C	 #define LUAI_TRY(L,c,a)	if (_setjmp((c)->b) == 0) { a }
	//C	 #define luai_jmpbuf	jmp_buf

	//C	 #else
	/* default handling with long jumps */
	//C	 #define LUAI_THROW(L,c)	longjmp((c)->b, 1)
	//C	 #define LUAI_TRY(L,c,a)	if (setjmp((c)->b) == 0) { a }
	//C	 #define luai_jmpbuf	jmp_buf

	//alias jmp_buf luai_jmpbuf;
	//C	 #endif


	/*
	@@ LUA_MAXCAPTURES is the maximum number of captures that a pattern
	@* can do during pattern-matching.
	** CHANGE it if you need more captures. This limit is arbitrary.
	*/
	//C	 #define LUA_MAXCAPTURES		32

	const LUA_MAXCAPTURES = 32;

	/*
	@@ lua_tmpnam is the function that the OS library uses to create a
	@* temporary name.
	@@ LUA_TMPNAMBUFSIZE is the maximum size of a name created by lua_tmpnam.
	** CHANGE them if you have an alternative to tmpnam (which is considered
	** insecure) or if you want the original tmpnam anyway.  By default, Lua
	** uses tmpnam except when POSIX is available, where it uses mkstemp.
	*/
	//C	 #if defined(loslib_c) || defined(luaall_c)

	//C	 #if defined(LUA_USE_MKSTEMP)
	//C	 #include <unistd.h>
	//C	 #define LUA_TMPNAMBUFSIZE	32
	//C	 #define lua_tmpnam(b,e)	{ 	strcpy(b, "/tmp/lua_XXXXXX"); 	e = mkstemp(b); 	if (e != -1) close(e); 	e = (e == -1); }

	//C	 #else
	//C	 #define LUA_TMPNAMBUFSIZE	L_tmpnam
	//C	 #define lua_tmpnam(b,e)		{ e = (tmpnam(b) == NULL); }
	//C	 #endif

	//C	 #endif


	/*
	@@ lua_popen spawns a new process connected to the current one through
	@* the file streams.
	** CHANGE it if you have a way to implement it in your system.
	*/
	//C	 #if defined(LUA_USE_POPEN)

	//C	 #define lua_popen(L,c,m)	((void)L, popen(c,m))
	//C	 #define lua_pclose(L,file)	((void)L, (pclose(file) != -1))

	//C	 #elif defined(LUA_WIN)

	//C	 #define lua_popen(L,c,m)	((void)L, _popen(c,m))
	//C	 #define lua_pclose(L,file)	((void)L, (_pclose(file) != -1))

	//C	 #else

	//C	 #define lua_popen(L,c,m)	((void)((void)c, m),  		luaL_error(L, LUA_QL("popen") " not supported"), (FILE*)0)
	//C	 #define lua_pclose(L,file)		((void)((void)L, file), 0)

	//C	 #endif

	/*
	@@ LUA_DL_* define which dynamic-library system Lua should use.
	** CHANGE here if Lua has problems choosing the appropriate
	** dynamic-library system for your platform (either Windows' DLL, Mac's
	** dyld, or Unix's dlopen). If your system is some kind of Unix, there
	** is a good chance that it has dlopen, so LUA_DL_DLOPEN will work for
	** it.  To use dlopen you also need to adapt the src/Makefile (probably
	** adding -ldl to the linker options), so Lua does not select it
	** automatically.  (When you change the makefile to add -ldl, you must
	** also add -DLUA_USE_DLOPEN.)
	** If you do not want any kind of dynamic library, undefine all these
	** options.
	** By default, _WIN32 gets LUA_DL_DLL and MAC OS X gets LUA_DL_DYLD.
	*/
	//C	 #if defined(LUA_USE_DLOPEN)
	//C	 #define LUA_DL_DLOPEN
	//C	 #endif

	//C	 #if defined(LUA_WIN)
	//C	 #define LUA_DL_DLL
	//C	 #endif


	/*
	@@ LUAI_EXTRASPACE allows you to add user-specific data in a lua_State
	@* (the data goes just *before* the lua_State pointer).
	** CHANGE (define) this if you really need that. This value must be
	** a multiple of the maximum alignment required for your machine.
	*/
	//C	 #define LUAI_EXTRASPACE		0

	const LUAI_EXTRASPACE = 0;

	/*
	@@ luai_userstate* allow user-specific actions on threads.
	** CHANGE them if you defined LUAI_EXTRASPACE and need to do something
	** extra when a thread is created/deleted/resumed/yielded.
	*/
	//C	 #define luai_userstateopen(L)		((void)L)
	//C	 #define luai_userstateclose(L)		((void)L)
	//C	 #define luai_userstatethread(L,L1)	((void)L)
	//C	 #define luai_userstatefree(L)		((void)L)
	//C	 #define luai_userstateresume(L,n)	((void)L)
	//C	 #define luai_userstateyield(L,n)	((void)L)


	/*
	@@ LUA_INTFRMLEN is the length modifier for integer conversions
	@* in 'string.format'.
	@@ LUA_INTFRM_T is the integer type correspoding to the previous length
	@* modifier.
	** CHANGE them if your system supports long long or does not support long.
	*/

	//C	 #if defined(LUA_USELONGLONG)

	//C	 #define LUA_INTFRMLEN		"ll"
	//C	 #define LUA_INTFRM_T		long long

	//C	 #else

	//C	 #define LUA_INTFRMLEN		"l"
	//C	 #define LUA_INTFRM_T		long

	alias long LUA_INTFRM_T;
	//C	 #endif



	/* =================================================================== */

	/*
	** Local configuration. You can use this space to add your redefinitions
	** without modifying the main part of the file.
	*/



	//C	 #endif

}