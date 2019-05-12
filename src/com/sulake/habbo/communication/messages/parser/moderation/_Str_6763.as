package com.sulake.habbo.communication.messages.parser.moderation
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_6763 implements IMessageParser 
    {
        private var _issues:Array;
        private var _retryEnabled:Boolean;
        private var _retryCount:int;


        public function get issues():Array
        {
            return this._issues;
        }

        public function get retryEnabled():Boolean
        {
            return this._retryEnabled;
        }

        public function get retryCount():int
        {
            return this._retryCount;
        }

        public function flush():Boolean
        {
            this._issues = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            var _local_4:int;
            var _local_5:int;
            var _local_6:String;
            var _local_7:_Str_2484;
            this._issues = new Array();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                _local_4 = k.readInteger();
                _local_5 = k.readInteger();
                _local_6 = k.readString();
                _local_7 = new _Str_2484(_local_4, 0, 0, 0, 0, 0, 0, 0, null, 0, null, _local_5, _local_6, null, 0, []);
                this._issues.push(_local_7);
                _local_3++;
            }
            this._retryEnabled = k.readBoolean();
            this._retryCount = k.readInteger();
            return true;
        }
    }
}
