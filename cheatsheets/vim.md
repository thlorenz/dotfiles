### Reserved Symbols

    :echo &somesetting
    :echo @somevalue

### Spell Checking

Turn it on, Change language, Limit number of spelling alternatives, Suggest

    :set spell  :set spelllang=en,de    :set spellsuggest=5     z=

### Key Bindings

Map to all - insert - normal - command - visual

    :map :imap :cmap :nmap :vmap

#### Keys

    <BS> <Tab> <CR> <Enter> <Esc> <Space> <F1>- <F12> 
    <Up> <Down> <Left> <Right> <Home> <End> <PageUp> <PageDown> <Insert> <Del> 

    :help key-mapping

### Navigation

Goto Declaration, File, Contextual connection

    gd      gf      %
Beginning/End Sentence, Paragraph, Block, Comment Block

    (   )       {   }       [{  ]}      [/  ]/
Forward/Backward Last Edits, Contextual beginning, Contextual end 

    g,  g;      ][  [       ]]  []
Function definition, back to origin

    Ctrl-]  Ctrl-t

### Searching

Backwards/Forwards - Repeat Search

    ?   /       ??  //
Forward/Backward Word under Cursor, Part of word under Cursor

    #   *       g#  g*

#### VimGrep

    :vimgrep /pattern/ [j] [g] file1 file2 ...  (j - result not presented, g - include a line for each pattern)

Search for C files recursively

    **/*.c

Matches Show, Next, Previous

    :clist  :cnext  :cprevious

Search help system

    :helpgrep pattern

### Marks

List, Create, Delete

    :marks      m*      :delmarks a b   :delmarks a-c   :delmarks!

Navigation Line, Line and Column

    '*  `*

    :help mark-motions

### Autocompletion

From open Buffers Backward/Forward
    
    Ctrl-p  Ctrl-n

From dictionary

    Ctrl-x + Ctrl-k
    :set dictionary+=/path/     

Others using Ctrl+x +:

    Ctrl-l: Complete whole lines of the text 
    Ctrl-n: Complete words from the current buffer 
    Ctrl-t: Complete words from the thesaurus (see :help 'thesaurus') 
    Ctrl-i: Words from the current and included files 
    S:      Spelling the suggestions

Omnicompletion

    Ctrl-x + Ctrl-o    
    :set omnifunc=CompletionFunction
    :help omnifunc 

### Macros

Start/End Recording, Execute, Repeat Execution

    q*  q       @*  @@

### Sessions and Views

Session Save, Load

    :mksession[!] [FILE]   :source Session.vim     vim -S Session.vim

View Save, Load, Control where views are saved

    :mkview [FILE]  :loadview [FILE]    :set viewdir=path

Auto Save and Load last session if no file name is given
    
    autocmd VimEnter * call LoadSession() 
    autocmd VimLeave * call SaveSession() 
    function! SaveSession()
        execute 'mksession! $HOME/.vim/sessions/session.vim' 
    endfunction
    function! LoadSession() 
        if argc() == 0 execute 'source $HOME/.vim/sessions/session.vim' endif
    endfunction

Save and Auto Load project (folder) specific session

    mksession!      silent source! Session.vim  

Auto Save and Load Views

    autocmd BufWinLeave * mkview 
    autocmd BufWinEnter * silent loadview

### Registers

Acess register e.g to yank into it or paste from it

    "*  "*y "*p
    :registers
    
Readonly Registers

    "-          small delete
    ".          last inserted text
    ":          command last executed on command line
    "%          name of file in currently active buffer
    "#          name of alternate file in currently active buffer
    "+          text selected globally
    "~          last text dropped into vim
    "/          last search
    "0 .. "9    change/delete history
    "=          yank expression result via command line to paste later
                :help expression

### Folding

    :help fold-manual fold-indent fold-expr  fold-syntax  fold-diff  fold-marker
    :set  fold enable

    zc      Close fold
    zo      Open fold
    zM      Close all folds
    zR      Open all folds

