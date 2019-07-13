package com.sulake.habbo.freeflowchat.viewer.enum
{
    import com.sulake.habbo.freeflowchat.data.ChatItem;
    import com.sulake.habbo.freeflowchat.viewer.visualization.style.ChatStyle;

    public class ChatColours 
    {
        public static const COLOUR_ARRAY:Array = [["@red@", 9115929], ["@cyan@", 0x7F7F], ["@blue@", 19609], ["@green@", 0x8000], ["@purple@", 0x4C004C]];

        public static function _Str_25637(k:ChatItem, _arg_2:ChatStyle):void
        {
            var _local_3:Array;
            for each (_local_3 in COLOUR_ARRAY)
            {
                if (k.text.indexOf(_local_3[0]) == 0)
                {
                    _arg_2.textFormat.color = _local_3[1];
                    k.text = k.text.substr(_local_3[0].length);
                }
            }
        }
    }
}
