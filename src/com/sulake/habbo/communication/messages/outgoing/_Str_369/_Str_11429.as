package com.sulake.habbo.communication.messages.outgoing._Str_369
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_11429 implements IMessageComposer 
    {
        private var _Str_2907:Array;

        public function _Str_11429(k:String, _arg_2:String)
        {
            this._Str_2907 = [];
            super();
            this._Str_2907.push(k);
            this._Str_2907.push(_arg_2);
        }

        public function getMessageArray():Array
        {
            return this._Str_2907;
        }

        public function dispose():void
        {
            this._Str_2907 = null;
        }
    }
}
