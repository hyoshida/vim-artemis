" Vim syntax file
" Language: Artemis script
" Maintainer: YOSHIDA Hiroki <hyoshida@appirits.com>

if v:version < 600
  syntax clear
elseif exists('b:current_syntax')
  finish
endif

if v:version < 508
  command -nargs=+ ArtemisHiLink hi link <args>
else
  command -nargs=+ ArtemisHiLink hi def link <args>
endif

syntax case match

syntax match artemisLineComment "//.*"
syntax region artemisLineComment start=/\/\*/ end=/\*\//
syntax match artemisLabel "^\*\S\+"

syntax match artemisCommandLine "^\t*\zs@.*$" contains=artemisCommandTagName,artemisCommandParametersKey,artemisCommandParametersEqual,artemisCommandParametersValue
syntax region artemisCommandTag start="\[" end="\]" contains=artemisCommandTagName,artemisCommandParametersKey,artemisCommandParametersEqual,artemisCommandParametersValue

syntax keyword artemisCommandParametersKey contained skipwhite nextgroup=artemisCommandParametersEqual accel align alt angle ask audiostreamnum autohide autoreturn backlay bceil bfloor bgamma bgcolor bgm bold buf call canskip ch channel char children click clickse clicksebuf clipheight clipleft cliptop clipwidth color countpage default delay destlayer destpage draggable dx dy edge edgecolor enabled end enterse entersebuf eol exp expand face fix fliplr flipud for frame framekey from func gceil gfloor ggamma graphic graphickey grayscale gvolume height hint hmax index italic jump kag key layer layers leavese leavesebuf left length line linekey linesize linespacing loop mapaction mapimage marginb marginl marginr margint maxchars mcolor messages method mode module mopacity name onenter onleave onskip opacity output overlap page pagekey pan path pausevideo pitch place playrate pointed pos position prompt rceil recthit repage restore rfloor rgamma rubyoffset rubysize rule se sebuf seg sh shadow shadowcolor size slot speed spline srclayer srcpage start stay storage store sw sx sy target text time timemode title to top vague vertical videoevent videosegloop visible vmax volume width withback x y
syntax match artemisCommandParametersEqual "=" contained nextgroup=artemisCommandParametersValue,artemisString,artemisBoolean
" FIXME: won't highlight
syntax match artemisCommandParametersValue "=\zs\S\+" contained

syntax keyword artemisCommandTagName contained skipwhite nextgroup=artemisCommandParametersKey,artemisCommandParametersEqual,artemisCommandParametersValue animstart animstop autowc backlay bgmopt button call cancelautomode cancelskip cancelvideoevent cancelvideosegloop cclick ch checkbox clearbgmlabel clearbgmstop clearsysvar clearvar clearvideolayer click clickskip close cm commit copybookmark copylay ct ctimeout current cursor cwheel deffont defstyle delay disablestore edit else elsif emb endhact endif endignore endindent endlink endmacro endnowait endscript er erasebookmark erasemacro eval fadebgm fadeinbgm fadeinse fadeoutbgm fadeoutse fadepausebgm fadese font freeimage glyph goback gotostart graph hact hch hidemessage history hr if ignore image indent input iscript jump l laycount layopt link load loadplugin locate locklink locksnapshot macro mapaction mapdisable mapimage mappfont move nextskip nowait openvideo p pausebgm pausevideo pimage playbgm playse playvideo position preparevideo ptext quake r rclick record resetfont resetstyle resetwait resumebgm resumevideo return rewindvideo ruby s save seopt setbgmlabel setbgmstop showhistory startanchor stopbgm stopmove stopquake stopse stoptrans stopvideo store style tempload tempsave timeout title trace trans unlocklink unlocksnapshot video videoevent videolayer videosegloop wa wait waitclick waittrig wb wc wf wheel wl wm wp wq ws wt wv xchgbgm

syntax region artemisString start=/"/ end=/"/
syntax region artemisString start=/'/ end=/'/

syntax keyword artemisBoolean true false

if v:version >= 508 || !exists("did_artemis_syn_inits")
  if v:version < 508
    let did_artemis_syn_inits = 1
  endif

  ArtemisHiLink artemisLineComment Comment
  ArtemisHiLink artemisLabel Label

  ArtemisHiLink artemisCommandTag Function
  ArtemisHiLink artemisCommandTagName Statement
  ArtemisHiLink artemisCommandParametersKey Type
  ArtemisHiLink artemisCommandParametersValue String

  ArtemisHiLink artemisString String
  ArtemisHiLink artemisBoolean Boolean

  delcommand ArtemisHiLink
endif

let b:current_syntax = 'artemis'
