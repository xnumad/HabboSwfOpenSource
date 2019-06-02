package com.sulake.habbo.ui.widget.furniture.externalimage
{
    import com.sulake.habbo.ui.widget.ConversionTrackingWidget;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.core.window.components.IHTMLTextWindow;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.window.components.ILabelWindow;
    import flash.text.TextField;
    import com.sulake.core.assets.loaders.BitmapFileLoader;
    import flash.display.Bitmap;
    import com.sulake.habbo.inventory.IHabboInventory;
    import com.sulake.habbo.help.IHabboHelp;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.core.runtime.Component;
    import com.sulake.core.window.components.IDisplayObjectWrapper;
    import com.sulake.core.window.events.WindowLinkEvent;
    import com.sulake.habbo.session.enum.RoomControllerLevel;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.ui.handler.ExternalImageWidgetHandler;
    import __AS3__.vec.Vector;
    import com.sulake.room.object.IRoomObject;
    import com.sulake.habbo.inventory.items.IFurnitureItem;
    import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
    import com.sulake.core.window.components.ITextWindow;
    import flash.display.BitmapData;
    import adobe.serialization.json.JSONDecoder;
    import flash.net.URLRequest;
    import com.sulake.core.assets.loaders.AssetLoaderEvent;
    import flash.geom.Matrix;
    import flash.geom.ColorTransform;
    import flash.net.URLLoader;
    import flash.events.HTTPStatusEvent;
    import flash.events.Event;
    import flash.events.IOErrorEvent;
    import flash.display.Stage;
    import com.sulake.habbo.window.utils._Str_2910;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.window.enum._Str_3023;
    import com.sulake.habbo.window.utils._Str_5639;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.habbo.tracking.HabboTracking;
    import flash.net.navigateToURL;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_2553;
    import org.openvideoads.util.StringUtils;
    import com.sulake.core.window.components.ISelectableWindow;
    import com.sulake.habbo.window.widgets._Str_2789;
    import com.sulake.core.window.components.ISelectorWindow;
    import com.sulake.core.window.components.IWidgetWindow;
    import __AS3__.vec.*;

    public class ExternalImageWidget extends ConversionTrackingWidget 
    {
        private static const PHOTO_POSTER:String = "photo_poster";
        private static const SELFIE:String = "selfie";
        private static const LEGACY:String = "legacy";
        private static const _Str_9120:int = 10;
        private static const _Str_15604:int = 71;

        private var _window:IWindowContainer;
        private var _Str_2840:IBitmapWrapperWindow;
        private var _Str_11003:IHTMLTextWindow;
        private var _Str_19406:IWindow;
        private var _Str_2728:IWindow;
        private var _Str_13852:IWindowContainer;
        private var _Str_6057:IWindow;
        private var _Str_6501:IWindowContainer;
        private var _Str_12629:IWindowContainer;
        private var _Str_25745:IWindow;
        private var _Str_6600:IRegionWindow;
        private var _Str_14612:ILabelWindow;
        private var _Str_7334:TextField;
        private var _Str_9997:ILabelWindow;
        private var _Str_10424:BitmapFileLoader;
        private var _Str_13302:Bitmap;
        private var _inventory:IHabboInventory;
        private var _Str_8722:int;
        private var _Str_8942:String;
        private var _Str_622:String;
        private var _Str_3017:int;
        private var _Str_7653:String;
        private var _Str_15263:IWindowContainer;
        private var _Str_6733:String;
        private var _Str_26327:IBitmapWrapperWindow;
        private var _help:IHabboHelp;
        private var _roomEngine:IRoomEngine;
        private var _Str_8403:IWindowContainer;
        private var _Str_5182:int = 0;
        private var _Str_16159:Boolean = false;
        private var _Str_2296:Component;

        public function ExternalImageWidget(k:IRoomWidgetHandler, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary, _arg_4:IHabboLocalizationManager, _arg_5:IHabboInventory, _arg_6:IHabboHelp, _arg_7:IRoomEngine, _arg_8:Component)
        {
            var _local_9:IDisplayObjectWrapper;
            super(k, _arg_2, _arg_3, _arg_4);
            this._window = (_arg_2.buildFromXML((_arg_3.getAssetByName("stories_image_widget_xml").content as XML)) as IWindowContainer);
            this._Str_2844.widget = this;
            this._Str_2728 = (this._window.findChildByName("closebutton") as IWindow);
            this._Str_2840 = (this._window.findChildByName("imageLoader") as IBitmapWrapperWindow);
            this._Str_11003 = (this._window.findChildByName("moderationText") as IHTMLTextWindow);
            this._Str_11003.addEventListener(WindowLinkEvent.WINDOW_EVENT_LINK, this._Str_23468);
            this._Str_12629 = (this._window.findChildByName("shareArea") as IWindowContainer);
            this._Str_13852 = (this._window.findChildByName("removeButtonContainer") as IWindowContainer);
            this._Str_19406 = (this._window.findChildByName("makeOwnButton") as IWindow);
            this._Str_25745 = (this._window.findChildByName("shareButtonContainer") as IWindow);
            this._Str_6057 = (this._window.findChildByName("bgBorder") as IWindow);
            this._Str_6600 = (this._window.findChildByName("senderNameButton") as IRegionWindow);
            this._Str_14612 = (this._window.findChildByName("senderName") as ILabelWindow);
            this._Str_7334 = new TextField();
            if (this._Str_2844.container.roomSession.roomControllerLevel == RoomControllerLevel.MODERATOR)
            {
                _local_9 = (this._window.findChildByName("name_copy_wrapper") as IDisplayObjectWrapper);
                this._Str_7334.textColor = 10061943;
                this._Str_7334.text = "";
                _local_9.setDisplayObject(this._Str_7334);
            }
            this._Str_9997 = (this._window.findChildByName("creationDate") as ILabelWindow);
            this._Str_6501 = (this._window.findChildByName("buttonContainer") as IWindowContainer);
            this._inventory = _arg_5;
            this._help = _arg_6;
            this._roomEngine = _arg_7;
            this._Str_15263 = (this._window.findChildByName("reportButtonContainer") as IWindowContainer);
            this._window.procedure = this._Str_3061;
            this._window.center();
            this._Str_12629.visible = false;
            this._Str_2296 = _arg_8;
            this.hide();
        }

        private function get _Str_2844():ExternalImageWidgetHandler
        {
            return _Str_2470 as ExternalImageWidgetHandler;
        }

        public function _Str_16946(k:IRoomObject):void
        {
            this._Str_8722 = k.getId();
            this._Str_6733 = k.getType();
            this._Str_16159 = false;
            this._Str_13852.visible = this._Str_2844._Str_19701();
            if (this.getType() == PHOTO_POSTER)
            {
                this._Str_15263.visible = true;
            }
            else
            {
                this._Str_15263.visible = this._Str_2844._Str_25770();
            }
            this.show(k.getModel().getString("furniture_data"));
            var _local_2:Vector.<IRoomObject> = this._Str_15905();
            if (_local_2.indexOf(k) != -1)
            {
                this._Str_5182 = _local_2.indexOf(k);
            }
        }

        public function _Str_24496(k:int):void
        {
            var _local_2:IFurnitureItem = this._inventory._Str_14082(k);
            if (_local_2)
            {
                this._Str_8722 = k;
                this._Str_6733 = this._roomEngine.getWallItemType(_local_2.type);
                this._Str_16159 = true;
                this._Str_13852.visible = false;
                this._Str_15263.visible = false;
                this.show(_local_2.stuffData.getLegacyString());
            }
        }

        private function show(k:String):void
        {
            if (this._Str_2844._Str_19276 == "disabled")
            {
                return;
            }
            this._Str_22893();
            if (k != null)
            {
                this._Str_24417(k);
            }
        }

        private function _Str_24000():void
        {
            var k:Vector.<IRoomObject> = this._Str_15905();
            if (k.length > 0)
            {
                this._Str_5182++;
                if (this._Str_5182 > (k.length - 1))
                {
                    this._Str_5182 = 0;
                }
                this._Str_16946(k[this._Str_5182]);
            }
        }

        private function _Str_23066():void
        {
            var k:Vector.<IRoomObject> = this._Str_15905();
            if (k.length > 0)
            {
                this._Str_5182--;
                if (this._Str_5182 < 0)
                {
                    this._Str_5182 = (k.length - 1);
                }
                this._Str_16946(k[this._Str_5182]);
            }
        }

        private function _Str_15905():Vector.<IRoomObject>
        {
            var _local_3:IRoomObject;
            var k:Vector.<IRoomObject> = new Vector.<IRoomObject>();
            var _local_2:Array = this._roomEngine._Str_22003(RoomObjectCategoryEnum.CONST_20);
            for each (_local_3 in _local_2)
            {
                if (_local_3.getType() == this._Str_6733)
                {
                    k.push(_local_3);
                }
            }
            return k;
        }

        private function _Str_22893():void
        {
            this._Str_8942 = null;
            this._Str_622 = "";
            var k:ITextWindow = (this._window.findChildByName("captionText") as ITextWindow);
            k.text = "";
            this._Str_6600.visible = false;
            this._Str_3017 = 0;
            this._Str_14612.caption = "";
            this._Str_7334.text = "";
            this._Str_9997.caption = "";
            this._Str_7653 = null;
            this._Str_11003.visible = false;
            this._Str_19771(new Bitmap(new BitmapData((this._Str_2840.width - 2), (this._Str_2840.height - 2), false, 0)));
        }

        private function _Str_24417(k:String):void
        {
            try
            {
                this._Str_8942 = new JSONDecoder(k, false).getValue().id;
                if (this._Str_8942)
                {
                    this._Str_25873();
                    return;
                }
                this._Str_20605(k, this._Str_21278(new JSONDecoder(k, false).getValue()));
            }
            catch(error:Error)
            {
            }
        }

        private function _Str_21278(k:Object):String
        {
            var _local_3:String;
            var _local_2:String = this._Str_5427(k, "w", "url");
            if (_local_2.indexOf("http") != 0)
            {
                _local_3 = "postcards/selfie/";
                if (this.getType() == PHOTO_POSTER)
                {
                    _local_3 = "";
                }
                if (_local_2.indexOf(".png") == -1)
                {
                    _local_2 = (_local_2 + ".png");
                }
                _local_2 = ((this._Str_2844._Str_19276 + _local_3) + _local_2);
            }
            return _local_2;
        }

        private function _Str_20605(photoJsonString:String, imageUrl:String):void
        {
            var jsonObject:Object;
            var shareUrlText:IWindow;
            var finalUrl:String;
            var captionText:ITextWindow;
            try
            {
                jsonObject = new JSONDecoder(photoJsonString, false).getValue();
            }
            catch(error:Error)
            {
                return;
            }
            if (!imageUrl)
            {
                imageUrl = this._Str_21278(jsonObject);
            }
            this._Str_10424 = new BitmapFileLoader("image/png", new URLRequest(imageUrl));
            this._Str_10424.addEventListener(AssetLoaderEvent.ASSETLOADEREVENTCOMPLETE, this._Str_10931);
            var senderName:String = this._Str_5427(jsonObject, "n", "creator_name");
            var senderId:String = this._Str_5427(jsonObject, "s", "creator_id");
            var uniqueId:String = this._Str_5427(jsonObject, "u", "unique_id");
            var creationTime:String = this._Str_5427(jsonObject, "t", "time");
            var creationDate:Date = new Date(Number(creationTime));
            if (senderName)
            {
                this._Str_14612.caption = senderName;
                this._Str_6600.visible = true;
                this._Str_7334.text = senderName;
                this._Str_3017 = int(senderId);
                this._Str_9997.caption = ((((creationDate.date + "-") + (creationDate.month + 1)) + "-") + creationDate.fullYear);
            }
            if (((this._Str_2844._Str_18355) && (this._Str_2844._Str_18355.length > 4)))
            {
                shareUrlText = (this._window.findChildByName("urlField") as IWindow);
                finalUrl = this._Str_2844._Str_18355.replace("%id%", uniqueId);
                shareUrlText.caption = finalUrl;
                this._Str_7653 = finalUrl;
            }
            this._Str_622 = this._Str_5427(jsonObject, "m", "caption");
            if (this._Str_622)
            {
                captionText = (this._window.findChildByName("captionText") as ITextWindow);
                captionText.text = this._Str_622;
            }
        }

        private function _Str_5427(k:Object, _arg_2:String, _arg_3:String=null):String
        {
            var _local_4:String;
            _local_4 = k[_arg_2];
            if (((!(_local_4)) && (_arg_3)))
            {
                _local_4 = k[_arg_3];
            }
            return _local_4;
        }

        private function _Str_10931(k:AssetLoaderEvent):void
        {
            var _local_2:Bitmap;
            if (this._Str_10424)
            {
                _local_2 = (this._Str_10424.content as Bitmap);
                if (_local_2)
                {
                    this._Str_2840.width = (_local_2.width + 2);
                    this._Str_2840.height = (_local_2.height + 2);
                    this._Str_19771(_local_2);
                }
            }
        }

        private function _Str_19771(k:Bitmap):void
        {
            this._Str_13302 = k;
            this._Str_2840.bitmap = new BitmapData(this._Str_2840.width, this._Str_2840.height, true, 0);
            this._window.visible = true;
            var _local_2:IWindow = this._window.findChildByName("previousButton");
            var _local_3:IWindow = this._window.findChildByName("nextButton");
            _local_2.x = _Str_9120;
            this._Str_6057.y = (this._Str_6057.x = 0);
            this._Str_2840.x = ((_Str_9120 * 2) + _local_2.width);
            this._Str_2840.y = _Str_15604;
            this._Str_6057.height = (this._window.height = (this._Str_2840.height + (_Str_15604 * 2)));
            this._Str_6057.width = (this._window.width = ((this._Str_2840.width + (_Str_9120 * 4)) + (_local_2.width * 2)));
            this._Str_6600.x = ((this._Str_2840.right - this._Str_6600.width) - 3);
            this._Str_6600.y = (this._Str_2840.bottom + 3);
            this._Str_9997.x = (this._Str_2840.x + 3);
            this._Str_9997.y = (this._Str_6600.y = this._Str_2840.bottom);
            this._Str_6501.y = 0;
            this._Str_6501.x = (this._Str_6057.right - this._Str_6501.width);
            _local_3.x = (this._Str_2840.right + _Str_9120);
            if (this._Str_16159)
            {
                _local_3.visible = (_local_2.visible = false);
            }
            else
            {
                _local_3.visible = (_local_2.visible = (this._Str_15905().length > 1));
            }
            var _local_4:Matrix = new Matrix();
            var _local_5:ColorTransform = new ColorTransform();
            _local_5.color = 0;
            _local_4.ty = (_local_4.ty + 1);
            this._Str_2840.bitmap.draw(k, _local_4, _local_5);
            _local_4.tx = (_local_4.tx + 1);
            _local_4.ty--;
            this._Str_2840.bitmap.draw(k, _local_4, _local_5);
            _local_4.ty = (_local_4.ty + 2);
            this._Str_2840.bitmap.draw(k, _local_4, _local_5);
            _local_4.ty--;
            _local_4.tx = (_local_4.tx + 1);
            this._Str_2840.bitmap.draw(k, _local_4, _local_5);
            _local_4.tx--;
            this._Str_2840.bitmap.draw(k, _local_4);
            this._window.activate();
            this._Str_20964();
        }

        private function _Str_25873():void
        {
            var k:String = (this._Str_2844._Str_23183 + this._Str_8942);
            var _local_2:URLLoader = new URLLoader(new URLRequest(k));
            _local_2.addEventListener(HTTPStatusEvent.HTTP_STATUS, this._Str_23258);
            _local_2.addEventListener(Event.COMPLETE, this._Str_22927);
            _local_2.addEventListener(IOErrorEvent.IO_ERROR, this._Str_23656);
        }

        private function _Str_23258(k:HTTPStatusEvent):void
        {
            if (((k.status == 403) && (this._Str_2844._Str_19701())))
            {
                this._Str_11003.visible = true;
            }
        }

        private function _Str_23656(k:Event):void
        {
            if (!this._Str_11003.visible)
            {
                Logger.log(("Extra data loading failed: " + k.toString()));
            }
        }

        private function _Str_22927(k:Event):void
        {
            var _local_2:String = URLLoader(k.target).data;
            if (_local_2.length == 0)
            {
                return;
            }
            this._Str_20605(_local_2, null);
        }

        override public function dispose():void
        {
            if (!this._window)
            {
                return;
            }
            this._Str_2840 = null;
            this._Str_2728 = null;
            this._Str_6057 = null;
            this._Str_19406 = null;
            this._Str_13852 = null;
            this._Str_10424 = null;
            this._inventory = null;
            this._help = null;
            this._roomEngine = null;
            this._Str_3017 = 0;
            this._Str_6600 = null;
            this._Str_7334 = null;
            this._Str_6501 = null;
            this._Str_12629 = null;
            this._window.procedure = null;
            this._window.dispose();
            this._Str_2296 = null;
            super.dispose();
            if (this._Str_8403)
            {
                this._Str_8403.destroy();
            }
        }

        public function hide():void
        {
            this._window.visible = false;
        }

        private function _Str_20964():void
        {
            if (!this._Str_13302)
            {
                this._window.center();
                return;
            }
            var k:Stage = this._Str_2296.context.displayObjectContainer.stage;
            var _local_2:Number = ((k.stageWidth - 100) / this._Str_13302.width);
            var _local_3:Number = ((k.stageHeight - 200) / this._Str_13302.height);
            if (_local_2 < 1)
            {
                this._window.x = 50;
            }
            else
            {
                this._window.x = ((k.stageWidth - this._window.width) * 0.5);
            }
            if (_local_3 < 1)
            {
                this._window.y = 50;
            }
            else
            {
                this._window.y = ((k.stageHeight - this._window.height) * 0.5);
            }
            var _local_4:IWindow = this._window.findChildByName("previousButton");
            var _local_5:IWindow = this._window.findChildByName("nextButton");
            var _local_6:int = this._Str_2296.context.displayObjectContainer.stage.stageHeight;
            if (this._Str_6057.height > _local_6)
            {
                _local_4.y = (_local_5.y = ((_local_6 / 2) - (_local_4.height / 2)));
            }
            else
            {
                _local_4.y = (_local_5.y = ((this._Str_6057.height / 2) - (_local_4.height / 2)));
            }
        }

        private function _Str_3061(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:_Str_2910;
            var _local_4:ITextFieldWindow;
            var _local_5:HabboToolbarEvent;
            if (_arg_2 == this._window)
            {
                switch (k.type)
                {
                    case WindowEvent.WINDOW_EVENT_PARENT_RESIZED:
                        this._Str_20964();
                        break;
                }
            }
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            switch (_arg_2.name)
            {
                case "closebutton":
                    this.hide();
                    return;
                case "removebutton":
                    _local_3 = windowManager.confirm(_Str_2499.getLocalization("inventory.remove.external_image_wallitem_header"), _Str_2499.getLocalization("inventory.remove.external_image_wallitem_body"), 0, this._Str_25380);
                    _local_3._Str_13956(_Str_3023.BUTTON_OK, new _Str_5639(_Str_2499.getLocalization("inventory.remove.external_image_wallitem_delete"), "", true));
                    return;
                case "makeOwnButton":
                    if (this.getType() == PHOTO_POSTER)
                    {
                        _local_5 = new HabboToolbarEvent(HabboToolbarEvent.HTE_ICON_CAMERA);
                        _local_5._Str_4856 = HabboToolbarEvent.IMAGEWIDGETMAKEOWN;
                        this._Str_2844.container.toolbar.events.dispatchEvent(_local_5);
                        this.hide();
                    }
                    else
                    {
                        if (this._Str_2296.getInteger("spaweb", 0) == 1)
                        {
                            HabboWebTools.openPage("/stories/cards/selfie/edit");
                        }
                        else
                        {
                            this._Str_2296.context.createLinkEvent("games/play/elisa_habbo_stories?ref=btn_selfie_myo");
                        }
                    }
                    return;
                case "shareButton":
                    this._Str_12629.visible = true;
                    HabboTracking.getInstance().trackEventLog("Stories", "shareopened", "stories.share.clicked", this._Str_6733);
                    return;
                case "twitterShare":
                    navigateToURL(new URLRequest(("http://www.twitter.com/share?url=" + this._Str_7653)), "_blank");
                    HabboTracking.getInstance().trackEventLog("Stories", "twitter", "stories.share.clicked", this._Str_6733);
                    return;
                case "fbShare":
                    navigateToURL(new URLRequest(("https://www.facebook.com/sharer/sharer.php?u=" + this._Str_7653)), "_blank");
                    HabboTracking.getInstance().trackEventLog("Stories", "facebook", "stories.share.clicked", this._Str_6733);
                    return;
                case "senderNameButton":
                    this._Str_2844._Str_2488(new _Str_2553(this._Str_3017));
                    return;
                case "urlField":
                    _local_4 = (this._window.findChildByName("urlField") as ITextFieldWindow);
                    _local_4.setSelection(0, _local_4.length);
                    HabboTracking.getInstance().trackEventLog("Stories", "fieldselected", "stories.share.clicked", this._Str_6733);
                    return;
                case "reportButton":
                    this._Str_24813();
                    return;
                case "nextButton":
                    this._Str_24000();
                    return;
                case "previousButton":
                    this._Str_23066();
                    return;
            }
        }

        private function _Str_23468(k:WindowLinkEvent):void
        {
            if (((!(k == null)) && (!(StringUtils.isEmpty(k.link)))))
            {
                navigateToURL(new URLRequest(k.link), "_blank");
            }
        }

        private function _Str_24813():void
        {
            this._help._Str_21718(this._Str_3017, this._Str_14612.caption, this._Str_8942, this._Str_8722);
        }

        private function getType():String
        {
            switch (this._Str_6733)
            {
                case "external_image_wallitem_poster":
                case "external_image_wallitem_poster_small":
                    return PHOTO_POSTER;
                case "external_image_wallitem":
                    return SELFIE;
            }
            return LEGACY;
        }

        private function _Str_21772(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:int;
            var _local_4:IWindow;
            var _local_5:String;
            var _local_6:IWindow;
            var _local_7:Boolean;
            var _local_8:ISelectableWindow;
            var _local_9:_Str_2789;
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            switch (_arg_2.name)
            {
                case "header_button_close":
                    this._Str_8403.destroy();
                    return;
                case "report_confirm":
                    _local_3 = 0;
                    _local_4 = this._Str_8403.findChildByName("reporting_reason");
                    if (_local_4 != null)
                    {
                        _local_8 = ISelectorWindow(_local_4).getSelected();
                        if (_local_8 != null)
                        {
                            _local_3 = int(_local_8.name);
                        }
                    }
                    _local_5 = null;
                    _local_6 = this._Str_8403.findChildByName("input_widget");
                    if (_local_6 != null)
                    {
                        _local_9 = ((_local_6 as IWidgetWindow).widget as _Str_2789);
                        _local_5 = _local_9.message;
                    }
                    if (!this._Str_7653)
                    {
                        this._Str_7653 = "url not available";
                    }
                    if (this.getType() == PHOTO_POSTER)
                    {
                        _local_7 = this._help._Str_14206(this._Str_8942, _local_3, this._roomEngine.activeRoomId, this._Str_3017, this._Str_8722);
                    }
                    else
                    {
                        _local_7 = this._help._Str_12812(this._Str_7653, _local_5, this._roomEngine.activeRoomId, this._Str_3017, this._Str_8722);
                    }
                    if (_local_7)
                    {
                        this._Str_8403.destroy();
                    }
                    return;
            }
        }

        private function _Str_25380(k:_Str_2910, _arg_2:WindowEvent):void
        {
            k.dispose();
            if (_arg_2.type == WindowEvent.WINDOW_EVENT_OK)
            {
                this._Str_2844._Str_25405(this._Str_8722);
            }
        }
    }
}
