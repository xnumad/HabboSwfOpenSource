//com.sulake.habbo.communication.messages.parser.room.session.RoomQueueStatusMessageParser

package com.sulake.habbo.communication.messages.parser.room.session{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.utils.Map;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class RoomQueueStatusMessageParser implements IMessageParser {

        private var _queueSets:Map;
        private var _activeTarget:int;

        public function RoomQueueStatusMessageParser();

        public function get activeTarget():int;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function getQueueSetTargets():Array;

        public function getQueueSet(k:int):RoomQueueSet;


    }
}//package com.sulake.habbo.communication.messages.parser.room.session

