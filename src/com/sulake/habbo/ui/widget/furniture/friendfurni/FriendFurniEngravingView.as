package com.sulake.habbo.ui.widget.furniture.friendfurni
{
    import com.sulake.habbo.avatar.IAvatarImageListener;
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.room.object.data.StringArrayStuffData;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.core.window.components.IDisplayObjectWrapper;
    import flash.display.BitmapData;
    import flash.geom.Point;
    import flash.display.Bitmap;
    import com.sulake.core.window.IWindow;
    import flash.errors.IllegalOperationError;
    import com.sulake.habbo.avatar.IAvatarImage;
    import com.sulake.habbo.avatar.enum.AvatarScaleType;
    import com.sulake.habbo.avatar.enum.AvatarSetType;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;

    public class FriendFurniEngravingView implements IAvatarImageListener, IDisposable 
    {
        private var _stuffData:StringArrayStuffData;
        private var _widget:FriendFurniEngravingWidget;
        private var _window:IWindowContainer = null;
        private var _disposed:Boolean = false;

        public function FriendFurniEngravingView(k:FriendFurniEngravingWidget, _arg_2:StringArrayStuffData)
        {
            this._widget = k;
            this._stuffData = _arg_2;
        }

        private static function _Str_2972(k:IWindow, _arg_2:BitmapData, _arg_3:int=0, _arg_4:int=0, _arg_5:int=0):void
        {
            var _local_9:IBitmapWrapperWindow;
            var _local_10:IDisplayObjectWrapper;
            if (_arg_2 == null)
            {
                return;
            }
            if (k == null)
            {
                return;
            }
            if (k.disposed)
            {
                return;
            }
            var _local_6:int = ((_arg_3 > 0) ? _arg_3 : k.height);
            var _local_7:int = (((k.width - _arg_2.width) / 2) + _arg_4);
            var _local_8:int = (((_local_6 - _arg_2.height) / 2) + _arg_5);
            if ((k as IBitmapWrapperWindow) != null)
            {
                _local_9 = IBitmapWrapperWindow(k);
                if (((_local_9.bitmap == null) || (_arg_3 > 0)))
                {
                    _local_9.bitmap = new BitmapData(k.width, _local_6, true, 0);
                }
                _local_9.bitmap.fillRect(_local_9.bitmap.rect, 0);
                _local_9.bitmap.copyPixels(_arg_2, _arg_2.rect, new Point(_local_7, _local_8), null, null, false);
                k.invalidate();
            }
            else
            {
                if ((k as IDisplayObjectWrapper) != null)
                {
                    _local_10 = IDisplayObjectWrapper(k);
                    _local_10.setDisplayObject(new Bitmap(_arg_2));
                }
            }
        }


        protected function get stuffData():StringArrayStuffData
        {
            return this._stuffData;
        }

        protected function get widget():FriendFurniEngravingWidget
        {
            return this._widget;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function dispose():void
        {
            if (!this.disposed)
            {
                this._Str_2669();
                this._widget = null;
                this._stuffData = null;
                this._disposed = true;
            }
        }

        public function open():void
        {
            this.createWindow();
        }

        public function close():void
        {
            this._Str_2669();
        }

        protected function assetName():String
        {
            throw (new IllegalOperationError("Must implement in concrete view!"));
        }

        private function createWindow():void
        {
            var k:IAvatarImage;
            var _local_2:IAvatarImage;
            if (!this._window)
            {
                this._window = IWindowContainer(this.widget.windowManager.buildFromXML(XML(this.widget.assets.getAssetByName(this.assetName()).content)));
                this._window.procedure = this._Str_12416;
                this._window.center();
                this._window.findChildByName("name_left").caption = this.stuffData.getValue(1);
                this._window.findChildByName("name_right").caption = this.stuffData.getValue(2);
                this._window.findChildByName("date").caption = this.stuffData.getValue(5);
                k = this.widget._Str_11963.container.avatarRenderManager.createAvatarImage(this.stuffData.getValue(3), AvatarScaleType.LARGE, null, this);
                _local_2 = this.widget._Str_11963.container.avatarRenderManager.createAvatarImage(this.stuffData.getValue(4), AvatarScaleType.LARGE, null, this);
                if (!k.isPlaceholder())
                {
                    this._Str_7967("avatar_left", k._Str_818(AvatarSetType.FULL));
                }
                if (!_local_2.isPlaceholder())
                {
                    _local_2.setDirection(AvatarSetType.FULL, 4);
                    this._Str_7967("avatar_right", _local_2._Str_818(AvatarSetType.FULL));
                }
            }
        }

        public function _Str_840(k:String):void
        {
            var _local_2:IAvatarImage;
            var _local_3:IAvatarImage;
            if (k == this.stuffData.getValue(3))
            {
                _local_2 = this.widget._Str_11963.container.avatarRenderManager.createAvatarImage(this.stuffData.getValue(3), AvatarScaleType.LARGE, null, this);
                this._Str_7967("avatar_left", _local_2._Str_818(AvatarSetType.FULL));
            }
            if (k == this.stuffData.getValue(4))
            {
                _local_3 = this.widget._Str_11963.container.avatarRenderManager.createAvatarImage(this.stuffData.getValue(4), AvatarScaleType.LARGE, null, this);
                _local_3.setDirection(AvatarSetType.FULL, 4);
                this._Str_7967("avatar_right", _local_3._Str_818(AvatarSetType.FULL));
            }
        }

        private function _Str_7967(k:String, _arg_2:BitmapData):void
        {
            var _local_3:IBitmapWrapperWindow = IBitmapWrapperWindow(this._window.findChildByName(k));
            _Str_2972(_local_3, _arg_2, 0, 0, 0);
        }

        private function _Str_2669():void
        {
            if (this._window)
            {
                this._window.dispose();
                this._window = null;
            }
        }

        private function _Str_12416(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                switch (_arg_2.name)
                {
                    case "header_button_close":
                        this.widget.close(this.widget.stuffId);
                        return;
                }
            }
        }
    }
}
