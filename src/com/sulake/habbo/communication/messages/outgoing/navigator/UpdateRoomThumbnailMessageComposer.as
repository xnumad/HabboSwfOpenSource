package com.sulake.habbo.communication.messages.outgoing.navigator
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class UpdateRoomThumbnailMessageComposer implements IMessageComposer, IDisposable
    {
        private var _array:Array;

        public function UpdateRoomThumbnailMessageComposer(flatId:int, bgImgId:int, frontImgId:int, objCount:int)
        {
            this._array = new Array();
            super();
            this._array.push(flatId);
            this._array.push(bgImgId);
            this._array.push(frontImgId);
            this._array.push(objCount);
        }

        public function _Str_26191(k:int, _arg_2:int):void
        {
            this._array.push(k);
            this._array.push(_arg_2);
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
