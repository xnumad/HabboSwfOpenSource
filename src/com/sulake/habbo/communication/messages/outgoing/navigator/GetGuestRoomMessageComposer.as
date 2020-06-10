package com.sulake.habbo.communication.messages.outgoing.navigator
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class GetGuestRoomMessageComposer implements IMessageComposer, IDisposable
    {
        private var _array:Array;

        public function GetGuestRoomMessageComposer(flatId:int, enterRoom:Boolean, roomForward:Boolean)
        {
            this._array = new Array();
            super();
            this._array.push(flatId);
            this._array.push(((enterRoom) ? 1 : 0));
            this._array.push(((roomForward) ? 1 : 0));
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
