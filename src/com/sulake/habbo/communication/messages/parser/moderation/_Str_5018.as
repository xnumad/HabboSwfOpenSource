package com.sulake.habbo.communication.messages.parser.moderation
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_5018 implements IDisposable 
    {
        private var _Str_12818:Array;
        private var _Str_14428:Array;
        private var _issues:Array;
        private var _Str_21327:Boolean;
        private var _Str_20034:Boolean;
        private var _Str_21542:Boolean;
        private var _Str_22205:Boolean;
        private var _Str_22169:Boolean;
        private var _Str_19231:Boolean;
        private var _Str_19156:Boolean;
        private var _disposed:Boolean;

        public function _Str_5018(k:IMessageDataWrapper)
        {
            var _local_2:_Str_5460 = new _Str_5460();
            this._issues = [];
            this._Str_12818 = [];
            this._Str_14428 = [];
            var _local_3:int = k.readInteger();
            var _local_4:int;
            while (_local_4 < _local_3)
            {
                if (_local_2.parse(k))
                {
                    this._issues.push(_local_2._Str_22192);
                }
                _local_4++;
            }
            _local_3 = k.readInteger();
            _local_4 = 0;
            while (_local_4 < _local_3)
            {
                this._Str_12818.push(k.readString());
                _local_4++;
            }
            _local_3 = k.readInteger();
            _local_4 = 0;
            while (_local_4 < _local_3)
            {
                k.readString();
                _local_4++;
            }
            this._Str_21327 = k.readBoolean();
            this._Str_20034 = k.readBoolean();
            this._Str_21542 = k.readBoolean();
            this._Str_22205 = k.readBoolean();
            this._Str_22169 = k.readBoolean();
            this._Str_19231 = k.readBoolean();
            this._Str_19156 = k.readBoolean();
            _local_3 = k.readInteger();
            _local_4 = 0;
            while (_local_4 < _local_3)
            {
                this._Str_14428.push(k.readString());
                _local_4++;
            }
        }

        public function dispose():void
        {
            if (this._disposed)
            {
                return;
            }
            this._disposed = true;
            this._Str_12818 = null;
            this._Str_14428 = null;
            this._issues = null;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get _Str_15690():Array
        {
            return this._Str_12818;
        }

        public function get _Str_18336():Array
        {
            return this._Str_14428;
        }

        public function get issues():Array
        {
            return this._issues;
        }

        public function get _Str_24070():Boolean
        {
            return this._Str_21327;
        }

        public function get _Str_12765():Boolean
        {
            return this._Str_20034;
        }

        public function get _Str_18465():Boolean
        {
            return this._Str_21542;
        }

        public function get _Str_20397():Boolean
        {
            return this._Str_22205;
        }

        public function get _Str_21242():Boolean
        {
            return this._Str_22169;
        }

        public function get _Str_24851():Boolean
        {
            return this._Str_19231;
        }

        public function get _Str_24333():Boolean
        {
            return this._Str_19156;
        }
    }
}
