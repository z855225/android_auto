require 'calabash-android/calabash_steps'
require_relative '../../../common/objects/Accounts'

Given(/^啟動 App$/) do
  sleep 5.0
end

Given(/^跳過導覽頁$/) do 
  if !query("* id:'btnSkip'").empty?
    touch("* id:'btnSkip'")
  end
end

When(/^點擊會員中心 icon$/) do
  sleep 3.0
  touch("* id:'bottom_nav_member'")
end

Given(/^會員登入 "([^"]*)" 帳號$/) do |account_type|
  @login_page = LoginPage.new(account_type)
  account = Account.new
  @login_page.login(account.account_info[:for_android][:account], account.account_info[:for_android][:password])
end

Given(/^清空購物車$/) do
  @my_cart = page(Cart)
  @my_cart.cart_empty
end

When(/^點擊首頁 icon$/) do
  sleep 3.0
  touch("* id:'bottom_nav_home'")
end

Given(/^搜尋商品 "([^"]*)"$/) do |item_id|
  @search_page = page(Search)
  @search_page.enter_keyword(item_id)
  @search_page.go_to_item_page  
end

Given(/^把商品加入購物車$/) do
  @itme = page(ItemPage)
  @itme.item_add_to_cart
end

Given(/^使用信用卡 "([^"]*)" 期結帳，發票選擇 "([^"]*)"$/) do |installment_num, invoice_type|
  @my_cart.checkout
  @my_cart.checkout_by_credit_card
  @my_cart.installment(installment_num)
  @my_cart.invoice(invoice_type)
end










