package com.sulake.core.assets.loaders
{
    import com.sulake.core.runtime.events.EventDispatcherWrapper;
    import com.sulake.core.runtime.IDisposable;
    import flash.events.HTTPStatusEvent;
    import com.sulake.core.assets.loaders.AssetLoaderEvent;
    import flash.events.Event;
    import flash.events.ProgressEvent;
    import flash.events.IOErrorEvent;
    import flash.events.SecurityErrorEvent;

    internal class AssetLoaderEventBroker extends EventDispatcherWrapper implements IDisposable 
    {
        public static const NONE:uint = 0;
        public static const IO_ERROR:uint = 1;
        public static const SECURITY_ERROR:uint = 2;

        protected var _status:int = 0;
        protected var _retries:int = 0;
        protected var _attempts:int = 2;
        protected var _errorCode:uint = 0;

        public function get errorCode():uint
        {
            return this._errorCode;
        }

        protected function loadEventHandler(event:Event):void
        {
			try
			{
            switch (event.type)
            {
                case HTTPStatusEvent.HTTP_STATUS:
                    this._status = HTTPStatusEvent(event).status;
                    dispatchEvent(new AssetLoaderEvent(AssetLoaderEvent.ASSETLOADEREVENTSTATUS, this._status));
                    return;
                case Event.COMPLETE:
                    dispatchEvent(new AssetLoaderEvent(AssetLoaderEvent.ASSETLOADEREVENTCOMPLETE, this._status));
                    return;
                case Event.UNLOAD:
                    dispatchEvent(new AssetLoaderEvent(AssetLoaderEvent.ASSETLOADEREVENTUNLOAD, this._status));
                    return;
                case Event.OPEN:
                    dispatchEvent(new AssetLoaderEvent(AssetLoaderEvent.ASSETLOADEREVENTOPEN, this._status));
                    return;
                case ProgressEvent.PROGRESS:
                    dispatchEvent(new AssetLoaderEvent(AssetLoaderEvent.ASSETLOADEREVENTPROGRESS, this._status));
                    return;
                case IOErrorEvent.IO_ERROR:
                    this._errorCode = IO_ERROR;
                    if (!this.retry())
                    {
                        dispatchEvent(new AssetLoaderEvent(AssetLoaderEvent.ASSETLOADEREVENTERROR, this._status));
                    }
                    return;
                case SecurityErrorEvent.SECURITY_ERROR:
                    this._errorCode = SECURITY_ERROR;
                    if (!this.retry())
                    {
                        dispatchEvent(new AssetLoaderEvent(AssetLoaderEvent.ASSETLOADEREVENTERROR, this._status));
                    }
                    return;
            }
			}
			catch (error: Error)
			{
				Habbo.trackLoginStep("loadEventHandler failed " + event.target() + "|" + event.toString() + "|" + error.message + "|" + error.getStackTrace());
			}
        }

        protected function retry():Boolean
        {
            return false;
        }
    }
}
