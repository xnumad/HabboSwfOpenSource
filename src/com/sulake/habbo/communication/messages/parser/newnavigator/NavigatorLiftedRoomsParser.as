package com.sulake.habbo.communication.messages.parser.newnavigator
{
    import com.sulake.core.communication.messages.IMessageParser;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.communication.messages.incoming.newnavigator.LiftedRoomData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import __AS3__.vec.*;

    public class NavigatorLiftedRoomsParser implements IMessageParser 
    {
        private var _liftedRooms:Vector.<LiftedRoomData>;


        public function flush():Boolean
        {
            this._liftedRooms = new Vector.<LiftedRoomData>();
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._liftedRooms.push(new LiftedRoomData(k));
                _local_3++;
            }
            return true;
        }

        public function get liftedRooms():Vector.<LiftedRoomData>
        {
            return this._liftedRooms;
        }
    }
}
