package com.sulake.core.assets
{
    import com.sulake.core.runtime.IUpdateReceiver;
    import __AS3__.vec.Vector;
    import com.sulake.core.Core;
    import __AS3__.vec.*;

    public class LazyAssetProcessor implements IUpdateReceiver 
    {
        private var _queue:Vector.<ILazyAsset>;
        private var _running:Boolean = false;
        private var _disposed:Boolean = false;

        public function LazyAssetProcessor()
        {
            this._queue = new Vector.<ILazyAsset>();
            super();
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                Core.instance.removeUpdateReceiver(this);
                this._queue = null;
                this._running = false;
                this._disposed = true;
            }
        }

        public function push(lazyAsset:ILazyAsset):void
        {
            if (lazyAsset)
            {
                this._queue.push(lazyAsset);
                if (!this._running)
                {
                    Core.instance.registerUpdateReceiver(this, 2);
                    this._running = true;
                }
            }
        }

        public function flush():void
        {
            var lazyAsset:ILazyAsset;
            for each (lazyAsset in this._queue)
            {
                if (!lazyAsset.disposed)
                {
                    lazyAsset.prepareLazyContent();
                }
            }
            this._queue = new Vector.<ILazyAsset>();
            if (this._running)
            {
                Core.instance.removeUpdateReceiver(this);
                this._running = false;
            }
        }

        public function update(k:uint):void
        {
            var lazyAsset:ILazyAsset = this._queue.shift();
            if (!lazyAsset)
            {
                if (this._running)
                {
                    Core.instance.removeUpdateReceiver(this);
                    this._running = false;
                }
            }
            else
            {
                if (!lazyAsset.disposed)
                {
                    lazyAsset.prepareLazyContent();
                }
            }
        }
    }
}
