package com.sulake.habbo.communication.messages.parser.moderation
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_8176 implements IDisposable 
    {
        private var _pattern:String;
        private var _startIndex:int;
        private var _endIndex:int;
        private var _disposed:Boolean = false;

        public function _Str_8176(k:IMessageDataWrapper)
        {
            this._pattern = k.readString();
            this._startIndex = k.readInteger();
            this._endIndex = k.readInteger();
        }

        public function dispose():void
        {
            this._disposed = true;
            this._pattern = "";
            this._startIndex = -1;
            this._endIndex = -1;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get pattern():String
        {
            return this._pattern;
        }

        public function get startIndex():int
        {
            return this._startIndex;
        }

        public function get endIndex():int
        {
            return this._endIndex;
        }
    }
}
