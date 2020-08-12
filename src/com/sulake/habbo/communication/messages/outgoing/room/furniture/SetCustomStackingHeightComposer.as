package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class SetCustomStackingHeightComposer implements IMessageComposer
    {
        private var _array:Array;

        public function SetCustomStackingHeightComposer(k:int, _arg_2:int=-100)
        {
            this._array = [k, _arg_2];
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
