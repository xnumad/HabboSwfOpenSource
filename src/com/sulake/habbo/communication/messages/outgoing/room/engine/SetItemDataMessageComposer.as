package com.sulake.habbo.communication.messages.outgoing.room.engine
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class SetItemDataMessageComposer implements IMessageComposer
    {
        private var _objectId:int;
        private var _array:String;
        private var _colorHex:String;

        public function SetItemDataMessageComposer(k:int, _arg_2:String="", _arg_3:String="")
        {
            this._objectId = k;
            this._array = _arg_3;
            this._colorHex = _arg_2;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return [this._objectId, this._colorHex, this._array];
        }
    }
}
