//com.sulake.habbo.communication.messages.parser.handshake.UserObjectMessageParser

package com.sulake.habbo.communication.messages.parser.handshake{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class UserObjectMessageParser implements IMessageParser {

        private var _id:int;
        private var _name:String;
        private var _figure:String;
        private var _sex:String;
        private var _customData:String;
        private var _realName:String;
        private var _directMail:Boolean;
        private var _respectTotal:int;
        private var _respectLeft:int;
        private var _petRespectLeft:int;
        private var _streamPublishingAllowed:Boolean;
        private var _lastAccessDate:String;
        private var _nameChangeAllowed:Boolean;
        private var _accountSafetyLocked:Boolean;

        public function UserObjectMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get id():int;

        public function get name():String;

        public function get figure():String;

        public function get sex():String;

        public function get customData():String;

        public function get realName():String;

        public function get directMail():Boolean;

        public function get respectTotal():int;

        public function get respectLeft():int;

        public function get petRespectLeft():int;

        public function get streamPublishingAllowed():Boolean;

        public function get lastAccessDate():String;

        public function get nameChangeAllowed():Boolean;

        public function get accountSafetyLocked():Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.handshake

