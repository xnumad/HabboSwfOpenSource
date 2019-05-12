package com.sulake.core.runtime.events
{
    import flash.events.IEventDispatcher;
    import com.sulake.core.runtime.IDisposable;
    import flash.events.EventDispatcher;
    import flash.utils.Dictionary;
    import com.sulake.core.Core;
    import flash.utils.getQualifiedClassName;
    import flash.events.Event;

    public class EventDispatcherWrapper implements IEventDispatcher, IDisposable 
    {
        private static const EVENT_RESULT_TRUE:uint = 0;
        private static const EVENT_RESULT_FALSE:uint = 1;
        private static const EVENT_RESULT_ERROR:uint = 2;

        protected var _disposed:Boolean = false;
        private var _eventDispatcher:EventDispatcher;
        private var _eventListenerTable:Dictionary;
        private var _result:uint;
        private var _error:Error;

        public function EventDispatcherWrapper(parent:IEventDispatcher=null)
        {
            this._eventListenerTable = new Dictionary();
            super();
            this._eventDispatcher = new EventDispatcher(((parent) ? parent : this));
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get error():Error
        {
            return this._error;
        }

        public function addEventListener(k:String, _arg_2:Function, _arg_3:Boolean=false, _arg_4:int=0, _arg_5:Boolean=false):void
        {
            var _local_8:EventListenerStruct;
            var _local_6:Array = this._eventListenerTable[k];
            var _local_7:EventListenerStruct = new EventListenerStruct(_arg_2, _arg_3, _arg_4, _arg_5);
            if (!_local_6)
            {
                _local_6 = [_local_7];
                this._eventListenerTable[k] = _local_6;
                this._eventDispatcher.addEventListener(k, this.eventProcessor);
            }
            else
            {
                for each (_local_8 in _local_6)
                {
                    if (((_local_8.callback == _arg_2) && (_local_8.useCapture == _arg_3)))
                    {
                        return;
                    }
                    if (_arg_4 > _local_8.priority)
                    {
                        _local_6.splice(_local_6.indexOf(_local_8), 0, _local_7);
                        return;
                    }
                }
                _local_6.push(_local_7);
            }
        }

        public function removeEventListener(k:String, _arg_2:Function, _arg_3:Boolean=false):void
        {
            var _local_4:Array;
            var _local_5:uint;
            var _local_6:EventListenerStruct;
            if (!this._disposed)
            {
                _local_4 = this._eventListenerTable[k];
                if (_local_4)
                {
                    _local_5 = 0;
                    for each (_local_6 in _local_4)
                    {
                        if (((_local_6.callback == _arg_2) && (_local_6.useCapture == _arg_3)))
                        {
                            _local_4.splice(_local_5, 1);
                            _local_6.callback = null;
                            if (_local_4.length == 0)
                            {
                                delete this._eventListenerTable[k];
                                this._eventDispatcher.removeEventListener(k, this.eventProcessor);
                            }
                            return;
                        }
                        _local_5++;
                    }
                }
            }
        }

        public function dispatchEvent(k:Event):Boolean
        {
            if (!this._disposed)
            {
                this._result = EVENT_RESULT_TRUE;
                this._eventDispatcher.dispatchEvent(k);
                if (this._result == EVENT_RESULT_ERROR)
                {
                    if (this._error != null)
                    {
                        Core.crash(((("Error caught when handling " + getQualifiedClassName(k)) + ": ") + this._error.message), this._error.errorID, this._error);
                    }
                    else
                    {
                        Core.crash((("Error caught when handling " + getQualifiedClassName(k)) + ". No error data available!"), 0, this._error);
                    }
                }
                return this._result == EVENT_RESULT_TRUE;
            }
            return false;
        }

        public function hasEventListener(k:String):Boolean
        {
            return (this._disposed) ? false : (!(this._eventListenerTable[k] == null));
        }

        public function callEventListeners(k:String):void
        {
            var _local_3:EventListenerStruct;
            var _local_2:Array = this._eventListenerTable[k];
            if (_local_2)
            {
                for each (_local_3 in _local_2)
                {
                    _local_3.callback(null);
                }
            }
        }

        public function willTrigger(k:String):Boolean
        {
            return (this._disposed) ? false : (!(this._eventListenerTable[k] == null));
        }

        private function eventProcessor(event:Event):void
        {
            var callbacks:Array;
            var callback:Function;
            var struct:EventListenerStruct;
            var array:Array = this._eventListenerTable[event.type];
            if (array)
            {
                callbacks = [];
                for each (struct in array)
                {
                    callbacks.push(struct.callback);
                }
                while (callbacks.length > 0)
                {
                    try
                    {
                        callback = callbacks.shift();
                        (callback(event));
                    }
                    catch(e:Error)
                    {
                        Logger.log(e.getStackTrace());
                        _result = EVENT_RESULT_ERROR;
                        _error = e;
                        return;
                    }
                }
            }
            this._result = ((event.isDefaultPrevented()) ? EVENT_RESULT_FALSE : EVENT_RESULT_TRUE);
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                for (var type:String in this._eventListenerTable)
                {
            		var listeners:Array = (this._eventListenerTable[type] as Array);
                    for each (var struct:EventListenerStruct in listeners)
                    {
                        struct.callback = null;
                    }
                    delete this._eventListenerTable[type];
                    this._eventDispatcher.removeEventListener(type, this.eventProcessor);
                }
                this._eventListenerTable = null;
                this._eventDispatcher = null;
                this._disposed = true;
            }
        }
    }
}
