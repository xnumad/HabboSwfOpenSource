//com.sulake.habbo.room.object.data.MapStuffData

package com.sulake.habbo.room.object.data{
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.core.utils.Map;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import com.sulake.room.object.IRoomObjectModel;
    import com.sulake.room.object.IRoomObjectModelController;

    public class MapStuffData extends StuffDataBase implements IStuffData {

        public static const FORMAT_KEY:int;
        private static const STATE_DEFAULT_KEY:String;
        private static const RARITY_KEY:String;

        private var _data:Map;

        public function MapStuffData(k:Map=null);

        override public function initializeFromIncomingMessage(k:IMessageDataWrapper):void;

        override public function initializeFromRoomObjectModel(k:IRoomObjectModel):void;

        override public function writeRoomObjectModel(k:IRoomObjectModelController):void;

        override public function getLegacyString():String;

        public function getValue(k:String):String;

        override public function compare(k:IStuffData):Boolean;

        override public function get rarityLevel():int;


    }
}//package com.sulake.habbo.room.object.data

