/* Converted to D from lua.h by htod */
module luad.c.lua;
import core.vararg;
import luad.c.luaconf;

/*
** Lua - An Extensible Extension Language
** Lua.org, PUC-Rio, Brazil (http://www.lua.org)
** See Copyright Notice at the end of this file
*/

//C	 #ifndef lua_h
//C	 #define lua_h

//C	 #include <stdarg.h>
//C	 #include <stddef.h>

//C	 #include "luaconf.h"
//import luaconf;
import luad.c.lauxlib;

extern (C) {

	//C	 #define LUA_VERSION	"Lua 5.1"
	string LUA_VERSION = "Lua 5.1";
	//C	 #define LUA_RELEASE	"Lua 5.1.2"
	string LUA_RELEASE = "Lua 5.1.2";
	//C	 #define LUA_VERSION_NUM	501
	//C	 #define LUA_COPYRIGHT	"Copyright (C) 1994-2007 Lua.org, PUC-Rio"
	string LUA_COPYRIGHT = "Copyright (C) 1994-2007 Lua.org, PUC-Rio";
	enum LUA_VERSION_NUM = 501;
	//C	 #define LUA_AUTHORS 	"R. Ierusalimschy, L. H. de Figueiredo & W. Celes"
	string LUA_AUTHORS = "R. Ierusalimschy, L. H. de Figueiredo & W. Celes";


	/* mark for precompiled code (`<esc>Lua') */
	//C	 #define	LUA_SIGNATURE	"\033Lua"
	const char[] LUA_SIGNATURE = "\033Lua";

	/* option for multiple returns in `lua_pcall' and `lua_call' */
	//C	 #define LUA_MULTRET	(-1)
	const LUA_MULTRET = -1;


	/*
	** pseudo-indices
	*/
	//C	 #define LUA_REGISTRYINDEX	(-10000)
	const LUA_REGISTRYINDEX = -10000;
	//C	 #define LUA_ENVIRONINDEX	(-10001)
	const LUA_ENVIRONINDEX = -10001;
	//C	 #define LUA_GLOBALSINDEX	(-10002)
	const LUA_GLOBALSINDEX = -10002;
	//C	 #define lua_upvalueindex(i)	(LUA_GLOBALSINDEX-(i))
	int lua_upvalueindex (int i) { return LUA_GLOBALSINDEX-i; }


	/* thread status; 0 is OK */
	//C	 #define LUA_YIELD	1
	//C	 #define LUA_ERRRUN	2
	const LUA_YIELD = 1;
	//C	 #define LUA_ERRSYNTAX	3
	const LUA_ERRRUN = 2;
	//C	 #define LUA_ERRMEM	4
	const LUA_ERRSYNTAX = 3;
	//C	 #define LUA_ERRERR	5
	const LUA_ERRMEM = 4;

	const LUA_ERRERR = 5;

	//C	 typedef struct lua_State lua_State;
	struct lua_State {}

	//C	 typedef int (*lua_CFunction) (lua_State *L);
	alias int function(lua_State *L) lua_CFunction;


	/*
	** functions that read/write blocks when loading/dumping Lua chunks
	*/
	//C	 typedef const char * (*lua_Reader) (lua_State *L, void *ud, size_t *sz);
	alias char * function(lua_State *L, void *ud, size_t *sz)lua_Reader;

	//C	 typedef int (*lua_Writer) (lua_State *L, const void* p, size_t sz, void* ud);
	alias int  function(lua_State *L, const void *p, size_t sz, void *ud)lua_Writer;


	/*
	** prototype for memory-allocation functions
	*/
	//C	 typedef void * (*lua_Alloc) (void *ud, void *ptr, size_t osize, size_t nsize);
	alias void * function(void *ud, void *ptr, size_t osize, size_t nsize)lua_Alloc;


	/*
	** basic types
	*/
	//C	 #define LUA_TNONE		(-1)
	const LUA_TNONE = -1;

	//C	 #define LUA_TNIL		0
	//C	 #define LUA_TBOOLEAN		1
	const LUA_TNIL = 0;
	//C	 #define LUA_TLIGHTUSERDATA	2
	const LUA_TBOOLEAN = 1;
	//C	 #define LUA_TNUMBER		3
	const LUA_TLIGHTUSERDATA = 2;
	//C	 #define LUA_TSTRING		4
	const LUA_TNUMBER = 3;
	//C	 #define LUA_TTABLE		5
	const LUA_TSTRING = 4;
	//C	 #define LUA_TFUNCTION		6
	const LUA_TTABLE = 5;
	//C	 #define LUA_TUSERDATA		7
	const LUA_TFUNCTION = 6;
	//C	 #define LUA_TTHREAD		8
	const LUA_TUSERDATA = 7;

	const LUA_TTHREAD = 8;


	/* minimum Lua stack available to a C function */
	//C	 #define LUA_MINSTACK	20

	const LUA_MINSTACK = 20;

	/*
	** generic extra include file
	*/
	//C	 #if defined(LUA_USER_H)
	//C	 #include LUA_USER_H
	//C	 #endif


	/* type of numbers in Lua */
	//C	 typedef LUA_NUMBER lua_Number;
	alias double lua_Number;


	/* type for integer functions */
	//C	 typedef LUA_INTEGER lua_Integer;
	alias ptrdiff_t lua_Integer;



	/*
	** state manipulation
	*/
	//C	 LUA_API lua_State *(lua_newstate) (lua_Alloc f, void *ud);
	lua_State * function(lua_Alloc f, void *ud) lua_newstate;
	//C	 LUA_API void	   (lua_close) (lua_State *L);
	void  function(lua_State *L) lua_close;
	//C	 LUA_API lua_State *(lua_newthread) (lua_State *L);
	lua_State * function(lua_State *L)lua_newthread;

	//C	 LUA_API lua_CFunction (lua_atpanic) (lua_State *L, lua_CFunction panicf);
	lua_CFunction  function(lua_State *L, lua_CFunction panicf) lua_atpanic;


	/*
	** basic stack manipulation
	*/
	//C	 LUA_API int   (lua_gettop) (lua_State *L);
	int  function(lua_State *L) nothrow lua_gettop;
	//C	 LUA_API void  (lua_settop) (lua_State *L, int idx);
	void  function(lua_State *L, int idx) nothrow lua_settop;
	//C	 LUA_API void  (lua_pushvalue) (lua_State *L, int idx);
	void  function(lua_State *L, int idx) nothrow lua_pushvalue;
	//C	 LUA_API void  (lua_remove) (lua_State *L, int idx);
	void  function(lua_State *L, int idx) lua_remove;
	//C	 LUA_API void  (lua_insert) (lua_State *L, int idx);
	void  function(lua_State *L, int idx) lua_insert;
	//C	 LUA_API void  (lua_replace) (lua_State *L, int idx);
	void  function(lua_State *L, int idx) lua_replace;
	//C	 LUA_API int   (lua_checkstack) (lua_State *L, int sz);
	int  function(lua_State *L, int sz) lua_checkstack;

	//C	 LUA_API void  (lua_xmove) (lua_State *from, lua_State *to, int n);
	void  function(lua_State *from, lua_State *to, int n) lua_xmove;


	/*
	** access functions (stack -> C)
	*/

	//C	 LUA_API int			 (lua_isnumber) (lua_State *L, int idx);
	int  function(lua_State *L, int idx) lua_isnumber;
	//C	 LUA_API int			 (lua_isstring) (lua_State *L, int idx);
	int  function(lua_State *L, int idx) lua_isstring;
	//C	 LUA_API int			 (lua_iscfunction) (lua_State *L, int idx);
	int  function(lua_State *L, int idx) lua_iscfunction;
	//C	 LUA_API int			 (lua_isuserdata) (lua_State *L, int idx);
	int  function(lua_State *L, int idx) lua_isuserdata;
	//C	 LUA_API int			 (lua_type) (lua_State *L, int idx);
	int  function(lua_State *L, int idx) nothrow lua_type;
	//C	 LUA_API const char	 *(lua_typename) (lua_State *L, int tp);
	char* function(lua_State *L, int tp) nothrow lua_typename;

	//C	 LUA_API int			(lua_equal) (lua_State *L, int idx1, int idx2);
	bool  function(lua_State *L, int idx1, int idx2) lua_equal;
	//C	 LUA_API int			(lua_rawequal) (lua_State *L, int idx1, int idx2);
	bool  function(lua_State *L, int idx1, int idx2) lua_rawequal;
	//C	 LUA_API int			(lua_lessthan) (lua_State *L, int idx1, int idx2);
	bool  function(lua_State *L, int idx1, int idx2) lua_lessthan;

	//C	 LUA_API lua_Number	  (lua_tonumber) (lua_State *L, int idx);
	lua_Number  function(lua_State *L, int idx) lua_tonumber;
	//C	 LUA_API lua_Integer	 (lua_tointeger) (lua_State *L, int idx);
	lua_Integer  function(lua_State *L, int idx) lua_tointeger;
	//C	 LUA_API int			 (lua_toboolean) (lua_State *L, int idx);
	bool  function(lua_State *L, int idx) lua_toboolean;
	//C	 LUA_API const char	 *(lua_tolstring) (lua_State *L, int idx, size_t *len);
	const(char)* function(lua_State *L, int idx, size_t *len) lua_tolstring;
	//C	 LUA_API size_t		  (lua_objlen) (lua_State *L, int idx);
	size_t  function(lua_State *L, int idx) lua_objlen;
	//C	 LUA_API lua_CFunction   (lua_tocfunction) (lua_State *L, int idx);
	lua_CFunction  function(lua_State *L, int idx) lua_tocfunction;
	//C	 LUA_API void		   *(lua_touserdata) (lua_State *L, int idx);
	void * function(lua_State *L, int idx) lua_touserdata;
	//C	 LUA_API lua_State	  *(lua_tothread) (lua_State *L, int idx);
	lua_State * function(lua_State *L, int idx) lua_tothread;
	//C	 LUA_API const void	 *(lua_topointer) (lua_State *L, int idx);
	void * function(lua_State *L, int idx) lua_topointer;


	/*
	** push functions (C -> stack)
	*/
	//C	 LUA_API void  (lua_pushnil) (lua_State *L);
	void  function(lua_State *L) lua_pushnil;
	//C	 LUA_API void  (lua_pushnumber) (lua_State *L, lua_Number n);
	void  function(lua_State *L, lua_Number n) lua_pushnumber;
	//C	 LUA_API void  (lua_pushinteger) (lua_State *L, lua_Integer n);
	void  function(lua_State *L, lua_Integer n) lua_pushinteger;
	//C	 LUA_API void  (lua_pushlstring) (lua_State *L, const char *s, size_t l);
	void  function(lua_State *L, const(char)* s, size_t l) lua_pushlstring;
	//C	 LUA_API void  (lua_pushstring) (lua_State *L, const char *s);
	void  function(lua_State *L, const(char)* s) lua_pushstring;
	//C	 LUA_API const char *(lua_pushvfstring) (lua_State *L, const char *fmt,
	//C														   va_list argp);
	const(char)* function(lua_State *L, const char *fmt, va_list argp) lua_pushvfstring;


	//C	 LUA_API const char *(lua_pushfstring) (lua_State *L, const char *fmt, ...);
	const(char)* function(lua_State *L, const(char)* fmt,...) lua_pushfstring;
	//C	 LUA_API void  (lua_pushcclosure) (lua_State *L, lua_CFunction fn, int n);
	void  function(lua_State *L, lua_CFunction fn, int n) lua_pushcclosure;
	//C	 LUA_API void  (lua_pushboolean) (lua_State *L, int b);
	void  function(lua_State *L, int b) lua_pushboolean;
	//C	 LUA_API void  (lua_pushlightuserdata) (lua_State *L, void *p);
	void  function(lua_State *L, void *p) lua_pushlightuserdata;
	//C	 LUA_API int   (lua_pushthread) (lua_State *L);
	int  function(lua_State *L) lua_pushthread;


	/*
	** get functions (Lua -> stack)
	*/
	//C	 LUA_API void  (lua_gettable) (lua_State *L, int idx);
	void  function(lua_State *L, int idx) lua_gettable;
	//C	 LUA_API void  (lua_getfield) (lua_State *L, int idx, const char *k);
	void  function(lua_State *L, int idx, const(char)* k) lua_getfield;
	//C	 LUA_API void  (lua_rawget) (lua_State *L, int idx);
	void  function(lua_State *L, int idx) lua_rawget;
	//C	 LUA_API void  (lua_rawgeti) (lua_State *L, int idx, int n);
	void  function(lua_State *L, int idx, int n) nothrow lua_rawgeti;
	//C	 LUA_API void  (lua_createtable) (lua_State *L, int narr, int nrec);
	void  function(lua_State *L, int narr, int nrec) lua_createtable;
	//C	 LUA_API void *(lua_newuserdata) (lua_State *L, size_t sz);
	void * function(lua_State *L, size_t sz) lua_newuserdata;
	//C	 LUA_API int   (lua_getmetatable) (lua_State *L, int objindex);
	int  function(lua_State *L, int objindex) lua_getmetatable;
	//C	 LUA_API void  (lua_getfenv) (lua_State *L, int idx);
	void  function(lua_State *L, int idx) lua_getfenv;


	/*
	** set functions (stack -> Lua)
	*/
	//C	 LUA_API void  (lua_settable) (lua_State *L, int idx);
	void  function(lua_State *L, int idx) lua_settable;
	//C	 LUA_API void  (lua_setfield) (lua_State *L, int idx, const char *k);
	void  function(lua_State *L, int idx, const(char)* k) lua_setfield;
	//C	 LUA_API void  (lua_rawset) (lua_State *L, int idx);
	void  function(lua_State *L, int idx) lua_rawset;
	//C	 LUA_API void  (lua_rawseti) (lua_State *L, int idx, int n);
	void  function(lua_State *L, int idx, int n) lua_rawseti;
	//C	 LUA_API int   (lua_setmetatable) (lua_State *L, int objindex);
	int  function(lua_State *L, int objindex) lua_setmetatable;
	//C	 LUA_API int   (lua_setfenv) (lua_State *L, int idx);
	int  function(lua_State *L, int idx) lua_setfenv;


	/*
	** `load' and `call' functions (load and run Lua code)
	*/
	//C	 LUA_API void  (lua_call) (lua_State *L, int nargs, int nresults);
	void  function(lua_State *L, int nargs, int nresults) lua_call;
	//C	 LUA_API int   (lua_pcall) (lua_State *L, int nargs, int nresults, int errfunc);
	int  function(lua_State *L, int nargs, int nresults, int errfunc) lua_pcall;
	//C	 LUA_API int   (lua_cpcall) (lua_State *L, lua_CFunction func, void *ud);
	int  function(lua_State *L, lua_CFunction func, void *ud) lua_cpcall;
	//C	 LUA_API int   (lua_load) (lua_State *L, lua_Reader reader, void *dt,
	//C											 const char *chunkname);
	int  function(lua_State *L, lua_Reader reader, void *dt, const(char)* chunkname) lua_load;

	//C	 LUA_API int (lua_dump) (lua_State *L, lua_Writer writer, void *data);
	int  function(lua_State *L, lua_Writer writer, void *data) lua_dump;


	/*
	** coroutine functions
	*/
	//C	 LUA_API int  (lua_yield) (lua_State *L, int nresults);
	int  function(lua_State *L, int nresults) lua_yield;
	//C	 LUA_API int  (lua_resume) (lua_State *L, int narg);
	int  function(lua_State *L, int narg) lua_resume;
	//C	 LUA_API int  (lua_status) (lua_State *L);
	int  function(lua_State *L) lua_status;

	/*
	** garbage-collection function and options
	*/

	//C	 #define LUA_GCSTOP		0
	//C	 #define LUA_GCRESTART		1
	const LUA_GCSTOP = 0;
	//C	 #define LUA_GCCOLLECT		2
	const LUA_GCRESTART = 1;
	//C	 #define LUA_GCCOUNT		3
	const LUA_GCCOLLECT = 2;
	//C	 #define LUA_GCCOUNTB		4
	const LUA_GCCOUNT = 3;
	//C	 #define LUA_GCSTEP		5
	const LUA_GCCOUNTB = 4;
	//C	 #define LUA_GCSETPAUSE		6
	const LUA_GCSTEP = 5;
	//C	 #define LUA_GCSETSTEPMUL	7
	const LUA_GCSETPAUSE = 6;

	const LUA_GCSETSTEPMUL = 7;
	//C	 LUA_API int (lua_gc) (lua_State *L, int what, int data);
	int  function(lua_State *L, int what, int data) lua_gc;


	/*
	** miscellaneous functions
	*/

	//C	 LUA_API int   (lua_error) (lua_State *L);
	int  function(lua_State *L) lua_error;

	//C	 LUA_API int   (lua_next) (lua_State *L, int idx);
	int  function(lua_State *L, int idx) lua_next;

	//C	 LUA_API void  (lua_concat) (lua_State *L, int n);
	void  function(lua_State *L, int n) lua_concat;

	//C	 LUA_API lua_Alloc (lua_getallocf) (lua_State *L, void **ud);
	lua_Alloc  function(lua_State *L, void **ud) lua_getallocf;
	//C	 LUA_API void lua_setallocf (lua_State *L, lua_Alloc f, void *ud);
	void  function(lua_State *L, lua_Alloc f, void *ud) lua_setallocf;



	/*
	** ===============================================================
	** some useful macros
	** ===============================================================
	*/

	//C	 #define lua_pop(L,n)		lua_settop(L, -(n)-1)
	void lua_pop(lua_State* L, int n) nothrow { lua_settop(L, -(n)-1); }

	//C	 #define lua_newtable(L)		lua_createtable(L, 0, 0)
	void lua_newtable(lua_State* L) { lua_createtable(L, 0, 0); }

	//C	 #define lua_register(L,n,f) (lua_pushcfunction(L, (f)), lua_setglobal(L, (n)))
	void lua_register(lua_State* L, const(char)* n, lua_CFunction f) { lua_pushcfunction(L, f); lua_setglobal(L, n); }

	//C	 #define lua_pushcfunction(L,f)	lua_pushcclosure(L, (f), 0)
	void lua_pushcfunction(lua_State* L, lua_CFunction f) { lua_pushcclosure(L, f, 0); }

	//C	 #define lua_strlen(L,i)		lua_objlen(L, (i))
	alias lua_objlen lua_strlen;

	//C	 #define lua_isfunction(L,n)	(lua_type(L, (n)) == LUA_TFUNCTION)
	bool lua_isfunction(lua_State* L, int n) { return lua_type(L, n) == LUA_TFUNCTION; }
	//C	 #define lua_istable(L,n)	(lua_type(L, (n)) == LUA_TTABLE)
	bool lua_istable(lua_State* L, int n) { return lua_type(L, n) == LUA_TTABLE; }
	//C	 #define lua_islightuserdata(L,n)	(lua_type(L, (n)) == LUA_TLIGHTUSERDATA)
	bool lua_islightuserdata(lua_State* L, int n) { return lua_type(L, n) == LUA_TLIGHTUSERDATA; }
	//C	 #define lua_isnil(L,n)		(lua_type(L, (n)) == LUA_TNIL)
	bool lua_isnil(lua_State* L, int n) { return lua_type(L, n) == LUA_TNIL; }
	//C	 #define lua_isboolean(L,n)	(lua_type(L, (n)) == LUA_TBOOLEAN)
	bool lua_isboolean(lua_State* L, int n) { return lua_type(L, n) == LUA_TBOOLEAN; }
	//C	 #define lua_isthread(L,n)	(lua_type(L, (n)) == LUA_TTHREAD)
	bool lua_isthread(lua_State* L, int n) { return lua_type(L, n) == LUA_TTHREAD; }
	//C	 #define lua_isnone(L,n)		(lua_type(L, (n)) == LUA_TNONE)
	bool lua_isnone(lua_State* L, int n) { return lua_type(L, n) == LUA_TNONE; }
	//C	 #define lua_isnoneornil(L, n)	(lua_type(L, (n)) <= 0)
	bool lua_isnoneornil(lua_State* L, int n) { return lua_type(L, n) <= 0; }

	//C	 #define lua_pushliteral(L, s)		lua_pushlstring(L, "" s, (sizeof(s)/sizeof(char))-1)
	void lua_pushliteral(lua_State* L, string s) { lua_pushlstring(L, s.ptr, s.length);  }

	//C	 #define lua_setglobal(L,s)	lua_setfield(L, LUA_GLOBALSINDEX, (s))
	void lua_setglobal(lua_State* L, const(char)* s) { lua_setfield(L, LUA_GLOBALSINDEX, s); }

	//C	 #define lua_getglobal(L,s)	lua_getfield(L, LUA_GLOBALSINDEX, (s))
	void lua_getglobal(lua_State* L, const(char)* s) { lua_getfield(L, LUA_GLOBALSINDEX, s); }

	//C	 #define lua_tostring(L,i)	lua_tolstring(L, (i), NULL)
	const(char)* lua_tostring(lua_State* L, int i) { return lua_tolstring(L, i, null); }



	/*
	** compatibility macros and functions
	*/

	//C	 #define lua_open()	luaL_newstate()
	alias luaL_newstate lua_open;

	//C	 #define lua_getregistry(L)	lua_pushvalue(L, LUA_REGISTRYINDEX)
	void lua_getregistry(lua_State* L) { lua_pushvalue(L, LUA_REGISTRYINDEX); }

	//C	 #define lua_getgccount(L)	lua_gc(L, LUA_GCCOUNT, 0)
	int lua_getgccount(lua_State* L) { return lua_gc(L, LUA_GCCOUNT, 0); }

	//C	 #define lua_Chunkreader		lua_Reader
	//C	 #define lua_Chunkwriter		lua_Writer
	alias lua_Reader lua_Chunkreader;

	alias lua_Writer lua_Chunkwriter;


	/*
	** {======================================================================
	** Debug API
	** =======================================================================
	*/


	/*
	** Event codes
	*/
	//C	 #define LUA_HOOKCALL	0
	//C	 #define LUA_HOOKRET	1
	const LUA_HOOKCALL = 0;
	//C	 #define LUA_HOOKLINE	2
	const LUA_HOOKRET = 1;
	//C	 #define LUA_HOOKCOUNT	3
	const LUA_HOOKLINE = 2;
	//C	 #define LUA_HOOKTAILRET 4
	const LUA_HOOKCOUNT = 3;

	const LUA_HOOKTAILRET = 4;

	/*
	** Event masks
	*/
	//C	 #define LUA_MASKCALL	(1 << LUA_HOOKCALL)
	const LUA_MASKCALL = 1 << LUA_HOOKCALL;
	//C	 #define LUA_MASKRET	(1 << LUA_HOOKRET)
	const LUA_MASKRET = 1 << LUA_HOOKRET;
	//C	 #define LUA_MASKLINE	(1 << LUA_HOOKLINE)
	const LUA_MASKLINE = 1 << LUA_HOOKLINE;
	//C	 #define LUA_MASKCOUNT	(1 << LUA_HOOKCOUNT)
	const LUA_MASKCOUNT = 1 << LUA_HOOKCOUNT;

	//C	 typedef struct lua_Debug lua_Debug;  /* activation record */


	/* Functions to be called by the debuger in specific events */
	//C	 typedef void (*lua_Hook) (lua_State *L, lua_Debug *ar);
	alias void  function(lua_State *L, lua_Debug *ar)lua_Hook;


	//C	 LUA_API int lua_getstack (lua_State *L, int level, lua_Debug *ar);
	int  function(lua_State *L, int level, lua_Debug *ar) lua_getstack;
	//C	 LUA_API int lua_getinfo (lua_State *L, const char *what, lua_Debug *ar);
	int  function(lua_State *L, const(char)* what, lua_Debug *ar) lua_getinfo;
	//C	 LUA_API const char *lua_getlocal (lua_State *L, const lua_Debug *ar, int n);
	const(char)* function(lua_State *L, lua_Debug *ar, int n)lua_getlocal;
	//C	 LUA_API const char *lua_setlocal (lua_State *L, const lua_Debug *ar, int n);
	const(char)*  function(lua_State *L, lua_Debug *ar, int n)lua_setlocal;
	//C	 LUA_API const char *lua_getupvalue (lua_State *L, int funcindex, int n);
	const(char)*  function(lua_State *L, int funcindex, int n) lua_getupvalue;
	//C	 LUA_API const char *lua_setupvalue (lua_State *L, int funcindex, int n);
	const(char)*  function(lua_State *L, int funcindex, int n) lua_setupvalue;

	//C	 LUA_API int lua_sethook (lua_State *L, lua_Hook func, int mask, int count);
	int  function(lua_State *L, lua_Hook func, int mask, int count) lua_sethook;
	//C	 LUA_API lua_Hook lua_gethook (lua_State *L);
	lua_Hook  function(lua_State *L) lua_gethook;
	//C	 LUA_API int lua_gethookmask (lua_State *L);
	int  function(lua_State *L) lua_gethookmask;
	//C	 LUA_API int lua_gethookcount (lua_State *L);
	int  function(lua_State *L) lua_gethookcount;


	//C	 struct lua_Debug {
	//C	   int event;
	//C	   const char *name;	/* (n) */
	//C	   const char *namewhat;	/* (n) `global', `local', `field', `method' */
	//C	   const char *what;	/* (S) `Lua', `C', `main', `tail' */
	//C	   const char *source;	/* (S) */
	//C	   int currentline;	/* (l) */
	//C	   int nups;		/* (u) number of upvalues */
	//C	   int linedefined;	/* (S) */
	//C	   int lastlinedefined;	/* (S) */
	//C	   char short_src[LUA_IDSIZE]; /* (S) */
	  /* private part */
	//C	   int i_ci;  /* active function */
	//C	 };
	struct lua_Debug
	{
		int event;
		const char *name;
		const char *namewhat;
		const char *what;
		const char *source;
		int currentline;
		int nups;
		int linedefined;
		int lastlinedefined;
		char [LUA_IDSIZE]short_src;
		int i_ci;
	}

	/* }====================================================================== */


	/******************************************************************************
	* Copyright (C) 1994-2007 Lua.org, PUC-Rio.  All rights reserved.
	*
	* Permission is hereby granted, free of charge, to any person obtaining
	* a copy of this software and associated documentation files (the
	* "Software"), to deal in the Software without restriction, including
	* without limitation the rights to use, copy, modify, merge, publish,
	* distribute, sublicense, and/or sell copies of the Software, and to
	* permit persons to whom the Software is furnished to do so, subject to
	* the following conditions:
	*
	* The above copyright notice and this permission notice shall be
	* included in all copies or substantial portions of the Software.
	*
	* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
	* EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
	* MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
	* IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
	* CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
	* TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
	* SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
	******************************************************************************/


	//C	 #endif

}