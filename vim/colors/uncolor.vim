hi clear
if exists("syntax_on")
      syntax reset
endif

" run this line to add stuff :so $VIMRUNTIME/syntax/hitest.vim

set background=light

highlight  wildmenu     cterm=bold       ctermfg=NONE      ctermbg=NONE
highlight  VertSplit    cterm=NONE       ctermfg=Black     ctermbg=Black
highlight  TabLine      cterm=bold       ctermfg=White     ctermbg=Black
highlight  TabLineSel   cterm=bold       ctermfg=Black     ctermbg=NONE
highlight  TabLineFill  cterm=NONE       ctermfg=Black     ctermbg=Black
highlight  Underlined   cterm=underline  ctermfg=NONE      ctermbg=NONE
highlight  PreProc      cterm=NONE       ctermfg=NONE      ctermbg=NONE
highlight  Ignore       cterm=NONE       ctermfg=NONE      ctermbg=NONE
highlight  Error        cterm=bold       ctermfg=NONE      ctermbg=Red
highlight  ErrorMsg     cterm=bold       ctermfg=Red       ctermbg=NONE
highlight  WarningMsg     cterm=bold       ctermfg=Red       ctermbg=NONE
highlight  MoreMsg      cterm=bold       ctermfg=Black     ctermbg=NONE
highlight  Pmenu        cterm=NONE       ctermfg=White     ctermbg=Black
highlight  PmenuSel     cterm=bold       ctermfg=Black     ctermbg=NONE
highlight  PmenuSbar    cterm=NONE       ctermfg=NONE      ctermbg=Black
highlight  PmenuThumb   cterm=NONE       ctermfg=NONE      ctermbg=Black
highlight  LineNr       cterm=bold       ctermfg=Black     ctermbg=NONE
highlight  Question     cterm=bold       ctermfg=Black     ctermbg=NONE
highlight  Title        cterm=NONE       ctermfg=12      ctermbg=NONE
highlight  Todo         cterm=NONE       ctermfg=12      ctermbg=NONE
highlight  Search       cterm=NONE       ctermfg=12      ctermbg=NONE
highlight  SpecialKey   cterm=NONE       ctermfg=12      ctermbg=NONE
highlight  Statement    cterm=bold       ctermfg=NONE      ctermbg=NONE
highlight  Identifier   cterm=NONE       ctermfg=NONE      ctermbg=NONE
highlight  Type         cterm=NONE       ctermfg=NONE      ctermbg=NONE
highlight  Special      cterm=NONE       ctermfg=NONE      ctermbg=NONE
highlight  Constant     cterm=NONE       ctermfg=DarkGray  ctermbg=NONE
highlight  Comment      cterm=NONE       ctermfg=DarkGray  ctermbg=NONE
highlight  Visual       cterm=bold       ctermfg=White     ctermbg=Black
highlight  MatchParen   cterm=underline  ctermfg=Black     ctermbg=NONE

"hi Comment
"hi Constant
"hi Identifier
"hi Type
"hi PreProc
"hi Error
"hi Todo
"highlight Normal 
"highlight Visual 

"bold
"underline
"undercurl	
"reverse
"inverse		
"italic
"standout
"NONE		
"
"color nums
"NR-16   NR-8    COLOR NAME ~
"0	    0	    Black
"1	    4	    DarkBlue
"2	    2	    DarkGreen
"3	    6	    DarkCyan
"4	    1	    DarkRed
"5	    5	    DarkMagenta
"6	    3	    Brown, DarkYellow
"7	    7	    LightGray, LightGrey, Gray, Grey
"8	    0*	    DarkGray, DarkGrey
"9	    4*	    Blue, LightBlue
"10	    2*	    Green, LightGreen
"11	    6*	    Cyan, LightCyan
"12	    1*	    Red, LightRed
"13	    5*	    Magenta, LightMagenta
"	    14	    3*	    Yellow, LightYellow
"	    15	    7*	    White
"if &background == "light"
"  highlight comment ctermfg=darkgreen guifg=darkgreen
"else
"  highlight comment ctermfg=green guifg=green
"endif
"
"	*Comment	any comment
"	*Constant	any constant
"	 String		a string constant: "this is a string"
"	 Character	a character constant: 'c', '\n'
"	 Number		a number constant: 234, 0xff
"	 Boolean	a boolean constant: TRUE, false
"	 Float		a floating point constant: 2.3e10
"
"	*Identifier	any variable name
"	 Function	function name (also: methods for classes)
"
"	*Statement	any statement
"	 Conditional	if, then, else, endif, switch, etc.
"	 Repeat		for, do, while, etc.
"	 Label		case, default, etc.
"	 Operator	"sizeof", "+", "*", etc.
"	 Keyword	any other keyword
"	 Exception	try, catch, throw
"
"	*PreProc	generic Preprocessor
"	 Include	preprocessor #include
"	 Define		preprocessor #define
"	 Macro		same as Define
"	 PreCondit	preprocessor #if, #else, #endif, etc.
"
"	*Type		int, long, char, etc.
"	 StorageClass	static, register, volatile, etc.
"	 Structure	struct, union, enum, etc.
"	 Typedef	A typedef
"
"	*Special	any special symbol
"	 SpecialChar	special character in a constant
"	 Tag		you can use CTRL-] on this
"	 Delimiter	character that needs attention
"	 SpecialComment	special things inside a comment
"	 Debug		debugging statements
"
"	*Underlined	text that stands out, HTML links
"
"	*Ignore		left blank, hidden  |hl-Ignore|
"
"	*Error		any erroneous construct
"
"	*Todo		anything that needs extra attention; mostly the
"			keywords TODO FIXME and XXX
"
"
