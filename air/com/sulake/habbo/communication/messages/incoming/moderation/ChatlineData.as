//com.sulake.habbo.communication.messages.incoming.moderation.ChatlineData

package com.sulake.habbo.communication.messages.incoming.moderation{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class ChatlineData {

        private var _ageInMilliseconds:int;
        private var _chatterId:int;
        private var _chatterName:String;
        private var _msg:String;
        private var _hasHighlighting:Boolean;

        public function ChatlineData(k:IMessageDataWrapper);

        public function get ageInMilliseconds():int;

        public function get chatterId():int;

        public function get chatterName():String;

        public function get msg():String;

        public function get hasHighlighting():Boolean;


    }
}//package com.sulake.habbo.communication.messages.incoming.moderation

