package com.sulake.habbo.communication.messages.outgoing.room.action
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class BanUserWithDurationMessageComposer implements IMessageComposer
    {
        private var _Str_2306:int;
        private var _roomId:int = 0;
        private var _banType:String;

        public function BanUserWithDurationMessageComposer(k:int, _arg_2:String, _arg_3:int=0)
        {
            this._Str_2306 = k;
            this._roomId = _arg_3;
            this._banType = _arg_2;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return [this._Str_2306, this._roomId, this._banType];
        }
    }
}
