package com.sulake.core.runtime
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.runtime.IID;
    import __AS3__.vec.Vector;
    import com.sulake.core.runtime.*;
    import __AS3__.vec.*;

    internal class ComponentInterfaceQueue implements IDisposable 
    {
        private var _identifier:IID;
        private var _isDisposed:Boolean;
        private var _receivers:Vector.<Function>;

        public function ComponentInterfaceQueue(identifier:IID)
        {
            this._identifier = identifier;
            this._receivers = new Vector.<Function>();
            this._isDisposed = false;
        }

        public function get identifier():IID
        {
            return this._identifier;
        }

        public function get disposed():Boolean
        {
            return this._isDisposed;
        }

        public function get receivers():Vector.<Function>
        {
            return this._receivers;
        }

        public function dispose():void
        {
            if (!this._isDisposed)
            {
                this._isDisposed = true;
                this._identifier = null;
                while (this._receivers.length > 0)
                {
                    this._receivers.pop();
                }
                this._receivers = null;
            }
        }
    }
}
