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

List, Creation, Deletion

    :marks      m*      :delmarks a b   :delmarks a-c   :delmarks!
Navigation Line, Line and Column

    '*  `*

    :help mark-motions

### Autocompletion

From open Buffers Backward/Forward
    Ctrl-p  Ctrl-n

From dictionary
    :set dictionary+=/path/     
    Ctrl-x + Ctrl-k

Others using Ctrl+x +:
    Ctrl-l: Complete whole lines of the text 
    Ctrl-n: Complete words from the current buffer 
    Ctrl-t: Complete words from the thesaurus (see :help 'thesaurus') 
    Ctrl-i: Words from the current and included files 
    S:      Spelling the suggestions

Omnicompletion
    :set omnifunc=CompletionFunction
    Ctrl-x + Ctrl-o    
    
    :help omnifunc 

