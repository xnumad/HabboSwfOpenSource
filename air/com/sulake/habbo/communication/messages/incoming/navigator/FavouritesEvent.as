//com.sulake.habbo.communication.messages.incoming.navigator.FavouritesEvent

package com.sulake.habbo.communication.messages.incoming.navigator{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.navigator.FavouritesMessageParser;

    [SecureSWF(rename="true")]
    public class FavouritesEvent extends MessageEvent implements IMessageEvent {

        public function FavouritesEvent(k:Function);

        public function getParser():FavouritesMessageParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.navigator

