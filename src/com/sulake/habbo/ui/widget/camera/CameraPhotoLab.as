package com.sulake.habbo.ui.widget.camera
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.display.BitmapData;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.utils.Map;
    import com.sulake.core.window.components.IScrollableGridWindow;
    import flash.display.Sprite;
    import flash.net.FileReference;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.core.window.components.IFrameWindow;
    import flash.utils.setTimeout;
    import com.sulake.habbo.quest.IHabboQuestEngine;
    import com.sulake.core.window.components.IRegionWindow;
    import flash.geom.Matrix;
    import flash.display.Bitmap;
    import com.sulake.core.window.IWindow;
    import flash.display.PixelSnapping;
    import flash.geom.Point;
    import com.sulake.core.window.components.IDisplayObjectWrapper;
    import flash.events.MouseEvent;
    import com.sulake.core.window.components.IBorderWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.events.WindowKeyboardEvent;
    import com.sulake.habbo.tracking.HabboTracking;
    import com.sulake.habbo.communication.messages.incoming.camera.CameraPublishStatusMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.camera.CompetitionStatusMessageEvent;
    import flash.globalization.DateTimeFormatter;
    import com.sulake.habbo.utils.images.PNGEncoder;
    import flash.utils.ByteArray;
    import flash.globalization.LocaleID;
    import flash.geom.ColorTransform;
    import __AS3__.vec.Vector;
    import __AS3__.vec.*;

    public class CameraPhotoLab implements IDisposable 
    {
        private static var TEXT_WIDTH_MARGIN:int = 6;
        private static var _purchaseConfirmationDialog:PhotoPurchaseConfirmationDialog;

        private var _widget:CameraWidget;
        private var _window:IWindowContainer;
        private var _disposed:Boolean = false;
        private var _Str_2726:IBitmapWrapperWindow;
        private var _Str_15808:BitmapData;
        private var _Str_5076:CameraFxStrengthSlider;
        private var _Str_10873:ITextWindow;
        private var _Str_4049:CameraEffect;
        private var _Str_4335:Map;
        private var _itemGrid:IScrollableGridWindow;
        private var _Str_11677:Sprite;
        private var _Str_11626:Map;
        private var _Str_9410:int = 0;
        private var _Str_20612:String = "";
        private var _Str_15282:Boolean = false;
        private var _Str_2063:FileReference;

        public function CameraPhotoLab(k:CameraWidget)
        {
            this._Str_4335 = new Map();
            this._Str_11626 = new Map();
            this._Str_2063 = new FileReference();
            super();
            this._widget = k;
        }

        public static function _Str_23652(k:String, _arg_2:String, _arg_3:IHabboLocalizationManager):void
        {
            var _local_6:CameraEffect;
            var _local_4:Array = [];
            var _local_5:Map = CameraEffect._Str_6532(_arg_2, _arg_3);
            for each (_local_6 in _local_5)
            {
                if (((_local_6.type == CameraEffect.COMPOSITE) || (_local_6.type == CameraEffect.FRAME)))
                {
                    _local_4.push(_local_6.name);
                }
            }
            CameraFxPreloader.init(k, _local_4);
        }


        public function dispose():void
        {
            if (this._disposed)
            {
                return;
            }
            if (_purchaseConfirmationDialog)
            {
                _purchaseConfirmationDialog.hide();
            }
            CameraEffect._Str_21096();
            this._Str_15808 = null;
            this._widget = null;
            this._Str_2726 = null;
            if (this._Str_5076 != null)
            {
                this._Str_5076.dispose();
                this._Str_5076 = null;
            }
            this._Str_10873 = null;
            this._Str_4049 = null;
            this._Str_4335 = null;
            this._Str_11626 = null;
            this._disposed = true;
            if (this._window)
            {
                this._window.dispose();
            }
            this._window = null;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        private function _Str_25593(k:BitmapData):void
        {
            this._Str_15808 = k.clone();
            this._Str_2726.bitmap = k;
            this._Str_20969();
        }

        internal function _Str_21214(k:Number):void
        {
            if (this._Str_4049)
            {
                this._Str_4049.value = k;
                this._Str_19878();
                this._Str_15810();
            }
        }

        private function _Str_19878():void
        {
            this._Str_10873.text = (((this._Str_4049.description + " ") + int((this._Str_4049._Str_10615() * 100))) + "%");
            this._Str_10873.width = (this._Str_10873.textWidth + TEXT_WIDTH_MARGIN);
        }

        internal function _Str_19577(k:String):void
        {
            ITextWindow(this._window.findChildByName("captionInput")).text = k;
        }

        private function _Str_22684():void
        {
            if (this._Str_11626.length > 0)
            {
                return;
            }
            var k:int = ((this._window as IFrameWindow).margins.left + this._itemGrid.x);
            var _local_2:int = 6;
            var _local_3:int = 2;
            var _local_4:IWindowContainer = this._Str_22253(CameraEffect.COLORMATRIX, "camera_icon_colorfilter");
            _local_4.x = (k + ((this._itemGrid.width - ((_local_3 * (_local_4.width + _local_2)) - _local_2)) / 2));
            _local_4.y = 50;
            this._window.addChild(_local_4);
            var _local_5:IWindowContainer = this._Str_22253(CameraEffect.COMPOSITE, "camera_icon_compositefilter");
            _local_5.x = (_local_4.right + _local_2);
            _local_5.y = _local_4.y;
            this._window.addChild(_local_5);
        }

        private function _Str_20969():void
        {
            var _local_3:IWindowContainer;
            var _local_5:CameraEffect;
            var _local_6:IWindowContainer;
            var _local_7:String;
            if (CameraFxPreloader._Str_25462() == false)
            {
                setTimeout(this._Str_20969, 200);
            }
            var k:int;
            var _local_2:IHabboQuestEngine = this._widget.handler.roomDesktop.questEngine;
            if (_local_2 != null)
            {
                k = _local_2.getAchievementLevel("explore", "ACH_CameraPhotoCount");
            }
            var _local_4:Map = CameraEffect._Str_6532(this._widget.component.getProperty("camera.available.effects"), this._widget.localizations);
            for each (_local_5 in _local_4)
            {
                _local_3 = this._Str_22327(_local_5, this._Str_15808.clone(), k);
                if (_local_3)
                {
                    _local_7 = _local_5.description;
                    if (k < _local_5._Str_15852)
                    {
                        _local_7 = ((this._widget.localizations.getLocalization("camera.effect.required.level") + " ") + _local_5._Str_15852);
                    }
                    IRegionWindow(_local_3).toolTipCaption = _local_7;
                }
            }
            _local_6 = (this._window.findChildByName("slider_container") as IWindowContainer);
            this._Str_5076 = new CameraFxStrengthSlider(this, _local_6, this._widget.windowManager.assets);
            this._Str_5076.disable();
            CameraEffect._Str_24241(this._Str_5076.scale());
            this._Str_20709(CameraEffect.COLORMATRIX);
        }

        private function _Str_22253(k:String, _arg_2:String):IWindowContainer
        {
            var _local_3:IRegionWindow = (this._widget.getXmlWindow("camera_typebutton") as IRegionWindow);
            var _local_4:IBitmapWrapperWindow = (_local_3.findChildByName("icon") as IBitmapWrapperWindow);
            _local_4.bitmap = (this._widget.windowManager.assets.getAssetByName(_arg_2).content as BitmapData).clone();
            _local_3.name = ("typebutton," + k);
            _local_3.toolTipCaption = k;
            this._Str_11626.add(k, _local_3);
            return _local_3;
        }

        private function _Str_22327(k:CameraEffect, _arg_2:BitmapData, _arg_3:int):IWindowContainer
        {
            var _local_5:IBitmapWrapperWindow;
            var _local_6:Number;
            var _local_7:Matrix;
            var _local_8:Bitmap;
            var _local_9:IWindow;
            var _local_4:IWindowContainer = (this._widget.getXmlWindow("camera_filterbutton") as IWindowContainer);
            if (_arg_3 >= k._Str_15852)
            {
                _local_5 = (_local_4.findChildByName("content") as IBitmapWrapperWindow);
                _local_5.bitmap = new BitmapData(_local_5.width, _local_5.height, true, 0);
                _local_6 = (_local_5.width / _arg_2.width);
                _local_7 = new Matrix();
                _local_7.scale(_local_6, _local_6);
                _local_8 = new Bitmap(_arg_2, PixelSnapping.AUTO, true);
                switch (k.type)
                {
                    case CameraEffect.COLORMATRIX:
                        _arg_2.applyFilter(_arg_2, _arg_2.rect, new Point(0, 0), k._Str_20652(true));
                        break;
                    case CameraEffect.COMPOSITE:
                        if (CameraFxPreloader.getImage(k.name) == null)
                        {
                            return null;
                        }
                        _arg_2.draw(CameraFxPreloader.getImage(k.name), null, null, k._Str_16566, null, true);
                        break;
                    case CameraEffect.FRAME:
                        if (CameraFxPreloader.getImage(k.name) == null)
                        {
                            return null;
                        }
                        _arg_2.draw(CameraFxPreloader.getImage(k.name), null, null, null, null, true);
                        break;
                }
                _local_5.bitmap.draw(_local_8, _local_7, null, null, null, true);
                _local_4.procedure = this._Str_24762;
            }
            else
            {
                _local_9 = (_local_4.findChildByName("lock_indicator") as IWindow);
                _local_9.visible = true;
            }
            _local_4.name = k.name;
            k.button = _local_4;
            this._Str_4335[_local_4.name] = k;
            return _local_4;
        }

        public function _Str_23895(k:BitmapData):void
        {
            this._window = (this._widget.getXmlWindow("camera_editor") as IWindowContainer);
            this._window.center();
            if (this._widget.component.getProperty("camera.effects.enabled") != "true")
            {
                this.openPurchaseConfirmationDialog(null);
                return;
            }
            this._itemGrid = (this._window.findChildByName("item_grid") as IScrollableGridWindow);
            this._itemGrid.spacing = 7;
            this._Str_2726 = (this._window.findChildByName("image") as IBitmapWrapperWindow);
            this._window.procedure = this._Str_3545;
            var _local_2:ITextWindow = ITextWindow(this._window.findChildByName("captionInput"));
            _local_2.procedure = this._Str_23300;
            var _local_3:IDisplayObjectWrapper = (this._window.findChildByName("purchase_display_object") as IDisplayObjectWrapper);
            this._Str_11677 = new Sprite();
            this._Str_11677.graphics.beginFill(0xFF0000, 0);
            this._Str_11677.graphics.drawRect(0, 0, _local_3.width, _local_3.height);
            _local_3.setDisplayObject(this._Str_11677);
            this._Str_11677.addEventListener(MouseEvent.CLICK, this.openPurchaseConfirmationDialog);
            var _local_4:IRegionWindow = (this._window.findChildByName("zoom_button") as IRegionWindow);
            var _local_5:IBorderWindow = (_local_4.getChildByName("centerizer") as IBorderWindow);
            var _local_6:ITextWindow = (_local_5.getChildByName("zoom_text") as ITextWindow);
            _local_6.width = (_local_6.textWidth + TEXT_WIDTH_MARGIN);
            var _local_7:IRegionWindow = (this._window.findChildByName("save_button") as IRegionWindow);
            var _local_8:IBorderWindow = (_local_7.getChildByName("centerizer") as IBorderWindow);
            var _local_9:ITextWindow = (_local_8.getChildByName("save_text") as ITextWindow);
            _local_9.width = (_local_9.textWidth + TEXT_WIDTH_MARGIN);
            var _local_10:IDisplayObjectWrapper = (this._window.findChildByName("save_click_catcher") as IDisplayObjectWrapper);
            var _local_11:Sprite = new Sprite();
            _local_11.graphics.beginFill(0xFF0000, 0);
            _local_11.graphics.drawRect(0, 0, _local_10.width, _local_10.height);
            _local_10.setDisplayObject(_local_11);
            _local_11.addEventListener(MouseEvent.CLICK, this._Str_24738);
            this._Str_22684();
            this._Str_25593(k);
            this._Str_10873 = (this._window.findChildByName("slider_effect_info") as ITextWindow);
            CameraEffect._Str_21096();
        }

        private function _Str_24762(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:CameraEffect;
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            if (_arg_2.name == "remove_effect_button")
            {
                if (this._Str_4335.hasKey(_arg_2.parent.name))
                {
                    _local_3 = this._Str_4335[_arg_2.parent.name];
                    _local_3._Str_15771(false);
                    if (this._Str_4049 == _local_3)
                    {
                        this._Str_5076.disable();
                        this._Str_4049 = null;
                    }
                    this._Str_15810();
                    return;
                }
            }
            if (this._Str_4335.hasKey(_arg_2.name))
            {
                this._Str_23081(this._Str_4335[_arg_2.name]);
            }
        }

        private function _Str_23300(k:WindowEvent, _arg_2:IWindow):void
        {
            if (k.type == WindowKeyboardEvent.WINDOW_EVENT_KEY_DOWN)
            {
                if (((WindowKeyboardEvent(k).ctrlKey) || (WindowKeyboardEvent(k).charCode == 0)))
                {
                    this._Str_9410 = 0;
                }
                else
                {
                    this._Str_9410++;
                }
            }
            else
            {
                if (k.type == WindowKeyboardEvent.WINDOW_EVENT_KEY_UP)
                {
                    this._Str_9410 = 0;
                }
                else
                {
                    if (k.type == WindowEvent.WINDOW_EVENT_CHANGE)
                    {
                        if (this._Str_9410 == 1)
                        {
                            this._Str_20612 = ITextWindow(this._window.findChildByName("captionInput")).text;
                        }
                        else
                        {
                            this._Str_19577(this._Str_20612);
                        }
                        this._Str_9410 = 0;
                    }
                }
            }
        }

        private function openPurchaseConfirmationDialog(k:MouseEvent):void
        {
            if (_purchaseConfirmationDialog)
            {
                _purchaseConfirmationDialog.hide();
            }
            if (this._widget.container.sessionDataManager.isAccountSafetyLocked())
            {
                this._widget.windowManager.alert("${generic.alert.title}", "${notifications.text.safety_locked}", 0, null);
                if (this._widget.component.getProperty("camera.effects.enabled") != "true")
                {
                    this.dispose();
                }
                return;
            }
            _purchaseConfirmationDialog = new PhotoPurchaseConfirmationDialog(this._widget, ITextWindow(this._window.findChildByName("captionInput")).text);
            //var _local_2:Boolean = this._widget.sendPhotoData();
            _purchaseConfirmationDialog._Str_24882(this._widget.handler.creditPrice, this._widget.handler.ducketPrice, this._widget.handler.publishDucketPrice);
            HabboTracking.getInstance().trackEventLog("Stories", "camera", "stories.photo.purchase_dialog_opened");
            /*if (!_local_2)
            {
                _purchaseConfirmationDialog._Str_19543();
                this._widget.windowManager.alert("${generic.alert.title}", "${camera.alert.too_much_stuff}", 0, null);
            }*/
            this.hide();
        }

        public function hide():void
        {
            this._window.visible = false;
        }

        public function show():void
        {
            this._window.visible = true;
        }

        public function _Str_23866():void
        {
            if (_purchaseConfirmationDialog)
            {
                _purchaseConfirmationDialog.hide();
                _purchaseConfirmationDialog = null;
            }
        }

        internal function _Str_22386():void
        {
            if (_purchaseConfirmationDialog)
            {
                _purchaseConfirmationDialog._Str_22361();
            }
        }

        public function _Str_12205(k:CameraPublishStatusMessageEvent):void
        {
            if (_purchaseConfirmationDialog)
            {
                _purchaseConfirmationDialog._Str_12205(k);
            }
        }

        public function competitionStatus(k:CompetitionStatusMessageEvent):void
        {
            if (_purchaseConfirmationDialog)
            {
                _purchaseConfirmationDialog.competitionStatus(k);
            }
        }

        public function getPreviewImage():BitmapData
        {
            return this._Str_2726.bitmap.clone();
        }

        private function _Str_24738(k:MouseEvent):void
        {
            var _local_4:DateTimeFormatter;
            var _local_5:String;
            var _local_2:BitmapData = this._Str_2726.bitmap.clone();
            var _local_3:ByteArray = PNGEncoder.encode(_local_2);
            try
            {
                _local_4 = new DateTimeFormatter(LocaleID.DEFAULT);
                _local_4.setDateTimePattern("yyyy-MM-dd_HH-mm-ss");
                _local_5 = (("Habbo_" + _local_4.format(new Date())) + ".png");
                this._Str_2063.save(_local_3, _local_5);
            }
            catch(error:Error)
            {
            }
        }

        public function _Str_26201():void
        {
            var k:CameraEffect;
            for each (k in this._Str_4335)
            {
                if (k._Str_5966)
                {
                    HabboTracking.getInstance().trackEventLog("Stories", "camera", "stories.photo.effect.chosen", k.name);
                }
            }
        }

        private function _Str_3545(k:WindowEvent, _arg_2:IWindow):void
        {
            if ((((this._disposed) || (!(this._window))) || (!(k.type == WindowMouseEvent.CLICK))))
            {
                return;
            }
            switch (_arg_2.name)
            {
                case "cancel_button":
                    this._widget.startTakingPhoto("effectEditorCancel");
                    this.dispose();
                    break;
                case "header_button_close":
                    this.dispose();
                    break;
                case "help_button":
                    this._widget.component.context.createLinkEvent("habbopages/camera");
                    break;
                case "save_button":
                    break;
                case "slider_container":
                    break;
                case "zoom_button":
                    this._Str_15282 = (!(this._Str_15282));
                    this._Str_15810();
                    break;
                default:
                    this._Str_5076.disable();
                    if (this._Str_4049 != null)
                    {
                        this._Str_4049._Str_18911();
                    }
            }
            if (_arg_2.name.indexOf("typebutton") != -1)
            {
                this._Str_20709(_arg_2.name.split(",")[1]);
            }
        }

        private function _Str_23081(k:CameraEffect):void
        {
            if (this._Str_4049 != null)
            {
                this._Str_4049._Str_18911();
            }
            this._Str_4049 = k;
            this._Str_4049._Str_15771(true);
            if (k._Str_25234())
            {
                this._Str_5076.enable();
                this._Str_5076.setValue(k.value);
                this._Str_19878();
            }
            else
            {
                this._Str_5076.disable();
            }
            if (k._Str_20730())
            {
                this._Str_22494(k);
            }
            this._Str_15810();
        }

        private function _Str_22494(k:CameraEffect):void
        {
            var _local_2:CameraEffect;
            for each (_local_2 in this._Str_4335)
            {
                if (((_local_2.type == k.type) && (!(_local_2 == k))))
                {
                    _local_2._Str_15771(false);
                }
            }
        }

        private function _Str_20709(k:String):void
        {
            var _local_2:CameraEffect;
            if (this._Str_4049 != null)
            {
                this._Str_4049._Str_18911();
            }
            this._itemGrid.removeGridItems();
            for each (_local_2 in this._Str_4335)
            {
                if (_local_2.type == k)
                {
                    this._itemGrid.addGridItem(_local_2.button);
                }
            }
            this._Str_22699(k);
        }

        private function _Str_22699(k:String):void
        {
            var _local_2:IWindowContainer;
            var _local_3:IWindow;
            for each (_local_2 in this._Str_11626)
            {
                _local_3 = _local_2.findChildByName("active_border");
                _local_3.visible = (_local_2.name == ("typebutton," + k));
            }
        }

        private function _Str_15810():void
        {
            var k:ColorTransform;
            var _local_3:CameraEffect;
            var _local_4:CameraEffect;
            var _local_5:Matrix;
            var _local_6:BitmapData;
            var _local_2:BitmapData = this._Str_15808.clone();
            if (this._Str_15282)
            {
                _local_5 = new Matrix();
                _local_5.a = 2;
                _local_5.d = 2;
                _local_5.tx = (-(_local_2.width) / 2);
                _local_5.ty = (-(_local_2.height) / 2);
                _local_6 = new BitmapData(_local_2.width, _local_2.height);
                _local_6.draw(_local_2, _local_5);
                _local_2 = _local_6;
            }
            for each (_local_3 in this._Str_4335)
            {
                if (_local_3._Str_5966)
                {
                    if (_local_3.type == CameraEffect.COLORMATRIX)
                    {
                        _local_2.applyFilter(_local_2, _local_2.rect, new Point(0, 0), _local_3._Str_20652());
                    }
                    if (_local_3.type == CameraEffect.COMPOSITE)
                    {
                        k = new ColorTransform(1, 1, 1, _local_3._Str_10615());
                        _local_2.draw(CameraFxPreloader.getImage(_local_3.name), null, k, _local_3._Str_16566);
                    }
                }
            }
            for each (_local_4 in this._Str_4335)
            {
                if (((_local_4._Str_5966) && (_local_4.type == CameraEffect.FRAME)))
                {
                    _local_2.draw(CameraFxPreloader.getImage(_local_4.name));
                }
            }
            this._Str_2726.bitmap = _local_2;
            this._Str_2726.invalidate();
        }

        protected function onCloseHandler(k:WindowMouseEvent):void
        {
            this.dispose();
        }

        public function _Str_16763(k:String):void
        {
            if (_purchaseConfirmationDialog)
            {
                _purchaseConfirmationDialog._Str_24775(k);
            }
        }

        public function _Str_22711():String
        {
            var _local_2:Object;
            var _local_3:CameraEffect;
            var _local_4:CameraEffect;
            var k:Vector.<Object> = new Vector.<Object>();
            for each (_local_3 in this._Str_4335)
            {
                if (((_local_3._Str_5966) && (!(_local_3.type == CameraEffect.FRAME))))
                {
                    _local_2 = {};
                    _local_2.name = _local_3.name;
                    _local_2.alpha = int((_local_3._Str_10615() * 0xFF));
                    k.push(_local_2);
                }
            }
            for each (_local_4 in this._Str_4335)
            {
                if (((_local_4._Str_5966) && (_local_4.type == CameraEffect.FRAME)))
                {
                    _local_2 = {};
                    _local_2.name = _local_4.name;
                    k.push(_local_2);
                }
            }
            return JSON.stringify(k);
        }

        public function _Str_25820():int
        {
            return (this._Str_15282) ? 2 : 1;
        }
    }
}
