package main;

import main.specifications.Lexer;

import java.io.*;


public class Main {

    public static void main(String[] args) {
	// write your code here
        runLexicalAnalysis();
    }



    public static void runLexicalAnalysis(){
        Reader reader = null;

            try {
                reader = new BufferedReader(new FileReader("C:\\Users\\benav\\Documents\\Projects\\FirstFollowCalculator\\src\\main\\specifications\\test.txt"));

                Lexer lexer = new Lexer(reader);
                String result = "";
                lexer.yylex();

            } catch (IOException e) {
                e.printStackTrace();
            }

    }
}
