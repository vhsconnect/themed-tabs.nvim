## Motivation

I found myself getting lost and disorganized when I was working with many tabs at once especially when each tab is further broken down into a set of panes. By color coding each tab I can switch contexts that little bit faster and keep focus.

`themed-tabs` automatically assigns new tabs to preselected themes of your choosing. You can also change the colors of the various tabs during usage and it will persist them.

## Requirements

This plugin only works in _Neovim 0.5_ or newer - This will not work in any version of _Vim_

## Installation

Using [packer](https://github.com/wbthomason/packer.nvim) in lua

```lua
use {"vhsconnect/themed-tabs.nvim", config = function()
  require("themed-tabs").setup({ colorschemes = { "theme1", "theme2", "etc" }})
end}
```

Using [lazy.nvim](https://github.com/folke/lazy.nvim) in lua

```lua
{
  {'vhsconnect/themed-tabs.nvim', opts = { colorschemes = { "theme1", "theme2", "etc" }}}
}
```

Using lua

```lua
  require('themed-tabs').setup({ colorschemes = { "theme1", "theme2", "etc" }}) 
```

## Configuration
```lua
  local config = { 
    colorschemes = { "theme1", "theme2", "etc" },
    fallback_colorscheme = "theme3"
  }
```



## Setup

This plugin must be explicitly enabled and a list of `colorschemes` must be passed in the configuration by using `require("themed-tabs").setup{ colorschemes }`. `themed-tabs` falls back on some default themes in case those are not set.

## Caveats and limitations

Colorschemes do not cycle back to the begninning. Once all colorschemes are used, themed-tabs falls back on the `fallback-colorscheme`

## Development

Append the path to the plugin's `init.lua` to your `package.path`

```lua
`package.path = package.path .. ';/path/to/themed-tabs.nvim/lua/themed-tabs/init.lua'`
```
