//com.sulake.habbo.communication.messages.incoming.roomsettings.RoomChatSettings

package com.sulake.habbo.communication.messages.incoming.roomsettings{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class RoomChatSettings {

        public static const CHAT_MODE_FREE_FLOW:int;
        public static const CHAT_MODE_LINE_BY_LINE:int;
        public static const CHAT_BUBBLE_WIDTH_WIDE:int;
        public static const CHAT_BUBBLE_WIDTH_NORMAL:int;
        public static const CHAT_BUBBLE_WIDTH_THIN:int;
        public static const CHAT_SCROLL_SPEED_FAST:int;
        public static const CHAT_SCROLL_SPEED_NORMAL:int;
        public static const CHAT_SCROLL_SPEED_SLOW:int;
        public static const FLOOD_FILTER_STRICT:int;
        public static const FLOOD_FILTER_NORMAL:int;
        public static const FLOOD_FILTER_LOOSE:int;

        private var _mode:int;
        private var _bubbleWidth:int;
        private var _scrollSpeed:int;
        private var _floodSensitivity:int;
        private var _fullHearRange:int;

        public function RoomChatSettings(k:IMessageDataWrapper);

        public function get mode():int;

        public function get bubbleWidth():int;

        public function get scrollSpeed():int;

        public function get fullHearRange():int;

        public function get floodSensitivity():int;


    }
}//package com.sulake.habbo.communication.messages.incoming.roomsettings

