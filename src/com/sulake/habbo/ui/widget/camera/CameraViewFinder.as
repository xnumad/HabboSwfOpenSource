package com.sulake.habbo.ui.widget.camera
{
    import com.sulake.core.runtime.IUpdateReceiver;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.communication.messages.outgoing.camera.RenderRoomMessageComposer;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.display.Loader;
    import com.sulake.core.window.IWindow;
    import flash.display.BitmapData;
    import flash.geom.Matrix;
    import flash.geom.Rectangle;
    import flash.utils.getTimer;
    import com.sulake.habbo.tracking.HabboTracking;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import adobe.serialization.json.JSON;
    import flash.net.URLLoader;
    import flash.events.Event;
    import flash.net.SharedObject;
    import flash.utils.ByteArray;
    import __AS3__.vec.*;

    public class CameraViewFinder implements IUpdateReceiver 
    {
        private static const _Str_10216:Number = 350;
        private static const _Str_5206:int = 5;
        private static var _Str_7234:Boolean = false;
        private static var _Str_3638:Vector.<CameraSlotData> = new Vector.<CameraSlotData>(_Str_5206);
        private static var _Str_15112:Vector.<RenderRoomMessageComposer> = new Vector.<RenderRoomMessageComposer>(_Str_5206);

        private var _widget:CameraWidget;
        private var _window:IWindowContainer;
        private var _disposed:Boolean = false;
        private var _Str_2726:IBitmapWrapperWindow;
        private var _Str_5658:IBitmapWrapperWindow;
        private var _Str_17640:int;
        private var _Str_21362:int;
        private var _Str_17681:Boolean = false;
        private var _Str_3290:int = 0;
        private var _Str_20180:Boolean = false;
        private var _Str_2835:Loader;
        private var _Str_15606:uint = 0;

        public function CameraViewFinder(k:CameraWidget)
        {
            var _local_3:IWindow;
            super();
            this._widget = k;
            this._Str_25311();
            this._Str_3290 = 0;
            while (this._Str_3290 < _Str_5206)
            {
                this._Str_19622(true);
                this._Str_3290++;
            }
            this._Str_3290 = 0;
            var _local_2:Boolean = this._Str_23872();
            if (_local_2)
            {
                _local_3 = this._window.findChildByName("slot_container");
                _local_3.visible = true;
            }
            this._Str_6381(false);
            this._Str_9922(0);
            this._Str_5658 = (this._window.findChildByName("flash") as IBitmapWrapperWindow);
            this._Str_5658.bitmap = new BitmapData(this._Str_5658.width, this._Str_5658.height, false, 0xFFFFFF);
            this._Str_5658.visible = false;
        }

        public function dispose():void
        {
            if (this._disposed)
            {
                return;
            }
            this._Str_5658 = null;
            this._Str_2726 = null;
            this._widget.component.removeUpdateReceiver(this);
            if (this._window)
            {
                this._window.dispose();
                this._window = null;
            }
            this._disposed = true;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        private function _Str_25311():void
        {
            if (this._window != null)
            {
                return;
            }
            this._window = (this._widget.getXmlWindow("camera_interface") as IWindowContainer);
            this._window.center();
            this._window.visible = false;
            this._Str_2726 = (this._window.findChildByName("image") as IBitmapWrapperWindow);
            this._Str_17640 = this._Str_2726.width;
            this._Str_21362 = this._Str_2726.height;
            this._Str_2726.visible = true;
            this._window.procedure = this.windowProcedure;
        }

        public function update(k:uint):void
        {
            if (this._Str_17681)
            {
                return;
            }
            if (this._Str_2726.bitmap == null)
            {
                this._Str_2726.bitmap = new BitmapData(this._Str_17640, this._Str_21362, false, 0);
            }
            this._Str_2726.bitmap.fillRect(this._Str_2726.bitmap.rect, this._widget.handler.roomDesktop.roomBackgroundColor);
            var _local_2:Matrix = new Matrix();
            var _local_3:Rectangle = this._Str_14786();
            _local_2.translate(-(_local_3.x), -(_local_3.y));
            this._widget._Str_23027(this._Str_2726.bitmap, _local_2, false);
            this._Str_2726.invalidate();
            if (this._Str_15606 > 0)
            {
                this._Str_23953();
            }
        }

        private function _Str_23953():void
        {
            this._Str_5658.visible = true;
            var k:Number = (getTimer() - this._Str_15606);
            var _local_2:Number = ((_Str_10216 - k) / _Str_10216);
            this._Str_5658.blend = _local_2;
            if (k > _Str_10216)
            {
                this._Str_15606 = 0;
                this._Str_5658.visible = false;
            }
        }

        public function _Str_14786():Rectangle
        {
            var k:IWindow = (this._window as IWindow);
            return new Rectangle((this._window.x + this._Str_2726.x), (this._window.y + this._Str_2726.y), this._Str_2726.width, this._Str_2726.height);
        }

        public function _Str_22715(k:String):void
        {
            if (this._window.visible)
            {
                this.hide();
            }
            else
            {
                HabboTracking.getInstance().trackEventLog("Stories", "camera", "stories.camera.opened", k);
                this.show();
                this._Str_6381(false);
            }
        }

        public function show():void
        {
            this._window.visible = true;
            this._window.center();
            this._widget.component.registerUpdateReceiver(this, 100);
        }

        public function hide():void
        {
            this._window.visible = false;
            this._widget.component.removeUpdateReceiver(this);
        }

        private function windowProcedure(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:IStaticBitmapWrapperWindow;
            var _local_4:RenderRoomMessageComposer;
            var _local_5:IWindow;
            var _local_6:String;
            var _local_7:CameraSlotData;
            var _local_8:int;
            if (_arg_2.name == "button_release")
            {
                _local_3 = IStaticBitmapWrapperWindow(this._window.findChildByName("release_bitmap"));
                switch (k.type)
                {
                    case WindowMouseEvent.DOWN:
                        _local_3.assetUri = "camera_camera_btn_down";
                        break;
                    case WindowMouseEvent.UP:
                        _local_3.assetUri = "camera_cam_btn_hi";
                        break;
                    case WindowMouseEvent.OVER:
                        _local_3.assetUri = "camera_cam_btn_hi";
                        break;
                    case WindowMouseEvent.OUT:
                        _local_3.assetUri = "camera_camera_btn";
                        break;
                }
            }
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            switch (k.target.name)
            {
                case "header_button_close":
                    this.hide();
                    break;
                case "button_editor":
                    this.hide();
                    this._widget._Str_24657(this._Str_2726.bitmap.clone());
                    break;
                case "delete_photo_button":
                    this._Str_19622();
                    this._Str_6381(false);
                    break;
                case "header_button_help":
                    this._widget.component.context.createLinkEvent("habbopages/camera");
                    break;
                case "button_release":
                    if (this._Str_17681)
                    {
                        this._Str_6381(false);
                    }
                    else
                    {
                        this._widget._Str_23751();
                        //_local_4 = this._widget.handler.collectPhotoData();
                        //if (((!(_local_4 == null)) && (_local_4.isSendable())))
                        //{
                            //_Str_15112[this._Str_3290] = _local_4;
                            this._Str_16078(this._Str_2726.bitmap.clone());
                            this._Str_15606 = getTimer();
                            HabboTracking.getInstance().trackEventLog("Stories", "camera", "stories.photo.taken");
                            _local_5 = this._window.findChildByName("slot_container");
                            _local_5.visible = true;
                        /*}
                        else
                        {
                            //this._widget.windowManager.alert("${generic.alert.title}", "${camera.alert.too_much_stuff}", 0, null);
                        }*/
                    }
                    break;
            }
            if (k.target.name.indexOf("cameraButton_") != -1)
            {
                _local_6 = k.target.name.charAt((k.target.name.length - 1));
                if (_Str_3638[int(_local_6)].isEmpty)
                {
                    this._Str_9922(int(_local_6));
                    this._Str_6381(false);
                    return;
                }
                _local_7 = _Str_3638[int(_local_6)];
                this._Str_2726.bitmap = _local_7.image.clone();
                this._Str_6381(true);
                this._Str_9922(int(_local_6));
            }
            if (k.target.name.indexOf("chooseSlotButton_") != -1)
            {
                _local_8 = int(k.target.name.charAt((k.target.name.length - 1)));
                if (_Str_3638.length < _local_8)
                {
                    return;
                }
                this._Str_9922(_local_8);
                this._Str_6381(false);
            }
        }

        private function _Str_9922(k:int):void
        {
            (this._window.findChildByName(("slotImage_" + this._Str_3290)) as IStaticBitmapWrapperWindow).assetUri = "camera_arrow_gray";
            this._Str_3290 = k;
            (this._window.findChildByName(("slotImage_" + this._Str_3290)) as IStaticBitmapWrapperWindow).assetUri = "camera_arrow_green";
            var _local_2:IWindow = this._window.findChildByName("photo_border");
            var _local_3:IWindow = this._window.findChildByName(("cameraButton_" + this._Str_3290));
            _local_2.x = ((_local_3.x - 1) + _local_3.parent.x);
            _local_2.y = ((_local_3.y - 3) + _local_3.parent.y);
            _local_2.visible = true;
            var _local_4:IWindow = this._window.findChildByName("delete_photo_button");
            _local_4.y = _local_2.y;
            _local_4.x = (_local_2.right - _local_4.width);
        }

        private function _Str_6381(k:Boolean):void
        {
            this._Str_17681 = k;
            var _local_2:IWindow = this._window.findChildByName("button_editor");
            var _local_3:IWindow = this._window.findChildByName("camera_crosshair");
            var _local_4:IWindow = this._window.findChildByName("photo_date");
            var _local_5:IWindow = this._window.findChildByName("photo_roomname");
            var _local_6:IWindow = this._window.findChildByName("buyButtonBg");
            _local_4.visible = (_local_5.visible = false);
            var _local_7:IWindow = this._window.findChildByName("delete_photo_button");
            _local_3.visible = (!(k));
            _local_7.visible = (_local_2.visible = (_local_6.visible = k));
        }

        private function onPurchaseError(event:Event):void
        {
            var data:Object;
            try
            {
                data = adobe.serialization.json.JSON.decode(URLLoader(event.target).data);
                switch (data.error.code)
                {
                    case "PURCHASING_FAILED":
                        this._widget.windowManager.alert("Something went wrong", "sorry, purhcase failed. We will investigate the issue. #code 1", 0, null);
                        break;
                    case "MODERATED":
                        this._widget.windowManager.alert("Inappropriate text", "Your photo caption contained inappropriate words. They were changed to bobba. Please edit the text and try again.", 0, null);
                        this._widget._Str_25345(data.error.message, true);
                        break;
                }
            }
            catch(error:Error)
            {
                _widget.windowManager.alert("Something went wrong", "sorry, purhcase failed. We will investigate the issue. # code 2", 0, null);
            }
        }

        private function _Str_23872():Boolean
        {
            var k:Boolean;
            var _local_2:int;
            while (_local_2 < _Str_3638.length)
            {
                if (_Str_3638[_local_2].isEmpty == false)
                {
                    this._Str_20905(_local_2, _Str_3638[_local_2]);
                    k = true;
                }
                _local_2++;
            }
            return k;
        }

        private function _Str_20905(k:int, _arg_2:CameraSlotData):void
        {
            var _local_3:IBitmapWrapperWindow = (this._window.findChildByName(("cameraSlot_" + k)) as IBitmapWrapperWindow);
            _local_3.bitmap = new BitmapData(_local_3.width, _local_3.height, false, 0);
            var _local_4:Number = ((_local_3.width - 2) / this._Str_17640);
            var _local_5:Matrix = new Matrix();
            _local_5.scale(_local_4, _local_4);
            _local_5.tx = (_local_5.ty = 1);
            _local_3.bitmap.draw(_arg_2.image, _local_5, null, null, null, true);
        }

        private function _Str_24191():Boolean
        {
            var so:SharedObject;
            try
            {
                so = SharedObject.getLocal(("camera_image_" + this._Str_3290));
            }
            catch(error:Error)
            {
                return false;
            }
            if (((so.size == 0) || (!(so.data))))
            {
                return false;
            }
            var data:ByteArray = (so.data.photo as ByteArray);
            if (!data)
            {
                return false;
            }
            if (!this._Str_2835)
            {
                this._Str_2835 = new Loader();
            }
            this._Str_2835.loadBytes(data);
            this._Str_2835.contentLoaderInfo.addEventListener(Event.COMPLETE, this._Str_23080);
            var slotData:CameraSlotData = new CameraSlotData();
            slotData._Str_16123(new Date());
            if (int(so.data.date) > 0)
            {
                slotData._Str_16123(new Date(int(so.data.date)));
            }
            _Str_3638[this._Str_3290] = slotData;
            return true;
        }

        private function _Str_23080(k:Event):void
        {
            var _local_2:BitmapData = new BitmapData(this._Str_2835.width, this._Str_2835.height, false);
            _local_2.draw(this._Str_2835);
            _Str_3638[this._Str_3290].image = _local_2.clone();
            this._Str_16078(_local_2, false, true);
            if (((this._Str_3290 < _Str_5206) && (this._Str_20180)))
            {
                this._Str_24191();
                if (this._Str_3290 == (_Str_5206 - 1))
                {
                    this._Str_20180 = false;
                }
            }
            else
            {
                _Str_7234 = true;
            }
        }

        private function _Str_25594():int
        {
            var k:int;
            while (k < _Str_3638.length)
            {
                if (_Str_3638[k].isEmpty)
                {
                    return k;
                }
                k++;
            }
            return -1;
        }

        private function _Str_19622(k:Boolean=false):void
        {
            if ((((k) && (_Str_3638[this._Str_3290])) && (!(_Str_3638[this._Str_3290].isEmpty))))
            {
                return;
            }
            _Str_3638[this._Str_3290] = null;
            this._Str_16078(new BitmapData(320, 320, false, 0xD2D2D2), true);
            this._Str_2726.bitmap = _Str_3638[this._Str_3290].image.clone();
            this._Str_6381(false);
        }

        private function _Str_16078(k:BitmapData, _arg_2:Boolean=false, _arg_3:Boolean=false):void
        {
            var _local_5:int;
            var _local_4:CameraSlotData = new CameraSlotData();
            _local_4.image = k;
            if (_arg_2)
            {
                _local_4.isEmpty = true;
            }
            else
            {
                _local_4._Str_16123(new Date());
                _local_4.isEmpty = false;
            }
            if ((((!(_arg_3)) && (!(_arg_2))) || (_Str_3638[this._Str_3290] == null)))
            {
                _Str_3638[this._Str_3290] = _local_4;
            }
            this._Str_20905(this._Str_3290, _local_4);
            if (!_arg_2)
            {
                _local_5 = this._Str_25594();
                if (_local_5 >= 0)
                {
                    this._Str_9922(_local_5);
                }
                else
                {
                    if (((!(_Str_7234)) && (!(_arg_3))))
                    {
                        this._widget.windowManager.alert(this._widget.localizations.getLocalization("camera.full.header"), this._widget.localizations.getLocalization("camera.full.body"), 0, null);
                        _Str_7234 = true;
                    }
                }
            }
        }

        public function getRenderRoomMessage():RenderRoomMessageComposer
        {
            return _Str_15112[this._Str_3290];
        }
    }
}
