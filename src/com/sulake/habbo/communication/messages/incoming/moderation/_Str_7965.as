package com.sulake.habbo.communication.messages.incoming.moderation
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7965 
    {
        private var _callId:int;
        private var _Str_20226:int;
        private var _Str_2797:int;
        private var _Str_10679:int;
        private var _Str_8977:ChatRecordData;

        public function _Str_7965(k:IMessageDataWrapper)
        {
            this._callId = k.readInteger();
            this._Str_20226 = k.readInteger();
            this._Str_2797 = k.readInteger();
            this._Str_10679 = k.readInteger();
            this._Str_8977 = new ChatRecordData(k);
        }

        public function get callId():int
        {
            return this._callId;
        }

        public function get _Str_23592():int
        {
            return this._Str_20226;
        }

        public function get _Str_2662():int
        {
            return this._Str_2797;
        }

        public function get _Str_20325():int
        {
            return this._Str_10679;
        }

        public function get _Str_17106():ChatRecordData
        {
            return this._Str_8977;
        }
    }
}
