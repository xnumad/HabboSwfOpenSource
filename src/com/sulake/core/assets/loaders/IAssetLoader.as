package com.sulake.core.assets.loaders
{
    import flash.events.IEventDispatcher;
    import com.sulake.core.runtime.IDisposable;
    import flash.net.URLRequest;

    public interface IAssetLoader extends IEventDispatcher, IDisposable 
    {
        function get url():String;
        function get content():Object;
        function get mimeType():String;
        function get bytesLoaded():uint;
        function get bytesTotal():uint;
        function get errorCode():uint;
        function get cacheKey():String;
        function get cacheRevision():int;
        function get fromCache():Boolean;
        function get id():int;
        function load(urlRequest:URLRequest):void;
    }
}
