package com.sulake.habbo.communication.messages.outgoing.help
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class GetFaqTextMessageComposer implements IMessageComposer
    {
        private var _questionId:int;

        public function GetFaqTextMessageComposer(k:int)
        {
            this._questionId = k;
        }

        public function getMessageArray():Array
        {
            return [this._questionId];
        }

        public function dispose():void
        {
        }
    }
}
