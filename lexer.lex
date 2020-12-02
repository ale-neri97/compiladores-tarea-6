%{
    #include <stdlib.h>
    #include <string.h>
%}

DIGIT [0-9]
FIRST_DIGIT [1-9]
LETTER [a-zA-Z]

%%

"program"						{ return T_PROGRAM; }
"begin"						    { return T_BEGIN; }
"end"						    { return T_END; }
"end."						    { return T_END_PROGRAM; }
"let"						    { return T_LET; }
"if"							{ return T_IF; }
"then"							{ return T_THEN; }
"fi"							{ return T_FI; }
"else"						    { return T_ELSE; }
"while"							{ return T_WHILE; }
"do"							{ return T_DO; }
"repeat"						{ return T_REPEAT; }
"until"						    { return T_UNTIL; }
"read"						    { return T_READ; }
"print"						    { return T_PRINT; }
"int"						    { return T_INT; }
"real"						    { return T_REAL; }
"bool"						    { return T_BOOL; }
"|" 						    { return T_OR; }
"&"	    					    { return T_AND; }
"True"						    { yylval.boolConstant = true; return T_TRUE; }
"False"						    { yylval.boolConstant = false;return T_FALSE; }
"+"								{ return T_PLUS; }
"-"								{ return T_MINUS; }
"*"								{ return T_TIMES; }
"/"								{ return T_DIVIDED_BY; }
"="								{ return T_EQUALS; }
":="							{ return T_ASSIGNATION; }
"<"								{ return T_LESS_THAN; }
">"								{ return T_GREATER_THAN; }
"("								{ return T_OPEN_PARENTHESIS; }
")"								{ return T_CLOSE_PARENTHESIS; }
";"								{ return T_SEMICOLON; }
":"								{ return T_COLON; }
","								{ return T_COMMA; }
"!"                             { return T_NOT; }
{LETTER}+                       { yylval.idName = strdup(yytext); return T_ID; }
{DIGIT}+                        { yylval.intVal = atoi(yytext); return T_NUMI; }
{FIRST_DIGIT}{DIGIT}*"."{DIGIT}*          { doubleVal = atof(yytext); return T_NUMR; }

%%

int yywrap(void) {}