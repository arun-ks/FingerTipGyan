; Shows a random quote from the text file called FingerTipGyan.txt
#NoEnv ; For security
#SingleInstance force


ProcessQuotesFiles:
	FileRead , quoteVar , C:\arun\Learn\AutoHotKey\2017\FingerTipGyan.txt      ;  Read the quote file
	StringSplit , quoteArray_ , quoteVar , `n                                  ;  Split each line into it's own variable

#z:: 
  gosub SplashQuote
return


SplashQuote:
    goSub ChooseQuote	
	MsgBox, 0, FingerTip Gyan, %quote%, 4                               ; MsgBox [, Options, Title, Text, Timeout]	
return

  
; HOTKEY HELP  #(Win) !(Alt) ^(Control)  +(Shift)

ChooseQuote:
	Random , rand , 1 , %quoteArray_0%                                  ;  Generate a random number between 1 and the number of quotes found. 
	StringReplace , quote , quoteArray_%rand% , ~~ , `n`n, All          ;  Move the details below the KEY assuming it follows 2 tildas ( ~~ ) .
	IF StrLen(quote) < 4                                                ;  Ignores blank lines, also, allowing you to use blank lines in txt file if you want to. 
		goto ChooseQuote
return  


