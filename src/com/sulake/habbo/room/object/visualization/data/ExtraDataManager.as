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

        private var inputVisualizationQueue:Vector.<FurnitureExternalImageVisualization>;
        private var outputVisualizationQueue:Vector.<FurnitureExternalImageVisualization>;

        public function ExtraDataManager()
        {
            this.inputVisualizationQueue = new Vector.<FurnitureExternalImageVisualization>();
            this.outputVisualizationQueue = new Vector.<FurnitureExternalImageVisualization>();
            super();
            this.setTimedBatchCheck();
        }

        private static function getInstance():ExtraDataManager
        {
            if (!instance)
            {
                instance = new (ExtraDataManager)();
            }
            return instance;
        }

        public static function requestExtraDataUrl(k:FurnitureExternalImageVisualization):void
        {
            getInstance().inputVisualizationQueue.push(k);
        }

        public static function furnitureDisposed(k:FurnitureExternalImageVisualization):void
        {
            getInstance().removeFurniFromManager(k);
        }


        private function setTimedBatchCheck():void
        {
            setInterval(this.handleBatch, 200);
        }

        private function removeFurniFromManager(k:FurnitureExternalImageVisualization):void
        {
            if (this.inputVisualizationQueue.indexOf(k) != -1)
            {
                this.inputVisualizationQueue.splice(this.inputVisualizationQueue.indexOf(k), 1);
            }
            if (this.outputVisualizationQueue.indexOf(k) != -1)
            {
                this.outputVisualizationQueue.splice(this.outputVisualizationQueue.indexOf(k), 1);
            }
        }

        private function handleBatch():void
        {
            var k:String;
            var _local_7:FurnitureExternalImageVisualization;
            var _local_8:String;
            if (this.inputVisualizationQueue.length == 0)
            {
                return;
            }
            var _local_2:Array = [];
            var _local_3:int;
            while (_local_3 < BATCH_MAX_QUERY_AMOUNT)
            {
                if (this.inputVisualizationQueue.length > 0)
                {
                    _local_7 = this.inputVisualizationQueue[0];
                    _local_8 = _local_7.getExternalImageUUID();
                    _local_2.push(_local_8);
                    k = _local_7.getExtraDataUrl();
                    this.outputVisualizationQueue.push(_local_7);
                    this.inputVisualizationQueue.splice(0, 1);
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
            _local_6.addEventListener(Event.COMPLETE, this.onExtraDataLoaded);
            _local_6.addEventListener(IOErrorEvent.IO_ERROR, this.onExtraDataError);
        }

        private function onExtraDataLoaded(event:Event):void
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
                        for each (visualization in this.outputVisualizationQueue)
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
                                this.removeFurniFromManager(visualization);
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

        private function onExtraDataError(k:IOErrorEvent):void
        {
            Logger.log(("Failed to load ExtraData batch " + k.toString()));
        }
    }
}
