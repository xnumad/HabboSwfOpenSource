//com.sulake.habbo.communication.messages.parser.room.engine.UserChangeMessageParser

package com.sulake.habbo.communication.messages.parser.room.engine{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class UserChangeMessageParser implements IMessageParser {

        private var _id:int;
        private var _figure:String;
        private var _sex:String;
        private var _customInfo:String;
        private var _achievementScore:int;

        public function UserChangeMessageParser();

        public function get id():int;

        public function get figure():String;

        public function get sex():String;

        public function get customInfo():String;

        public function get achievementScore():int;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.room.engine

