package com.sulake.core.assets.loaders
{
    import flash.net.URLRequest;
    import flash.utils.ByteArray;
    import flash.events.Event;
    import com.probertson.utils.GZIPBytesEncoder;
    import flash.errors.IllegalOperationError;

    public class TextFileLoader extends BinaryFileLoader implements IAssetLoader 
    {
        public function TextFileLoader(type:String, urlRequest:URLRequest=null, cacheKey:String=null, cacheRevision:int=-1, buffer:ByteArray=null, id:int=-1)
        {
            super(type, urlRequest, cacheKey, cacheRevision, buffer, id);
        }

        override protected function retry():Boolean
        {
            if (!_disposed)
            {
                if (++_retries <= _attempts)
                {
                    try
                    {
                        _loader.close();
                    }
                    catch(e:Error)
                    {
                    }
                    _loader.load(new URLRequest((((_url + ((_url.indexOf("?") == -1) ? "?" : "&")) + "retry=") + _retries)));
                    return true;
                }
            }
            return false;
        }

        override protected function loadEventHandler(event:Event):void
        {
            if (event.type == Event.COMPLETE)
            {
                this.unCompress();
            }
            super.loadEventHandler(event);
        }

        private function unCompress():void
        {
            var data:String = "";
            if ((_loader.data is ByteArray))
            {
                var byteArray:ByteArray = (_loader.data as ByteArray);
                if (byteArray.length == 0)
                {
                    data = "";
                }
                else
                {
                    try
                    {
                        var encoder:GZIPBytesEncoder = new GZIPBytesEncoder();
                        data = encoder.uncompressToByteArray(byteArray).toString();
                    }
                    catch(error:IllegalOperationError)
                    {
                        byteArray.position = 0;
                        data = byteArray.readUTFBytes(byteArray.length);
                    }
                }
                byteArray.clear();
            }
            else
            {
                data = (_loader.data as String);
            }
            _loader.data = data;
        }
    }
}
