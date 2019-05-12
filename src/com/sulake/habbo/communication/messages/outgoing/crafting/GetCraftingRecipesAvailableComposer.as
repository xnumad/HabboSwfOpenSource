package com.sulake.habbo.communication.messages.outgoing.crafting
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;
    import __AS3__.vec.Vector;

    public class GetCraftingRecipesAvailableComposer implements IMessageComposer, IDisposable 
    {
        private var _array:Array;

        public function GetCraftingRecipesAvailableComposer(k:int, _arg_2:Vector.<int>)
        {
            this._array = new Array();
            super();
            this._array.push(k);
            this._array.push(_arg_2.length);
            var _local_3:int;
            while (_local_3 < _arg_2.length)
            {
                this._array.push(_arg_2[_local_3]);
                _local_3++;
            }
        }

        public function getMessageArray():Array
        {
            return this._array;
        }

        public function dispose():void
        {
            this._array = null;
        }

        public function get disposed():Boolean
        {
            return false;
        }
    }
}
