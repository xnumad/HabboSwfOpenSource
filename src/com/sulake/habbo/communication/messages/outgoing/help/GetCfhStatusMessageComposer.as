package com.sulake.habbo.communication.messages.outgoing.help
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class GetCfhStatusMessageComposer implements IMessageComposer
    {
        private var _Str_22113:Boolean;

        public function GetCfhStatusMessageComposer(k:Boolean)
        {
            this._Str_22113 = k;
        }

        public function getMessageArray():Array
        {
            return [this._Str_22113];
        }

        public function dispose():void
        {
        }
    }
}
