package com.sulake.habbo.communication.messages.incoming.navigator
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_4374 
    {
        private var _Str_5696:int;
        private var _Str_4347:int;
        private var _Str_18850:int;

        public function _Str_4374(k:IMessageDataWrapper, _arg_2:int=0, _arg_3:int=0)
        {
            this._Str_5696 = _arg_2;
            this._Str_4347 = _arg_3;
            if (k != null)
            {
                this._Str_5696 = k.readInteger();
                this._Str_4347 = k.readInteger();
                this._Str_18850 = k.readInteger();
            }
        }

        public function get goalId():int
        {
            return this._Str_5696;
        }

        public function get pageIndex():int
        {
            return this._Str_4347;
        }

        public function get _Str_8849():int
        {
            return this._Str_18850;
        }
    }
}
