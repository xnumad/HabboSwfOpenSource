package com.sulake.habbo.communication.messages.outgoing.room.engine
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class MoveWallItemMessageComposer implements IMessageComposer
    {
        private var _array:Array;

        public function MoveWallItemMessageComposer(k:int, _arg_2:int, _arg_3:String)
        {
            this._array = [];
            super();
            this._array.push(k);
            this._array.push(_arg_3);
        }

        public function dispose():void
        {
            this._array = null;
        }

        public function getMessageArray():Array
        {
            return this._array;
        }
    }
}
