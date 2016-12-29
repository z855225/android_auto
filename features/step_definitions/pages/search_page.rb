require 'calabash-android'


class Search < Calabash::ABase

	QUERY_STRING_HASH = {
        search_button: "* id:'menu_search'",
        search_field: "* id:'search_field'",
        confirm_search_button: "* id:'search_icon'",
        item_photo: "* id:'photo'"
            
    }


    def enter_keyword (item_id)
      touch(QUERY_STRING_HASH[:search_button])
      enter_text(QUERY_STRING_HASH[:search_field], item_id)
      touch(QUERY_STRING_HASH[:confirm_search_button])
      
    end

    def go_to_item_page
      touch(QUERY_STRING_HASH[:item_photo])

    end


end