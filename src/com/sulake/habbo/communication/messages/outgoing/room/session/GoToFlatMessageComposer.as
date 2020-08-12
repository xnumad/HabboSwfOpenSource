package com.sulake.habbo.communication.messages.outgoing.room.session
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class GoToFlatMessageComposer implements IMessageComposer
    {
        private var _Str_2337:int;

        public function GoToFlatMessageComposer(k:int)
        {
            this._Str_2337 = k;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return [this._Str_2337];
        }
    }
}
