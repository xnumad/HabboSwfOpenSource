package com.sulake.core.window.utils
{
    import com.sulake.core.runtime.IDisposable;
    import flash.events.IEventDispatcher;
    import __AS3__.vec.Vector;
    import flash.events.Event;
    import __AS3__.vec.*;

    public class GenericEventQueue implements IEventQueue, IDisposable 
    {
        protected var _disposed:Boolean = false;
        protected var _eventDispatcher:IEventDispatcher;
        protected var _Str_4751:Vector.<Event>;
        protected var _index:uint = 0;
        protected var _Str_18060:Boolean = true;

        public function GenericEventQueue(k:IEventDispatcher)
        {
            this._Str_4751 = new Vector.<Event>();
            this._eventDispatcher = k;
        }

        public function get length():uint
        {
            return this._Str_4751.length;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                this._eventDispatcher = null;
                if (this._Str_4751.length)
                {
                    this._Str_4751.splice(0, this._Str_4751.length);
                }
                this._disposed = true;
            }
        }

        public function begin():void
        {
            if (!this._Str_18060)
            {
                this.flush();
            }
            this._index = 0;
            this._Str_18060 = false;
        }

        public function next():Event
        {
            var k:Event;
            if (this._index < this._Str_4751.length)
            {
                k = this._Str_4751[this._index];
                this._index++;
            }
            return k;
        }

        public function remove():void
        {
            this._Str_4751.splice((this._index - 1), 1);
            if (this._index > 0)
            {
                this._index--;
            }
        }

        public function end():void
        {
            this._index = 0;
            this._Str_18060 = true;
        }

        public function flush():void
        {
            this._Str_4751.splice(0, this._Str_4751.length);
            this._index = 0;
        }

        protected function _Str_26253(k:Event):void
        {
            this._Str_4751.push(k);
        }
    }
}
