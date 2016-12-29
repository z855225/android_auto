require 'calabash-android'


class ItemPage < Calabash::ABase

    QUERY_STRING_HASH = {
        spec_aaa_button: "* text:'aaa'",
        gift_button: "* id:'gift'",
        select_gift_radio_button: "* id:'imageRadio'",
        done_button: "* id:'menu_done'",
        add_to_cart_button: "* id:'addToCart'",
        checkout_button: "* id:'btnGoCheckout'"
    }


    def item_add_to_cart
            
        # 選擇主商品規格
        sleep 1
        #  perform_action('drag', from_x, to_x, from_y, to_y, steps)
        perform_action('drag', 50, 50, 80, 28, 10)
        perform_action('drag', 50, 50, 80, 70, 10)
        sleep 2
        touch(QUERY_STRING_HASH[:spec_aaa_button])

        # 選擇贈品
        sleep 1
        #  perform_action('drag', from_x, to_x, from_y, to_y, steps)
        perform_action('drag', 50, 50, 70, 45, 10)
        sleep 2
        touch(QUERY_STRING_HASH[:gift_button])
        sleep 2

        # 點擊第一個贈品，選擇規格 大, a，點擊完成
        cells = query(QUERY_STRING_HASH[:select_gift_radio_button])
        touch(cells[0])
        touch(QUERY_STRING_HASH[:spec_aaa_button])
        touch(QUERY_STRING_HASH[:done_button])

        # 點擊完成
        sleep 1
        touch(QUERY_STRING_HASH[:done_button])

        # 點擊加入購物車
        touch(QUERY_STRING_HASH[:add_to_cart_button])


        # 點擊前往結帳
        touch(QUERY_STRING_HASH[:checkout_button])
        sleep 3
 
    end

end