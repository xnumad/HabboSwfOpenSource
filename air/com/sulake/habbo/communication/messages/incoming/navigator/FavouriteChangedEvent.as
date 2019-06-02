//com.sulake.habbo.communication.messages.incoming.navigator.FavouriteChangedEvent

package com.sulake.habbo.communication.messages.incoming.navigator{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.navigator.FavouriteChangedMessageParser;

    [SecureSWF(rename="true")]
    public class FavouriteChangedEvent extends MessageEvent implements IMessageEvent {

        public function FavouriteChangedEvent(k:Function);

        public function getParser():FavouriteChangedMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.navigator

