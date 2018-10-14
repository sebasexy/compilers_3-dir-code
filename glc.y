%{
    #include <stdio.h>
    void yyerror(char* c);
    int yylex(void);

    //PROLOGUE
%}

// BISON DECLARATIONS

//

// AFTER %% -> GRAMMAR RULES %%
%%



program: 
    declaration-list;
declaration-list: 
    declaration-list declaration
    | declaration;
declaration:
    var-declaration
    | fun-declaration;
var-declaration:
    type-specifier ID ';'
    | type-specifier ID '[' NUM ']' ';';
type-specifier:
    int
    | void;
fun-declaration:
    type-specifier ID '(' params ')' compund-stmt;
params:
    param-list
    | void;
param-list:
    param-list ',' param
    | param;
param:
    type-specifier ID
    | type-specifier ID '[' ']';
compound-stmt:
    '{' local-declarations statement-list '}';
local-declarations:
    local-declarations var-declaration
    | empty;
statement-list:
    statement-list statement
    | empty;
statement:
    expression-stmt
    | compund-stmt
    | selection-stmt
    | iteration-stmt
    | return-stmt;
expression-stmt:
    expression ';'
    | ';';
selection-stmt:
    'if' '(' expression ')'

%%

// EPILOGUE

    

    