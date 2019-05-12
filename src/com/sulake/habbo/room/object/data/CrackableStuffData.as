package com.sulake.habbo.room.object.data
{
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import com.sulake.habbo.room.object.RoomObjectVariableEnum;
    import com.sulake.room.object.IRoomObjectModelController;
    import com.sulake.room.object.IRoomObjectModel;

    public class CrackableStuffData extends StuffDataBase implements IStuffData 
    {
        public static const FORMAT_KEY:int = StuffDataFormatKeyEnum.CRACKABLE_TYPE_KEY;//7
        private static const FURNITURE_CRACKABLE_STATE:String = "furniture_crackable_state";
        private static const FURNITURE_CRACKABLE_HITS:String = "furniture_crackable_hits";
        private static const FURNITURE_CRACKABLE_TARGET:String = "furniture_crackable_target";

        private var _state:String = "";
        private var _hits:int;
        private var _target:int;


        override public function initializeFromIncomingMessage(k:IMessageDataWrapper):void
        {
            this._state = k.readString();
            this._hits = k.readInteger();
            this._target = k.readInteger();
            super.initializeFromIncomingMessage(k);
        }

        override public function writeRoomObjectModel(k:IRoomObjectModelController):void
        {
            super.writeRoomObjectModel(k);
            k.setNumber(RoomObjectVariableEnum.FURNITURE_DATA_FORMAT, FORMAT_KEY);
            k.setString(FURNITURE_CRACKABLE_STATE, this._state);
            k.setNumber(FURNITURE_CRACKABLE_HITS, this._hits);
            k.setNumber(FURNITURE_CRACKABLE_TARGET, this._target);
        }

        override public function initializeFromRoomObjectModel(k:IRoomObjectModel):void
        {
            super.initializeFromRoomObjectModel(k);
            this._state = k.getString(FURNITURE_CRACKABLE_STATE);
            this._hits = k.getNumber(FURNITURE_CRACKABLE_HITS);
            this._target = k.getNumber(FURNITURE_CRACKABLE_TARGET);
        }

        override public function getLegacyString():String
        {
            return this._state;
        }

        public function setString(k:String):void
        {
            this._state = k;
        }

        public function get hits():int
        {
            return this._hits;
        }

        public function get target():int
        {
            return this._target;
        }

        override public function compare(k:IStuffData):Boolean
        {
            return true;
        }
    }
}
