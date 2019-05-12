package com.sulake.habbo.communication.messages.outgoing.userdefinedroomevents
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class UpdateActionMessageComposer implements IMessageComposer, IDisposable 
    {
        private var _array:Array;

        public function UpdateActionMessageComposer(k:int, _arg_2:Array, _arg_3:String, _arg_4:Array, _arg_5:int, _arg_6:int)
        {
            var _local_7:int;
            var _local_8:int;
            this._array = new Array();
            super();
            this._array.push(k);
            this._array.push(_arg_2.length);
            for each (_local_7 in _arg_2)
            {
                this._array.push(_local_7);
            }
            this._array.push(_arg_3);
            this._array.push(_arg_4.length);
            for each (_local_8 in _arg_4)
            {
                this._array.push(_local_8);
            }
            this._array.push(_arg_5);
            this._array.push(_arg_6);
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
