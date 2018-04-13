"--------------------------------------------------------------------------------
"     File Name           :     autoHEADER.vim
"     Created By          :     shanzi
"     Creation Date       :     [2012-10-03 23:53]
"     Last Modified       :     [2013-07-08 21:00]
"     Description         :     Auto insert comment header block for varies
"                               programing language
"--------------------------------------------------------------------------------



let s:style_list = [
            \    { 'style' : ['/*' , '*' , '*/' , '*' ] , 'ft' : [ 'c' , 'java' , 'cpp' , 'javascript' , 'go' , 'php' , 'jsp' ] , 
            \      'prefix' : {
            \                 'php' : '<?php',
            \                 'jsp' : '<%',
            \                 },
            \      'appendix' : {
            \                 'php' : '?>',
            \                 'jsp' : '%>',
            \                 }},
            \    { 'style' : ['#'  , '#' , ''  , '#' ] , 'ft' : [ 'python' ,'python.django','ruby', 'perl' , 'sh','coffee' ] , 
            \      'prefix' : {
            \                 'python' : '#! /usr/bin/env python',
            \                 'ruby' : '#! /usr/bin/env ruby',
            \                 'perl' : '#! /usr/bin/env perl',
            \                 'sh' : '#! /bin/bash',
            \                   }},
            \    { 'style' : ['"'  , '"' , ''  , '-' ] , 'ft' : [ 'vim' , 'tex' ] },
            \    { 'style' : ['<!--'  , '*' , '-->'   , '*' ] , 'ft' : [ 'html' , 'md' ] },
            \    { 'style' : ['---[[' , ''  , '---]]' , ''  ]  , 'ft' : [ 'lua' ]},
            \]


fun! s:insert_header_with_ft(ft, licenceName)
    for styledict in s:style_list
        let ftlist = get(styledict,'ft')
        let indexofft = index(ftlist, a:ft)
        if indexofft >= 0
            let style = get(styledict,'style')
            let prefix = get(styledict,'prefix')
            let appendix = get(styledict,'appendix')
            let start_char = style[1]
            let start_line = 0

            if a:licenceName == "gpl3"
                let messages = [[printf('Copyright (C) %s  %s <%s>', strftime('%Y'), g:userName, g:userEmail)],
                               \['This program is free software: you can redistribute it and/or modify'],
                               \['it under the terms of the GNU General Public License as published by'],
                               \['the Free Software Foundation, either version 3 of the License, or'],
                               \['(at your option) any later version.'],
                               \[''],
                               \['This program is distributed in the hope that it will be useful,'],
                               \['but WITHOUT ANY WARRANTY; without even the implied warranty of'],
                               \['MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the'],
                               \['GNU General Public License for more details.'],
                               \[''],
                               \['You should have received a copy of the GNU General Public License'],
                               \['along with this program.  If not, see <http://www.gnu.org/licenses/>.']]

            elseif a:licenceName == "mit"
                let messages =  [['This file is under MIT Licence'],
                                \[printf('Copyright (C) %s %s <%s>', strftime('%Y'), g:userName, g:userEmail)],
                                \[''],
                                \['Permission is hereby granted, free of charge, to any person obtaining a copy of'],
                                \['this software and associated documentation files (the "Software"),'], 
                                \['to deal in the Software without restriction, including without limitation'],
                                \['the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or'],
                                \['sell copies of the Software, and to permit persons to whom the Software is'],
                                \['furnished to do so, subject to the following conditions:'],
                                \[''],
                                \['The above copyright notice and this permission notice shall be included in all copies'],
                                \['or substantial portions of the Software.'],
                                \[''],
                                \['THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,'],
                                \['INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE'],
                                \['AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,'],
                                \['DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,'],
                                \['ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.']]

            else
                echom "Unknown licence"
                return -1
            endif

            if  type(prefix) == type({})
                let prefix_by_ft = get(prefix,a:ft)
                if  type(prefix_by_ft)==type('') && len(prefix_by_ft)>0
                    call append(0 , prefix_by_ft)
                    let start_line += 1
                endif
            endif

            " start of comment block
            call append(start_line, repeat('', 1) . style[0] . repeat(style[3], 1))
            let start_line += 1

            for message in messages
                call append(start_line, repeat(' ', 1) . start_char . repeat(' ',1) . printf('%-2s',get(message,0)))
                let start_line += 1
            endfor

            " save cursor pos
            let endline = start_line

            " end of comment block
            call append(start_line,repeat('', 1) . style[2])
            let start_line += 1

            " appendix
            if type(appendix)==type({})
                let appendix_by_ft = get(appendix,a:ft)
                if type(appendix_by_ft)==type('') && len(appendix_by_ft)
                    call append(start_line,appendix_by_ft)
                endif
            endif

            call append(start_line+1,'')
            
            " restore line
            call cursor(endline,0)
            exe "normal $"
            return 1
        endif
    endfor
    return 0
endfun


fun! autoHEADER#make_header(licenceName)
    let s:filename=expand('%')
    call s:insert_header_with_ft(&ft, a:licenceName)
endfun

fun! autoHEADER#enable()
    augroup autoHEADER
        autocmd!
        autocmd BufNewFile *.* call autoHEADER#make_header()
        autocmd Bufwritepre,filewritepre *.* call autoHEADER#update_modified_time()
    augroup END
endfun

fun! autoHEADER#disable()
    augroup autoHEADER
        autocmd!
    augroup END
endfun



fun! autoHEADER#update_modified_time()
    let cursor_pos = getpos('.')
    silent! exe "1,10s/\\(Last Modified\\s\\+:\\s\\+\\)\\[[^\\]]\\+\\]/\\1[" . strftime("%Y-%m-%d %H:%M") . "]/" 
    call setpos('.',cursor_pos)
endfun

if !exists(":Licence")
  command -nargs=1 Licence :call autoHEADER#make_header(<q-args>)
endif
