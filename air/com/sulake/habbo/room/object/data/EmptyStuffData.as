//com.sulake.habbo.room.object.data.EmptyStuffData

package com.sulake.habbo.room.object.data{
    import com.sulake.habbo.room.IStuffData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import com.sulake.room.object.IRoomObjectModel;
    import com.sulake.room.object.IRoomObjectModelController;

    public class EmptyStuffData extends StuffDataBase implements IStuffData {

        public function EmptyStuffData();

        override public function initializeFromIncomingMessage(k:IMessageDataWrapper):void;

        override public function initializeFromRoomObjectModel(k:IRoomObjectModel):void;

        override public function writeRoomObjectModel(k:IRoomObjectModelController):void;

        override public function getLegacyString():String;

        override public function compare(k:IStuffData):Boolean;


    }
}//package com.sulake.habbo.room.object.data

