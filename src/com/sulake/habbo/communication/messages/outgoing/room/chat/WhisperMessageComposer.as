package com.sulake.habbo.communication.messages.outgoing.room.chat
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class WhisperMessageComposer implements IMessageComposer
    {
        private var _text:String;
        private var _Str_10061:String;
        private var _styleId:int = 0;

        public function WhisperMessageComposer(k:String, _arg_2:String, _arg_3:int=0)
        {
            this._Str_10061 = k;
            this._text = _arg_2;
            this._styleId = _arg_3;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return [((this._Str_10061 + " ") + this._text), this._styleId];
        }
    }
}
