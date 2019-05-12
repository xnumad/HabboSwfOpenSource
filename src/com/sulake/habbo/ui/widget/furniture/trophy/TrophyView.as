package com.sulake.habbo.ui.widget.furniture.trophy
{
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.display.BitmapData;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.events.WindowMouseEvent;

    public class TrophyView implements ITrophyView 
    {
        private static const _Str_18501:Array = new Array("trophy_bg_gold", "trophy_bg_silver", "trophy_bg_bronze");
        private static const _Str_16117:Array = new Array(4293707079, 4291411404, 4290279476);

        private var _widget:ITrophyFurniWidget;
        private var _window:IWindowContainer;

        public function TrophyView(k:ITrophyFurniWidget)
        {
            this._widget = k;
        }

        public function dispose():void
        {
            if (this._window)
            {
                this._window.dispose();
                this._window = null;
            }
            this._widget = null;
        }

        public function _Str_3030():Boolean
        {
            var _local_3:IWindow;
            var _local_4:IWindowContainer;
            var _local_5:ITextWindow;
            var _local_6:ITextWindow;
            var _local_7:ITextWindow;
            var _local_8:BitmapDataAsset;
            var _local_9:BitmapData;
            var _local_10:IBitmapWrapperWindow;
            var k:IAsset = this._widget.assets.getAssetByName("trophy");
            var _local_2:XmlAsset = XmlAsset(k);
            if (_local_2 == null)
            {
                return false;
            }
            if (this._window == null)
            {
                this._window = (this._widget.windowManager.buildFromXML((_local_2.content as XML)) as IWindowContainer);
            }
            this._window.center();
            _local_3 = this._window.findChildByName("close");
            if (_local_3 != null)
            {
                _local_3.addEventListener(WindowMouseEvent.CLICK, this._Str_3132);
            }
            _local_4 = (this._window.findChildByName("title_bg") as IWindowContainer);
            if (_local_4 != null)
            {
                _local_4.color = _Str_16117[this._widget.color];
            }
            _local_5 = (this._window.findChildByName("greeting") as ITextWindow);
            if (_local_5 != null)
            {
                _local_5.text = this._widget.message.replace(/\\r/g, "\n");
            }
            _local_6 = (this._window.findChildByName("date") as ITextWindow);
            if (_local_6 != null)
            {
                _local_6.text = this._widget.date;
            }
            _local_7 = (this._window.findChildByName("name") as ITextWindow);
            if (_local_7 != null)
            {
                _local_7.text = this._widget.name;
            }
            _local_8 = (this._widget.assets.getAssetByName(_Str_18501[this._widget.color]) as BitmapDataAsset);
            _local_10 = (this._window.findChildByName("trophy_bg") as IBitmapWrapperWindow);
            if (_local_8 != null)
            {
                _local_9 = (_local_8.content as BitmapData);
                _local_10.bitmap = _local_9;
            }
            return true;
        }

        public function _Str_7493():void
        {
            if (this._window != null)
            {
                this._window.dispose();
                this._window = null;
            }
        }

        private function _Str_3132(k:WindowMouseEvent):void
        {
            this._Str_7493();
        }
    }
}



