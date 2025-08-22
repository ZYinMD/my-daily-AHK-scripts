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
    To ChatGPT: My question is already very detailed, please just answer according to my question.

    I'm a Warren Buffett style value investor. I want to learn about the stock of _________. Please help me understand the company by covering the topics below. (Note: the topics below are based on a checklist I often use, you may find that not all items in the checklist are applicable to this company, so feel free to skip some items as you see fit)

    1. Tell me a brief history of the company. Then tell me what does it do, what does it sell, who are the customers, what is its goal, and have they been sort of evolving over time?

    2. What's their business model, how do they make money, what's the key mechanism to understand about how they make money, what makes them make more money, what makes them make less money, is there any intuitive or counter intuitive aspect to understand this business model, etc. Btw, if the company's revenue and profit consists of multiple segments, please break it down and tell me how each segment works, and how big each segment is compared to the whole company. (Also, below I have more detailed questions, and the answers to those questions should also be broken down by segment if applicable)

    3. Is this a growth company, if so, how does it grow, is it fast or slow growth? Is it likely to grow by increasing penetration in existing market? Is it likely to grow by expanding into new regions? Is it likely to grow by taking competitor's market share? Is it likely to grow by introducing new products or services that they haven't sold before? Are growth already priced in?

    4. Is it a high or low margin business? Is it capital intensive? Is it high in ROE? Does it constantly require large amount of reinvestment of retained earnings? Has reinvestment turned out to generate good return? Is the company free to raise price and the customers will still buy? Is the company free to raise price in response to inflation? Is it a commodity business or does brand matter? Is it a high or low debt business model? Is the company generating a healthy cashflow or under cash pressure? Does the company aggressively buy back shares or pay dividends? Is it in a cyclical industry? How much does macro economic environments like interest rate, tariff, oil price etc affect this industry?

    5. Does this company have a competitive advantage, does it have a moat, is it in a dominant market position, does it have network effect, does it have economy of scale, does it have customer loyalty, is it easy for customers to switch to competitors? Who are the notable competitors, what are the competitors up to? Are they a big threat? Is the future predicable / foreseeable in 5-10 years for this industry? Is the competition scene predictable / foreseeable in 5-10 years among the competitors? Can the huge AI trend have a notable positive or negative impact on the company? Can you see a worst future where this company become dead in 10 years?

    6. What do we know about the top management figures, especially founder or CEO or director? Any prominent public figures who has a fair amount of public interviews that I can watch? Any figure with fans? Overall, how is the management's energy level (high or low energy), track record, management capability, and trustworthiness? Is the most important figure getting old and planning for succession? Is there some notable facts about ownership structure (insider ownership %, institutional ownership, large long-term holders, etc)?

    7. Finally, what's the argument and counter argument for and against investing in this stock long term?

    (to Kimi) 我的问题已经很详细了, 按照我的问题进行相应回答即可

    我是一名受巴菲特影响的价值投资者。我想研究 ____ 的股票。请您帮助我理解这家公司, 涵盖以下问题 (注: 以下问题是基于我经常使用的模板, 你可能会发现模板里的某些项目不适用于这家公司, 你可以酌情跳过):

    1. 简述一下公司历史, 然后说说他们是做什么的？主要销售什么产品或服务？客户是谁？以上这些方面随着时间的推移是否发生过变化？

    2. 公司的商业模式是什么？怎么赚钱？理解其赚钱机制的关键是什么？什么情况会使他们赚得更多, 什么情况会使他们赚得更少？这个商业模式是不是很容易理解, 或者存在反直觉的地方？(假如公司的营收/利润由多个板块构成, 则请分别说明每个板块的商业原理, 并说明每个板块相对于整体公司的营收和利润占比。另外, 下面还有更多详细问题, 如果公司由多个板块构成, 也请分板块回答那些问题)

    3. 这家公司处于增长期吗? 如果是, 如何增长, 快速还是慢速增长? 从现在的情况看, 这家公司是否将会在现有市场内增加客户来实现增长? 是否将会通过进入新地区或出海来增长? 是否可以通过抢占竞争对手的市场份额来增长? 是否有概率通过推出新产品或新服务来增长? 增长是否已经被市场纳入定价当中?

    4. 公司所在的赛道是高利润率还是低利润率? 是资本密集型吗？净资产回报率高吗? 是否需要持续将大量留存收益进行再投资？过去的再投资是否带来了良好的回报？公司是否拥有定价权？是否有品牌溢价? 如果提价客户是否仍愿意购买？如果发生通胀, 公司能否随通胀提价？商业模式是高负债还是低负债？公司现金流是否健康？还是面临现金压力？公司是否有积极进行股票回购或支付股息？公司所在产业是否具有周期性？公司所在产业受宏观经济环境影响大吗(例如利率, 油价, 关税, 等等)?

    5. 公司是否拥有护城河/竞争壁垒? 是否占有市场主导地位? 是否有成本优势, 规模效应? 是否有网络效应? 客户是否忠诚? 客户转向竞争对手是否容易？公司的主要竞争对手有哪些其他公司？竞争对手情况如何, 在做什么, 威胁大吗？未来5-10年，这个行业的发展前景是否可预见？未来5-10年，与主要竞争对手之间的竞争格局是否可预见？AI的普及是否可以对这家公司产生重大的正面或负面影响? 能想象一个最坏情况使得这家公司在10年内消亡吗?

    6. 对于公司的高层管理层（尤其是创始人、CEO、董事长）我们了解哪些? 是否是知名人物？网上是否可常见其公开采访？是否有粉丝? 管理层的活力、战斗力、过往业绩、诚信度如何？最关键的人物是否年事已高, 公司即将向接班人转移？股权结构方面有什么值得一提的地方吗？(例如内部人持股比例、机构投资者持股、是否有大型长期股东、是否有国有成分, 国有成分是否带来国企的通病, 等等。)

    7. 最后，如果我打算长期投资这家公司的股票, 支持和反对的理由各是什么？

  )"

  A_Clipboard := text ; put the text into clipboard
  ClipWait ; Wait for clipboard to be ready
  Send "^v"
}
