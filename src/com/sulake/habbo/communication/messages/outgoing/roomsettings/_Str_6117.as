package com.sulake.habbo.communication.messages.outgoing.roomsettings
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class _Str_6117 implements IMessageComposer, IDisposable 
    {
        public static var _Str_16408:Boolean = true;
        public static var _Str_16962:Boolean = false;

        private var _Str_2156:Array;

        public function _Str_6117(k:int, _arg_2:Boolean, _arg_3:String)
        {
            this._Str_2156 = new Array();
            super();
            this._Str_2156.push(k);
            this._Str_2156.push(_arg_2);
            this._Str_2156.push(_arg_3);
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
