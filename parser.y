//This file contains the sitax recognizer for the given grammar.

%{
    #include <stdio.h>
    #include <stdbool.h>
    #include <stdlib.h>//Incluye malloc
    #include <math.h>
    #include <string.h>//Incluye strlen
%}

// Start Token
%start prog


// Token declarations
%token T_PROGRAM 
%token T_BEGIN 
%token T_END
%token T_END_PROGRAM 
%token T_LET 
%token T_IF 
%token T_THEN
%token T_FI 
%token T_ELSE 
%token T_PLUS 
%token T_MINUS
%token T_TIMES 
%token T_DIVIDED_BY
%token T_REPEAT 
%token T_UNTIL
%token T_WHILE
%token T_DO
%token T_EQUALS
%token T_LESS_THAN 
%token T_GREATER_THAN
%token T_OR 
%token T_AND 
%token T_NOT
%token T_INT 
%token T_REAL 
%token T_BOOL 
%token T_CLOSE_PARENTHESIS 
%token T_OPEN_PARENTHESIS 
%token T_ASSIGNATION
%token T_SEMICOLON 
%token T_COMMA 
%token T_COLON 
%token T_READ 
%token T_PRINT 
%token T_TRUE 
%token T_FALSE
%token T_ID //Future Modification
%token T_NUMI //Future Modification
%token T_NUMR //Future Modification

%%

// Grammar Rules
prog: T_PROGRAM T_ID opt_decls T_BEGIN opt_stmts T_END_PROGRAM;

opt_decls: decl_lst | %empty;

decl_lst: decl T_SEMICOLON decl_lst | decl;

decl: T_LET id_lst T_COLON tipo;

id_lst: T_ID COMMA_TOKEN id_lst | T_ID ;

tipo: T_NUMI | T_NUMR | T_BOOL ;

stmt: 
    T_ID T_ASSIGNATION expr 
    | T_ID T_ASSIGNATION bool_expr 
    | T_IF bool_expr T_THEN stmt T_FI 
    | T_IF bool_expr T_THEN stmt T_ELSE stmt 
    | T_WHILE bool_expr T_DO stmt
    | T_REPEAT stmt T_UNTIL bool_expr
    | T_BEGIN opt_stmts T_END 
    | T_READ T_ID 
    | T_PRINT expr ;

opt_stmts: stmt_lst | %empty ;

stmt_lst: stmt_lst T_SEMICOLON stmt | stmt;

expr: expr T_PLUS term 
    | expr T_MINUS term 
    | term ;

term: term T_TIMES factor 
    | term T_DIVIDED_BY factor 
    | factor;

factor: T_OPEN_PARENTHESIS expr T_CLOSE_PARENTHESIS 
    | T_ID 
    | T_NUMI 
    | T_NUMR;

bool_expr: 
    bool_expr T_OR bool_expr 
    | T_NOT bool_term 
    | bool_term ;

bool_term: 
    bool_term T_AND bool_factor 
    | bool_factor ;

bool_factor:
    expr T_LESS_THAN expr 
    | expr T_GREATER_THAN expr
    | expr T_EQUALS expr
    | T_OPEN_PARENTHESIS bool_expr T_CLOSE_PARENTHESIS 
    | T_TRUE
    | T_FALSE;

%%