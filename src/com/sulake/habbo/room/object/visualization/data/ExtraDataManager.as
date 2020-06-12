package com.sulake.habbo.room.object.visualization.data
{
    import __AS3__.vec.Vector;
    import com.sulake.habbo.room.object.visualization.furniture.FurnitureExternalImageVisualization;
    import flash.utils.setInterval;
    import flash.net.URLRequest;
    import flash.net.URLRequestMethod;
    import flash.net.URLLoader;
    import flash.net.URLLoaderDataFormat;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import __AS3__.vec.*;

    public class ExtraDataManager 
    {
        public static const REJECTED:String = "REJECTED";
        private static const BATCH_MAX_QUERY_AMOUNT:int = 50;
        private static var instance:ExtraDataManager;

        private var _Str_5833:Vector.<FurnitureExternalImageVisualization>;
        private var _Str_9149:Vector.<FurnitureExternalImageVisualization>;

        public function ExtraDataManager()
        {
            this._Str_5833 = new Vector.<FurnitureExternalImageVisualization>();
            this._Str_9149 = new Vector.<FurnitureExternalImageVisualization>();
            super();
            this._Str_22566();
        }

        private static function getInstance():ExtraDataManager
        {
            if (!instance)
            {
                instance = new (ExtraDataManager)();
            }
            return instance;
        }

        public static function _Str_23593(k:FurnitureExternalImageVisualization):void
        {
            getInstance()._Str_5833.push(k);
        }

        public static function _Str_22536(k:FurnitureExternalImageVisualization):void
        {
            getInstance()._Str_22217(k);
        }


        private function _Str_22566():void
        {
            setInterval(this._Str_25544, 200);
        }

        private function _Str_22217(k:FurnitureExternalImageVisualization):void
        {
            if (this._Str_5833.indexOf(k) != -1)
            {
                this._Str_5833.splice(this._Str_5833.indexOf(k), 1);
            }
            if (this._Str_9149.indexOf(k) != -1)
            {
                this._Str_9149.splice(this._Str_9149.indexOf(k), 1);
            }
        }

        private function _Str_25544():void
        {
            var k:String;
            var _local_7:FurnitureExternalImageVisualization;
            var _local_8:String;
            if (this._Str_5833.length == 0)
            {
                return;
            }
            var _local_2:Array = [];
            var _local_3:int;
            while (_local_3 < BATCH_MAX_QUERY_AMOUNT)
            {
                if (this._Str_5833.length > 0)
                {
                    _local_7 = this._Str_5833[0];
                    _local_8 = _local_7.getExternalImageUUID();
                    _local_2.push(_local_8);
                    k = _local_7.getExtraDataUrl();
                    this._Str_9149.push(_local_7);
                    this._Str_5833.splice(0, 1);
                }
                _local_3++;
            }
            if (_local_2.length == 0)
            {
                return;
            }
            var _local_4:URLRequest = new URLRequest();
            _local_4.method = URLRequestMethod.POST;
            _local_4.contentType = "application/json";
            var _local_5:String = JSON.stringify(_local_2);
            _local_4.data = _local_5;
            _local_4.url = k;
            var _local_6:URLLoader = new URLLoader(_local_4);
            _local_6.dataFormat = URLLoaderDataFormat.TEXT;
            _local_6.addEventListener(Event.COMPLETE, this.onImageLoaded);
            _local_6.addEventListener(IOErrorEvent.IO_ERROR, this.onExternalDataError);
        }

        private function onImageLoaded(event:Event):void
        {
            var result:Array;
            var obj:Object;
            var id:String;
            var visualization:FurnitureExternalImageVisualization;
            var data:String = event.currentTarget.data;
            if (((data) && (data.length > 0)))
            {
                try
                {
                    result = (JSON.parse(data) as Array);
                    for each (obj in result)
                    {
                        id = obj.id;
                        for each (visualization in this._Str_9149)
                        {
                            if (visualization.getExternalImageUUID() == id)
                            {
                                if (((obj.status) && (obj.status == REJECTED)))
                                {
                                    visualization.onUrlFromExtraDataService(REJECTED);
                                }
                                else
                                {
                                    visualization.onUrlFromExtraDataService(obj.url);
                                }
                                this._Str_22217(visualization);
                            }
                        }
                    }
                }
                catch(error:Error)
                {
                    Logger.log("Failed to read JSON from ExtraData service");
                }
            }
        }

        private function onExternalDataError(k:IOErrorEvent):void
        {
            Logger.log(("Failed to load ExtraData batch " + k.toString()));
        }
    }
}
