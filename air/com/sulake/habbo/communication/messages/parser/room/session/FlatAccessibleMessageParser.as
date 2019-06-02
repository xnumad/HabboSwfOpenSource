//com.sulake.habbo.communication.messages.parser.room.session.FlatAccessibleMessageParser

package com.sulake.habbo.communication.messages.parser.room.session{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class FlatAccessibleMessageParser implements IMessageParser {

        private var _userName:String;

        public function FlatAccessibleMessageParser();

        public function get userName():String;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.room.session

