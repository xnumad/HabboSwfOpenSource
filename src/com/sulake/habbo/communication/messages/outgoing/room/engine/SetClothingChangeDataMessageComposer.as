package com.sulake.habbo.communication.messages.outgoing.room.engine
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class SetClothingChangeDataMessageComposer implements IMessageComposer
    {
        private var _objectId:int;
        private var _gender:String;
        private var _Str_20428:String;

        public function SetClothingChangeDataMessageComposer(k:int, _arg_2:String, _arg_3:String="")
        {
            this._objectId = k;
            this._gender = _arg_2;
            this._Str_20428 = _arg_3;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return [this._objectId, this._gender, this._Str_20428];
        }
    }
}
