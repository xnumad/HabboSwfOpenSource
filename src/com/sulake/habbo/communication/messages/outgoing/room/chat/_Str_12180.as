package com.sulake.habbo.communication.messages.outgoing.room.chat
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_12180 implements IMessageComposer 
    {
        private var _text:String;
        private var _Str_3567:int = 0;

        public function _Str_12180(k:String, _arg_2:int=0)
        {
            this._text = k;
            this._Str_3567 = _arg_2;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return [this._text, this._Str_3567];
        }
    }
}
