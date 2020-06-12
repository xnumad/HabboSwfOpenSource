package com.sulake.habbo.room.object.visualization.furniture
{
    import flash.events.ErrorEvent;
    import flash.display.Loader;
    import flash.system.LoaderContext;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.events.SecurityErrorEvent;
    import flash.net.URLRequest;
    import com.sulake.core.runtime.exceptions.Exception;
    import flash.display.LoaderInfo;
    import flash.display.Bitmap;

    public class ExternalIsometricImageFurniVisualization extends IsometricImageFurniVisualization
    {
        private var _thumbnailUrl:String = null;


        private static function onThumbnailError(k:ErrorEvent):void
        {
            Logger.log(("External Image thumbnail download error: " + k.toString()));
        }


        override protected function updateModel(k:Number):Boolean
        {
            var _local_2:String;
            var _local_3:Loader;
            var _local_4:LoaderContext;
            if (object != null)
            {
                _local_2 = this.getThumbnailURL();
                if (this._thumbnailUrl != _local_2)
                {
                    this._thumbnailUrl = _local_2;
                    if (((!(this._thumbnailUrl == null)) && (!(this._thumbnailUrl == ""))))
                    {
                        _local_3 = new Loader();
                        _local_3.name = _local_2;
                        _local_3.contentLoaderInfo.addEventListener(Event.COMPLETE, this.onThumbnailLoaded);
                        _local_3.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onThumbnailError);
                        _local_3.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onThumbnailError);
                        _local_4 = new LoaderContext(true);
                        _local_4.checkPolicyFile = true;
                        _local_3.load(new URLRequest(_local_2), _local_4);
                    }
                    else
                    {
                        setThumbnailImages(null);
                    }
                }
            }
            return super.updateModel(k);
        }

        protected function getThumbnailURL():String
        {
            throw (new Exception("This method must be overridden!"));
        }

        private function onThumbnailLoaded(k:Event):void
        {
            var _local_2:LoaderInfo = (k.target as LoaderInfo);
            var _local_3:Bitmap = (_local_2.content as Bitmap);
            if (_local_3 != null)
            {
                setThumbnailImages(_local_3.bitmapData);
            }
            else
            {
                setThumbnailImages(null);
            }
        }
    }
}
