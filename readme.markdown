Synbad
======

![](https://camo.githubusercontent.com/f4e0cb49e71725d2ca7dece953ebe96a44c6abc4/687474703a2f2f332e62702e626c6f6773706f742e636f6d2f2d65475041534f54693653302f554863635a7279334472492f41414141414141417656342f5a326e59694a505a6c50592f73313630302f73696e6261642d6d757374616368652b2832292e6a7067 "Moar Synbad")

Cycle through predefined syntaxes in Vim using a list of predefined syntaxes.

Use case: you have a file that Vim thinks is HTML but you want to treat it as PHP or Liquid or ERB. Create a file at the root of your project called .syntaxes and enter file types in it:

```
html
php
javascript
liquid
```

Or, define global syntaxes in your .vimrc file:

```
let g:syntaxes = ['go', 'html', 'javascript', 'jsx', 'php', 'ruby', 'twig']
```

### Key mappings

Ctrl-y to cycle through file types. When you've cycled through the available options, ctrl-y will return to default filetype.
