/* A Bison parser, made by GNU Bison 2.4.2.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989-1990, 2000-2006, 2009-2010 Free Software
   Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     CHAR = 258,
     INT = 259,
     DOUBLE = 260,
     IF = 261,
     ELSE = 262,
     WHILE = 263,
     FOR = 264,
     CONTINUE = 265,
     BREAK = 266,
     VOID = 267,
     RETURN = 268,
     DIM = 269,
     TO = 270,
     NEXT = 271,
     APT = 272,
     ADDOP = 273,
     SUBOP = 274,
     MULOP = 275,
     DIVOP = 276,
     INCR = 277,
     DECR = 278,
     OROP = 279,
     ANDOP = 280,
     NOTOP = 281,
     EQUOP = 282,
     NEQUOP = 283,
     GTEQ = 284,
     GT = 285,
     LTEQ = 286,
     LT = 287,
     LPAREN = 288,
     RPAREN = 289,
     LBRACE = 290,
     RBRACE = 291,
     SEMI = 292,
     ASSIGN = 293,
     COMMA = 294,
     ID = 295,
     ICONST = 296,
     FCONST = 297,
     CCONST = 298,
     STRING = 299
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 1685 of yacc.c  */
#line 11 "parser.y"

    char str_val[100];
    int int_val;



/* Line 1685 of yacc.c  */
#line 102 "parser.tab.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;

