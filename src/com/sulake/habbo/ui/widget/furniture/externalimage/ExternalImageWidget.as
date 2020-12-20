package com.sulake.habbo.ui.widget.furniture.externalimage
{
    import com.sulake.habbo.ui.widget.RoomWidgetBase;
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
    import com.sulake.habbo.window.utils.IConfirmDialog;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.window.enum.HabboAlertDialogFlag;
    import com.sulake.habbo.window.utils.AlertDialogCaption;
    import com.sulake.habbo.utils.HabboWebTools;
    import com.sulake.habbo.tracking.HabboTracking;
    import flash.net.navigateToURL;
    import com.sulake.habbo.communication.messages.outgoing.users.GetExtendedProfileMessageComposer;
    import org.openvideoads.util.StringUtils;
    import com.sulake.core.window.components.ISelectableWindow;
    import com.sulake.habbo.window.widgets.IIlluminaInputWidget;
    import com.sulake.core.window.components.ISelectorWindow;
    import com.sulake.core.window.components.IWidgetWindow;
    import __AS3__.vec.*;

    public class ExternalImageWidget extends RoomWidgetBase
    {
        private static const PHOTO_POSTER:String = "photo_poster";
        private static const SELFIE:String = "selfie";
        private static const LEGACY:String = "legacy";
        private static const HORIZONTAL_ITEM_SPACING:int = 10;
        private static const VERTICAL_SPACE:int = 71;

        private var _window:IWindowContainer;
        private var _imageContainer:IBitmapWrapperWindow;
        private var _moderationText:IHTMLTextWindow;
        private var _makeOwnButton:IWindow;
        private var _closeButton:IWindow;
        private var _deleteButton:IWindowContainer;
        private var _bgBorder:IWindow;
        private var _buttonContainer:IWindowContainer;
        private var _shareArea:IWindowContainer;
        private var _shareButton:IWindow;
        private var _senderNameButton:IRegionWindow;
        private var _senderNameText:ILabelWindow;
        private var _nameCopyField:TextField;
        private var _creationDateText:ILabelWindow;
        private var _bitmapLoader:BitmapFileLoader;
        private var _currentImage:Bitmap;
        private var _inventory:IHabboInventory;
        private var _roomObjectID:int;
        private var _extraDataID:String;
        private var _caption:String;
        private var _senderId:int;
        private var _shareUrl:String;
        private var _reportImagebutton:IWindowContainer;
        private var _roomObjectType:String;
        private var _Str_26327:IBitmapWrapperWindow;
        private var _help:IHabboHelp;
        private var _roomEngine:IRoomEngine;
        private var _reportImageContainer:IWindowContainer;
        private var _currentRoomObjectListIndex:int = 0;
        private var _openedFromInventory:Boolean = false;
        private var _component:Component;

        public function ExternalImageWidget(k:IRoomWidgetHandler, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary, _arg_4:IHabboLocalizationManager, _arg_5:IHabboInventory, _arg_6:IHabboHelp, _arg_7:IRoomEngine, _arg_8:Component)
        {
            var _local_9:IDisplayObjectWrapper;
            super(k, _arg_2, _arg_3, _arg_4);
            this._window = (_arg_2.buildFromXML((_arg_3.getAssetByName("stories_image_widget_xml").content as XML)) as IWindowContainer);
            this.ownHandler.widget = this;
            this._closeButton = (this._window.findChildByName("closebutton") as IWindow);
            this._imageContainer = (this._window.findChildByName("imageLoader") as IBitmapWrapperWindow);
            this._moderationText = (this._window.findChildByName("moderationText") as IHTMLTextWindow);
            this._moderationText.addEventListener(WindowLinkEvent.WINDOW_EVENT_LINK, this.onClickModerationInfoLink);
            this._shareArea = (this._window.findChildByName("shareArea") as IWindowContainer);
            this._deleteButton = (this._window.findChildByName("removeButtonContainer") as IWindowContainer);
            this._makeOwnButton = (this._window.findChildByName("makeOwnButton") as IWindow);
            this._shareButton = (this._window.findChildByName("shareButtonContainer") as IWindow);
            this._bgBorder = (this._window.findChildByName("bgBorder") as IWindow);
            this._senderNameButton = (this._window.findChildByName("senderNameButton") as IRegionWindow);
            this._senderNameText = (this._window.findChildByName("senderName") as ILabelWindow);
            this._nameCopyField = new TextField();
            if (this.ownHandler.container.roomSession.roomControllerLevel == RoomControllerLevel.MODERATOR)
            {
                _local_9 = (this._window.findChildByName("name_copy_wrapper") as IDisplayObjectWrapper);
                this._nameCopyField.textColor = 10061943;
                this._nameCopyField.text = "";
                _local_9.setDisplayObject(this._nameCopyField);
            }
            this._creationDateText = (this._window.findChildByName("creationDate") as ILabelWindow);
            this._buttonContainer = (this._window.findChildByName("buttonContainer") as IWindowContainer);
            this._inventory = _arg_5;
            this._help = _arg_6;
            this._roomEngine = _arg_7;
            this._reportImagebutton = (this._window.findChildByName("reportButtonContainer") as IWindowContainer);
            this._window.procedure = this.onWindowEvent;
            this._window.center();
            this._shareArea.visible = false;
            this._component = _arg_8;
            this.hide();
        }

        private function get ownHandler():ExternalImageWidgetHandler
        {
            return _handler as ExternalImageWidgetHandler;
        }

        public function showWithRoomObject(k:IRoomObject):void
        {
            this._roomObjectID = k.getId();
            this._roomObjectType = k.getType();
            this._openedFromInventory = false;
            this._deleteButton.visible = this.ownHandler.hasRightsToRemove();
            if (this.getType() == PHOTO_POSTER)
            {
                this._reportImagebutton.visible = true;
            }
            else
            {
                this._reportImagebutton.visible = this.ownHandler.isSelfieReportingEnabled();
            }
            this.show(k.getModel().getString("furniture_data"));
            var _local_2:Vector.<IRoomObject> = this.getWallItemsOfCurrentTypeInRoom();
            if (_local_2.indexOf(k) != -1)
            {
                this._currentRoomObjectListIndex = _local_2.indexOf(k);
            }
        }

        public function showWithFurniID(k:int):void
        {
            var _local_2:IFurnitureItem = this._inventory.getWallItemById(k);
            if (_local_2)
            {
                this._roomObjectID = k;
                this._roomObjectType = this._roomEngine.getWallItemType(_local_2.type);
                this._openedFromInventory = true;
                this._deleteButton.visible = false;
                this._reportImagebutton.visible = false;
                this.show(_local_2.stuffData.getLegacyString());
            }
        }

        private function show(k:String):void
        {
            if (this.ownHandler.storiesImageUrlBase == "disabled")
            {
                return;
            }
            this.clearImage();
            if (k != null)
            {
                this.readFurniJson(k);
            }
        }

        private function showNext():void
        {
            var k:Vector.<IRoomObject> = this.getWallItemsOfCurrentTypeInRoom();
            if (k.length > 0)
            {
                this._currentRoomObjectListIndex++;
                if (this._currentRoomObjectListIndex > (k.length - 1))
                {
                    this._currentRoomObjectListIndex = 0;
                }
                this.showWithRoomObject(k[this._currentRoomObjectListIndex]);
            }
        }

        private function showPrevious():void
        {
            var k:Vector.<IRoomObject> = this.getWallItemsOfCurrentTypeInRoom();
            if (k.length > 0)
            {
                this._currentRoomObjectListIndex--;
                if (this._currentRoomObjectListIndex < 0)
                {
                    this._currentRoomObjectListIndex = (k.length - 1);
                }
                this.showWithRoomObject(k[this._currentRoomObjectListIndex]);
            }
        }

        private function getWallItemsOfCurrentTypeInRoom():Vector.<IRoomObject>
        {
            var _local_3:IRoomObject;
            var k:Vector.<IRoomObject> = new Vector.<IRoomObject>();
            var _local_2:Array = this._roomEngine.getObjectsByCategory(RoomObjectCategoryEnum.OBJECT_CATEGORY_WALLITEM);
            for each (_local_3 in _local_2)
            {
                if (_local_3.getType() == this._roomObjectType)
                {
                    k.push(_local_3);
                }
            }
            return k;
        }

        private function clearImage():void
        {
            this._extraDataID = null;
            this._caption = "";
            var k:ITextWindow = (this._window.findChildByName("captionText") as ITextWindow);
            k.text = "";
            this._senderNameButton.visible = false;
            this._senderId = 0;
            this._senderNameText.caption = "";
            this._nameCopyField.text = "";
            this._creationDateText.caption = "";
            this._shareUrl = null;
            this._moderationText.visible = false;
            this.drawImage(new Bitmap(new BitmapData((this._imageContainer.width - 2), (this._imageContainer.height - 2), false, 0)));
        }

        private function readFurniJson(k:String):void
        {
            try
            {
                this._extraDataID = new JSONDecoder(k, false).getValue().id;
                if (this._extraDataID)
                {
                    this.loadExternalData();
                    return;
                }
                this.loadPhoto(k, this.getImageUrl(new JSONDecoder(k, false).getValue()));
            }
            catch(error:Error)
            {
            }
        }

        private function getImageUrl(k:Object):String
        {
            var _local_3:String;
            var _local_2:String = this.getJsonValue(k, "w", "url");
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
                _local_2 = ((this.ownHandler.storiesImageUrlBase + _local_3) + _local_2);
            }
            return _local_2;
        }

        private function loadPhoto(photoJsonString:String, imageUrl:String):void
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
                imageUrl = this.getImageUrl(jsonObject);
            }
            this._bitmapLoader = new BitmapFileLoader("image/png", new URLRequest(imageUrl));
            this._bitmapLoader.addEventListener(AssetLoaderEvent.ASSETLOADEREVENTCOMPLETE, this.onImageLoaded);
            var senderName:String = this.getJsonValue(jsonObject, "n", "creator_name");
            var senderId:String = this.getJsonValue(jsonObject, "s", "creator_id");
            var uniqueId:String = this.getJsonValue(jsonObject, "u", "unique_id");
            var creationTime:String = this.getJsonValue(jsonObject, "t", "time");
            var creationDate:Date = new Date(Number(creationTime));
            if (senderName)
            {
                this._senderNameText.caption = senderName;
                this._senderNameButton.visible = true;
                this._nameCopyField.text = senderName;
                this._senderId = int(senderId);
                this._creationDateText.caption = ((((creationDate.date + "-") + (creationDate.month + 1)) + "-") + creationDate.fullYear);
            }
            if (((this.ownHandler.storiesImageShareUrl) && (this.ownHandler.storiesImageShareUrl.length > 4)))
            {
                shareUrlText = (this._window.findChildByName("urlField") as IWindow);
                finalUrl = this.ownHandler.storiesImageShareUrl.replace("%id%", uniqueId);
                shareUrlText.caption = finalUrl;
                this._shareUrl = finalUrl;
            }
            this._caption = this.getJsonValue(jsonObject, "m", "caption");
            if (this._caption)
            {
                captionText = (this._window.findChildByName("captionText") as ITextWindow);
                captionText.text = this._caption;
            }
        }

        private function getJsonValue(k:Object, _arg_2:String, _arg_3:String=null):String
        {
            var _local_4:String;
            _local_4 = k[_arg_2];
            if (((!(_local_4)) && (_arg_3)))
            {
                _local_4 = k[_arg_3];
            }
            return _local_4;
        }

        private function onImageLoaded(k:AssetLoaderEvent):void
        {
            var _local_2:Bitmap;
            if (this._bitmapLoader)
            {
                _local_2 = (this._bitmapLoader.content as Bitmap);
                if (_local_2)
                {
                    this._imageContainer.width = (_local_2.width + 2);
                    this._imageContainer.height = (_local_2.height + 2);
                    this.drawImage(_local_2);
                }
            }
        }

        private function drawImage(k:Bitmap):void
        {
            this._currentImage = k;
            this._imageContainer.bitmap = new BitmapData(this._imageContainer.width, this._imageContainer.height, true, 0);
            this._window.visible = true;
            var _local_2:IWindow = this._window.findChildByName("previousButton");
            var _local_3:IWindow = this._window.findChildByName("nextButton");
            _local_2.x = HORIZONTAL_ITEM_SPACING;
            this._bgBorder.y = (this._bgBorder.x = 0);
            this._imageContainer.x = ((HORIZONTAL_ITEM_SPACING * 2) + _local_2.width);
            this._imageContainer.y = VERTICAL_SPACE;
            this._bgBorder.height = (this._window.height = (this._imageContainer.height + (VERTICAL_SPACE * 2)));
            this._bgBorder.width = (this._window.width = ((this._imageContainer.width + (HORIZONTAL_ITEM_SPACING * 4)) + (_local_2.width * 2)));
            this._senderNameButton.x = ((this._imageContainer.right - this._senderNameButton.width) - 3);
            this._senderNameButton.y = (this._imageContainer.bottom + 3);
            this._creationDateText.x = (this._imageContainer.x + 3);
            this._creationDateText.y = (this._senderNameButton.y = this._imageContainer.bottom);
            this._buttonContainer.y = 0;
            this._buttonContainer.x = (this._bgBorder.right - this._buttonContainer.width);
            _local_3.x = (this._imageContainer.right + HORIZONTAL_ITEM_SPACING);
            if (this._openedFromInventory)
            {
                _local_3.visible = (_local_2.visible = false);
            }
            else
            {
                _local_3.visible = (_local_2.visible = (this.getWallItemsOfCurrentTypeInRoom().length > 1));
            }
            var _local_4:Matrix = new Matrix();
            var _local_5:ColorTransform = new ColorTransform();
            _local_5.color = 0;
            _local_4.ty = (_local_4.ty + 1);
            this._imageContainer.bitmap.draw(k, _local_4, _local_5);
            _local_4.tx = (_local_4.tx + 1);
            _local_4.ty--;
            this._imageContainer.bitmap.draw(k, _local_4, _local_5);
            _local_4.ty = (_local_4.ty + 2);
            this._imageContainer.bitmap.draw(k, _local_4, _local_5);
            _local_4.ty--;
            _local_4.tx = (_local_4.tx + 1);
            this._imageContainer.bitmap.draw(k, _local_4, _local_5);
            _local_4.tx--;
            this._imageContainer.bitmap.draw(k, _local_4);
            this._window.activate();
            this.updateWindowPosition();
        }

        private function loadExternalData():void
        {
            var k:String = (this.ownHandler.extraDataServiceUrl + this._extraDataID);
            var _local_2:URLLoader = new URLLoader(new URLRequest(k));
            _local_2.addEventListener(HTTPStatusEvent.HTTP_STATUS, this.onExternalDataHttpStatus);
            _local_2.addEventListener(Event.COMPLETE, this.onExternalDataLoaded);
            _local_2.addEventListener(IOErrorEvent.IO_ERROR, this.onExternalDataError);
        }

        private function onExternalDataHttpStatus(k:HTTPStatusEvent):void
        {
            if (((k.status == 403) && (this.ownHandler.hasRightsToRemove())))
            {
                this._moderationText.visible = true;
            }
        }

        private function onExternalDataError(k:Event):void
        {
            if (!this._moderationText.visible)
            {
                Logger.log(("Extra data loading failed: " + k.toString()));
            }
        }

        private function onExternalDataLoaded(k:Event):void
        {
            var _local_2:String = URLLoader(k.target).data;
            if (_local_2.length == 0)
            {
                return;
            }
            this.loadPhoto(_local_2, null);
        }

        override public function dispose():void
        {
            if (!this._window)
            {
                return;
            }
            this._imageContainer = null;
            this._closeButton = null;
            this._bgBorder = null;
            this._makeOwnButton = null;
            this._deleteButton = null;
            this._bitmapLoader = null;
            this._inventory = null;
            this._help = null;
            this._roomEngine = null;
            this._senderId = 0;
            this._senderNameButton = null;
            this._nameCopyField = null;
            this._buttonContainer = null;
            this._shareArea = null;
            this._window.procedure = null;
            this._window.dispose();
            this._component = null;
            super.dispose();
            if (this._reportImageContainer)
            {
                this._reportImageContainer.destroy();
            }
        }

        public function hide():void
        {
            this._window.visible = false;
        }

        private function updateWindowPosition():void
        {
            if (!this._currentImage)
            {
                this._window.center();
                return;
            }
            var k:Stage = this._component.context.displayObjectContainer.stage;
            var _local_2:Number = ((k.stageWidth - 100) / this._currentImage.width);
            var _local_3:Number = ((k.stageHeight - 200) / this._currentImage.height);
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
            var _local_6:int = this._component.context.displayObjectContainer.stage.stageHeight;
            if (this._bgBorder.height > _local_6)
            {
                _local_4.y = (_local_5.y = ((_local_6 / 2) - (_local_4.height / 2)));
            }
            else
            {
                _local_4.y = (_local_5.y = ((this._bgBorder.height / 2) - (_local_4.height / 2)));
            }
        }

        private function onWindowEvent(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:IConfirmDialog;
            var _local_4:ITextFieldWindow;
            var _local_5:HabboToolbarEvent;
            if (_arg_2 == this._window)
            {
                switch (k.type)
                {
                    case WindowEvent.WINDOW_EVENT_PARENT_RESIZED:
                        this.updateWindowPosition();
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
                    _local_3 = windowManager.confirm(_localizations.getLocalization("inventory.remove.external_image_wallitem_header"), _localizations.getLocalization("inventory.remove.external_image_wallitem_body"), 0, this.onDeleteConfirm);
                    _local_3.setButtonCaption(HabboAlertDialogFlag.BUTTON_OK, new AlertDialogCaption(_localizations.getLocalization("inventory.remove.external_image_wallitem_delete"), "", true));
                    return;
                case "makeOwnButton":
                    if (this.getType() == PHOTO_POSTER)
                    {
                        _local_5 = new HabboToolbarEvent(HabboToolbarEvent.HTE_ICON_CAMERA);
                        _local_5._Str_4856 = HabboToolbarEvent.IMAGEWIDGETMAKEOWN;
                        this.ownHandler.container.toolbar.events.dispatchEvent(_local_5);
                        this.hide();
                    }
                    else
                    {
                        if (this._component.getInteger("spaweb", 0) == 1)
                        {
                            HabboWebTools.openPage("/stories/cards/selfie/edit");
                        }
                        else
                        {
                            this._component.context.createLinkEvent("games/play/elisa_habbo_stories?ref=btn_selfie_myo");
                        }
                    }
                    return;
                case "shareButton":
                    this._shareArea.visible = true;
                    HabboTracking.getInstance().trackEventLog("Stories", "shareopened", "stories.share.clicked", this._roomObjectType);
                    return;
                case "twitterShare":
                    navigateToURL(new URLRequest(("http://www.twitter.com/share?url=" + this._shareUrl)), "_blank");
                    HabboTracking.getInstance().trackEventLog("Stories", "twitter", "stories.share.clicked", this._roomObjectType);
                    return;
                case "fbShare":
                    navigateToURL(new URLRequest(("https://www.facebook.com/sharer/sharer.php?u=" + this._shareUrl)), "_blank");
                    HabboTracking.getInstance().trackEventLog("Stories", "facebook", "stories.share.clicked", this._roomObjectType);
                    return;
                case "senderNameButton":
                    this.ownHandler.sendMessage(new GetExtendedProfileMessageComposer(this._senderId));
                    return;
                case "urlField":
                    _local_4 = (this._window.findChildByName("urlField") as ITextFieldWindow);
                    _local_4.setSelection(0, _local_4.length);
                    HabboTracking.getInstance().trackEventLog("Stories", "fieldselected", "stories.share.clicked", this._roomObjectType);
                    return;
                case "reportButton":
                    this.openReportImage();
                    return;
                case "nextButton":
                    this.showNext();
                    return;
                case "previousButton":
                    this.showPrevious();
                    return;
            }
        }

        private function onClickModerationInfoLink(k:WindowLinkEvent):void
        {
            if (((!(k == null)) && (!(StringUtils.isEmpty(k.link)))))
            {
                navigateToURL(new URLRequest(k.link), "_blank");
            }
        }

        private function openReportImage():void
        {
            this._help.startPhotoReportingInNewCfhFlow(this._senderId, this._senderNameText.caption, this._extraDataID, this._roomObjectID);
        }

        private function getType():String
        {
            switch (this._roomObjectType)
            {
                case "external_image_wallitem_poster":
                case "external_image_wallitem_poster_small":
                    return PHOTO_POSTER;
                case "external_image_wallitem":
                    return SELFIE;
            }
            return LEGACY;
        }

        private function onReportWindowEvent(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:int;
            var _local_4:IWindow;
            var _local_5:String;
            var _local_6:IWindow;
            var _local_7:Boolean;
            var _local_8:ISelectableWindow;
            var _local_9:IIlluminaInputWidget;
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            switch (_arg_2.name)
            {
                case "header_button_close":
                    this._reportImageContainer.destroy();
                    return;
                case "report_confirm":
                    _local_3 = 0;
                    _local_4 = this._reportImageContainer.findChildByName("reporting_reason");
                    if (_local_4 != null)
                    {
                        _local_8 = ISelectorWindow(_local_4).getSelected();
                        if (_local_8 != null)
                        {
                            _local_3 = int(_local_8.name);
                        }
                    }
                    _local_5 = null;
                    _local_6 = this._reportImageContainer.findChildByName("input_widget");
                    if (_local_6 != null)
                    {
                        _local_9 = ((_local_6 as IWidgetWindow).widget as IIlluminaInputWidget);
                        _local_5 = _local_9.message;
                    }
                    if (!this._shareUrl)
                    {
                        this._shareUrl = "url not available";
                    }
                    if (this.getType() == PHOTO_POSTER)
                    {
                        _local_7 = this._help.reportPhoto(this._extraDataID, _local_3, this._roomEngine.activeRoomId, this._senderId, this._roomObjectID);
                    }
                    else
                    {
                        _local_7 = this._help.reportSelfie(this._shareUrl, _local_5, this._roomEngine.activeRoomId, this._senderId, this._roomObjectID);
                    }
                    if (_local_7)
                    {
                        this._reportImageContainer.destroy();
                    }
                    return;
            }
        }

        private function onDeleteConfirm(k:IConfirmDialog, _arg_2:WindowEvent):void
        {
            k.dispose();
            if (_arg_2.type == WindowEvent.WINDOW_EVENT_OK)
            {
                this.ownHandler.deleteCard(this._roomObjectID);
            }
        }
    }
}
