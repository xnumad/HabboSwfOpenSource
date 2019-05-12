package com.sulake.habbo.communication.messages.outgoing.groupforums
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class PostMessageMessageComposer implements IMessageComposer, IDisposable 
    {
        private var _array:Array;

        public function PostMessageMessageComposer(k:int, _arg_2:int, _arg_3:String, _arg_4:String)
        {
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

        public function get disposed():Boolean
        {
            return false;
        }
    }
}
