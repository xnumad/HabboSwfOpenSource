package com.sulake.habbo.communication.messages.outgoing.inventory.badges
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_7854 implements IMessageComposer 
    {
        private var _Str_2156:Array;

        public function _Str_7854(k:String)
        {
            this._Str_2156 = new Array();
            super();
            this._Str_2156.push(k);
        }

        public function getMessageArray():Array
        {
            return this._Str_2156;
        }

        public function dispose():void
        {
            this._Str_2156 = null;
        }

        public function get disposed():Boolean
        {
            return false;
        }
    }
}
