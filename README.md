<!--********************************************************************************
*     File Name           :     README.md
*     Created By          :     shanzi
*     Hacked By           :     shanzi
*     Creation Date       :     [2012-10-04 01:10]
*     Last Modified       :     [2013-07-08 21:22]
*     Description         :     Introduction to autoHEADER
*********************************************************************************-->


# vim-licenceAdd 

## Introduction

vim-licenceAdd is a vim helper plugin for easier inserting comment header block contains Licences.
For example, a typical python comment header block may like this:


    #! /usr/bin/env python
    ##
    # Copyright (C) 2013  Alexandre BM <s@rednaks.tn>
    # This program is free software: you can redistribute it and/or modify
    # it under the terms of the GNU General Public License as published by
    # the Free Software Foundation, either version 3 of the License, or
    # (at your option) any later version.
    #   
    # This program is distributed in the hope that it will be useful,
    # but WITHOUT ANY WARRANTY; without even the implied warranty of
    # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    # GNU General Public License for more details.
    #   
    # You should have received a copy of the GNU General Public License
    # along with this program.  If not, see <http://www.gnu.org/licenses/>.


## Install

To install you can just clone or download the source code and extract into your `.vim/bundle/` folder. 
You should have [Pathogen](https://github.com/tpope/vim-pathogen) installed.

## Usage

vim-licenseAdd is able to insert comment block at the head of you source file automatically when you are creating
a new file with `vim newfile.py -c 'Licence mit` in console , or `:Licence mit` in vim. 

You can also specify the Email and the User name in `.vimrc`


## Config

1. `g:userName`
    Your name, to be used in the licence.
2. `g:userEmail`
    Your email adress, used in the licence.


## Licence

    autoHEADER - a vim plugin auto insert comment header blocks

    Copyright (C) 2012 shanzi
    All rights reserved.

    Redistribution and use in source and binary forms, with or without
    modification, are permitted provided that the following conditions are met:

    1. Redistributions of source code must retain the above copyright
    notice, this list of conditions and the following disclaimer.
    2. Redistributions in binary form must reproduce the above copyright
    notice, this list of conditions and the following disclaimer in the
    documentation and/or other materials provided with the distribution.

    THIS SOFTWARE IS PROVIDED BY sh ''AS IS'' AND ANY
    EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
    WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
    DISCLAIMED. IN NO EVENT SHALL sh BE LIABLE FOR ANY
    DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
    (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
    LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
    ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
    (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
    SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


    The views and conclusions contained in the software and documentation 
    are those of the authors and should not be interpreted as representing
    official policies, either expressedor implied, of sh.

    ****************************************************************************

    Copyright (C) 2013 Alexandre BM <s@rednaks.tn>
    The hacked code is under GNU General Public V3 Licence.


