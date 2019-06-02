//com.sulake.habbo.communication.messages.parser.groupforums.GetForumsListMessageParser

package com.sulake.habbo.communication.messages.parser.groupforums{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class GetForumsListMessageParser implements IMessageParser {

        private var _listCode:int;
        private var _totalAmount:int;
        private var _startIndex:int;
        private var _amount:int;
        private var _forums:Array;

        public function GetForumsListMessageParser();

        public function get listCode():int;

        public function get totalAmount():int;

        public function get startIndex():int;

        public function get amount():int;

        public function get forums():Array;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.groupforums

