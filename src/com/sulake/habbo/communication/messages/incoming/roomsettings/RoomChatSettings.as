package com.sulake.habbo.communication.messages.incoming.roomsettings
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class RoomChatSettings 
    {
        public static const CHAT_MODE_FREE_FLOW:int = 0;
        public static const CHAT_MODE_LINE_BY_LINE:int = 1;
        public static const CHAT_BUBBLE_WIDTH_WIDE:int = 0;
        public static const CHAT_BUBBLE_WIDTH_NORMAL:int = 1;
        public static const CHAT_BUBBLE_WIDTH_THIN:int = 2;
        public static const CHAT_SCROLL_SPEED_FAST:int = 0;
        public static const CHAT_SCROLL_SPEED_NORMAL:int = 1;
        public static const CHAT_SCROLL_SPEED_SLOW:int = 2;
        public static const FLOOD_FILTER_STRICT:int = 0;
        public static const FLOOD_FILTER_NORMAL:int = 1;
        public static const FLOOD_FILTER_LOOSE:int = 2;

        private var _mode:int = 0;
        private var _bubbleWidth:int = 1;
        private var _scrollSpeed:int = 1;
        private var _floodSensitivity:int = 1;
        private var _fullHearRange:int = 14;

        public function RoomChatSettings(k:IMessageDataWrapper)
        {
            this._mode = k.readInteger();
            this._bubbleWidth = k.readInteger();
            this._scrollSpeed = k.readInteger();
            this._fullHearRange = k.readInteger();
            this._floodSensitivity = k.readInteger();
        }

        public function get mode():int
        {
            return this._mode;
        }

        public function get bubbleWidth():int
        {
            return this._bubbleWidth;
        }

        public function get scrollSpeed():int
        {
            return this._scrollSpeed;
        }

        public function get fullHearRange():int
        {
            return this._fullHearRange;
        }

        public function get floodSensitivity():int
        {
            return this._floodSensitivity;
        }
    }
}
