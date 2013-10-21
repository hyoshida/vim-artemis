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
syntax match artemisCommandParametersValue "=\zs\S\+" contained

command -nargs=+ ArtemisTagName syntax keyword artemisCommandTagName contained skipwhite nextgroup=artemisCommandParametersKey,artemisCommandParametersEqual,artemisCommandParametersValue <args>
" exec
ArtemisTagName
  \ automode autosave backlog call calllua debug debugprint debugreload delcommandskipin delonautomodein delonautomodeout delonbacklogin delonbacklogout deloncommandskipout deloncontrolskipin deloncontrolskipout delonhidein delonhideout delonpush exec exit hide jump keyconfig load lua macroadd macrodel rclick reset return save setonautomodein setonautomodeout setonbacklogin setonbacklogout setoncommandskipin setoncommandskipout setoncontrolskipin setoncontrolskipout setonhidein setonhideout setonpush skip stop tag wait
" text
ArtemisTagName
  \ chgmsg font fontinit glyph indent link linkdisable linkenable print prohibit rp rt ruby scein sceout scetween writebacklog
  \ fontdefault
" animation
ArtemisTagName
  \ anime delonclick delondrag delondragin delondragout delonrollout delonrollover flip lyc lydel lydrag lyedit lyprop lytween lytweendel savess setonclick setondrag setondragin setondragout setonrollout setonrollover slider takess trans tweenset uidel
" sound
ArtemisTagName
  \ delonsoundfinish seplay sestop setonsoundfinish sfade splay sstop sxfade voice
" video
ArtemisTagName
  \ video
" variable
ArtemisTagName
  \ if loop var
  \ elseif else
" file
ArtemisTagName
  \ file
" network
ArtemisTagName
  \ httpget httppost
" os/hardware
ArtemisTagName
  \ callnative caption delondirchg dialog direction ime mouse openbrowser purchase setondirchg statusbar vibrate
" pre-processor
ArtemisTagName
  \ &autoinsert &linetag &scpsupport
delcommand ArtemisTagName

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
