require 'calabash-android'
require_relative '../../../../common/objects/CreditCard'

class Cart < Calabash::ABase

    QUERY_STRING_HASH = {
        loading_icon: "* id:'view_loading'",
        cart_empty_wording: "* {text CONTAINS[c] '別讓您的購物車睡著了，快推著您的購物車，放入商品體驗變價！'}",
        edit_button: "* marked:'編輯'",
        delete_button: "* marked:'刪除'",
        wait_for_delete_button: "* {text CONTAINS[c] '刪除'}",
        checkout_button: "* id:'btnCheckout'",
        credit_card_radio_button: "* id:'radioCreditCard'",
        add_other_credit_card_button: "* id:'textOtherCreditCard'",
        confirm_button: "* id:'button1'",
        installment_selection: "* id:'textInstallment'",
        next_button: "* id:'btnNext'"
            
    }


    def cart_empty
        touch("* id:'menu_cart'")
        sleep 1.0
        wait_for_element_does_not_exist(QUERY_STRING_HASH[:loading_icon])
        sleep 1.0
        if (false == element_exists(QUERY_STRING_HASH[:cart_empty_wording])) then
            touch(QUERY_STRING_HASH[:edit_button])
            wait_for_element_exists(QUERY_STRING_HASH[:wait_for_delete_button], {})
            while (element_exists(QUERY_STRING_HASH[:wait_for_delete_button])) do
              touch(QUERY_STRING_HASH[:delete_button])
              wait_for_element_does_not_exist(QUERY_STRING_HASH[:loading_icon])
              if (element_exists(QUERY_STRING_HASH[:cart_empty_wording])) then
                break
              end
            end
        end
        press_back_button
    end

    def checkout
        touch(QUERY_STRING_HASH[:checkout_button])
        sleep 5
    end


    def checkout_by_credit_card
        # perform_action('drag', from_x, to_x, from_y, to_y, steps)
        perform_action('drag', 50, 50, 80, 60, 10)
        sleep 1

        # 點擊信用卡 radio button
        touch(QUERY_STRING_HASH[:credit_card_radio_button])

        # 點擊其他信用卡
        touch(QUERY_STRING_HASH[:add_other_credit_card_button])

        #下滑找到新增信用卡選項
        # perform_action('drag', from_x, to_x, from_y, to_y, steps)
        perform_action('drag', 50, 50, 50, 0, 10)
        perform_action('drag', 50, 50, 50, 0, 10)

        # 點擊確認
        touch(QUERY_STRING_HASH[:confirm_button])

        credit_card = Credit_card.new

        enter_text("* id:'editCardName'", credit_card.for_installment_1_to_24_info_hash[:cardName])
        hide_soft_keyboard
        enter_text("* id:'editCardNumber'", credit_card.for_installment_1_to_24_info_hash[:cardNO_all])
        hide_soft_keyboard
        enter_text("* id:'editExpireDate'", credit_card.for_installment_1_to_24_info_hash[:expiredDate])
        hide_soft_keyboard
        enter_text("* id:'editCardPin'", credit_card.for_installment_1_to_24_info_hash[:cardSecurityCode])
        hide_soft_keyboard

        # perform_action('drag', from_x, to_x, from_y, to_y, steps)
        perform_action('drag', 50, 50, 50, 10, 10)
        sleep 3

    end

    def installment (installment)

        if installment == "一"
          touch(QUERY_STRING_HASH[:installment_selection])
          touch(QUERY_STRING_HASH[:confirm_button])

        end

        touch(QUERY_STRING_HASH[:next_button])



    end


    def invoice (invoice_type)


        # if invoice_type == "friDay 加購會員載具"
        #   cells = query("* id:'imageRadio'")
        #   touch(cells[0])

        # end

        # if invoice_type == "自然人憑證載具"
        #   cells = query("* id:'imageRadio'")
        #   touch(cells[1])

        # end

        # touch("* id:'btnNext'")
    

        cells = query("*")

        result = "fail"

        cells.each_index do |x|

          if cells[x]["text"] == invoice_type
            touch(cells[x-2])
            result = "pass"

          end
        
        end

        fail("Can not find the invoice type") unless result == "pass"

        touch(QUERY_STRING_HASH[:next_button])

    end


end