//com.sulake.habbo.communication.messages.parser.navigator.PopularRoomTagsResultMessageParser

package com.sulake.habbo.communication.messages.parser.navigator{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.navigator.PopularRoomTagsData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class PopularRoomTagsResultMessageParser implements IMessageParser {

        private var _data:PopularRoomTagsData;

        public function PopularRoomTagsResultMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get data():PopularRoomTagsData;


    }
}//package com.sulake.habbo.communication.messages.parser.navigator

