package com.sulake.habbo.window.widgets
{
    import com.sulake.core.window.utils.PropertyStruct;
    import com.sulake.habbo.window.enum._Str_4387;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.window.HabboWindowManagerComponent;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import com.sulake.core.window.components.IRegionWindow;
    import com.sulake.habbo.communication.messages.incoming.users._Str_5093;
    import com.sulake.habbo.communication.messages.incoming.users._Str_5458;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.iterators.EmptyIterator;
    import com.sulake.core.window.utils.IIterator;
    import com.sulake.core.window.theme.PropertyKeys;
    import com.sulake.core.window.utils.IBitmapDataContainer;
    import flash.display.BitmapData;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_2863;
    import com.sulake.habbo.gamecenter.GameConfigurations;
    import flash.geom.Point;

    public class BadgeImageWidget implements _Str_2402 
    {
        public static const BADGE_IMAGE:String = "badge_image";
        private static const _Str_13540:String = (BADGE_IMAGE + ":type");
        private static const _Str_13026:String = (BADGE_IMAGE + ":badge_id");
        private static const _Str_12929:PropertyStruct = new PropertyStruct(_Str_13540, _Str_4387.NORMAL, PropertyStruct.STRING, false, _Str_4387.ALL);
        private static const _Str_15899:PropertyStruct = new PropertyStruct(_Str_13026, "", PropertyStruct.STRING);

        private var _disposed:Boolean;
        private var _widgetWindow:IWidgetWindow;
        private var _windowManager:HabboWindowManagerComponent;
        private var _refreshing:Boolean;
        private var _root:IWindowContainer;
        private var _bitmap:IStaticBitmapWrapperWindow;
        private var _region:IRegionWindow;
        private var _type:String;
        private var _badgeId:String;
        private var _groupId:int;
        private var _groupDetailsChangedMessageEvent:_Str_5093;
        private var _habboGroupBadgesMessageEvent:_Str_5458;

        public function BadgeImageWidget(k:IWidgetWindow, _arg_2:HabboWindowManagerComponent)
        {
            this._type = String(_Str_12929.value);
            this._badgeId = String(_Str_15899.value);
            super();
            this._widgetWindow = k;
            this._windowManager = _arg_2;
            this._root = (this._windowManager.buildFromXML((this._windowManager.assets.getAssetByName("badge_image_xml").content as XML)) as IWindowContainer);
            this._bitmap = (this._root.findChildByName("bitmap") as IStaticBitmapWrapperWindow);
            this._region = (this._root.findChildByName("region") as IRegionWindow);
            this._region.addEventListener(WindowMouseEvent.CLICK, this.onClick);
            this._widgetWindow._Str_2429 = this._root;
            this._root.width = this._widgetWindow.width;
            this._root.height = this._widgetWindow.height;
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                this.groupId = 0;
                if (this._region != null)
                {
                    this._region.removeEventListener(WindowMouseEvent.CLICK, this.onClick);
                    this._region.dispose();
                    this._region = null;
                }
                this._bitmap = null;
                if (this._root != null)
                {
                    this._root.dispose();
                    this._root = null;
                }
                if (this._widgetWindow != null)
                {
                    this._widgetWindow._Str_2429 = null;
                    this._widgetWindow = null;
                }
                this._windowManager = null;
                this._disposed = true;
            }
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get iterator():IIterator
        {
            return EmptyIterator.INSTANCE;
        }

        public function get properties():Array
        {
            var _local_2:PropertyStruct;
            var k:Array = [];
            if (this._disposed)
            {
                return k;
            }
            k.push(_Str_12929.withValue(this._type));
            k.push(_Str_15899.withValue(this._badgeId));
            for each (_local_2 in this._bitmap.properties)
            {
                if (_local_2.key != PropertyKeys.ASSET_URI)
                {
                    k.push(_local_2.withNameSpace(BADGE_IMAGE));
                }
            }
            return k;
        }

        public function set properties(k:Array):void
        {
            var _local_3:PropertyStruct;
            this._refreshing = true;
            var _local_2:Array = [];
            for each (_local_3 in k)
            {
                switch (_local_3.key)
                {
                    case _Str_13540:
                        this.type = String(_local_3.value);
                        break;
                    case _Str_13026:
                        this.badgeId = String(_local_3.value);
                        break;
                }
                if (_local_3.key != ((BADGE_IMAGE + ":") + PropertyKeys.ASSET_URI))
                {
                    _local_2.push(_local_3.withoutNameSpace());
                }
            }
            this._bitmap.properties = _local_2;
            this._refreshing = false;
            this.refresh();
        }

        public function get type():String
        {
            return this._type;
        }

        public function set type(k:String):void
        {
            this._type = k;
            this.refresh();
        }

        public function get badgeId():String
        {
            return this._badgeId;
        }

        public function set badgeId(k:String):void
        {
            this._badgeId = k;
            this.refresh();
        }

        public function get groupId():int
        {
            return this._groupId;
        }

        public function set groupId(k:int):void
        {
            this._groupId = k;
            var _local_2:Boolean = ((this._type == _Str_4387.GROUP) && (this._groupId > 0));
            if (((!(this._windowManager == null)) && (!(this._windowManager.communication == null))))
            {
                if (((!(_local_2)) && (!(this._habboGroupBadgesMessageEvent == null))))
                {
                    this._windowManager.communication.removeHabboConnectionMessageEvent(this._groupDetailsChangedMessageEvent);
                    this._windowManager.communication.removeHabboConnectionMessageEvent(this._habboGroupBadgesMessageEvent);
                    this._groupDetailsChangedMessageEvent = null;
                    this._habboGroupBadgesMessageEvent = null;
                }
                else
                {
                    if (((_local_2) && (this._habboGroupBadgesMessageEvent == null)))
                    {
                        this._groupDetailsChangedMessageEvent = new _Str_5093(this._Str_18693);
                        this._habboGroupBadgesMessageEvent = new _Str_5458(this._Str_18218);
                        this._windowManager.communication.addHabboConnectionMessageEvent(this._groupDetailsChangedMessageEvent);
                        this._windowManager.communication.addHabboConnectionMessageEvent(this._habboGroupBadgesMessageEvent);
                    }
                }
            }
        }

        public function get bitmapData():BitmapData
        {
            return IBitmapDataContainer(this._bitmap).bitmapData;
        }

        public function get pivotPoint():uint
        {
            return this._bitmap.pivotPoint;
        }

        public function set pivotPoint(k:uint):void
        {
            this._bitmap.pivotPoint = k;
            this._bitmap.invalidate();
        }

        public function get stretchedX():Boolean
        {
            return this._bitmap.stretchedX;
        }

        public function set stretchedX(k:Boolean):void
        {
            this._bitmap.stretchedX = k;
            this._bitmap.invalidate();
        }

        public function get stretchedY():Boolean
        {
            return this._bitmap.stretchedY;
        }

        public function set stretchedY(k:Boolean):void
        {
            this._bitmap.stretchedY = k;
            this._bitmap.invalidate();
        }

        public function get zoomX():Number
        {
            return this._bitmap.zoomX;
        }

        public function set zoomX(k:Number):void
        {
            this._bitmap.zoomX = k;
            this._bitmap.invalidate();
        }

        public function get zoomY():Number
        {
            return this._bitmap.zoomY;
        }

        public function set zoomY(k:Number):void
        {
            this._bitmap.zoomY = k;
            this._bitmap.invalidate();
        }

        public function get greyscale():Boolean
        {
            return this._bitmap.greyscale;
        }

        public function set greyscale(k:Boolean):void
        {
            this._bitmap.greyscale = k;
            this._bitmap.invalidate();
        }

        public function get etchingColor():uint
        {
            return this._bitmap.etchingColor;
        }

        public function set etchingColor(k:uint):void
        {
            this._bitmap.etchingColor = k;
            this._bitmap.invalidate();
        }

        public function get fitSizeToContents():Boolean
        {
            return this._bitmap.fitSizeToContents;
        }

        public function set fitSizeToContents(k:Boolean):void
        {
            this._bitmap.fitSizeToContents = k;
            this._bitmap.invalidate();
        }

        private function onClick(k:WindowMouseEvent):void
        {
            if (this._groupId > 0)
            {
                this._windowManager.communication.connection.send(new _Str_2863(this._groupId, true));
            }
        }

        private function refresh():void
        {
            if (this._refreshing)
            {
                return;
            }
            this._bitmap.assetUri = this.assetUri;
            this._bitmap.invalidate();
        }

        private function get assetUri():String
        {
            var k:String = "";
            if (((!(this._badgeId == null)) && (this._badgeId.length > 0)))
            {
                switch (this._type)
                {
                    case _Str_4387.NORMAL:
                        if (GameConfigurations.isGameBadge(this._badgeId))
                        {
                            k = GameConfigurations.getBadgeImageUri(this._badgeId);
                        }
                        else
                        {
                            k = (("${image.library.url}album1584/" + this._badgeId) + ".gif");
                        }
                        break;
                    case _Str_4387.GROUP:
                        k = this._windowManager.getProperty("group.badge.url").replace("%imagerdata%", this._badgeId);
                        break;
                    case _Str_4387.PERK:
                        k = (("${image.library.url}perk/" + this._badgeId) + ".png");
                        break;
                }
            }
            return k;
        }

        private function _Str_22252(k:int, _arg_2:String):void
        {
            if (k != this._groupId)
            {
                return;
            }
            this._badgeId = _arg_2;
            this._windowManager.resourceManager.removeAsset(this.assetUri);
            this.refresh();
        }

        private function _Str_18693(k:_Str_5093):void
        {
            this._Str_22252(k.groupId, this._badgeId);
        }

        private function _Str_18218(k:_Str_5458):void
        {
            if (k.badges.hasKey(this._groupId))
            {
                this._Str_22252(this._groupId, k.badges[this._groupId]);
            }
        }

        public function get etchingPoint():Point
        {
            return new Point(0, 1);
        }

        public function get wrapX():Boolean
        {
            return false;
        }

        public function set wrapX(k:Boolean):void
        {
        }

        public function get wrapY():Boolean
        {
            return false;
        }

        public function set wrapY(k:Boolean):void
        {
        }
    }
}






