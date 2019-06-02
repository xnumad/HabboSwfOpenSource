package com.sulake.habbo.communication.messages.incoming.nux
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_5589 
    {
        private var _Str_2570:String;
        private var _Str_3286:String;

        public function _Str_5589(k:IMessageDataWrapper)
        {
            this._Str_2570 = k.readString();
            this._Str_3286 = k.readString();
            if (this._Str_3286 == "")
            {
                this._Str_3286 = null;
            }
        }

        public function get productCode():String
        {
            return this._Str_2570;
        }

        public function get _Str_14499():String
        {
            return this._Str_3286;
        }
    }
}
