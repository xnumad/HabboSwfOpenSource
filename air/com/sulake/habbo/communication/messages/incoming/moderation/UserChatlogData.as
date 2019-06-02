//com.sulake.habbo.communication.messages.incoming.moderation.UserChatlogData

package com.sulake.habbo.communication.messages.incoming.moderation{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class UserChatlogData {

        private var _userId:int;
        private var _userName:String;
        private var _rooms:Array;

        public function UserChatlogData(k:IMessageDataWrapper);

        public function get userId():int;

        public function get userName():String;

        public function get rooms():Array;


    }
}//package com.sulake.habbo.communication.messages.incoming.moderation

