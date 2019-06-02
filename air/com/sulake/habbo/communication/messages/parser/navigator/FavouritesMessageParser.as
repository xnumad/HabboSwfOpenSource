//com.sulake.habbo.communication.messages.parser.navigator.FavouritesMessageParser

package com.sulake.habbo.communication.messages.parser.navigator{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class FavouritesMessageParser implements IMessageParser {

        private var _limit:int;
        private var _favouriteRoomIds:Array;

        public function FavouritesMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get limit():int;

        public function get favouriteRoomIds():Array;


    }
}//package com.sulake.habbo.communication.messages.parser.navigator

