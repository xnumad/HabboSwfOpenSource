package com.sulake.habbo.communication.messages.outgoing.room.chat
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class ShoutMessageComposer implements IMessageComposer
    {
        private var _text:String;
        private var _styleId:int = 0;

        public function ShoutMessageComposer(k:String, _arg_2:int=0)
        {
            this._text = k;
            this._styleId = _arg_2;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return [this._text, this._styleId];
        }
    }
}
