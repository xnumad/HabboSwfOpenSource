package com.sulake.habbo.communication.messages.outgoing.room.action
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class AmbassadorAlertMessageComposer implements IMessageComposer 
    {
        private var _Str_2306:int;

        public function AmbassadorAlertMessageComposer(k:int)
        {
            this._Str_2306 = k;
        }

        public function getMessageArray():Array
        {
            return [this._Str_2306];
        }

        public function dispose():void
        {
        }
    }
}
