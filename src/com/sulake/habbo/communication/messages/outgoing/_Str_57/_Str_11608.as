package com.sulake.habbo.communication.messages.outgoing._Str_57
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class _Str_11608 implements IMessageComposer, IDisposable 
    {
        private var flatId:String;

        public function _Str_11608(k:String)
        {
            this.flatId = k;
        }

        public function getMessageArray():Array
        {
            return [this.flatId];
        }

        public function dispose():void
        {
        }

        public function get disposed():Boolean
        {
            return false;
        }
    }
}
