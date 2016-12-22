" bepo.vim - Disposition bepo
" Author:       Ergodis <http://bepo.fr/>
" Version:      0.1
" GetLatestVimScripts: ---- :AutoInstall: bepo.vim


if exists("g:loaded_bepo") 
  finish
endif
let g:loaded_bepo = 1

" test OS et lang
"
" if !empty(system("setxkbmap -print|grep bepo"))
"    source ~/.vimrc.bepo
" endif
" if has('win32')
  " function for win
" endif

" os detection 
" if !exists("g:bepo_os")
"    if has("win64") || has("win32") || has("win16")
"        let g:bepo_os = "Windows"
"    else
"        let g:bepo_os = substitute(system('uname'), '\n', '', '')
"    endif
"endif


" gestion du menu

function! s:bepo_test_param()
  if !exists('g:bepo_permut_w')
    let g:bepo_permut_w = 0
  endif
  if !exists('g:bepo_permut_maj_numb')
    let g:bepo_permut_maj_numb = 0
  endif
  if !exists('g:bepo_map_azerty')
    let g:bepo_map_azerty = 0
  endif
  if !exists('g:bepo_map_qwerty')
    let g:bepo_map_qwerty = 0
  endif
  if !exists('g:bepo_color_nbsp')
    let g:bepo_color_nbsp = 0
  endif
  if !exists('g:bepo_disp_hidden')
    let g:bepo_disp_hidden = 0
  endif
endfunction

"call s:bepo_test_param()

