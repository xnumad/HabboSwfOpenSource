package com.sulake.habbo.communication.messages.outgoing.groupforums
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class UpdateForumReadMarkerMessageComposer implements IMessageComposer, IDisposable 
    {
        private var _array:Array;

        public function UpdateForumReadMarkerMessageComposer()
        {
            this._array = [0];
            super();
        }

        public function add(k:int, _arg_2:int, _arg_3:Boolean):void
        {
            this._array.push(k, _arg_2, _arg_3);
            this._array[0]++;
        }

        public function getMessageArray():Array
        {
            return this._array;
        }

        public function get size():int
        {
            return this._array[0];
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
