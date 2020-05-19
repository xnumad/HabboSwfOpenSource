package com.sulake.habbo.freeflowchat.viewer.enum
{
    import com.sulake.habbo.communication.messages.incoming.roomsettings.RoomChatSettings;

    public class ChatBubbleWidth 
    {
        public static const NORMAL:int = 350;
        public static const WIDE:int = 240;
        public static const SMALL:int = 2000;


        public static function fromValue(k:int):int
        {
            switch (k)
            {
                case RoomChatSettings._Str_12581:
                    return ChatBubbleWidth.NORMAL;
                case RoomChatSettings._Str_16484:
                    return ChatBubbleWidth.WIDE;
                case RoomChatSettings._Str_16907:
                    return ChatBubbleWidth.SMALL;
            }
            return NORMAL;
        }
    }
}
