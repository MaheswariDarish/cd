%{
#include <stdio.h>

void yyerror(const char *s);
int yylex();
%}

%token ID NUM IF ELSE LE GE EQ NE OR AND 
%right '=' UMINUS
%left '>' '<' '+' '-' '/' '*' LE GE NE EQ AND OR 

%%
S : ST { printf("Input accepted\n"); };

ST : MIF            
   | UIF            
   | DEF            
   ;

MIF : IF '(' E ')' ST ELSE ST    
    ;

UIF : IF '(' E ')' ST            
    ;

DEF : '{' BLOCK '}'              
    | E ';'                      
    | /* empty */               
    ;

BLOCK : BLOCK ST                 
      | ST                       
      | /* empty */             
      ;

E : ID '=' E                     
  | E '+' E                     
  | E '-' E                      
  | E '*' E                     
  | E '/' E                     
  | E '<' E                     
  | E '>' E                     
  | E LE E                      
  | E GE E                      
  | E NE E                      
  | E EQ E                      
  | E AND E                     
  | E OR E                      
  | E '+' '+'                   
  | E '-' '-'                   
  | ID                           
  | NUM                          
  ;

%%

int main() {
    printf("Enter the expression:\n");
    yyparse();
    return 0;
}

void yyerror(const char *s) {
    fprintf(stdout, "Input not accepted: %s\n", s);
}