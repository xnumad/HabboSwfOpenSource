//com.sulake.habbo.room.object.data.VoteResultStuffData

package com.sulake.habbo.room.object.data{
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import com.sulake.room.object.IRoomObjectModelController;
    import com.sulake.room.object.IRoomObjectModel;

    public class VoteResultStuffData extends StuffDataBase implements IStuffData {

        public static const FORMAT_KEY:int;
        private static const INTERNAL_STATE_KEY:String;
        private static const INTERNAL_RESULT_KEY:String;

        private var _state:String;
        private var _result:int;

        public function VoteResultStuffData();

        override public function initializeFromIncomingMessage(k:IMessageDataWrapper):void;

        override public function writeRoomObjectModel(k:IRoomObjectModelController):void;

        override public function initializeFromRoomObjectModel(k:IRoomObjectModel):void;

        override public function getLegacyString():String;

        public function setString(k:String):void;

        public function get result():int;

        override public function compare(k:IStuffData):Boolean;


    }
}//package com.sulake.habbo.room.object.data

