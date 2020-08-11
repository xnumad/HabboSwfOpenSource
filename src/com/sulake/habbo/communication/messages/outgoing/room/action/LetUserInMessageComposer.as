package com.sulake.habbo.communication.messages.outgoing.room.action
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class LetUserInMessageComposer implements IMessageComposer
    {
        private var _message:Array;

        public function LetUserInMessageComposer(k:String, _arg_2:Boolean)
        {
            this._message = [k, _arg_2];
        }

        public function dispose():void
        {
            this._message = null;
        }

        public function getMessageArray():Array
        {
            return this._message;
        }
    }
}
