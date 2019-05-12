package com.sulake.habbo.communication.messages.outgoing.room.chat
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_7738 implements IMessageComposer 
    {
        private var _text:String;
        private var _Str_7600:int = 0;
        private var _Str_3567:int = 0;

        public function _Str_7738(k:String, _arg_2:int=0, _arg_3:int=-1)
        {
            this._text = k;
            this._Str_3567 = _arg_2;
            this._Str_7600 = _arg_3;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return [this._text, this._Str_3567, this._Str_7600];
        }
    }
}
