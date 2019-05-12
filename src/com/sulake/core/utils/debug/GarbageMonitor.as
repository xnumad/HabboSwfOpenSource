package com.sulake.core.utils.debug
{
    import com.sulake.core.runtime.IDisposable;
    import flash.utils.Dictionary;

    public class GarbageMonitor implements IDisposable 
    {
        private var _disposed:Boolean = false;
        private var _dict:Dictionary;

        public function GarbageMonitor()
        {
            this._dict = new Dictionary(true);
        }

        public function dispose():void
        {
            var k:*;
            if (!this._disposed)
            {
                for each (k in this._dict)
                {
                    delete this._dict[k];
                }
                this._dict = null;
                this._disposed = true;
            }
        }

        public function insert(k:Object, _arg_2:String=null):void
        {
            this._dict[k] = ((_arg_2 == null) ? k.toString() : _arg_2);
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get list():Array
        {
            var _local_2:*;
            var k:Array = new Array();
            for each (_local_2 in this._dict)
            {
                k.push(_local_2);
            }
            return k;
        }
    }
}
