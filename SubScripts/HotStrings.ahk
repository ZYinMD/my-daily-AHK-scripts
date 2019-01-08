; Important Node: For unknown reasons, UTF-8 is not enough for special characters like ↑↓←→. To fix, open with Notepad, then save as.., choose UTF-8 and overwrite. This will change the encoding from UTF-8 to UTF-8 with BOM. Then it'll work.

/*
Goal:
  Hotstrings and auto-replace
Syntax:
  ::what you type::what it'll turn into
  Triggers after an "ending character" is typed, which includes space and enter and punctuations.
  Add O between the first two colons means don't display the ending character
  Add * between the first two colons means fire immediately without waiting for the ending character.
  Add ? between the first two colons means fire even when the hotstring is inside another word
  # and ^ and + needs an R as escape char, forgot why.
Background Story:
  The hotstrings are inspired by Chinese
*/
; ::its::it's

#Hotstring ? *

::qian::$
::baif::%
::gong::&
::tong::&
::xing::*
::cheng::*
:R:jier::^
::duihao::✔
::cuohao::⨯
::dacha::⨯
::wujiao::★
::shalou::⏳
::zailai::⇆
::jiandao::✂
::eee::Ⓔ
::shangmian::↑
::xiamian::↓
::zuomian::←
::youmian::→
::huiche::⏎
::haoping::👍
::chaping::👎
/* It's very tricky to make these three work↓. Gave up.
::'|::'t
::']::'r
::'}::'s
:://:://{space}
*/
::<<::<>{left}
::<>::</>{left}
::cslg::console.log(){left}
::csdr::console.dir(){left}
::csif::console.info(){left}
::cswn::console.warn(){left}
::cser::console.error(){left}
::cstb::console.table(){left}
::csgp::console.groupCollapsed(){Enter}{Enter}console.groupEnd(){Up}{Tab}

; some hotstrings in ConEmu:
#Hotstring ?0
::gsta::git status{enter}
::gadd::git add -A{enter}
::gcom::git commit -m ""{left}
::gfet::git fetch{enter}
::glog::git log --oneline{enter}
::gche::git checkout{space}
::gbra::git branch{space}

#Hotstring *0
::fata::=> ; fat arrow
::nara::-> ; narrow arrow
::portf::https://ZYinMD.github.io ;my online portfolio site



/*
:C:Im::I'm
:C:Ill::I'll
:C:Ive::I've
::youll::you'll
::youre::you're
::youve::you've
::youd::you'd
::itll::it'll
::its::it's
::itd::it'd
::isnt::isn't
::arent::aren't
::wasnt::wasn't
::werent::weren't
::dont::don't
::doesnt::doesn't
::didnt::didn't
::havent::haven't
::hadnt::hadn't
::hasnt::hasn't
::shouldnt::shouldn't
::shouldve::should've
::wouldnt::wouldn't
::wouldve::would've
::cant::can't
::couldnt::couldn't
::wont::won't
::whats::what's
::whatre::what're
::wheres::where's
::wherere::where're
::theres::there's
::thered::there'd
::therere::there're
::thats::that's
::thatll::that'll
::heres::here's
::todays::today's
::theyre::they're
::theyll::they'll
::theyd::they'd
::theyve::they've
::whos::who's
::howd::how'd
::shes::she's
#Hotstring *0 ?0
::hows::how's
*/