function! s:bepo_permut_w() 
  " {W} -> [É]
  " On remappe W sur É :
  noremap é w
  noremap É W
  " Corollaire: on remplace les text objects aw, aW, iw et iW
  " pour effacer/remplacer un mot quand on n’est pas au début (daé / laé).
  onoremap aé aw
  onoremap aÉ aW
  onoremap ié iw
  onoremap iÉ iW
  " Pour faciliter les manipulations de fenêtres, on utilise {W} comme un Ctrl+W :
  noremap w <C-w>
  noremap W <C-w><C-w>
     
    " [HJKL] -> {CTSR}
  " {cr} = « gauche / droite »
  noremap c h
  noremap r l
  " {ts} = « haut / bas »
  noremap t j
  noremap s k
  " {CR} = « haut / bas de l'écran »
  noremap C H
  noremap R L
  " {TS} = « joindre / aide »
  noremap T J
  noremap S K
  " Corollaire : repli suivant / précédent
  noremap zs zj
  noremap zt zk
   
  " {HJKL} <- [CTSR]
  " {J} = « Jusqu'à »            (j = suivant, J = précédant)
  noremap j t
  noremap J T
  " {L} = « Change »             (l = attend un mvt, L = jusqu'à la fin de ligne)
  noremap l c
  noremap L C
  " {H} = « Remplace »           (h = un caractère slt, H = reste en « Remplace »)
  noremap h r
  noremap H R
  " {K} = « Substitue »          (k = caractère, K = ligne)
  noremap k s
  noremap K S
  " Corollaire : correction orthographique
  noremap ]k ]s
  noremap [k [s
   
  " Désambiguation de {g}
  " ligne écran précédente / suivante (à l'intérieur d'une phrase)
  noremap gs gk
  noremap gt gj
  " onglet précédant / suivant
  noremap gb gT
  noremap gé gt
  " optionnel : {gB} / {gÉ} pour aller au premier / dernier onglet
  noremap gB :exe "silent! tabfirst"<CR>
  noremap gÉ :exe "silent! tablast"<CR>
  " optionnel : {g"} pour aller au début de la ligne écran
  noremap g" g0
   
  " <> en direct
  noremap « <
  noremap » >
   
  " Remaper la gestion des fenêtres
  noremap wt <C-w>j
  noremap ws <C-w>k
  noremap wc <C-w>h
  noremap wr <C-w>l
  noremap wd <C-w>c
  noremap wo <C-w>s
  noremap wp <C-w>o
  noremap w<SPACE> :split<CR>
  noremap w<CR> :vsplit<CR>
endfunction


function! s:bepo_permut_maj_numb() 
  " Chiffres en accès direct
  noremap " 1
  noremap 1 "
  noremap « 2
  noremap 2 <
  noremap » 3
  noremap 3 >
  noremap ( 4
  noremap 4 (
  noremap ) 5
  noremap 5 )
  noremap @ 6
  noremap 6 @
  noremap + 7
  noremap 7 +
  noremap - 8
  noremap 8 -
  noremap / 9
  noremap 9 /
  noremap * 0
  noremap 0 *
endfunction

function! s:bepo_map_bepo()
  mapclear
endfunction

function! s:bepo_map_bepo_qwerty() 
  "" mapping du clavier bépo->qwerty en mode normal
  ""
  " configuration des lettres
  noremap b q
  noremap é w
  noremap p e
  noremap o r
  noremap è t
  noremap ^ y
  noremap v u
  noremap d i
  noremap l o
  noremap j p
  noremap z [
  noremap w ]
  noremap a a
  noremap u s
  noremap i d
  noremap e f
  noremap \ \
  noremap g ,
  noremap c h
  noremap t j
  noremap s k
  noremap r l
  noremap n ;
  noremap m '
  noremap ê <
  noremap à z
  noremap àà zz
  noremap y x
  noremap x c
  noremap . v
  noremap k b
  noremap ' n
  noremap q m
  noremap g ,
  noremap , g
  noremap ,, gg
  noremap h .
  noremap f /
  noremap B Q
  noremap É W
  noremap P E
  noremap O R
  noremap È T
  noremap ! Y
  noremap V U
  noremap D I
  noremap L O
  noremap J P
  noremap Z {
  noremap W }
  noremap A A
  noremap U S
  noremap I D
  noremap E F
  noremap ; G
  noremap C H
  noremap T J
  noremap S K
  noremap R L
  noremap N :
  noremap M "
  noremap Ç \|
  noremap Ê >
  noremap À Z
  noremap ÀÀ ZZ
  noremap Y X
  noremap X C
  noremap : V
  noremap K B
  noremap ? N
  noremap Q M
  noremap G <
  noremap H >
  noremap F ?
  " configuration du copié sur le ç car y est sur la touche composé ^
  noremap ç y
  " configuration des nombres
  noremap $ `
  noremap " 1
  noremap « 2
  noremap » 3
  noremap ( 4
  noremap ) 5
  noremap @ 6
  noremap + 7
  noremap - 8
  noremap / 9
  noremap * 0
  noremap = -
  noremap % =
  noremap # ~
  noremap 1 !
  noremap 2 @
  noremap 3 #
  noremap 4 $
  noremap 5 %
  noremap 6 ^
  noremap 7 &
  noremap 8 *
  noremap 9 (
  noremap 0 )
  noremap ° _
  noremap ` +
endfunction


function! s:bepo_map_bepo_azerty() 
  set langmap=ba,éz,pe,or,èt,çy,vu,di,lo,fp,j^,z$,aq,us,id,ef,\\,g,ch,tj,sk,rl,
        \ nm,mù,^*,ê<,àw,yx,xc,.v,kb,'n,q\\,,g\\;,h:,f!,BA,ÉZ,PE,OR,ÈT,ÇY,VU,DI,
        \ LO,FP,J¨,Z£,AQ,US,ID,EF,?G,CH,TJ,SK,RL,NM,M%,!*,Ê>,ÀW,YX,XC,:V,KB,\\;N,
        \ QG,G.,H/,F§,@œ,_&,"é,«",»',((,)-,+è,-_,*ç,/à,=),%=,$Œ,^°,µ+,#“,{´,}~,
        \ <#,>{,[[,]|,±`,¬\,×^,÷@,¯],%}
endfunction


function! s:bepo_color_nbsp()
  " colorise les nbsp
  highlight NbSp ctermbg=lightgray guibg=lightred
  match NbSp /\%xa0/
endfunction

function! s:bepo_disp_hidden()
  " affiche caracteres invisibles
  set listchars=nbsp:¤,tab:>-,trail:¤,extends:>,precedes:<
  set list
endfunction


function! BepoInit()
  call s:bepo_test_param()
  if g:bepo_permut_w
    call s:bepo_permut_w()
  endif 
  if g:bepo_permut_maj_numb
    call s:bepo_permut_maj_numb()
  endif
  if g:bepo_map_qwerty
    call s:bepo_map_bepo_qwerty()
  endif 
  if g:bepo_map_azerty
    call s:bepo_map_bepo_azerty()
  endif 
  if g:bepo_color_nbsp
    call s:bepo_color_nbsp()
  endif 
  if g:bepo_disp_hidden
    call s:bepo_disp_hidden()
  endif

endfunction

command! -bar BepoPermutW call s:bepo_permut_w()
command! -bar BepoPermutMajNumb call s:bepo_permut_maj_numb()

command! -bar BepoMapQwerty call s:bepo_map_bepo_qwerty()
command! -bar BepoMapAzerty call s:bepo_map_bepo_azerty()
command! -bar BepoColorNbsp call s:bepo_color_nbsp()
command! -bar BepoDispHidden call s:bepo_disp_hidden()

call BepoInit()
" vim:set ft=vim sw=2 sts=2 et:
