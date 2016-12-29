require 'calabash-android'


class LoginPage < Calabash::ABase

    QUERY_STRING_HASH = {
        login_btn: "* marked:'會員登入/註冊'",
        logout_btn: "* id:'imageLogout'",
        account_text_box: "webview css:'input[name=\"account\"]'",
        password_text_box: "webview css:'input[name=\"password\"]'",
        submit_btn: "webview css:'button[type=\"submit\"]'"
    }

    def initialize (account_type)
    	@account_type = account_type
    end    

    def friday_account_login
        # 點擊會員登入
        login_button_count = query(QUERY_STRING_HASH[:login_btn]).count
        
        
        # 如果未登入狀態，直接點擊會員登入
        if (login_button_count != 0) then
          sleep 1.0
          touch(QUERY_STRING_HASH[:login_btn])
        end

        # perform_action('drag', from_x, to_x, from_y, to_y, steps)
        perform_action('drag', 50, 50, 80, 75, 10)
        sleep 1

        logout_button_count = query(QUERY_STRING_HASH[:logout_btn]).count
        
        # 如果是已登入狀態，先點擊登出，再點擊會員登入
        if (logout_button_count != 0) then
          sleep 3.0
          touch(QUERY_STRING_HASH[:logout_btn])
          
          sleep 3.0
          touch(QUERY_STRING_HASH[:login_btn])
        end
        
        # 輸入帳號
        enter_text(QUERY_STRING_HASH[:account_text_box], @account)
        hide_soft_keyboard()

        # 輸入密碼
        enter_text(QUERY_STRING_HASH[:password_text_box], @password)

        #點擊登入按鈕
        hide_soft_keyboard()
        touch QUERY_STRING_HASH[:submit_btn]
        sleep 5.0
        pan_up
    end

    def login (account, password)
        @account = account
        @password = password
        
        if @account_type == "friDay"
            friday_account_login
        end

    end

end