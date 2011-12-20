### Spell Checking

Turn it on
    :set spell

Change language
    :set spelllang=en,de

Suggest:
    z=

Limit number of spelling alternatives
    :set spellsuggest=5
    

### Key Bindings

Map to all - insert - normal - command - visual
    :map :imap :cmap :nmap :vmap

#### Keys

    <BS> <Tab> <CR> <Enter> <Esc> <Space> 
    <Up> <Down> <Left> <Right> <Home> <End> <PageUp> <PageDown>
    <F1>- <F12> <Insert> <Del> 

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
    :vimgrep /pattern/ [j] [g] file1 file2 ...
    j   - result not presented
    g   - include a line for each pattern

Search for C files recursively
    **/*.c

Matches Show, Next, Previous
    :clist  :cnext  :cprevious

Search help system
    :helpgrep pattern

### Marks

List 
    :marks
Creation - Deletion
    m*      :delmarks a b   :delmarks a-c   :delmarks!
Navigation Line, Line and Column
    '*  `*

:help mark-motions


