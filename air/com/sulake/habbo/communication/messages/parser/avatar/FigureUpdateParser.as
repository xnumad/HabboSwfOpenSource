//com.sulake.habbo.communication.messages.parser.avatar.FigureUpdateParser

package com.sulake.habbo.communication.messages.parser.avatar{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class FigureUpdateParser implements IMessageParser {

        private var _figure:String;
        private var _gender:String;

        public function FigureUpdateParser();

        public function get figure():String;

        public function get gender():String;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.avatar

