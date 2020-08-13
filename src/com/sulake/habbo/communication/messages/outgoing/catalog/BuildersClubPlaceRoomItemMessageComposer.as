package com.sulake.habbo.communication.messages.outgoing.catalog
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class BuildersClubPlaceRoomItemMessageComposer implements IMessageComposer
    {
        private var _array:Array;

        public function BuildersClubPlaceRoomItemMessageComposer(k:int, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:int, _arg_6:int)
        {
            this._array = [];
            super();
            this._array = [k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6];
        }

        public function getMessageArray():Array
        {
            return this._array;
        }

        public function dispose():void
        {
            this._array = null;
        }
    }
}
