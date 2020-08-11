package com.sulake.habbo.communication.messages.outgoing.userclassification
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_9884 implements IMessageComposer 
    {
        private var userClassType:String;

        public function _Str_9884(k:String)
        {
            this.userClassType = k;
        }

        public function getMessageArray():Array
        {
            return [this.userClassType];
        }

        public function dispose():void
        {
            this.userClassType = null;
        }
    }
}
