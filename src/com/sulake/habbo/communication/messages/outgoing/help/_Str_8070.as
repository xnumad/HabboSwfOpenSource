package com.sulake.habbo.communication.messages.outgoing.help
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class _Str_8070 implements IMessageComposer, IDisposable 
    {
        private var _Str_2156:Array;

        public function _Str_8070(k:String, _arg_2:int, _arg_3:int, _arg_4:Array)
        {
            this._Str_2156 = new Array();
            super();
            this._Str_2156.push(k);
            this._Str_2156.push(_arg_2);
            this._Str_2156.push(_arg_3);
            this._Str_2156.push((_arg_4.length / 2));
            this._Str_2156 = this._Str_2156.concat(_arg_4);
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
