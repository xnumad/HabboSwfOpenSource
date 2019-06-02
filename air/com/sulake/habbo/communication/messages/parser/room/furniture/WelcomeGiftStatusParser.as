//com.sulake.habbo.communication.messages.parser.room.furniture.WelcomeGiftStatusParser

package com.sulake.habbo.communication.messages.parser.room.furniture{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class WelcomeGiftStatusParser implements IMessageParser {

        private var _email:String;
        private var _isVerified:Boolean;
        private var _allowChange:Boolean;
        private var _furniId:int;
        private var _requestedByUser:Boolean;

        public function WelcomeGiftStatusParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get requestedByUser():Boolean;

        public function get email():String;

        public function get isVerified():Boolean;

        public function get allowChange():Boolean;

        public function get furniId():int;


    }
}//package com.sulake.habbo.communication.messages.parser.room.furniture

