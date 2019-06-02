//com.sulake.habbo.communication.messages.incoming.help.HotelMergeNameChangeEvent

package com.sulake.habbo.communication.messages.incoming.help{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.help.HotelMergeNameChangeParser;

    [SecureSWF(rename="true")]
    public class HotelMergeNameChangeEvent extends MessageEvent implements IMessageEvent {

        public function HotelMergeNameChangeEvent(k:Function);

        public function getParser():HotelMergeNameChangeParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.help

