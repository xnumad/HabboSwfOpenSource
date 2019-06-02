package com.sulake.habbo.freeflowchat.viewer.visualization
{
    import flash.display.Sprite;
    import com.sulake.habbo.freeflowchat.HabboFreeFlowChat;
    import com.sulake.habbo.freeflowchat.data.ChatItem;
    import flash.display.Bitmap;
    import flash.text.TextField;
    import com.sulake.habbo.freeflowchat.viewer.visualization.style.IChatStyleInternal;
    import flash.display.BitmapData;
    import com.sulake.habbo.freeflowchat.viewer.enum.ChatBubbleWidth;
    import flash.text.AntiAliasType;
    import flash.text.GridFitType;
    import flash.events.TextEvent;
    import com.sulake.habbo.session.events.RoomSessionChatEvent;
    import flash.geom.Rectangle;
    import flash.geom.Point;
    import flash.events.Event;
    import flash.events.MouseEvent;

    public class ChatBubble extends Sprite 
    {
        public static const _Str_7976:uint = 300;
        public static const _Str_16761:int = 15;

        private const _Str_10527:int = 85;
        private const _Str_16997:int = 190;
        private const _Str_6907:uint = 150;
        private const MAX_HEIGHT:uint = 108;
        private const _Str_10539:int = 28;
        private const _Str_11116:int = 15;

        private var _component:HabboFreeFlowChat;
        private var _chatItem:ChatItem;
        private var _background:Sprite;
        private var _pointer:Bitmap;
        private var _face:Bitmap;
        private var _textField:TextField;
        private var _style:IChatStyleInternal;
        private var _timeMs:uint = 0;
        private var _moveBeginMs:uint;
        private var _moveTargetX:int;
        private var _moveTargetY:int;
        private var _moveOriginX:int;
        private var _moveOriginY:int;
        private var _moveDeltaXPerMs:Number;
        private var _moveDeltaYPerMs:Number;
        private var _readyToRecycle:Boolean = false;
        private var _roomPanOffsetX:int = 0;
        private var _proxyX:int;
        private var _useDesktopMargins:Boolean = false;
        private var _hasHitDesktopMargin:Boolean = false;
        private var _clipMask:Sprite;

        public function ChatBubble(k:ChatItem, _arg_2:IChatStyleInternal, _arg_3:BitmapData, _arg_4:String, _arg_5:uint, _arg_6:HabboFreeFlowChat, _arg_7:int=-1, _arg_8:Boolean=false, _arg_9:int=-1)
        {
            var _local_18:int;
            var _local_19:int;
            var _local_20:Array;
            var _local_21:String;
            var _local_22:String;
            var _local_23:String;
            var _local_24:int;
            var _local_25:BitmapData;
            super();
            this._component = _arg_6;
            this._chatItem = k;
            this._style = _arg_2;
            this._background = _arg_2.getNewBackgroundSprite(_arg_5);
            this._pointer = ((_arg_2._Str_4931) ? null : new Bitmap(_arg_2.pointer));
            this._useDesktopMargins = _arg_8;
            var _local_10:int = _Str_7976;
            if (_arg_7 != -1)
            {
                _local_10 = ChatBubbleWidth.fromValue(_arg_7);
            }
            else
            {
                if (_arg_6._Str_7277)
                {
                    _local_10 = ChatBubbleWidth.fromValue(_arg_6._Str_7277.weight);
                }
            }
            _local_10 = (_local_10 - _Str_16761);
            this.cacheAsBitmap = true;
            var _local_11:int = ((_local_10 - _arg_2.textFieldMargins.x) - _arg_2.textFieldMargins.width);
            this._textField = new TextField();
            this._textField.width = _local_11;
            this._textField.multiline = true;
            this._textField.wordWrap = true;
            this._textField.selectable = false;
            this._textField.thickness = -15;
            this._textField.sharpness = 80;
            this._textField.antiAliasType = AntiAliasType.ADVANCED;
            this._textField.embedFonts = true;
            this._textField.gridFitType = GridFitType.PIXEL;
            this._textField.cacheAsBitmap = true;
            this._textField.defaultTextFormat = _arg_2.textFormat;
            this._textField.styleSheet = this._style.styleSheet;
            this._textField.addEventListener(TextEvent.LINK, this._Str_10834);
			this._textField.background = true;
            var _local_12:* = (k.chatType == RoomSessionChatEvent.CHAT_TYPE_SPEAK);
            var _local_13:* = (k.chatType == RoomSessionChatEvent.CHAT_TYPE_SHOUT);
            var _local_14:Boolean = (((!(_local_12)) && (!(_local_13))) && (!(this._style._Str_4931)));
            if (_local_14)
            {
                this._textField.alpha = 0.6;
            }
            var _local_15:String = (((_local_14) ? "<i>" : "") + ((this._style._Str_4931) ? "" : (("<b>" + _arg_4) + ": </b>")));
            _local_15 = (((_local_15 + ((_local_13) ? "<b>" : "")) + k.text) + ((_local_13) ? "</b>" : ""));
            _local_15 = (_local_15 + ((_local_14) ? "</i>" : ""));
            if (((k.links == null) || (k.links[0] == null)))
            {
                this._textField.htmlText = _local_15;
            }
            else
            {
                _local_19 = -1;
                _local_20 = new Array();
                _local_18 = 0;
                while (_local_18 < k.links.length)
                {
                    _local_21 = k.links[_local_18][0][1];
                    _local_22 = (((('<a href="' + _local_21) + '">') + _local_21) + "</a>");
                    _local_23 = (("{" + _local_18) + "}");
                    _local_24 = k.text.indexOf(_local_23);
                    _local_19 = (_local_24 + _local_22.length);
                    _local_20.push([_local_24, _local_19]);
                    _local_15 = _local_15.replace(_local_23, _local_22);
                    _local_18++;
                }
                this._textField.htmlText = _local_15;
            }
            var _local_16:int = Math.min(_local_10, ((this._textField.textWidth + _arg_2.textFieldMargins.x) + _arg_2.textFieldMargins.width));
            var _local_17:int = ((this._textField.textHeight + _arg_2.textFieldMargins.y) + _arg_2.textFieldMargins.height);
            if (!this._style.isSystemStyle)
            {
                _local_17 = Math.min(this.MAX_HEIGHT, _local_17);
            }
            if (_arg_9 != -1)
            {
                _local_17 = Math.max(_arg_9, _local_17);
            }
            _local_16 = Math.max(_local_16, this._background.width);
            _local_17 = Math.max(_local_17, this._background.height);
            this._background.width = _local_16;
            this._background.height = _local_17;
            this._background.x = 0;
            this._background.y = 0;
            this._background.cacheAsBitmap = true;
            addChild(this._background);
            if (!this._style._Str_4931)
            {
                this._pointer.x = Math.max(this._Str_10539, Math.min(this._Str_11116, this._Str_10783));
                this._pointer.y = (_local_17 - _arg_2._Str_8470);
                addChild(this._pointer);
            }
            if (((!(_arg_3 == null)) && (!(_arg_2._Str_5505 == null))))
            {
                if (_arg_3.height > _local_17)
                {
                    _local_25 = new BitmapData(_arg_3.width, _local_17);
                    _local_25.copyPixels(_arg_3, new Rectangle(0, (_arg_3.height - _local_17), _arg_3.width, _local_17), new Point(0, 0));
                }
                else
                {
                    _local_25 = _arg_3;
                }
                this._face = new Bitmap(_local_25);
                this._face.x = (_arg_2._Str_5505.x - (_local_25.width / 2));
                this._face.y = Math.max(1, (_arg_2._Str_5505.y - (_local_25.height / 2)));
                addChild(this._face);
            }
            this._textField.width = Math.min(_local_11, (this._textField.textWidth + this._style.textFieldMargins.width));
            this._textField.height = (this._textField.textHeight + this._style.textFieldMargins.height);
            this._textField.x = _arg_2.textFieldMargins.x;
            this._textField.y = _arg_2.textFieldMargins.y;
            addChild(this._textField);
            if (((!(this._style.isSystemStyle)) && (this._textField.textHeight > this.MAX_HEIGHT)))
            {
                this._clipMask = new Sprite();
                this._clipMask.graphics.clear();
                this._clipMask.graphics.beginFill(0xFFFFFF);//(this._textField.textColor);
                this._clipMask.graphics.drawRect(0, 0, (this._textField.textWidth + 5), (this.MAX_HEIGHT - _arg_2.textFieldMargins.height));
                this._textField.mask = this._clipMask;
                addChild(this._clipMask);
            }
            this.addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        }

        public function dispose():void
        {
            this.removeEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
            this.removeEventListener(MouseEvent.CLICK, this.onMouseClick);
            if (this._clipMask)
            {
                removeChild(this._clipMask);
            }
            if (this._textField)
            {
                this._textField.removeEventListener(TextEvent.LINK, this._Str_10834);
            }
            removeChild(this._textField);
            if (((!(this._face == null)) && (!(this._style._Str_5505 == null))))
            {
                removeChild(this._face);
            }
            if (((this._pointer) && (this._pointer.parent)))
            {
                removeChild(this._pointer);
            }
            removeChild(this._background);
            this._clipMask = null;
            this._textField = null;
            this._face = null;
            this._pointer = null;
            this._background = null;
            this._style = null;
        }

        private function _Str_10834(k:TextEvent):void
        {
            if (((k.text) && (k.text.length > 0)))
            {
                this._component.context.createLinkEvent(k.text);
            }
        }

        public function get _Str_22234():Number
        {
            return (this._style.isSystemStyle) ? height : Math.min(this.MAX_HEIGHT, height);
        }

        private function onAddedToStage(k:Event):void
        {
            this.addEventListener(MouseEvent.CLICK, this.onMouseClick);
        }

        public function moveTo(k:int, _arg_2:int):void
        {
            if (((!(this._moveTargetX == k)) || (!(this._moveTargetY == _arg_2))))
            {
                this._moveBeginMs = this._timeMs;
                this._moveOriginX = this._Str_3980;
                this._moveOriginY = y;
                this._moveTargetX = k;
                this._moveTargetY = _arg_2;
                this._moveDeltaXPerMs = ((k - this._Str_3980) / Number(this._Str_6907));
                this._moveDeltaYPerMs = ((_arg_2 - y) / Number(this._Str_6907));
            }
        }

        public function _Str_12023(k:int, _arg_2:int):void
        {
            this._moveTargetX = k;
            this._moveTargetY = _arg_2;
            this._Str_3980 = k;
            y = _arg_2;
            this._Str_12210();
        }

        public function update(k:uint):void
        {
            var _local_2:uint;
            this._timeMs = (this._timeMs + k);
            if (((!(this._Str_3980 == this._moveTargetX)) || (!(y == this._moveTargetY))))
            {
                _local_2 = (this._timeMs - this._moveBeginMs);
                if (_local_2 < this._Str_6907)
                {
                    this._Str_3980 = int((this._moveOriginX + (_local_2 * this._moveDeltaXPerMs)));
                    y = int((this._moveOriginY + (_local_2 * this._moveDeltaYPerMs)));
                }
                else
                {
                    this._Str_3980 = this._moveTargetX;
                    y = this._moveTargetY;
                }
            }
            this._Str_12210();
        }

        public function get _Str_3980():int
        {
            return this._proxyX;
        }

        public function set _Str_3980(k:int):void
        {
            var _local_2:int;
            var _local_3:int;
            this._proxyX = k;
            if (((this._useDesktopMargins) && (stage)))
            {
                _local_2 = (this._proxyX + this._roomPanOffsetX);
                this._hasHitDesktopMargin = false;
                _local_3 = ((stage.stageWidth - this._Str_16997) - width);
                if (_local_2 > _local_3)
                {
                    _local_2 = _local_3;
                    this._hasHitDesktopMargin = true;
                }
                if (_local_2 < this._Str_10527)
                {
                    _local_2 = this._Str_10527;
                    this._hasHitDesktopMargin = true;
                }
                x = _local_2;
            }
            else
            {
                x = (this._proxyX + this._roomPanOffsetX);
            }
        }

        public function _Str_12210():void
        {
            if (((this._pointer) && (this._pointer.parent)))
            {
                this._pointer.x = Math.max(this._Str_10539, Math.min((this._background.width - this._Str_11116), this._Str_10783));
                this._pointer.y = (this._background.height - this._style._Str_8470);
            }
        }

        public function get _Str_4702():Boolean
        {
            return this._readyToRecycle;
        }

        public function set _Str_4702(k:Boolean):void
        {
            this._readyToRecycle = k;
            if (k)
            {
                this.removeEventListener(MouseEvent.CLICK, this.onMouseClick);
            }
        }

        public function get timeStamp():uint
        {
            return this._chatItem.timeStamp;
        }

        public function set component(k:HabboFreeFlowChat):void
        {
            this._component = k;
        }

        private function get _Str_10783():int
        {
            return this._Str_11643.x - this.x;
        }

        public function get _Str_11643():Point
        {
            if (this._chatItem._Str_12917)
            {
                return new Point(((this._component.displayObject.stage.stageWidth / 2) + Number(this._chatItem._Str_12917)), 500);
            }
            return this._component._Str_21534(this._chatItem.roomId, this._chatItem._Str_20712);
        }

        public function get roomId():int
        {
            return this._chatItem.roomId;
        }

        public function set _Str_18364(k:int):void
        {
            if (this._roomPanOffsetX != k)
            {
                this._roomPanOffsetX = k;
                this._Str_12023(this._moveTargetX, this._moveTargetY);
            }
        }

        private function onMouseClick(k:MouseEvent):void
        {
            if (((this._style) && (this._style._Str_4931)))
            {
                return;
            }
            if (!this._component._Str_21417(k))
            {
                this._component._Str_19178(this._chatItem);
                k.stopImmediatePropagation();
            }
        }

        public function get overlap():Rectangle
        {
            return this._style.overlap;
        }

        public function get _Str_19538():Boolean
        {
            return this._hasHitDesktopMargin;
        }

        public function _Str_23014(k:BitmapData):void
        {
            k.draw(this);
        }
		
		public function get textField():TextField
		{
			return this._textField;
		}
    }
}
