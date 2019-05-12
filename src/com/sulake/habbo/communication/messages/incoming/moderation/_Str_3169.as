package com.sulake.habbo.communication.messages.incoming.moderation
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_3169 implements IDisposable 
    {
        private var _Str_22209:Boolean;
        private var _name:String;
        private var _desc:String;
        private var _tags:Array;
        private var _disposed:Boolean;

        public function _Str_3169(k:IMessageDataWrapper)
        {
            this._tags = new Array();
            super();
            this._Str_22209 = k.readBoolean();
            if (!this._Str_2811)
            {
                return;
            }
            this._name = k.readString();
            this._desc = k.readString();
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._tags.push(k.readString());
                _local_3++;
            }
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function dispose():void
        {
            if (this._disposed)
            {
                return;
            }
            this._disposed = true;
            this._tags = null;
        }

        public function get name():String
        {
            return this._name;
        }

        public function get desc():String
        {
            return this._desc;
        }

        public function get tags():Array
        {
            return this._tags;
        }

        public function get _Str_2811():Boolean
        {
            return this._Str_22209;
        }
    }
}
