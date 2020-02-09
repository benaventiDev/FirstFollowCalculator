package main.specifications;
import java_cup.runtime.*;
//idea que cada no terminal genere una clase java


%%
%public
%class Lexer
%unicode
%standalone
%caseless
%column
%line



ESPACIO=" "
SALTO=\n|\r|\r\n
BLANK = ({ESPACIO}|{SALTO})+
SEMI = ";"
ASSIGN = "::="
EPSILON = "EPSILON"
PP = "%%"
OR = "|"
ID = [:jletter:] ([:jletterdigit:] |"_")*


%state GRAMMAR_DECLARATION GRAMMAR_BODY
%%
<YYINITIAL>{

    {BLANK} {}
    {EPSILON} {System.out.println("ERROR: Epsilon, line: " + yyline + ", column " + yycolumn);} // error adv it will be ignored
    {ID} {System.out.println("id: " + yytext());}
    {SEMI} {System.out.println("ERROR: Semi");} // adv it will be ignored
    {OR} {System.out.println("ERROR: OR");} // adv it will be ignored
    {ASSIGN} {System.out.println("ERROR: Arrow");}  // adv it will be ignored
    {PP} {System.out.println("PP"); yybegin(GRAMMAR_DECLARATION); System.out.println("Enter GRAMMAR_DECLARATION"); }
    . {System.out.println("value: " + yytext());}
}

<GRAMMAR_DECLARATION>{

    {ASSIGN} {System.out.println("Arrow"); System.out.println("Enter GRAMMAR_BODY"); yybegin(GRAMMAR_BODY);}  // adv it will be ignored
    {ID} {System.out.println("id1: " + yytext());}
    . {System.out.println("value: " + yytext());} // adv unexpected token, adv to remove it in line and col

}

<GRAMMAR_BODY>{
    {EPSILON} {System.out.println("Epsilon");}
    {SEMI} {System.out.println("Semi"); System.out.println("Enter GRAMMAR_DECLARATION"); yybegin(GRAMMAR_DECLARATION);}
    {OR} {System.out.println("OR");}
    {BLANK} {}
    {ASSIGN} {System.out.println("Arrow"); }  // adv unexpected token, adv to remove it in line and col
    {ID} {System.out.println("id: " + yytext());}
    . {System.out.println("value: " + yytext());}


}




