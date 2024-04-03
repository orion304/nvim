To initialize nvim, first install packer

Powershell:
git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"

Unix
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim


Windows:
Install mingw64, add C:\mingw64\bin to path

Both:
Install node.js


I haven't figured out enough about nvim to know why packer.lua doesn't seem to be sourced when nvim initializes, so I have solved that issue by

1. Navigate to packer.lua
2. :so
3. :PackerSync

Once packer syncs the plugins, everything should start working hopefully
