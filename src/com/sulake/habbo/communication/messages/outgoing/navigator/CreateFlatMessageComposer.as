package com.sulake.habbo.communication.messages.outgoing.navigator
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class CreateFlatMessageComposer implements IMessageComposer, IDisposable 
    {
        private var _array:Array;

        public function CreateFlatMessageComposer(roomName:String, roomDesc:String, roomLayout:String, selectedFlatCategoryNodeId:int, maxVisitors:int, roomTradeSetting:int)
        {
            this._array = new Array();
            super();
            this._array.push(roomName);
            this._array.push(roomDesc);
            this._array.push(roomLayout);
            this._array.push(selectedFlatCategoryNodeId);
            this._array.push(maxVisitors);
            this._array.push(roomTradeSetting);
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
