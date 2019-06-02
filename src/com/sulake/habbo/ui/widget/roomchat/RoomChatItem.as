package com.sulake.habbo.ui.widget.roomchat
{
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.core.assets.IAssetLibrary;
    import flash.display.BitmapData;
    import com.sulake.habbo.ui.widget.events._Str_3535;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import flash.geom.Rectangle;
    import com.sulake.habbo.ui.widget.enums.SystemChatStyleEnum;
    import flash.text.TextFormat;
    import com.sulake.core.window.components.ILabelWindow;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.habbo.room.object.RoomObjectTypeEnum;
    import com.sulake.habbo.avatar.pets.PetTypeEnum;
    import com.sulake.core.window.enum.WindowParam;
    import com.sulake.core.window.enum.WindowParam;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.habbo.utils.HabboWebTools;

    public class RoomChatItem 
    {
        public static const _Str_15992:Number = 18;
        private static const _Str_9962:int = 6;
        private static const _Str_15961:int = 6;
        private static const _Str_5706:int = 35;
        private static const _Str_13391:int = 26;
        private static const NAME:String = "name";
        private static const MESSAGE:String = "message";
        private static const POINTER:String = "pointer";
        private static const BACKGROUND:String = "background";
        private static const _Str_17786:String = "${chat.history.drag.tooltip}";

        private var _widget:RoomChatWidget;
        private var _windowManager:IHabboWindowManager;
        private var _localizations:IHabboLocalizationManager;
        private var _window:IRegionWindow;
        private var _assetLibrary:IAssetLibrary;
        private var _id:String;
        private var _siteUrl:String;
        private var _aboveLevels:int = 0;
        private var _screenLevel:int = -1;
        private var _chatType:int;
        private var _chatStyle:int;
        private var _senderId:int;
        private var _senderName:String;
        private var _message:String;
        private var _messageLinks:Array;
        private var _messageLinkPositions:Array;
        private var _timeStamp:int;
        private var _senderX:Number;
        private var _senderImage:BitmapData;
        private var _senderColor:uint;
        private var _roomId:int;
        private var _userType:int;
        private var _petType:int;
        private var _senderCategory:int;
        private var _width:Number = 0;
        private var _rendered:Boolean = false;
        private var _topOffset:Number = 0;
        private var _originalBackgroundYOffset:Number = 0;
        private var _x:Number = 0;
        private var _y:Number = 0;
        private var _dragTooltipEnabled:Boolean = false;

        public function RoomChatItem(k:RoomChatWidget, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary, _arg_4:String, _arg_5:IHabboLocalizationManager, _arg_6:String)
        {
            this._senderName = new String();
            this._message = new String();
            super();
            this._widget = k;
            this._windowManager = _arg_2;
            this._assetLibrary = _arg_3;
            this._id = _arg_4;
            this._localizations = _arg_5;
            this._siteUrl = _arg_6;
        }

        public function dispose():void
        {
            if (this._window != null)
            {
                this._window.dispose();
                this._window = null;
                this._widget = null;
                this._windowManager = null;
                this._localizations = null;
                this._senderImage = null;
            }
        }

        public function _Str_13182(k:_Str_3535):void
        {
            this._chatType = k.chatType;
            this._chatStyle = k.styleId;
            this._senderId = k.userId;
            this._senderName = k.userName;
            this._senderCategory = k._Str_23083;
            this._message = k.text;
            this._messageLinks = k.links;
            this._senderX = k._Str_24184;
            this._senderImage = k._Str_23069;
            this._senderColor = k._Str_24330;
            this._roomId = k.roomId;
            this._userType = k._Str_2908;
            this._petType = k._Str_4355;
            this._Str_13126();
        }

        public function set message(k:String):void
        {
            this._message = k;
        }

        public function set senderName(k:String):void
        {
            this._senderName = k;
        }

        public function set _Str_25766(k:BitmapData):void
        {
            this._senderImage = k;
        }

        public function set _Str_23108(k:uint):void
        {
            this._senderColor = k;
        }

        public function set chatType(k:int):void
        {
            this._chatType = k;
        }

        public function get view():IWindowContainer
        {
            return this._window;
        }

        public function get screenLevel():int
        {
            return this._screenLevel;
        }

        public function get timeStamp():int
        {
            return this._timeStamp;
        }

        public function get _Str_7368():Number
        {
            return this._senderX;
        }

        public function set _Str_7368(k:Number):void
        {
            this._senderX = k;
        }

        public function get width():Number
        {
            return this._width;
        }

        public function get height():Number
        {
            return _Str_15992;
        }

        public function get message():String
        {
            return this._message;
        }

        public function get x():Number
        {
            return this._x;
        }

        public function get y():Number
        {
            return this._y;
        }

        public function get aboveLevels():int
        {
            return this._aboveLevels;
        }

        public function set aboveLevels(k:int):void
        {
            this._aboveLevels = k;
        }

        public function set screenLevel(k:int):void
        {
            this._screenLevel = k;
        }

        public function set timeStamp(k:int):void
        {
            this._timeStamp = k;
        }

        public function set x(k:Number):void
        {
            this._x = k;
            if (this._window != null)
            {
                this._window.x = k;
            }
        }

        public function set y(k:Number):void
        {
            this._y = k;
            if (this._window != null)
            {
                this._window.y = ((k - this._topOffset) + this._originalBackgroundYOffset);
            }
        }

        public function _Str_22279():void
        {
            var k:IWindow;
            if (this._window)
            {
                k = this._window.findChildByName("pointer");
                if (k)
                {
                    k.visible = false;
                }
            }
        }

        public function _Str_23410(k:Number):void
        {
            if (((!(this._window)) || (this._window.disposed)))
            {
                return;
            }
            var _local_2:IBitmapWrapperWindow = (this._window.findChildByName("pointer") as IBitmapWrapperWindow);
            var _local_3:IBitmapWrapperWindow = (this._window.findChildByName("middle") as IBitmapWrapperWindow);
            if (((_local_3 == null) || (_local_2 == null)))
            {
                return;
            }
            _local_2.visible = true;
            k = (k + (this._window.width / 2));
            k = Math.min(k, (_local_3.rectangle.right - _local_2.width));
            k = Math.max(k, _local_3.rectangle.left);
            _local_2.x = k;
        }

        public function _Str_23373(k:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:Number):Boolean
        {
            var _local_6:Rectangle = new Rectangle(this._x, this._y, this.width, k);
            var _local_7:Rectangle = new Rectangle(_arg_2, _arg_3, _arg_4, _arg_5);
            return _local_6.intersects(_local_7);
        }

        public function _Str_5574():void
        {
            if (this._window)
            {
                this._window.dispose();
            }
            this._window = null;
            this._rendered = false;
        }

        private function get _Str_21943():Boolean
        {
            return this._chatStyle == SystemChatStyleEnum.GENERIC;
        }

        public function _Str_13126():void
        {
            var messageWidth:int;
            var userIconWindow:IBitmapWrapperWindow;
            var x1:int;
            var y1:int;
            var i:int;
            var lastLinkEndPos:int;
            var linkFormat:TextFormat;
            var filteredLink:String;
            var placeHolder:String;
            var placeholderPos:int;
            var linkPos:Array;
            if (this._rendered)
            {
                return;
            }
            this._rendered = true;
            if (this._window)
            {
                return;
            }
            this._window = RoomChatWidget._Str_5827._Str_25575(this._chatStyle, this._chatType);
            if (!this._window)
            {
                return;
            }
            this._window._Str_4074 = true;
            var background:IBitmapWrapperWindow = (this._window.findChildByName(BACKGROUND) as IBitmapWrapperWindow);
            var nameWindow:ILabelWindow = (this._window.findChildByName(NAME) as ILabelWindow);
            var textWindow:ITextWindow = (this._window.findChildByName(MESSAGE) as ITextWindow);
            var pointerWindow:IBitmapWrapperWindow = (this._window.findChildByName(POINTER) as IBitmapWrapperWindow);
            var totalHeight:Number = this._window.height;
            var pointerBitmapData:BitmapData = RoomChatWidget._Str_5827._Str_23013(this._chatStyle);
            this._originalBackgroundYOffset = background.y;
            var textWindowOffsetX:int = ((textWindow.x <= _Str_13391) ? 0 : (textWindow.x - _Str_13391));
            if (this._senderImage != null)
            {
                this._topOffset = Math.max(0, ((this._senderImage.height - background.height) / 2));
                totalHeight = Math.max(totalHeight, this._senderImage.height);
                totalHeight = Math.max(totalHeight, background.height);
            }
            this._width = 0;
            this._window.x = this._x;
            this._window.y = this._y;
            this._window.width = 0;
            this._window.height = totalHeight;
            this._Str_16939();
            this._Str_23110(this._window);
            if (((this._senderImage) && (!(this._Str_21943))))
            {
                userIconWindow = (this._window.findChildByName("user_image") as IBitmapWrapperWindow);
                if (userIconWindow)
                {
                    userIconWindow.width = this._senderImage.width;
                    userIconWindow.height = this._senderImage.height;
                    userIconWindow.bitmap = this._senderImage;
                    userIconWindow.disposesBitmap = false;
                    x1 = (userIconWindow.x - (this._senderImage.width / 2));
                    y1 = Math.max(0, ((background.height - this._senderImage.height) / 2));
                    if (this._userType == RoomObjectTypeEnum.PET)
                    {
                        if (this._petType == PetTypeEnum.HORSE)
                        {
                            if (this._senderImage.height > background.height)
                            {
                                y1 = ((this._senderImage.height - background.height) / 2);
                            }
                        }
                    }
                    userIconWindow.x = x1;
                    userIconWindow.y = (userIconWindow.y + y1);
                    this._width = (this._width + (userIconWindow.x + this._senderImage.width));
                }
            }
            if (nameWindow != null)
            {
                if (!this._Str_21943)
                {
                    nameWindow.text = (this._senderName + ": ");
                    nameWindow.y = (nameWindow.y + this._topOffset);
                    nameWindow.width = (nameWindow.textWidth + _Str_9962);
                }
                else
                {
                    nameWindow.text = "";
                    nameWindow.width = 0;
                }
                this._width = (this._width + nameWindow.width);
            }
            if (this._chatType == _Str_3535.CHAT_TYPE_RESPECT)
            {
                textWindow.text = this._localizations.registerParameter("widgets.chatbubble.respect", "username", this._senderName);
                this._width = _Str_5706;
            }
            else
            {
                if (this._chatType == _Str_3535.CHAT_TYPE_PETRESPECT)
                {
                    textWindow.text = this._localizations.registerParameter("widget.chatbubble.petrespect", "petname", this._senderName);
                    this._width = _Str_5706;
                }
                else
                {
                    if (this._chatType == _Str_3535.CHAT_TYPE_PETTREAT)
                    {
                        textWindow.text = this._localizations.registerParameter("widget.chatbubble.pettreat", "petname", this._senderName);
                        this._width = _Str_5706;
                    }
                    else
                    {
                        if (this._chatType == _Str_3535.CHAT_TYPE_PETREVIVE)
                        {
                            textWindow.text = this.message;
                            this._width = _Str_5706;
                        }
                        else
                        {
                            if (this._chatType == _Str_3535.CHAT_TYPE_PET_REBREED_FERTILIZE)
                            {
                                textWindow.text = this.message;
                                this._width = _Str_5706;
                            }
                            else
                            {
                                if (this._chatType == _Str_3535.CHAT_TYPE_PET_SPEED_FERTILIZE)
                                {
                                    textWindow.text = this.message;
                                    this._width = _Str_5706;
                                }
                                else
                                {
                                    if (this._chatType == _Str_3535._Str_15836)
                                    {
                                        textWindow.text = this.message;
                                        this._width = _Str_5706;
                                    }
                                    else
                                    {
                                        if (this._messageLinks == null)
                                        {
                                            textWindow.text = this.message;
                                        }
                                        else
                                        {
                                            this._messageLinkPositions = new Array();
                                            lastLinkEndPos = -1;
                                            i = 0;
                                            while (i < this._messageLinks.length)
                                            {
                                                filteredLink = this._messageLinks[i][1];
                                                placeHolder = (("{" + i) + "}");
                                                placeholderPos = this._message.indexOf(placeHolder);
                                                lastLinkEndPos = (placeholderPos + filteredLink.length);
                                                this._messageLinkPositions.push([placeholderPos, lastLinkEndPos]);
                                                this._message = this._message.replace(placeHolder, filteredLink);
                                                i = (i + 1);
                                            }
                                            textWindow.text = this.message;
                                            textWindow.immediateClickMode = true;
                                            textWindow.setParamFlag(WindowParam.WINDOW_PARAM_USE_PARENT_GRAPHIC_CONTEXT, false);
                                            textWindow.setParamFlag(WindowParam.WINDOW_PARAM_FORCE_CLIPPING, true);
                                            linkFormat = textWindow.getTextFormat();
                                            switch (this._chatStyle)
                                            {
                                                case SystemChatStyleEnum.BOT:
                                                    linkFormat.color = 0xDDDDDD;
                                                    break;
                                                default:
                                                    linkFormat.color = 2710438;
                                            }
                                            linkFormat.underline = true;
                                            i = 0;
                                            while (i < this._messageLinkPositions.length)
                                            {
                                                linkPos = this._messageLinkPositions[i];
                                                try
                                                {
                                                    textWindow.setTextFormat(linkFormat, linkPos[0], linkPos[1]);
                                                }
                                                catch(e:RangeError)
                                                {
                                                    Logger.log("Chat message links were malformed. Could not set TextFormat");
                                                }
                                                i = (i + 1);
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            if (textWindow.visible)
            {
                textWindow.x = (this._width + textWindowOffsetX);
                if (nameWindow != null)
                {
                    textWindow.x = (nameWindow.x + nameWindow.width);
                    if (nameWindow.width > _Str_9962)
                    {
                        textWindow.x = (textWindow.x - (_Str_9962 - 1));
                    }
                }
                textWindow.y = (textWindow.y + this._topOffset);
                messageWidth = textWindow.textWidth;
                textWindow.width = (messageWidth + _Str_15961);
                this._width = (this._width + textWindow.width);
            }
            if (((!(pointerWindow == null)) && (pointerWindow.visible)))
            {
                pointerWindow.bitmap = pointerBitmapData;
                pointerWindow.disposesBitmap = false;
                pointerWindow.x = (this._width / 2);
                pointerWindow.y = (pointerWindow.y + this._topOffset);
            }
            var textWidth:int = textWindow.width;
            if (nameWindow)
            {
                textWidth = (textWidth + nameWindow.width);
            }
            var bitmap:BitmapData = RoomChatWidget._Str_5827._Str_25059(this._chatStyle, this._chatType, textWidth, background.height, this._senderColor);
            this._window.width = bitmap.width;
            this._window.y = (this._window.y - this._topOffset);
            this._window.y = (this._window.y + this._originalBackgroundYOffset);
            this._width = this._window.width;
            background.bitmap = bitmap;
            background.y = this._topOffset;
        }

        public function _Str_16939():void
        {
            this._dragTooltipEnabled = true;
            this._Str_20783();
        }

        public function _Str_22093():void
        {
            this._dragTooltipEnabled = false;
            this._Str_20783();
        }

        private function _Str_20783():void
        {
            if (this._window == null)
            {
                return;
            }
            this._window._Str_2613 = "";
            if (this._widget.isGameSession)
            {
                return;
            }
            if (this._dragTooltipEnabled)
            {
                this._window._Str_2613 = _Str_17786;
            }
            this._window._Str_3099 = 500;
        }

        private function _Str_23110(k:IWindowContainer):void
        {
            k.setParamFlag(WindowParam.WINDOW_PARAM_INPUT_EVENT_PROCESSOR, true);
            k.addEventListener(WindowMouseEvent.CLICK, this._Str_24326);
            k.addEventListener(WindowMouseEvent.DOWN, this._Str_22405);
            k.addEventListener(WindowMouseEvent.OVER, this._Str_23850);
            k.addEventListener(WindowMouseEvent.OUT, this._Str_23475);
            k.addEventListener(WindowMouseEvent.UP, this._Str_24323);
        }

        private function _Str_22492(k:int, _arg_2:int):Boolean
        {
            var _local_5:int;
            var _local_3:ITextWindow = (this._window.getChildByName(MESSAGE) as ITextWindow);
            var _local_4:int = _local_3.getCharIndexAtPoint((k - _local_3.x), (_arg_2 - _local_3.y));
            if (_local_4 > -1)
            {
                _local_5 = 0;
                while (_local_5 < this._messageLinkPositions.length)
                {
                    if (((_local_4 >= this._messageLinkPositions[_local_5][0]) && (_local_4 <= this._messageLinkPositions[_local_5][1])))
                    {
                        if (this._messageLinks[_local_5][2] == 0)
                        {
                            HabboWebTools.open(this._messageLinks[_local_5][0]);
                        }
                        else
                        {
                            if (this._messageLinks[_local_5][2] == 1)
                            {
                                HabboWebTools.openWebPage((this._siteUrl + this._messageLinks[_local_5][0]), "habboMain");
                            }
                            else
                            {
                                HabboWebTools.openWebPage((this._siteUrl + this._messageLinks[_local_5][0]));
                            }
                        }
                        return true;
                    }
                    _local_5++;
                }
            }
            return false;
        }

        private function _Str_24326(k:WindowMouseEvent):void
        {
            if (((this._messageLinks) && (this._messageLinks.length > 0)))
            {
                if (this._Str_22492(k.localX, k.localY))
                {
                    return;
                }
            }
            this._widget._Str_22991(this._senderId, this._senderName, this._senderCategory, this._roomId, k);
        }

        private function _Str_22405(k:WindowMouseEvent):void
        {
            this._widget._Str_24206(this._senderId, this._senderCategory, this._roomId, k);
        }

        private function _Str_23850(k:WindowMouseEvent):void
        {
            this._widget._Str_22868(this._senderId, this._senderCategory, this._roomId, k);
        }

        private function _Str_23475(k:WindowMouseEvent):void
        {
            this._widget._Str_25858(this._senderId, this._senderCategory, this._roomId, k);
        }

        private function _Str_24323(k:WindowMouseEvent):void
        {
            this._widget._Str_20437();
        }

        public function get _Str_24439():int
        {
            return this._chatStyle;
        }

        public function get _Str_26239():Number
        {
            return this._originalBackgroundYOffset;
        }
    }
}
