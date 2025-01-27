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

local turmstr               = hsl("#6fc7d3")

local white                 = hsl("#ffffff")
local black                 = hsl("#000000")

local medium_bg             = anthracite
local dark_bg               = medium_bg.darken(50)
local light_bg              = medium_bg.lighten(40)

local green_base            = hsl(100,40,50)
local red_base              = hsl(0,40,50)
local orange_base           = hsl(40,60,50)
local blue_base             = hsl(210,40,50)

local magenta               = hsl(321,25,55)
local bright_red            = hsl('#b00000')

local theme = lush(function(injected_functions)
  local sym = injected_functions.sym

  return {

    -- Helper definitions to inherit from:

    -- Normal text
    Normal        { fg = white },
    NormalNC      { Normal }, -- normal text in non-current windows

    NormalFloat   { Normal , bg = dark_bg }, -- Normal text in floating windows.
    FloatBorder   { NormalFloat },

    -- Line Numbers
    CursorLineNr  { fg = display_text , gui = "bold" },
    LineNr        { fg = inactive_display_text },

    -- Cursor
    Cursor        { }, -- character under the cursor
    lCursor       { }, -- the character under the cursor when |language-mapping| is used (see 'guicursor')
    CursorIM      { }, -- like Cursor, but used when in IME mode |CursorIM|
    CursorLine    { bg = black.lighten(5) },
    CursorColumn  { CursorLine },
    TermCursor    { bg = white, fg = black }, -- cursor in a focused terminal
    TermCursorNC  { bg = TermCursor.bg.darken(40) }, -- cursor in an unfocused terminal

    -- UI
    ColorColumn   { CursorLine }, -- used for the columns set with 'colorcolumn'
    StatusLine    { CursorLineNr , bg = medium_bg },
    StatusLineNC  { LineNr , bg = dark_bg },
    VertSplit     { fg = inactive_display_text },
    Tabline       { LineNr , bg = dark_bg },
    TablineSel    { CursorLineNr , bg = medium_bg },
    TablineFill   { VertSplit },

    -- "Above the text"
    Visual        { bg = bvg_yellow, fg = black },
    Search        { bg = light_bg , fg = black }, -- TODO: color
    IncSearch     { Search , gui = "bold,underline" },

    -- Invisible text
    Conceal       { fg = bvg_yellow }, -- placeholder characters substituted for concealed text (see 'conceallevel')
    Whitespace    { fg = anthracite },
    Folded        { Whitespace }, -- line used for closed folds
    NonText       { Whitespace }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.

    Noise { fg = Whitespace.fg.lighten(60) },

    -- More default stuff:
    Directory     { }, -- directory names (and other special names in listings)
    DiffAdd       { bg = green_base.darken(60) }, -- diff mode: Added line |diff.txt|
    DiffChange    { bg = orange_base.darken(60) }, -- diff mode: Changed line |diff.txt|
    DiffDelete    { bg = red_base.darken(60) , fg = red_base.darken(50) }, -- diff mode: Deleted line |diff.txt|
    DiffText      { bg = DiffChange.bg.lighten(20) }, -- diff mode: Changed text within a changed line |diff.txt|
    EndOfBuffer   { }, -- filler lines (~) after the end of the buffer.  By default, this is highlighted like |hl-NonText|.
    Ignore        { Whitespace }, -- (preferred) left blank, hidden  |hl-Ignore|
    Error         { fg = white , bg = bright_red }, -- (preferred) any erroneous construct
    ErrorMsg      { Error }, -- error messages on the command line
    FoldColumn    { Whitespace }, -- 'foldcolumn'
    SignColumn    { }, -- column where |signs| are displayed
    Substitute    { }, -- |:substitute| replacement text highlighting
    MatchParen    { fg = turmstr }, -- The character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    ModeMsg       { fg = inactive_display_text }, -- 'showmode' message (e.g., "-- INSERT -- ")
    MsgArea       { Noise }, -- Area for messages and cmdline
    MsgSeparator  { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg       { }, -- |more-prompt|
    Pmenu         { bg = NormalFloat.bg , fg = inactive_display_text }, -- Popup menu: normal item.
    PmenuSel      { bg = Pmenu.bg       , fg = display_text }, -- Popup menu: selected item.
    PmenuSbar     { bg = Pmenu.bg }, -- Popup menu: scrollbar.
    PmenuThumb    { bg = inactive_display_text }, -- Popup menu: Thumb of the scrollbar.
    Question      { }, -- |hit-enter| prompt and yes/no questions
    QuickFixLine  { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    SpecialKey    { fg = bvg_yellow }, -- Unprintable characters: text displayed differently from what it really is.  But not 'listchars' whitespace. |hl-Whitespace|
    SpellBad      { bg = magenta.darken(50) }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    SpellCap      { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    SpellLocal    { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    SpellRare     { }, -- Word that is recognized by the spellchecker as one that is hardly ever used.  |spell| Combined with the highlighting used otherwise.
    VisualNOS     { }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg    { bg = orange_base.darken(40), fg = Error.fg }, -- warning messages
    WildMenu      { DiffDelete }, -- current match in 'wildmenu' completion

    -- Code and markup
    Comment     { fg = light_grey },
    Todo        { fg = magenta },

    Constant    { fg = sand },
    String      { Constant },
    Character   { Constant }, --  a character constant: 'c', '\n'
    Number      { Constant }, --   a number constant: 234, 0xff
    Boolean     { Constant }, --  a boolean constant: TRUE, false
    Float       { Number }, --    a floating point constant: 2.3e10

    Identifier  { fg = bvg_yellow.lighten(20)  },
    Function    { fg = Identifier.fg.darken(30) , gui = "bold" }, -- function name (also: methods for classes)

    Statement   { fg = white, gui = "bold,italic" },
    Keyword     { fg = light_grey.lighten(50), gui = "italic" },
    Conditional { Keyword }, --  if, then, else, endif, switch, etc.
    Repeat      { Keyword }, --   for, do, while, etc.
    Label       { Keyword }, --    case, default, etc.
    Operator    { fg = light_grey }, -- "sizeof", "+", "*", etc.
    Exception   { Keyword }, --  try, catch, throw

    Type        { fg = color_04.lighten(20) },
    StorageClass{ fg = Type.fg }, -- static, register, volatile, etc.
    Structure   { fg = Type.fg.darken(20) }, --  struct, union, enum, etc.
    Typedef     { fg = Type.fg.darken(20), gui = 'bold' }, --  A typedef

    PreProc     { fg = color_08.lighten(20) },
    Include     { PreProc }, --  preprocessor #include
    Define      { PreProc }, --   preprocessor #define
    Macro       { PreProc }, --    same as Define
    PreCondit   { PreProc }, --  preprocessor #if, #else, #endif, etc.

    Special        { fg = String.fg.lighten(50) }, -- (preferred) any special symbol
    SpecialChar    { Special }, --  special character in a constant
    Tag            { Special }, --    you can use CTRL-] on this
    Delimiter      { fg = anthracite.lighten(20) },
    SpecialComment { Special }, -- special things inside a comment
    Debug          { Special }, --    debugging statements

    Title         { fg = bvg_yellow, gui = "bold" },
    Underlined    { gui = "underline" }, -- (preferred) text that stands out, HTML links
    Bold          { gui = "bold" },
    Italic        { gui = "italic" },

    -- ("Ignore", below, may be invisible...)
    -- Ignore         { }, -- (preferred) left blank, hidden  |hl-Ignore|

    -- Error          { }, -- (preferred) any erroneous construct

    URI { fg = blue_base, gui = 'underline' },

    -- These groups are for the native LSP client. Some other LSP clients may
    -- use these groups, or use their own. Consult your LSP client's
    -- documentation.

    LspReferenceText                     { fg = red_base.lighten(20) }, -- used for highlighting "text" references
    LspReferenceRead                     { fg = red_base.lighten(20) }, -- used for highlighting "read" references
    LspReferenceWrite                    { fg = red_base.lighten(20) }, -- used for highlighting "write" references

    -- LspDiagnosticsDefaultError           { fg = red_base.darken(60)   }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    -- LspDiagnosticsDefaultWarning         { fg = orange_base.darken(60)}, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    -- LspDiagnosticsDefaultInformation     { fg = blue_base.darken(60)  }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)
    -- LspDiagnosticsDefaultHint            { fg = green_base.darken(60) }, -- Used as the base highlight group. Other LspDiagnostic highlights link to this by default (except Underline)

    LspDiagnosticsVirtualTextError       { fg = red_base.darken(60)    }, -- Used for "Error" diagnostic virtual text
    LspDiagnosticsVirtualTextWarning     { fg = orange_base.darken(60) }, -- Used for "Warning" diagnostic virtual text
    LspDiagnosticsVirtualTextInformation { fg = blue_base.darken(60)   }, -- Used for "Information" diagnostic virtual text
    LspDiagnosticsVirtualTextHint        { fg = green_base.darken(60)  }, -- Used for "Hint" diagnostic virtual text

    LspDiagnosticsUnderlineError         { fg = LspDiagnosticsVirtualTextError.fg.lighten(20) , gui = "underline" }, -- Used to underline "Error" diagnostics
    LspDiagnosticsUnderlineWarning       { fg = LspDiagnosticsVirtualTextWarning.fg.lighten(20) , gui = "underline" }, -- Used to underline "Warning" diagnostics
    LspDiagnosticsUnderlineInformation   { fg = LspDiagnosticsVirtualTextInformation.fg.lighten(20) , gui = "underline" }, -- Used to underline "Information" diagnostics
    LspDiagnosticsUnderlineHint          { fg = LspDiagnosticsVirtualTextHint.fg.lighten(20) , gui = "underline" }, -- Used to underline "Hint" diagnostics

    LspDiagnosticsFloatingError          { bg = Normal.fg, bg = LspDiagnosticsVirtualTextError.fg }, -- Used to color "Error" diagnostic messages in diagnostics float
    LspDiagnosticsFloatingWarning        { bg = Normal.fg, bg = LspDiagnosticsVirtualTextWarning.fg }, -- Used to color "Warning" diagnostic messages in diagnostics float
    LspDiagnosticsFloatingInformation    { bg = Normal.fg, bg = LspDiagnosticsVirtualTextInformation.fg }, -- Used to color "Information" diagnostic messages in diagnostics float
    LspDiagnosticsFloatingHint           { bg = Normal.fg, bg = LspDiagnosticsVirtualTextHint.fg }, -- Used to color "Hint" diagnostic messages in diagnostics float

    -- LspDiagnosticsSignError              { }, -- Used for "Error" signs in sign column
    -- LspDiagnosticsSignWarning            { }, -- Used for "Warning" signs in sign column
    -- LspDiagnosticsSignInformation        { }, -- Used for "Information" signs in sign column
    -- LspDiagnosticsSignHint               { }, -- Used for "Hint" signs in sign column

    sym('@punctuation.delimiter') { Delimiter },
    sym('@puncuation.bracket')    { fg = light_grey }, -- For brackets and parens.
    sym('@puncuation.special')    { Delimiter }, -- For special punctutation that does not fall in the catagories before.
    sym('@constant')              { Constant }, -- For constants
    sym('@string')                { String }, -- For strings.
    sym('@function')              { Function }, -- For function (calls and definitions).
    sym('@parameter')             { Identifier }, -- For parameters of a function.
    sym('@method')                { Function }, -- For method calls and definitions.
    sym('@constructor')           { sym('@method') , gui = "italic" }, -- For constructor calls and definitions: `{ }` in Lua, and Java constructors.
    sym('@keyword')               { Keyword }, -- For keywords that don't fall in previous categories.
    sym('@type')                  { Type }, -- For types.
    sym('@variable')              { Identifier },
    sym('@markup.raw')            { bg = light_grey },

    -- Plugins

      -- scrollview
      ScrollView { bg = inactive_display_text },

      -- fugitive
      diffRemoved               { DiffDelete, fg = DiffDelete.fg.lighten(50)  },
      diffAdded                 { DiffAdd },
      diffChanged               { DiffChange },
      fugitiveUntrackedModifier { fg = DiffDelete.bg.lighten(20) },
      fugitiveUnstagedModifier  { fg = DiffText.bg.lighten(20) },
      fugitiveStagedModifier    { fg = DiffAdd.bg.lighten(20) },
      -- diffOnly                 {},
      -- diffIdentical            {},
      -- diffDiffer               {},
      -- diffBDiffer              {},
      -- diffIsA                  {},
      -- diffNoEOL                {},
      -- diffCommon               {},
      -- diffSubname              {},
      -- diffLine                 {},
      -- diffFile                 {},
      -- diffOldFile              {},
      -- diffNewFile              {},
      -- diffIndexLine            {},
      -- diffComment              {},
      -- fugitiveHash             {},
      -- fugitiveSymbolicRef      {},
      -- fugitiveHeader           {},
      -- fugitiveBareHeader       {},
      -- fugitiveHelpTag          {},
      -- fugitiveHelpHeader       {},
      -- fugitiveHeading          {},
      -- fugitiveSection          {},
      -- fugitivePreposition      {},
      -- fugitiveCount            {},
      -- fugitiveInstruction      {},
      -- fugitiveDone             {},
      -- fugitiveStop             {},
      -- fugitiveModifier         {},
      -- fugitiveHunk             {},
      -- fugitiveUntrackedHeading {},
      -- fugitiveUntrackedSection {},
      -- fugitiveUnstagedHeading  {},
      -- fugitiveUnstagedSection  {},
      -- fugitiveStagedHeading    {},
      -- fugitiveStagedSection    {},

      -- gitsigns
      GitSignsAdd                {DiffAdd}, -- Used for the text of 'add' signs.
      GitSignsChange             {DiffChange}, -- Used for the text of 'change' signs.
      GitSignsDelete             {DiffDelete}, -- Used for the text of 'delete' signs.
      GitSignsChangedelete       {GitSignsChange}, -- Used for the text of 'changedelete' signs.
      GitSignsTopdelete          {GitSignsDelete}, -- Used for the text of 'topdelete' signs.
      GitSignsUntracked          {GitSignsAdd}, -- Used for the text of 'untracked' signs.
      GitSignsAddNr              {GitSignsAdd}, -- Used for number column (when `config.numhl == true`) of 'add' signs.
      GitSignsChangeNr           {GitSignsChange}, -- Used for number column (when `config.numhl == true`) of 'change' signs.
      GitSignsDeleteNr           {GitSignsDelete}, -- Used for number column (when `config.numhl == true`) of 'delete' signs.
      GitSignsChangedeleteNr     {GitSignsChangeNr}, -- Used for number column (when `config.numhl == true`) of 'changedelete' signs.
      GitSignsTopdeleteNr        {GitSignsDeleteNr}, -- Used for number column (when `config.numhl == true`) of 'topdelete' signs.
      GitSignsUntrackedNr        {GitSignsAddNr}, -- Used for number column (when `config.numhl == true`) of 'untracked' signs.
      GitSignsAddLn              {DiffAdd}, -- Used for buffer line (when `config.linehl == true`) of 'add' signs.
      GitSignsChangeLn           {DiffChange}, -- Used for buffer line (when `config.linehl == true`) of 'change' signs.
      GitSignsChangedeleteLn     {GitSignsChangeLn}, -- Used for buffer line (when `config.linehl == true`) of 'changedelete' signs.
      GitSignsUntrackedLn        {GitSignsAddLn}, -- Used for buffer line (when `config.linehl == true`) of 'untracked' signs.
      GitSignsAddPreview         {DiffAdd}, -- Used for added lines in previews.
      GitSignsDeletePreview      {DiffDelete}, -- Used for deleted lines in previews.
      GitSignsCurrentLineBlame   {NonText}, -- Used for current line blame.
      GitSignsAddInline          {TermCursor}, -- Used for added word diff regions in inline previews.
      GitSignsDeleteInline       {TermCursor}, -- Used for deleted word diff regions in inline previews.
      GitSignsChangeInline       {TermCursor}, -- Used for changed word diff regions in inline previews.
      GitSignsAddLnInline        {GitSignsAddInline}, -- Used for added word diff regions when `config.word_diff == true`.
      GitSignsChangeLnInline     {GitSignsChangeInline}, -- Used for changed word diff regions when `config.word_diff == true`.
      GitSignsDeleteLnInline     {GitSignsDeleteInline}, -- Used for deleted word diff regions when `config.word_diff == true`.
      GitSignsDeleteVirtLn       {DiffDelete}, -- Used for deleted lines shown by inline `preview_hunk_inline()` or `show_deleted()`.
      GitSignsDeleteVirtLnInLine {GitSignsDeleteLnInline}, -- Used for word diff regions in lines shown by inline `preview_hunk_inline()` or `show_deleted()`.
      GitSignsVirtLnum           {GitSignsDeleteVirtLn}, -- Used for line numbers in inline hunks previews.

      WhichKey          { gui = "bold" },
      WhichKeySeperator { Pmenu },
      WhichKeyGroup     { Pmenu , gui = "italic" },
      WhichKeyDesc      { PmenuSel , gui = "italic" },
      WhichKeyFloating  { PmenuSel },

      -- telescope
      TelescopeNormal         { Pmenu },
      TelescopeBorder         { fg = TelescopeNormal.bg, bg = TelescopeNormal.bg },
      TelescopeNormalBorder   { TelescopeNormal },
      TelescopeSelection      { PmenuSel },
      TelescopeSelectionCaret { TelescopeSelection, fg = TelescopeSelection.bg.lighten(60) , gui = 'bold' },
      TelescopeTitle          { fg = TelescopeNormal.bg.lighten(70), bg = TelescopeNormal.bg.lighten(20) , gui = "italic"},
      TelescopeMatching       { fg = TelescopeSelection.bg, bg = TelescopeSelection.fg , gui = "bold"},

      TelescopePromptNormal   { fg = black, bg = bvg_yellow , gui = 'bold' },
      TelescopePromptBorder   { fg = TelescopePromptNormal.bg, bg = TelescopePromptNormal.bg },
      TelescopePromptTitle    { fg = TelescopePromptNormal.bg.darken(70), bg = TelescopePromptNormal.bg.lighten(20), gui = "italic" },
      TelescopePromptCounter  { fg = TelescopePromptNormal.bg.darken(70) },
      TelescopePromptPrefix   { TelescopePromptCounter, gui = 'bold' },

      TelescopePreviewNormal  { fg = Normal.fg.darken(30), bg = TelescopeNormal.bg.darken(50) },
      TelescopePreviewBorder  { TelescopePreviewNormal },
      TelescopePreviewTitle   { fg = TelescopePreviewNormal.bg.darken(70), bg = TelescopePreviewNormal.bg.darken(20), gui = "italic" },
      TelescopePreviewMessage { fg = TelescopePreviewNormal.bg.darken(40) },

      -- Floaterm
      Floaterm { bg = NormalFloat.bg },
      FloatermBorder { NormalFloat },

      CmpItemKindDefault  { fg = sand },
      CmpItemKindCopilot  { fg = u9 },
      CmpItemKindText     { fg = anthracite },
      CmpGhostText        { fg = turmstr },

      typstMarkupReference { fg = color_04 },
      typstMarkupLabel     { typstMarkupReference },
      typstMarkupURL       { URI },
      typstCommentBlock            { Comment },
      typstCommentLine             { Comment },
      typstCommentTodo             { Todo },
      typstCodeConditional         { Conditional },
      typstCodeRepeat              { Repeat },
      typstCodeKeyword             { Keyword },
      typstCodeStatement           { Statement },
      typstCodeStatementWord       { fg = typstCodeStatement.fg.lighten(20), gui = typstCodeStatement.gui },
      typstCodeConstant            { Constant },
      typstCodeNumberInteger       { Number },
      typstCodeNumberFloat         { Number },
      typstCodeNumberLength        { Number },
      typstCodeNumberAngle         { Number },
      typstCodeNumberRatio         { Number },
      typstCodeNumberFraction      { Number },
      typstCodeString              { String },
      typstCodeIdentifier          { Identifier },
      typstCodeFieldAccess         { Identifier },
      typstCodeFunction            { Function },
      typstCodeFunctionArgument    { },
      typstCodeParen               { Noise },
      typstCodeBrace               { Noise },
      typstCodeBracket             { Noise },
      typstCodeDollar              { Noise },
      typstHashtagConditional      { Conditional },
      typstHashtagRepeat           { Repeat },
      typstHashtagKeywords         { },
      typstHashtagStatement        { },
      typstHashtagControlFlowError { Error },
      typstHashtagControlFlow      { Noise },
      typstHashtagKeyword          { Keyword },
      typstHashtagStatementWord    { Statement },
      typstHashtagConstant         { Constant },
      typstHashtagIdentifier       { Identifier },
      typstHashtagFieldAccess      { Identifier },
      typstHashtagFunction         { Function },
      typstHashtagParen            { Noise },
      typstHashtagBrace            { Noise },
      typstHashtagBracket          { Noise },
      typstHashtagDollar           { Noise },
      typstMarkupRawInline         { Macro },
      typstMarkupRawBlock          { Macro },
      typstMarkupHeading           { Title },
      typstMarkupBulletList        { Normal },
      typstMarkupEnumList          { Normal },
      typstMarkupBold              { gui='bold' },
      typstMarkupItalic            { gui='italic' },
      typstMarkupLinebreak         { Noise },
      typstMarkupNonbreakingSpace  { Whitespace },
      typstMarkupShy               { Constant },
      typstMarkupDash              { Constant },
      typstMarkupEllipsis          { Constant },
      typstMarkupTermList          { Constant },
      typstMarkupItalicDelimiter   { Noise },
      typstMarkupBoldDelimiter     { Noise },
      typstMarkupDollar            { Noise },


      DapUINormal { Normal },
      DapUIVariable { Normal },
      DapUIScope {  },
      DapUIType {  },
      DapUIValue { Normal },
      DapUIModifiedValue {  },
      DapUIDecoration {  },
      DapUIThread {  },
      DapUIStoppedThread {  },
      DapUIFrameName { Normal },
      DapUISource {  },
      DapUILineNumber { fg = turmstr.lighten(20) , bg = turmstr.darken(70) },
      DapUIFloatNormal { NormalFloat },
      DapUIFloatBorder {  },
      DapUIWatchesEmpty {  },
      DapUIWatchesValue {  },
      DapUIWatchesError {  },
      DapUIBreakpointsPath {  },
      DapUIBreakpointsInfo {  },
      DapUIBreakpointsCurrentLine {  },
      DapUIBreakpointsLine { DapUILineNumber },
      DapUIBreakpointsDisabledLine {  },
      DapUICurrentFrameName { DapUIBreakpointsCurrentLine },
      DapUIStepOver {  },
      DapUIStepInto {  },
      DapUIStepBack {  },
      DapUIStepOut {  },
      DapUIStop {  },
      DapUIPlayPause {  },
      DapUIRestart {  },
      DapUIUnavailable {  },
      DapUIWinSelect {  },
      DapUIEndofBuffer { EndOfBuffer },
      DapUINormalNC { Normal },
      DapUIPlayPauseNC {  },
      DapUIRestartNC {  },
      DapUIStopNC {  },
      DapUIUnavailableNC {  },
      DapUIStepOverNC {  },
      DapUIStepIntoNC {  },
      DapUIStepBackNC {  },
      DapUIStepOutNC {  },
  }
end)

return theme

-- vi:nowrap:number
