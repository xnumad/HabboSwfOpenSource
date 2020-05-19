package com.sulake.habbo.freeflowchat.viewer.enum
{
    import com.sulake.habbo.communication.messages.incoming.roomsettings.RoomChatSettings;

    public class ChatBubbleWidth 
    {
        public static const NORMAL:int = 350;
        public static const THIN:int = 240;
        public static const WIDE:int = 2000;


        public static function fromValue(k:int):int
        {
            switch (k)
            {
                case RoomChatSettings.CHAT_BUBBLE_WIDTH_NORMAL:
                    return ChatBubbleWidth.NORMAL;
                case RoomChatSettings.CHAT_BUBBLE_WIDTH_THIN:
                    return ChatBubbleWidth.THIN;
                case RoomChatSettings.CHAT_BUBBLE_WIDTH_WIDE:
                    return ChatBubbleWidth.WIDE;
            }
            return NORMAL;
        }
    }
}
