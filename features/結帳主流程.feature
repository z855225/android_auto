Feature: 結帳主流程

@test1  
    Scenario: 信用卡一期 + 商品: 【FET IT-OA】MacPro 1000 + 發票: friDay 加購會員載具

        Given 啟動 App

        Given 跳過導覽頁

        Given 點擊會員中心 icon

        Given 會員登入 "friDay" 帳號

        Given 清空購物車

        Given 點擊首頁 icon

        Given 搜尋商品 "阿柴"

        Given 把商品加入購物車

        Given 使用信用卡 "一" 期結帳，發票選擇 "電子發票 - friDay加購會員載具 (預設)"
      
        Then I should see "感謝您的訂購"



@test2    
    Scenario: 信用卡一期 + 發票: 自然人憑證載具

        Given 啟動 App

        Given 跳過導覽頁

        Given 點擊會員中心 icon

        Given 會員登入 "friDay" 帳號

        Given 清空購物車

        Given 點擊首頁 icon

        Given 搜尋商品 "阿柴"

        Given 把商品加入購物車

        Given 使用信用卡 "一" 期結帳，發票選擇 "電子發票 - 自然人憑證載具"
      
        Then I should see "感謝您的訂購"
    

@test3
    Scenario: 信用卡一期 + 發票: 手機載具

        Given 啟動 App

        Given 跳過導覽頁

        Given 點擊會員中心 icon

        Given 會員登入 "friDay" 帳號

        Given 清空購物車

        Given 點擊首頁 icon

        Given 搜尋商品 "阿柴"

        Given 把商品加入購物車

        Given 使用信用卡 "一" 期結帳，發票選擇 "電子發票 - 手機載具"
      
        Then I should see "感謝您的訂購"


@test4
    Scenario: 信用卡一期 + 發票: 紙本發票

        Given 啟動 App

        Given 跳過導覽頁

        Given 點擊會員中心 icon

        Given 會員登入 "friDay" 帳號

        Given 清空購物車

        Given 點擊首頁 icon

        Given 搜尋商品 "阿柴"

        Given 把商品加入購物車

        Given 使用信用卡 "一" 期結帳，發票選擇 "紙本發票"
      
        Then I should see "感謝您的訂購"


@test5
    Scenario: 信用卡一期 + 發票: 捐贈發票

        Given 啟動 App

        Given 跳過導覽頁

        Given 點擊會員中心 icon

        Given 會員登入 "friDay" 帳號

        Given 清空購物車

        Given 點擊首頁 icon

        Given 搜尋商品 "阿柴"

        Given 把商品加入購物車

        Given 使用信用卡 "一" 期結帳，發票選擇 "捐贈發票 - 16888癌症希望基金會"
      
        Then I should see "感謝您的訂購"


