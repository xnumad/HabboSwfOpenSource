package com.sulake.core.window.events
{
    import com.sulake.core.runtime.IDisposable;
    import flash.utils.Dictionary;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.runtime.events.EventListenerStruct;

    public class WindowEventDispatcher implements IDisposable 
    {
        private static const EVENT_RESULT_TRUE:uint = 0;
        private static const EVENT_RESULT_FALSE:uint = 1;
        private static const EVENT_RESULT_ERROR:uint = 2;

        protected var _disposed:Boolean = false;
        private var _eventListenerTable:Dictionary;
        private var _result:uint;
        private var _error:Error;

        public function WindowEventDispatcher(window:IWindow)
        {
            this._eventListenerTable = new Dictionary();
            super();
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get error():Error
        {
            return this._error;
        }

        public function addEventListener(type:String, callback:Function, priority:int=0):void
        {
            var listeners:Array = this._eventListenerTable[type];
            var eventListener:EventListenerStruct = new EventListenerStruct(callback, false, priority);
            if (!listeners)
            {
                listeners = [eventListener];
                this._eventListenerTable[type] = listeners;
            }
            else
            {
                for each (var struct:EventListenerStruct in listeners)
                {
                    if (struct.callback == callback)
                    {
                        return;
                    }
                    if (priority > struct.priority)
                    {
                        listeners.splice(listeners.indexOf(struct), 0, eventListener);
                        return;
                    }
                }
                listeners.push(eventListener);
            }
        }

        public function removeEventListener(type:String, callback:Function):void
        {
            if (!this._disposed)
            {
                var listeners:Array = this._eventListenerTable[type];
                if (listeners)
                {
                    var index:uint;
                    for each (var eventListener:EventListenerStruct in listeners)
                    {
                        if (eventListener.callback == callback)
                        {
                            listeners.splice(index, 1);
                            eventListener.callback = null;
                            if (listeners.length == 0)
                            {
                                delete this._eventListenerTable[type];
                            }
                            return;
                        }
                        index++;
                    }
                }
            }
        }

        public function dispatchEvent(event:WindowEvent):Boolean
        {
            if (!this._disposed)
            {
                this._result = EVENT_RESULT_TRUE;
                var listeners:Array = this._eventListenerTable[event.type];
                if (listeners)
                {
					var callbacks:Array = [];
                    for each (var eventListener:EventListenerStruct in listeners)
                    {
                        callbacks.push(eventListener.callback);
                    }
                    while (callbacks.length > 0)
                    {
                        var callback:Function = callbacks.shift();
                        (callback(event));
                    }
                }
                this._result = ((event.isDefaultPrevented()) ? EVENT_RESULT_FALSE : EVENT_RESULT_TRUE);
                return this._result == EVENT_RESULT_TRUE;
            }
            return false;
        }

        public function hasEventListener(type:String):Boolean
        {
            return (this._disposed) ? false : (!(this._eventListenerTable[type] == null));
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                for (var key:Object in this._eventListenerTable)
                {
                    var listeners:Array = (this._eventListenerTable[key] as Array);
                    for each (var eventListener:EventListenerStruct in listeners)
                    {
                        eventListener.callback = null;
                    }
                    delete this._eventListenerTable[key];
                }
                this._eventListenerTable = null;
                this._disposed = true;
            }
        }
    }
}
