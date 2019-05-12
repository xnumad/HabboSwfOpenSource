package com.sulake.habbo.communication.messages.outgoing.room.engine
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.utils.Map;

    public class _Str_5686 implements IMessageComposer 
    {
        private var _array:Array;

        public function _Str_5686(k:int, _arg_2:Map)
        {
            var _local_3:String;
            this._array = [];
            super();
            this._array.push(k);
            this._array.push((_arg_2.length * 2));
            for each (_local_3 in _arg_2.getKeys())
            {
                this._array.push(_local_3);
                this._array.push(_arg_2.getValue(_local_3));
            }
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
