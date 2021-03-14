local lush = require('lush')
local hsl = lush.hsl

local color_01              = hsl("#4F4D4D")
local anthracite            = hsl("#353A43")
local rockbed               = hsl("#433E3C")
local mud                   = hsl("#5F4B35")
local color_02              = hsl("#6C645A")
local light_grey            = hsl("#7D807C")
local color_03              = hsl("#8D755A")
local color_04              = hsl("#A88F64")
local sand                  = hsl("#D3C6AB")
local color_05              = hsl("#E5C95A")
local bvg_yellow            = hsl("#E5C33B")
local color_06              = hsl("#D7B247")
local color_07              = hsl("#CFA338")
local display_text          = hsl("#f2a926")
local inactive_display_text = display_text.darken(50).desaturate(70)
local color_08              = hsl("#B78932")
local gold                  = hsl("#9D6D2D")

local u7                    = hsl("#508fbb")
local u8                    = hsl("#1d4f8a")
local u9                    = hsl("#f27822")

local white                 = hsl("#ffffff")
local black                 = hsl("#000000")

local green_base            = hsl(100,40,50)
local red_base              = hsl(0,40,50)
local orange_base           = hsl(40,60,50)

local theme = lush(function()
  return {

    -- Helper definitions to inherit from:
    -- TODO

    -- Normal text
    Normal        { bg = black, fg = white },
    NormalFloat   { Normal }, -- Normal text in floating windows.
    NormalNC      { Normal }, -- normal text in non-current windows

    -- Line Numbers
    CursorLineNr  { fg = display_text , gui = "bold" },
    LineNr        { fg = inactive_display_text },

    -- Cursor
    Cursor        { }, -- character under the cursor
    lCursor       { }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    CursorIM      { }, -- like Cursor, but used when in IME mode |CursorIM|
    CursorLine    { bg = Normal.bg.lighten(5) },
    CursorColumn  { CursorLine },
    TermCursor    { Cursor }, -- cursor in a focused terminal
    TermCursorNC  { Cursor }, -- cursor in an unfocused terminal

    -- UI
    ColorColumn   { CursorLine }, -- used for the columns set with 'colorcolumn'
    StatusLine    { CursorLineNr },
    StatusLineNC  { LineNr },
    VertSplit     { fg = inactive_display_text },
    Tabline       { LineNr },
    TablineSel    { CursorLineNr },
    TablineFill   { VertSplit },
    Title         { StatusLineNC },

    -- "Above the text"
    Visual        { bg = bvg_yellow, fg = black },
    Search        { bg = anthracite , gui = "bold,underline"},
    IncSearch     { bg = Search.bg.lighten(30), gui = "bold,underline" },

    -- Invisible text
    Whitespace    { fg = anthracite },
    Conceal       { }, -- placeholder characters substituted for concealed text (see 'conceallevel')

    -- More default stuff:
    Directory     { }, -- directory names (and other special names in listings)
    DiffAdd       { bg = green_base.darken(60) }, -- diff mode: Added line |diff.txt|
    DiffChange    { bg = orange_base.darken(60) }, -- diff mode: Changed line |diff.txt|
    DiffDelete    { bg = red_base.darken(60) , fg = red_base.darken(50) }, -- diff mode: Deleted line |diff.txt|
    DiffText      { bg = DiffChange.bg.lighten(20) }, -- diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer   { }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    ErrorMsg      { fg = red_base.lighten(40), bg = red_base.darken(60) }, -- error messages on the command line
    Folded        { Whitespace }, -- line used for closed folds
    FoldColumn    { Whitespace }, -- 'foldcolumn'
    SignColumn    { }, -- column where |signs| are displayed
    Substitute    { }, -- |:substitute| replacement text highlighting
    MatchParen    { fg = bvg_yellow }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    ModeMsg       { fg = inactive_display_text }, -- 'showmode' message (e.g., "-- INSERT -- ")
    MsgArea       { }, -- Area for messages and cmdline
    MsgSeparator  { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg       { }, -- |more-prompt|
    NonText       { Whitespace }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Pmenu         { bg = black , fg = inactive_display_text }, -- Popup menu: normal item.
    PmenuSel      { bg = black , fg = display_text }, -- Popup menu: selected item.
    PmenuSbar     { bg = black }, -- Popup menu: scrollbar.
    PmenuThumb    { bg = inactive_display_text }, -- Popup menu: Thumb of the scrollbar.
    Question      { }, -- |hit-enter| prompt and yes/no questions
    QuickFixLine  { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    SpecialKey    { fg = bvg_yellow }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    SpellBad      { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap      { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal    { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare     { }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
    VisualNOS     { }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg    { }, -- warning messages
    WildMenu      { DiffDelete }, -- current match in 'wildmenu' completion

    -- Code and markup
    Comment     { fg = light_grey },

    Constant    { fg = sand },
    String      { Constant },
    Character   { Constant }, --  a character constant: 'c', '\n'
    Number      { Constant }, --   a number constant: 234, 0xff
    Boolean     { Constant }, --  a boolean constant: TRUE, false
    Float       { Number }, --    a floating point constant: 2.3e10

    Identifier  { fg = bvg_yellow , gui = "bold"},
    Function    { Identifier }, -- function name (also: methods for classes)

    Statement   { fg = white, gui = "bold,italic" },
    Keyword     { fg = white, gui = "italic" },
    Conditional { Keyword }, --  if, then, else, endif, switch, etc.
    Repeat      { Keyword }, --   for, do, while, etc.
    Label       { Keyword }, --    case, default, etc.
    Operator    { fg = light_grey }, -- "sizeof", "+", "*", etc.
    Exception   { Keyword }, --  try, catch, throw

    Type        { gui = "underline" },
    StorageClass{ Type }, -- static, register, volatile, etc.
    Structure   { Type }, --  struct, union, enum, etc.
    Typedef     { Type }, --  A typedef

    PreProc     { fg = color_08.lighten(20) },
    Include     { PreProc }, --  preprocessor #include
    Define      { PreProc }, --   preprocessor #define
    Macro       { PreProc }, --    same as Define
    PreCondit   { PreProc }, --  preprocessor #if, #else, #endif, etc.

    Special        { fg = anthracite.lighten(20) }, -- (preferred) any special symbol
    SpecialChar    { Special }, --  special character in a constant
    Tag            { Special }, --    you can use CTRL-] on this
    Delimiter      { Special },
    SpecialComment { Special }, -- special things inside a comment
    Debug          { Special }, --    debugging statements

    Underlined { gui = "underline" }, -- (preferred) text that stands out, HTML links
    Bold       { gui = "bold" },
    Italic     { gui = "italic" },

    -- ("Ignore", below, may be invisible...)
    -- Ignore         { }, -- (preferred) left blank, hidden  |hl-Ignore|

    -- Error          { }, -- (preferred) any erroneous construct

    -- Todo           { }, -- (preferred) anything that needs extra attention; mostly the keywords TODO FIXME and XXX

    -- These groups are for the native LSP client. Some other LSP clients may
    -- use these groups, or use their own. Consult your LSP client's
    -- documentation.

    -- LspReferenceText                     { }, -- used for highlighting "text" references
    -- LspReferenceRead                     { }, -- used for highlighting "read" references
    -- LspReferenceWrite                    { }, -- used for highlighting "write" references

    -- LspDiagnosticsDefaultError           { }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    -- LspDiagnosticsDefaultWarning         { }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    -- LspDiagnosticsDefaultInformation     { }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    -- LspDiagnosticsDefaultHint            { }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)

    -- LspDiagnosticsVirtualTextError       { }, -- Used for "Error" diagnostic virtual text
    -- LspDiagnosticsVirtualTextWarning     { }, -- Used for "Warning" diagnostic virtual text
    -- LspDiagnosticsVirtualTextInformation { }, -- Used for "Information" diagnostic virtual text
    -- LspDiagnosticsVirtualTextHint        { }, -- Used for "Hint" diagnostic virtual text

    -- LspDiagnosticsUnderlineError         { }, -- Used to underline "Error" diagnostics
    -- LspDiagnosticsUnderlineWarning       { }, -- Used to underline "Warning" diagnostics
    -- LspDiagnosticsUnderlineInformation   { }, -- Used to underline "Information" diagnostics
    -- LspDiagnosticsUnderlineHint          { }, -- Used to underline "Hint" diagnostics

    -- LspDiagnosticsFloatingError          { }, -- Used to color "Error" diagnostic messages in diagnostics float
    -- LspDiagnosticsFloatingWarning        { }, -- Used to color "Warning" diagnostic messages in diagnostics float
    -- LspDiagnosticsFloatingInformation    { }, -- Used to color "Information" diagnostic messages in diagnostics float
    -- LspDiagnosticsFloatingHint           { }, -- Used to color "Hint" diagnostic messages in diagnostics float

    -- LspDiagnosticsSignError              { }, -- Used for "Error" signs in sign column
    -- LspDiagnosticsSignWarning            { }, -- Used for "Warning" signs in sign column
    -- LspDiagnosticsSignInformation        { }, -- Used for "Information" signs in sign column
    -- LspDiagnosticsSignHint               { }, -- Used for "Hint" signs in sign column


    -- These groups are for the neovim tree-sitter highlights.
    -- As of writing, tree-sitter support is a WIP, group names may change.
    -- By default, most of these groups link to an appropriate Vim group,
    -- TSError -> Error for example, so you do not have to define these unless
    -- you explicitly want to support Treesitter's improved syntax awareness.

    -- TSError              { }, -- For syntax/parser errors.
    -- TSPunctDelimiter     { }, -- For delimiters ie: `.`
    -- TSPunctBracket       { }, -- For brackets and parens.
    -- TSPunctSpecial       { }, -- For special punctutation that does not fall in the catagories before.
    -- TSConstant           { }, -- For constants
    -- TSConstBuiltin       { }, -- For constant that are built in the language: `nil` in Lua.
    -- TSConstMacro         { }, -- For constants that are defined by macros: `NULL` in C.
    -- TSString             { }, -- For strings.
    -- TSStringRegex        { }, -- For regexes.
    -- TSStringEscape       { }, -- For escape characters within a string.
    -- TSCharacter          { }, -- For characters.
    -- TSNumber             { }, -- For integers.
    -- TSBoolean            { }, -- For booleans.
    -- TSFloat              { }, -- For floats.
    -- TSFunction           { }, -- For function (calls and definitions).
    -- TSFuncBuiltin        { }, -- For builtin functions: `table.insert` in Lua.
    -- TSFuncMacro          { }, -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
    -- TSParameter          { }, -- For parameters of a function.
    -- TSParameterReference { }, -- For references to parameters of a function.
    -- TSMethod             { }, -- For method calls and definitions.
    -- TSField              { }, -- For fields.
    -- TSProperty           { }, -- Same as `TSField`.
    -- TSConstructor        { }, -- For constructor calls and definitions: `{ }` in Lua, and Java constructors.
    -- TSConditional        { }, -- For keywords related to conditionnals.
    -- TSRepeat             { }, -- For keywords related to loops.
    -- TSLabel              { }, -- For labels: `label:` in C and `:label:` in Lua.
    -- TSOperator           { }, -- For any operator: `+`, but also `->` and `*` in C.
    -- TSKeyword            { }, -- For keywords that don't fall in previous categories.
    -- TSKeywordFunction    { }, -- For keywords used to define a fuction.
    -- TSException          { }, -- For exception related keywords.
    -- TSType               { }, -- For types.
    -- TSTypeBuiltin        { }, -- For builtin types (you guessed it, right ?).
    -- TSNamespace          { }, -- For identifiers referring to modules and namespaces.
    -- TSInclude            { }, -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
    -- TSAnnotation         { }, -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
    -- TSText               { }, -- For strings considered text in a markup language.
    -- TSStrong             { }, -- For text to be represented with strong.
    -- TSEmphasis           { }, -- For text to be represented with emphasis.
    -- TSUnderline          { }, -- For text to be represented with an underline.
    -- TSTitle              { }, -- Text that is part of a title.
    -- TSLiteral            { }, -- Literal text.
    -- TSURI                { }, -- Any URI like a link or email.
    -- TSVariable           { }, -- Any variable name that does not have another highlight.
    -- TSVariableBuiltin    { }, -- Variable names that are defined by the languages, like `this` or `self`.

    -- Plugins
    ScrollView { bg = inactive_display_text },
  }
end)

return theme

-- vi:nowrap:number
