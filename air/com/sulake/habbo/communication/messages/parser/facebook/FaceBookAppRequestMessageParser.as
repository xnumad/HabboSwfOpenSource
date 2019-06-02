//com.sulake.habbo.communication.messages.parser.facebook.FaceBookAppRequestMessageParser

package com.sulake.habbo.communication.messages.parser.facebook{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class FaceBookAppRequestMessageParser implements IMessageParser {

        private var _authToken:String;
        private var _data:String;
        private var _userFilter:String;
        private var _senderReference:int;

        public function FaceBookAppRequestMessageParser();

        public function get authToken():String;

        public function get data():String;

        public function get userFilter():String;

        public function get senderReference():int;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.facebook

