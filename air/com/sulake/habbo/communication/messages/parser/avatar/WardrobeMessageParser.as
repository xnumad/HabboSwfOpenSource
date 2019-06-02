//com.sulake.habbo.communication.messages.parser.avatar.WardrobeMessageParser

package com.sulake.habbo.communication.messages.parser.avatar{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class WardrobeMessageParser implements IMessageParser {

        private var _state:int;
        private var _outfits:Array;

        public function WardrobeMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get outfits():Array;

        public function get state():int;


    }
}//package com.sulake.habbo.communication.messages.parser.avatar

