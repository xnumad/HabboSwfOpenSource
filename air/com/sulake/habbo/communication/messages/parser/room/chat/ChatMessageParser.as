//com.sulake.habbo.communication.messages.parser.room.chat.ChatMessageParser

package com.sulake.habbo.communication.messages.parser.room.chat{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class ChatMessageParser implements IMessageParser {

        private var _userId:int;
        private var _text:String;
        private var _links:Array;
        private var _gesture:int;
        private var _trackingId:int;
        private var _styleId:int;

        public function ChatMessageParser();

        public function get userId():int;

        public function get text():String;

        public function get links():Array;

        public function get gesture():int;

        public function get trackingId():int;

        public function get styleId():int;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.room.chat

