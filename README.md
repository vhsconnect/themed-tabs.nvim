## Requirements

This plugin only works in _Neovim 0.5_ or newer - This will not work in any version of _Vim_

## Installation

Using [packer](https://github.com/wbthomason/packer.nvim) in lua

```lua
use {"vhsconnect/themed-tabs.nvim", tag = '*', config = function()
  require("toggleterm").setup({ colorschemes = { "theme1", "theme2", "etc" }})
end}
```

Using [lazy.nvim](https://github.com/folke/lazy.nvim) in lua

```lua
{
  {'vhsconnect/themed-tabs.nvim', version = "*", opts = { colorschemes = { "theme1", "theme2", "etc" }}}
}
```

## Motivation

I found myself getting lost in the sauce when I was working on many files at once or when I was exploring large projects. By color coding each tab I can switch contexts that little bit faster and keep focus.

## Setup

This plugin must be explicitly enabled and a list of `colorschemes` must be passed in the configuration by using `require("toggleterm").setup{ colorschemes }`. Neovim will throw errors when you switch tabs if these are not set.

## Usage

Just create new tabs and switch between them as you usually would. The theme is set per tab number so closing a tab will cause all your tabs to shift one colorscheme to the left.

## Caveats and limitations

The default `colorscheme` set in your configuration will take precedent over the first colorscheme in the plugin's configuration when opening Neovim. Once you cycle back to the first tab however the plugin's first theme is applied. That's why it's a good idea to match those two themes.

## Development

Append the path to the plugin's `init.lua` to your `package.path`

```lua
`package.path = package.path .. ';/path/to/themed-tabs.nvim/lua/themed-tabs/init.lua'`
```
