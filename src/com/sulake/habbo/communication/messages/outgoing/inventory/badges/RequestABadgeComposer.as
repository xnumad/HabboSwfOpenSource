package com.sulake.habbo.communication.messages.outgoing.inventory.badges
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class RequestABadgeComposer implements IMessageComposer
    {
        private var _Str_10244:String;

        public function RequestABadgeComposer(k:String)
        {
            this._Str_10244 = k;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            var k:Array = new Array();
            k.push(this._Str_10244);
            return k;
        }
    }
}
