//com.sulake.habbo.communication.messages.incoming.avatar.WardrobeMessageEvent

package com.sulake.habbo.communication.messages.incoming.avatar{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.avatar.WardrobeMessageParser;

    [SecureSWF(rename="true")]
    public class WardrobeMessageEvent extends MessageEvent implements IMessageEvent {

        public static const WARDROBE_NOT_AVAILABLE:int;
        public static const WARDROBE_OK:int;

        public function WardrobeMessageEvent(k:Function);

        private function getParser():WardrobeMessageParser;

        public function get outfits():Array;

        public function get state():int;


    }
}//package com.sulake.habbo.communication.messages.incoming.avatar

