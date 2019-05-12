package com.sulake.habbo.room.object.data
{
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import com.sulake.room.object.IRoomObjectModel;
    import com.sulake.room.object.IRoomObjectModelController;

    public class EmptyStuffData extends StuffDataBase implements IStuffData 
    {
        override public function initializeFromIncomingMessage(k:IMessageDataWrapper):void
        {
            super.initializeFromIncomingMessage(k);
        }

        override public function initializeFromRoomObjectModel(k:IRoomObjectModel):void
        {
            super.initializeFromRoomObjectModel(k);
        }

        override public function writeRoomObjectModel(k:IRoomObjectModelController):void
        {
            super.writeRoomObjectModel(k);
        }

        override public function getLegacyString():String
        {
            return "";
        }

        override public function compare(k:IStuffData):Boolean
        {
            return super.compare(k);
        }
    }
}
