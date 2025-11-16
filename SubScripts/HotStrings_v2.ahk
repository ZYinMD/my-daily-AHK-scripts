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
  Add X between the first two colons means fire means call a function instead of sending text
  # and ^ and + needs an R as escape char, forgot why.
  Find more in the doc on hotstring
*/

:*X:;stock::ask_ai_for_stock_analysis() ; type xstock for template of stock analysis

ask_ai_for_stock_analysis() {
  text := "
  (
    I'm a Warren Buffett style value investor. I want to learn about the stock of _________, so I will ask you a sequence of questions. (Note: the questions are based on a template of checklist I often use, you may find that not every thing in the list are applicable to this company, so feel free to say "it's not applicable to this company".)

    1. Tell me a brief history of the company. Tell me where is it headquartered, where is it traded, what does it do, what does it sell, who are the customers, what is its goal, and have these answer been evolving over time? When is your knowledge cutoff date? What's their current market cap?

    2. What's their business model, how do they make money? Is it a to B or to C business ? If to B, which are its biggest clients? What's the key mechanism to understand about how they make money, is there any intuitive or counter intuitive aspect to understand this business model? Btw, if the company's revenue and profit consists of multiple segments, please break it down and tell me how each segment works, and how big each segment is compared to the whole company. (Also, below I have more detailed questions, and the answers to those questions should also be broken down by segment if applicable)

    3. Does this company have a high or low gross margin? What's the biggest "cost of goods sold" or "cost of revenue" of this company? Is the COGS cyclical? Is there some major upstream suppliers in the supply chain? If yes, does this company have an advantage in negotiating the price with the suppliers? What's the major cost of this company other than COGS? Does the company have a high or low net margin? Does it have a notably high R&D or high SA&G or high sale & marketing expenses or other expenses?

    4. Is this a growth company, if so, how does it grow, is it fast or slow growth? Is it likely to grow by increasing penetration in existing market? Is it likely to grow by taking competitor's market share? Is it likely to grow by introducing new products or services that they haven't sold before? Is it likely to grow by expanding into new regions? Speaking of regions, how much of the company's sale is domestic and how much is international?

    5. Analyze the capital intensity of the company, including: Is it capex heavy? Is it high in ROE? Does it constantly require large amount of reinvestment of retained earnings? Does it constantly need to invest in next generation technology to avoid falling behind? Has previous reinvestment generated good returns? (btw there's a type of businesses that are historically capex heavy but now has finished infrastructure build-out and is in the cash return phase, which is also worth buying even though it shows a low ROIC / ROE). Is the company generating a healthy cashflow? Is under cash pressure? Is it a high or low debt business model? Does the company aggressively buy back shares or pay dividends?

    6. Does the company have pricing power, can it raise prices and the customers still buy? Is the company free to raise price in response to inflation? Is it a commodity business or does brand matter? Is sales cyclical? If cyclical, is it currently in peak or trough? Upward or downward? How much does macro economic environments like affect this industry (things like recession, bull/bear market, interest rate, tariff, oil price, etc)?

    7. Does this company have a competitive advantage, does it have a moat, is it in a dominant market position, does it have network effect, does it have economy of scale, does it have customer loyalty, is it easy for customers to switch to competitors? Who are the notable competitors, how do they compare, what are the competitors up to? Are they a big threat? Is the future predicable / foreseeable in 5-10 years for this industry? Is the competition scene predictable / foreseeable in 5-10 years among the competitors? Can new competitors enter the game? Is there good reasons to believe this company will come out on top among competitors in the future 10 years? Can the huge AI trend have a notable positive or negative impact on the company? Can you see a worst future where this company become dead in 10 years?

    8. What do we know about the top management figures, like founder or CEO or director? Any prominent public figures who has a fair amount of public interviews that I can watch? Any figure with fans? Overall, how is the management's energy level (high or low energy), track record, management capability, and trustworthiness? Is the most important figure getting old and planning for succession? Is there some notable facts about ownership structure (insider ownership %, institutional ownership, large long-term holders, etc)? Is the company shareholder-oriented?

    9. Does this company have earning visibility of x years in the future via something like backlog or contracts? If yes, is it a one-off deal or a normal state for this company? Does the company recently added some new revenue source (e.g. a new business segment, a new product, a new factory, or expanded production capacity, etc), or did they say they have something of such sorts that's not generating revenue now, but will kick in soon? By the way, have there been rapid increase or rapid decrease in its market cap in recent years, if yes, what was the reason?

    10. Is there anything notable in the company's balance sheet? Anything interesting or unusual?

    11. On reddit, valueinvestorsclub, Motley Fools, etc, are there some people who are passionately bullish about this stock? What are their reasons? Are there some notable big name investors who are known to hold this stock or have publicly praised this stock? What are their reasons?

    12. Finally, are there some other important knowledge you think I should understand? What's the argument and counter argument for and against investing in this stock long term?

    我是一名受巴菲特影响的价值投资者。我想研究 ____ 的股票。下面我将会问你一连串问题来帮助我理解这家公司。(注: 我的提问是基于一个我经常使用的模板, 你可能会发现模板里的某些问题不适用于这家公司, 你可以说"此问题不适用于这家公司"):

    1. 简述一下公司历史, 说说他们总部在哪, 在哪上市, 是做什么的？主要销售什么产品或服务？客户是谁？以上这些方面随着时间的推移是否发生过变化？你的知识截止到什么时候？公司现在市值多少? 公司是否国际知名, 如果是, 在英文语境中公司名称是什么?

    2. 该公司的商业模式是什么？怎么赚钱？理解其赚钱机制的关键是什么？公司主要是to B 还是to C? 如果to B, 主要客户是谁? 什么情况会使他们赚得更多, 什么情况会使他们赚得更少？这个商业模式是不是很容易理解, 或者存在反直觉的地方？(假如公司的营收/利润由多个板块构成, 则请分别说明每个板块的商业原理, 并说明每个板块相对于整体公司的营收和利润占比。另外, 下面还有更多详细问题, 如果公司由多个板块构成, 也请分板块回答那些问题)

    3. 该公司毛利算高还是低? 主要的"cost of goods sold"来自什么? 成本是否具有周期性? 是否有供应链上游的主要供货者? 在采购时, 与上游供应链的议价能力如何? 公司的净利润算高还是低? 自身主要的支出是什么? 是否有显著的高研发支出, 销售与管理费用, 等等?

    4. 该公司处于增长期吗? 如果是, 如何增长, 快速还是慢速增长? 从现在的情况看, 这家公司是否可以通过"在现有市场内增加客户"的形式来实现增长? 是否可以通过抢占竞争对手的市场份额来增长? 是否可以通过扩产来增长? 是否可以通过推出新产品或新服务来增长? 是否可以通过进入新地区或出海来增长? 说到出海, 这家公司有多少业务在国内, 多少业务在海外? (有时一些供应链上游的公司自己生产的零件不直接销往海外, 但下游组装成产品后却大幅销往海外, 如果符合这种情况也算)

    5. 分析该公司的资本密集程度, 包括: 净资产还是重资产？净资产回报率高吗? 是否需要持续用大量留存收益进行再投资？是否需要不断的研发下一代产品与技术以避免落后? 过去的再投资是否带来了良好的回报？(另外, 有一类公司虽然历史上长期重资本, 但现在基础建设已结束, 已进入了现金回报阶段, 所以ROIC和ROE低也没关系, 这种也可以买) 公司的现金流是否健康？是否面临现金压力？公司的运行模式是高负债还是低负债？公司是否有积极进行股票回购或支付股息？

    6. 该公司是否有定价权? 是否有品牌溢价? 如果提价客户是否仍愿意购买？如果发生通胀, 公司能否随通胀提价？公司的营收是否具有周期性？如果有周期性, 现在是顶还是底, 上行还是下行? 公司所在产业受宏观经济环境影响大吗(例如经济景气程度, 股市熊牛, 银行利率, 油价, 关税, 等等)?

    7. 该公司是否拥有护城河/竞争壁垒? 是否占有龙头地位? 是否有成本优势, 规模效应? 是否有网络效应? 客户是否忠诚? 客户转向竞争对手是否容易？公司的主要竞争对手有哪些其他公司？竞争对手情况如何, 在做什么, 威胁大吗？未来5-10年，这个行业的发展前景是否可预见? 未来5-10年，与主要竞争对手之间的竞争格局是否可预见, 新的竞争者会随时出现吗? 有没有理由相信这家公司在未来10年的竞争中会获胜? AI的普及是否可以对这家公司产生重大的正面或负面影响? 能想象一个最坏情况使得这家公司在10年内消亡吗?

    8. 对于该公司的高层管理层（例如创始人、CEO、董事长）我们了解哪些? 是否是知名人物？网上是否可常见其公开采访？是否有粉丝? 管理层的能力、过往业绩、诚信度、活力、战斗力如何？关键人物是否年事已高, 公司即将向接班人转移？股权结构方面有什么值得一提的地方吗？内部人持股比例如何?  公司是否对股东友好, 以股东利益为先？是否有国有成分? 如果有, 国有成分是否带来国企通病? 是否存在利益链条导致的账上现金越来越多却无法完全分红分掉、不愿回购的问题?

    9. 该公司是否有提前锁定订单的机制(甚至订单积压), 使得未来x年收入可见? 如果有, 是暂时的, 还是这家公司的常态? 公司最近有没有增加新业务(例如一个新产品, 新工厂, 新客户, 或者刚刚扩产, 之类)? 或者有没有官宣某项业务现在还未运转, 但很快会开始运转? 顺便调查一下, 公司最近几年股价有没有出现过大涨或者大跌? 如果有, 是什么造成的? 公司是否有H股和A股? 如果有, 两边起伏是否联动? 如果没有, 未来有H股上市的计划吗? 另外有没有美股ADR?

    10. 该公司的资产负债表上有没有什么值得一提的地方? 有没有什么有意思的特点, 或异于常规的地方?

    11. 在雪球有没有一些散户像粉丝一样坚定看好这支股票? 理由是什么? 有没有什么知名的大腕投资者已知持有或曾公开赞扬这家公司? 理由是什么?

    12. 最后，还有什么其他重要事实是你觉得我应该知道的? 如果我打算投资这家公司的股票并长期持有, 支持和反对的理由各是什么？

  )"

  A_Clipboard := text ; put the text into clipboard
  ClipWait ; Wait for clipboard to be ready
  Send "^v"
}
