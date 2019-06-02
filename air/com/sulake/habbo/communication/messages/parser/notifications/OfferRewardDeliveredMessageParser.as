//com.sulake.habbo.communication.messages.parser.notifications.OfferRewardDeliveredMessageParser

package com.sulake.habbo.communication.messages.parser.notifications{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class OfferRewardDeliveredMessageParser implements IMessageParser {

        private var _contentType:String;
        private var _classId:int;
        private var _name:String;
        private var _description:String;

        public function OfferRewardDeliveredMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get contentType():String;

        public function get classId():int;

        public function get name():String;

        public function get description():String;


    }
}//package com.sulake.habbo.communication.messages.parser.notifications

