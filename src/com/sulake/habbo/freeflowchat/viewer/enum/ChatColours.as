package com.sulake.habbo.freeflowchat.viewer.enum
{
    import com.sulake.habbo.freeflowchat.data.ChatItem;
    import com.sulake.habbo.freeflowchat.viewer.visualization.style.ChatStyle;

    public class ChatColours 
    {
        public static const COLOUR_ARRAY:Array = [["@red@", 9115929], ["@cyan@", 0x7F7F], ["@blue@", 19609], ["@green@", 0x8000], ["@purple@", 0x4C004C]];

        public static function _Str_25637(Item:ChatItem, Style:ChatStyle):void
        {
            var COLOUR:Array;
            for each (COLOUR in COLOUR_ARRAY)
            {
                if (Item.text.indexOf(COLOUR[0]) == 0)
                {
                    Style.textFormat.color = COLOUR[1];
                    Item.text = Item.text.substr(COLOUR[0].length);
                }
            }

            Item.text = Item.text.replace(/\[tag\](.*?)\[\/tag\]/g, "<font color='#ff7800'><b>$1</b></font>");
        }
    }
}
