//com.sulake.habbo.communication.messages.parser.room.engine.FavouriteMembershipUpdateMessageParser

package com.sulake.habbo.communication.messages.parser.room.engine{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class FavouriteMembershipUpdateMessageParser implements IMessageParser {

        private var _roomIndex:int;
        private var _habboGroupId:int;
        private var _status:int;
        private var _habboGroupName:String;

        public function FavouriteMembershipUpdateMessageParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get roomIndex():int;

        public function get habboGroupId():int;

        public function get status():int;

        public function get habboGroupName():String;


    }
}//package com.sulake.habbo.communication.messages.parser.room.engine

