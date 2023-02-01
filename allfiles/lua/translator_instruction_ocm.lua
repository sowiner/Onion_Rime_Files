--- @@ instruction_ocm
--[[
說明蝦米各種掛接
--]]
local function instruction_ocm(input, seg, env)
  -- if input:find('^;$') then
  local engine = env.engine
  local context = engine.context
  local caret_pos = context.caret_pos
  if (string.match(input, "^;$")~=nil) and (caret_pos == 1) then
    -- for cand in input:iter() do
    --   yield(cand)
    -- end
    local table_sd_1 = {
          { ' ※ 輸入【項目】每字第一碼（正碼），調出相關符號。', '𝟎' }
        , { '【表情】【自然】【飲食】【活動】【旅遊】【物品】', '𝟏' }
        , { '【符號】【國旗】【微笑】【大笑】【冒汗】【喜愛】', '𝟐' }
        , { '【討厭】【無奈】【哭泣】【冷淡】【驚訝】【生氣】', '𝟑' }
        , { '【懷疑】【頭像】【人物】【獸面】【貓頭】【怪物】', '𝟒' }
        , { '【五官】【手勢】【亞裔】【白人】【黑人】【天氣】', '𝟓' }
        , { '【下雪】【天體】【夜空】【地球】【景色】【月相】', '𝟔' }
        , { '【名勝】【日本】【美國】【法國】【建築】【生肖】', '𝟕' }
        , { '【娛樂】【遊戲】【運動】【球具】【獎項】【獎牌】', '𝟖' }
        , { '【食物】【正飯】【午餐】【午飯】【早飯】【早點】', '𝟗' }
        , { '【中餐】【西食】【快餐】【速食】【米飯】【捲物】', '𝟏𝟎' }
        , { '【串物】【甜食】【零食】【飲料】【熱飲】【酒精】', '𝟏𝟏' }
        , { '【酒類】【植物】【水果】【蔬菜】【粗糧】【餐具】', '𝟏𝟐' }
        , { '【花卉】【葉子】【肉類】【肉品】【牲畜】【禽類】', '𝟏𝟑' }
        , { '【魚圖】【魚類】【家禽】【蟲類】【蟲圖】【器官】', '𝟏𝟒' }
        , { '【血液】【血型】【服裝】【衣物】【衣服】【褲子】', '𝟏𝟓' }
        , { '【眼鏡】【帽子】【包包】【頭髮】【膚色】【化妝】', '𝟏𝟔' }
        , { '【愛情】【兩性】【效果】【宗教】【音樂】【工具】', '𝟏𝟕' }
        , { '【時鐘】【號誌】【圖示】【介面】【箭標】【精怪】', '𝟏𝟖' }
        , { '【指示】【回收】【有害】【通訊】【電腦】【工業】', '𝟏𝟗' }
        , { '【交通】【電子】【武器】【象棋】【麻將】【骰子】', '𝟐𝟎' }
        , { '【撲克】【船隻】【飛機】【汽車】【車輛】【公交】', '𝟐𝟏' }
        , { '【軌道】【火車】【錢財】【金錢】【鈔票】【紙鈔】', '𝟐𝟐' }
        , { '【動物】【貨幣】【單位】【數學】【分數】【打勾】', '𝟐𝟑' }
        , { '【星號】【箭頭】【線段】【幾何】【三角】【方塊】', '𝟐𝟒' }
        , { '【圓形】【填色】【單線】【雙線】【星座】【易經】', '𝟐𝟓' }
        , { '【八卦】【卦名】【天干】【地支】【干支】【節氣】', '𝟐𝟔' }
        , { '【月份】【日期】【曜日】【時間】【符碼】【標點】', '𝟐𝟕' }
        , { '【合字】【部首】【偏旁】【筆畫】【倉頡】【結構】', '𝟐𝟖' }
        , { '【拼音】【注音】【聲調】【羅馬】【希臘】【俄語】', '𝟐𝟗' }
        , { '【韓文】【麵包(gn)】', '𝟑𝟎' }
        , { '【幾何圖】【鞋子圖】【電器圖】【節日圖】【佳節圖】', '𝟑𝟏' }
        , { '【甜點圖】【動物圖】【禽類圖】【鳥類圖】【標誌圖】', '𝟑𝟐' }
        , { '【科學圖】【交通圖】【景點圖】【飛行器】【多媒體】', '𝟑𝟑' }
        , { '【愛心圖】【黃種人】【拉美裔】【棕色人】【白種人】', '𝟑𝟒' }
        , { '【阿拉伯】【顏色塊】【動物臉】【猴子頭】【咧嘴笑】', '𝟑𝟓' }
        , { '【做運動】【日本菜】【食物捲】【辦公室】【警消護】', '𝟑𝟔' }
        , { '【大自然】【遊樂園】【撲克牌】【西洋棋】【樂器圖】', '𝟑𝟕' }
        , { '【日用品】【單線框】【雙線框】【色塊心】【色塊方】', '𝟑𝟖' }
        , { '【色塊圓】【填色塊】【占星術】【十字架】【星座名】', '𝟑𝟗' }
        , { '【十二宮】【太玄經】【蘇州碼】【標點直】【輸入法】', '𝟒𝟎' }
        , { '【羅馬大】【希臘大】【俄語大】【字母圈】【字母括】', '𝟒𝟏' }
        , { '【字母方】【字母框】【數字圈】【數字括】【數字點】', '𝟒𝟐' }
        , { '【數字標】【漢字圈】【漢字框】【漢字括】【韓文圈】', '𝟒𝟑' }
        , { '【韓文括】【假名圈】【運動女】【運動男】【精怪女】', '𝟒𝟒' }
        , { '【精怪男】【日本年】【假名半(形)】', '𝟒𝟓' }
        , { '【IRO(いろは順)】【文化(第一字全碼)】', '𝟒𝟔' }
        , { '【平假名(第一碼全碼)】【片假名(第一碼全碼)】', '𝟒𝟕' }
        , { '【上標(第一字全碼)】【下標(第一字全碼)】', '𝟒𝟖' }
        , { '【猴子表情】【十二生肖】【交通工具】【公共運輸】', '𝟒𝟗' }
        , { '【野生動物】【日式料理】【日本料理】【日本星期】', '𝟓𝟎' }
        , { '【羅馬數字】【數字圈黑】【數字黑圈】【字母圈大】', '𝟓𝟏' }
        , { '【字母括大】【字母黑圈】【字母圈黑】【字母黑方】', '𝟓𝟐' }
        , { '【字母方黑】【字母框黑】【字母黑框】【易經卦名】', '𝟓𝟑' }
        , { '【六十四卦】【六十四卦名】【羅馬數字大】', '𝟓𝟒' }
        , { '【 a 假名】【 i 假名】【 u 假名】【 e 假名】【 o 假名】', '𝟓𝟓' }
        , { '【 k 假名】【 g 假名】【 s 假名】【 z 假名】【 t 假名】', '𝟓𝟔' }
        , { '【 d 假名】【 n 假名】【 h 假名】【 b 假名】【 p 假名】', '𝟓𝟕' }
        , { '【 m 假名】【 y 假名】【 r 假名】【 w 假名】', '𝟓𝟖' }
        , { ' ｢圈｣｢框｣｢括｣數字字母：【 0 ~ 10 】【 1-0 ~ 5-0 】【 a ~ z 】', '𝟓𝟗' }
    }
    for k, v in ipairs(table_sd_1) do
      local cand = Candidate('help', seg.start, seg._end, v[2], ' ' .. v[1])
      -- cand.preedit = input .. '\t※ 輸入〔項目〕每字第一個注音，調出相關符號。'
      yield(cand)
    end
  end
  -- if input:find('^;;$') then
  if(string.match(input, "^;;$")~=nil) and (caret_pos == 2) then
    local table_sd_2 = {
          { '〖 a ~ z 〗字母變化      ※ 以下 顏文字：', '𝟘' }
        , { '〖 1 〗開心 〖 2 〗喜歡 〖 3 〗傷心', '𝟙' }
        , { '〖 4 〗生氣 〖 5 〗驚訝 〖 6 〗無奈', '𝟚' }
        , { '〖 7 〗喜     〖 8 〗樂     〖 9 〗怒', '𝟛' }
        , { '〖 0 〗指示和圖示          〖 - 〗回話', '𝟜' }
    }
    for k, v in ipairs(table_sd_2) do
      local cand = Candidate('help', seg.start, seg._end, v[2], ' ' .. v[1])
      -- cand.preedit = input .. '\t※ 輸入【項目】每字第一個注音，調出相關符號。'
      yield(cand)
    end
  end
end

return instruction_ocm