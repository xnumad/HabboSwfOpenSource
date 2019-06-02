//com.sulake.habbo.communication.messages.parser.room.furniture.RequestSpamWallPostItMessageParser

package com.sulake.habbo.communication.messages.parser.room.furniture{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class RequestSpamWallPostItMessageParser implements IMessageParser {

        private var _itemId:int;
        private var _location:String;

        public function RequestSpamWallPostItMessageParser();

        public function get itemId():int;

        public function get location():String;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.room.furniture

