package com.sulake.habbo.communication.messages.incoming.callforhelp
{
    import com.sulake.habbo.communication.messages.incoming.moderation._Str_817;
    import com.sulake.core.runtime.IDisposable;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageDataWrapper;
    import com.sulake.habbo.communication.messages.incoming.moderation.*;
    import __AS3__.vec.*;

    public class CallForHelpCategoryData implements _Str_817, IDisposable 
    {
        private var _name:String;
        private var _topics:Vector.<_Str_3509>;
        private var _disposed:Boolean;

        public function CallForHelpCategoryData(k:IMessageDataWrapper)
        {
            this._topics = new Vector.<_Str_3509>();
            this._name = k.readString();
            Logger.log(("READ CFH CAT: " + this._name));
            var _local_2:int = k.readInteger();
            var _local_3:int;
            while (_local_3 < _local_2)
            {
                this._topics.push(new _Str_3509(k));
                _local_3++;
            }
        }

        public function dispose():void
        {
            if (this._disposed)
            {
                return;
            }
            this._disposed = true;
            this._topics = null;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get name():String
        {
            return this._name;
        }

        public function get _Str_14841():Vector.<_Str_3509>
        {
            return this._topics;
        }
    }
}
