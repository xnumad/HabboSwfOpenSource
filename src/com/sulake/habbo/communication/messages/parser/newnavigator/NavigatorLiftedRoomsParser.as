package com.sulake.habbo.communication.messages.parser.newnavigator
{
    import com.sulake.core.communication.messages.IMessageParser;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.communication.messages.incoming.newnavigator._Str_4768;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import __AS3__.vec.*;

    public class NavigatorLiftedRoomsParser implements IMessageParser 
    {
        private var _liftedRooms:Vector.<_Str_4768>;


        public function flush():Boolean
        {
            this._liftedRooms = new Vector.<_Str_4768>();
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._liftedRooms.push(new _Str_4768(k));
                _local_3++;
            }
            return true;
        }

        public function get _Str_6772():Vector.<_Str_4768>
        {
            return this._liftedRooms;
        }
    }
}
