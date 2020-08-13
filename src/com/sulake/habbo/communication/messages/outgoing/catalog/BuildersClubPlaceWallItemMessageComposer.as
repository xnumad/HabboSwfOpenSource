package com.sulake.habbo.communication.messages.outgoing.catalog
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class BuildersClubPlaceWallItemMessageComposer implements IMessageComposer
    {
        private var _array:Array;

        public function BuildersClubPlaceWallItemMessageComposer(k:int, _arg_2:int, _arg_3:String, _arg_4:String)
        {
            this._array = [];
            super();
            this._array = [k, _arg_2, _arg_3, _arg_4];
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
