package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class AddSpamWallPostItMessageComposer implements IMessageComposer
    {
        private var _itemId:int;
        private var _location:String;
        private var _message:String;
        private var _colorHex:String;

        public function AddSpamWallPostItMessageComposer(k:int, _arg_2:String, _arg_3:String, _arg_4:String)
        {
            this._itemId = k;
            this._location = _arg_2;
            this._message = _arg_4;
            this._colorHex = _arg_3;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return [this._itemId, this._location, this._colorHex, this._message];
        }
    }
}
