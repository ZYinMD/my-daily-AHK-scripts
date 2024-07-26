; Important Node: For unknown reasons, UTF-8 is not enough for special characters like ↑↓←→. To fix, open with Notepad, then save as.., choose UTF-8 and overwrite. This will change the encoding from UTF-8 to UTF-8 with BOM. Then it'll work.

/*
Goal:
  HotStrings and auto-replace
Syntax:
  ::what you type::what it'll turn into
  Triggers after an "ending character" is typed, which includes space and enter and punctuations.
  Add O between the first two colons means don't display the ending character
  Add * between the first two colons means fire immediately without waiting for the ending character.
  Add ? between the first two colons means fire even when the HotString is inside another word
  # and ^ and + needs an R as escape char, forgot why.
Background Story:
  The HotStrings are inspired by Chinese
*/
; ::its::it's

#Hotstring ? *
::dunhao::、
::pozhehao::–
::maohao::꞉
::duihao::✔
::wujiao::★
::shalou::⏳
::zailai::⇆
::jiandao::✂
::chilun::⚙️
::chengyi::×
::fangge::□
::shangmian::↑
::xiamian::↓
::zuomian::←
::youmian::→
::huiche::⏎
::haoping::👍
::chaping::👎
::dotdotdot::⋮
::shuminghao::《》{left} ; I used to need this because I used to use English punctuations with Chinese input

::cslg::console.log(''){left 2}
::cswn::console.warn(''){left 2}
::dzc::douzhencang

; the following affects the hotkey in PotPlayer, so need not to work in PotPlayer
#IfWinNotActive ahk_class PotPlayer64
  ::<<::<>{left} ;output <|>
  ::>>::</>{left} ;output </|>
  ::<>::< />{left 3} ;output <| />
#IfWinNotActive

#Hotstring *0
::fata:: => ; fat arrow
::nara:: -> ; narrow arrow
