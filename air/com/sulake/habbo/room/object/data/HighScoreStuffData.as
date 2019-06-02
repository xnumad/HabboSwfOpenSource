//com.sulake.habbo.room.object.data.HighScoreStuffData

package com.sulake.habbo.room.object.data{
    import com.sulake.habbo.room.IStuffData;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import com.sulake.room.object.IRoomObjectModel;
    import com.sulake.room.object.IRoomObjectModelController;

    public class HighScoreStuffData extends StuffDataBase implements IStuffData {

        public static const FORMAT_KEY:int;

        private var _state:String;
        private var _scoreType:int;
        private var _clearType:int;
        private var _entries:Vector.<HighScoreData>;

        public function HighScoreStuffData();

        public function get scoreType():int;

        public function get clearType():int;

        public function get entries():Vector.<HighScoreData>;

        override public function initializeFromIncomingMessage(k:IMessageDataWrapper):void;

        override public function initializeFromRoomObjectModel(k:IRoomObjectModel):void;

        override public function writeRoomObjectModel(k:IRoomObjectModelController):void;

        override public function getLegacyString():String;


    }
}//package com.sulake.habbo.room.object.data

