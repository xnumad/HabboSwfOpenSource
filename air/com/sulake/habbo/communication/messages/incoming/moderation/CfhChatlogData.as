//com.sulake.habbo.communication.messages.incoming.moderation.CfhChatlogData

package com.sulake.habbo.communication.messages.incoming.moderation{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class CfhChatlogData {

        private var _callId:int;
        private var _callerUserId:int;
        private var _reportedUserId:int;
        private var _chatRecordId:int;
        private var _chatRecord:ChatRecordData;

        public function CfhChatlogData(k:IMessageDataWrapper);

        public function get callId():int;

        public function get callerUserId():int;

        public function get reportedUserId():int;

        public function get chatRecordId():int;

        public function get chatRecord():ChatRecordData;


    }
}//package com.sulake.habbo.communication.messages.incoming.moderation

